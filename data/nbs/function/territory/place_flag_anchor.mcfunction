# ติดแท็กชั่วคราวให้ผู้เล่นที่กำลังวางธงเพื่อส่งข้อความกลับถูกคน
tag @s add flag_placer

# ==========================================
# 1. สแกนหาตำแหน่งบล็อกธงที่เพิ่งวาง (ขยับละเอียดทีละ 0.25 บล็อก ไปข้างหน้า 6 บล็อก)
# ==========================================
execute anchored eyes positioned ^ ^ ^0.5 run function nbs:territory/raycast_flag

# จัดตำแหน่งตัวเช็กชั่วคราวให้อยู่กึ่งกลางบล็อกพอดี
execute as @e[type=minecraft:marker,tag=temp_flag_check] at @s align xyz run tp @s ~0.5 ~0.5 ~0.5

# ==========================================
# 2. ตรวจสอบระยะห่างจากธงอาณาเขตต้นอื่น (แยกเงื่อนไขระหว่าง "ศัตรู" กับ "ทีมตัวเอง")
# ==========================================
# คัดลอกเลข team_id ของคนวางไปเก็บไว้ในตัวแปรกลางเพื่อใช้เทียบ
scoreboard players operation #placer_team team_id = @s team_id

# แยกแท็กให้หมุดธงเดิมในโลกชั่วคราวว่าเป็น "ธงทีมเรา" หรือ "ธงศัตรู"
execute as @e[type=minecraft:marker,tag=flag_anchor] if score @s team_id = #placer_team team_id run tag @s add same_team_flag
execute as @e[type=minecraft:marker,tag=flag_anchor] unless score @s team_id = #placer_team team_id run tag @s add enemy_flag

# กรณี A: ถ้าในรัศมี 48 บล็อก มี "ธงศัตรู" อยู่ -> ห้ามปักและดีดออกทันที
execute as @e[type=minecraft:marker,tag=temp_flag_check,limit=1] at @s if entity @e[type=minecraft:marker,tag=enemy_flag,distance=..48] run setblock ~ ~ ~ minecraft:air destroy
execute as @e[type=minecraft:marker,tag=temp_flag_check,limit=1] at @s if entity @e[type=minecraft:marker,tag=enemy_flag,distance=..48] run title @a[tag=flag_placer] actionbar {"text":"ไม่สามารถปักธงได้! ใกล้เขตอาณาเขตของศัตรูเกินไป (ต้องห่างอย่างน้อย 48 บล็อก)","color":"red"}
execute as @e[type=minecraft:marker,tag=temp_flag_check,limit=1] at @s if entity @e[type=minecraft:marker,tag=enemy_flag,distance=..48] run kill @s

# กรณี B: ถ้าปักทับบล็อกเดียวกับ "ธงทีมเรา" แบบติดกันเกินไป (ระยะไม่ถึง 1.5 บล็อก) -> กันบั๊กซ้อนทับ
execute as @e[type=minecraft:marker,tag=temp_flag_check,limit=1] at @s if entity @e[type=minecraft:marker,tag=same_team_flag,distance=..1.5] run setblock ~ ~ ~ minecraft:air destroy
execute as @e[type=minecraft:marker,tag=temp_flag_check,limit=1] at @s if entity @e[type=minecraft:marker,tag=same_team_flag,distance=..1.5] run title @a[tag=flag_placer] actionbar {"text":"ไม่สามารถปักธงซ้อนทับจุดเดิมได้!","color":"red"}
execute as @e[type=minecraft:marker,tag=temp_flag_check,limit=1] at @s if entity @e[type=minecraft:marker,tag=same_team_flag,distance=..1.5] run kill @s

# ล้างแท็กแยกฝ่ายชั่วคราวออกจากหมุดเดิมทั้งหมด
tag @e[type=minecraft:marker,tag=flag_anchor] remove same_team_flag
tag @e[type=minecraft:marker,tag=flag_anchor] remove enemy_flag

# ==========================================
# 3. ตรวจสอบโควตาจำนวนธงของทีม (จำกัดทีมละไม่เกิน 3 ต้น)
# ==========================================
scoreboard players set #team_flags flag_count 0

execute as @e[type=minecraft:marker,tag=flag_anchor] if score @s team_id = #placer_team team_id run scoreboard players add #team_flags flag_count 1

execute as @e[type=minecraft:marker,tag=temp_flag_check,limit=1] at @s if score #team_flags flag_count matches 3.. run setblock ~ ~ ~ minecraft:air destroy
execute as @e[type=minecraft:marker,tag=temp_flag_check,limit=1] at @s if score #team_flags flag_count matches 3.. run title @a[tag=flag_placer] actionbar {"text":"ทีมของคุณปักธงอาณาเขตครบโควตาสูงสุด 3 ต้นแล้ว!","color":"red"}
execute as @e[type=minecraft:marker,tag=temp_flag_check,limit=1] at @s if score #team_flags flag_count matches 3.. run kill @s

execute as @e[type=minecraft:marker,tag=temp_flag_check,limit=1] at @s if score #placer_team team_id matches 0 run setblock ~ ~ ~ minecraft:air destroy
execute as @e[type=minecraft:marker,tag=temp_flag_check,limit=1] at @s if score #placer_team team_id matches 0 run title @a[tag=flag_placer] actionbar {"text":"คุณต้องมีทีมก่อนจึงจะปักธงอาณาเขตได้!","color":"red"}
execute as @e[type=minecraft:marker,tag=temp_flag_check,limit=1] at @s if score #placer_team team_id matches 0 run kill @s

# ==========================================
# 4. ผ่านทุกเงื่อนไข -> ยืนยันการปักธงและสร้างป้ายชื่อ
# ==========================================
execute as @e[type=minecraft:marker,tag=temp_flag_check,limit=1] run tag @s add flag_anchor
execute as @e[type=minecraft:marker,tag=temp_flag_check,limit=1] run tag @s add new_flag
tag @e[type=minecraft:marker,tag=temp_flag_check] remove temp_flag_check

# บันทึกข้อมูลเลขทีมของคนวางลงในหมุด
scoreboard players operation @e[type=minecraft:marker,tag=new_flag,limit=1] team_id = @s team_id

# สร้างป้ายชื่อลอยเหนือธงตามชื่อและสีทีมที่แอดมินตั้งไว้ (รองรับ 1-8 ทีม)
execute if score @s team_id matches 1 run function nbs:territory/summon_flag_text with storage nbs:team t1
execute if score @s team_id matches 2 run function nbs:territory/summon_flag_text with storage nbs:team t2
execute if score @s team_id matches 3 run function nbs:territory/summon_flag_text with storage nbs:team t3
execute if score @s team_id matches 4 run function nbs:territory/summon_flag_text with storage nbs:team t4
execute if score @s team_id matches 5 run function nbs:territory/summon_flag_text with storage nbs:team t5
execute if score @s team_id matches 6 run function nbs:territory/summon_flag_text with storage nbs:team t6
execute if score @s team_id matches 7 run function nbs:territory/summon_flag_text with storage nbs:team t7
execute if score @s team_id matches 8 run function nbs:territory/summon_flag_text with storage nbs:team t8

# แจ้งเตือนเจ้าของธง
execute if entity @e[type=minecraft:marker,tag=new_flag] run title @s actionbar {"text":"ปักธงอาณาเขตสำเร็จ! รัศมีป้องกัน 32 บล็อกทำงานแล้ว","color":"green"}

# ล้างแท็กชั่วคราวทั้งหมด
tag @e[type=minecraft:marker,tag=new_flag] remove new_flag
tag @e[type=minecraft:text_display,tag=new_text] remove new_text
tag @s remove flag_placer