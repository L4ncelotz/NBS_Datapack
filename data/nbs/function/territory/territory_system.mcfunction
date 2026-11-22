# กำหนดค่าเริ่มต้น team_id = 0 สำหรับผู้เล่นที่ยังไม่เคยมีค่า (ป้องกันค่าว่างข้ามเงื่อนไข matches 0)
scoreboard players add @a team_id 0

# ==========================================
# 1. ระบบปักธงอาณาเขต (ตรวจจับจังหวะวางบล็อกธงแยกสีทีม 1-8)
# ==========================================
execute as @a[scores={place_flag_1=1..}] at @s run function nbs:territory/place_flag_anchor
execute as @a[scores={place_flag_2=1..}] at @s run function nbs:territory/place_flag_anchor
execute as @a[scores={place_flag_3=1..}] at @s run function nbs:territory/place_flag_anchor
execute as @a[scores={place_flag_4=1..}] at @s run function nbs:territory/place_flag_anchor
execute as @a[scores={place_flag_5=1..}] at @s run function nbs:territory/place_flag_anchor
execute as @a[scores={place_flag_6=1..}] at @s run function nbs:territory/place_flag_anchor
execute as @a[scores={place_flag_7=1..}] at @s run function nbs:territory/place_flag_anchor
execute as @a[scores={place_flag_8=1..}] at @s run function nbs:territory/place_flag_anchor
scoreboard players set @a[scores={place_flag_1=1..}] place_flag_1 0
scoreboard players set @a[scores={place_flag_2=1..}] place_flag_2 0
scoreboard players set @a[scores={place_flag_3=1..}] place_flag_3 0
scoreboard players set @a[scores={place_flag_4=1..}] place_flag_4 0
scoreboard players set @a[scores={place_flag_5=1..}] place_flag_5 0
scoreboard players set @a[scores={place_flag_6=1..}] place_flag_6 0
scoreboard players set @a[scores={place_flag_7=1..}] place_flag_7 0
scoreboard players set @a[scores={place_flag_8=1..}] place_flag_8 0

# ==========================================
# 2. ระบบตรวจสอบสภาพธงและเอฟเฟกต์ Particle สีทีม
# ==========================================
execute as @e[type=minecraft:marker,tag=flag_anchor,scores={team_id=1}] at @s unless block ~ ~ ~ minecraft:red_banner unless block ~ ~ ~ minecraft:red_wall_banner run function nbs:territory/break_flag_anchor
execute as @e[type=minecraft:marker,tag=flag_anchor,scores={team_id=2}] at @s unless block ~ ~ ~ minecraft:blue_banner unless block ~ ~ ~ minecraft:blue_wall_banner run function nbs:territory/break_flag_anchor
execute as @e[type=minecraft:marker,tag=flag_anchor,scores={team_id=3}] at @s unless block ~ ~ ~ minecraft:green_banner unless block ~ ~ ~ minecraft:green_wall_banner run function nbs:territory/break_flag_anchor
execute as @e[type=minecraft:marker,tag=flag_anchor,scores={team_id=4}] at @s unless block ~ ~ ~ minecraft:yellow_banner unless block ~ ~ ~ minecraft:yellow_wall_banner run function nbs:territory/break_flag_anchor
execute as @e[type=minecraft:marker,tag=flag_anchor,scores={team_id=5}] at @s unless block ~ ~ ~ minecraft:magenta_banner unless block ~ ~ ~ minecraft:magenta_wall_banner run function nbs:territory/break_flag_anchor
execute as @e[type=minecraft:marker,tag=flag_anchor,scores={team_id=6}] at @s unless block ~ ~ ~ minecraft:cyan_banner unless block ~ ~ ~ minecraft:cyan_wall_banner run function nbs:territory/break_flag_anchor
execute as @e[type=minecraft:marker,tag=flag_anchor,scores={team_id=7}] at @s unless block ~ ~ ~ minecraft:orange_banner unless block ~ ~ ~ minecraft:orange_wall_banner run function nbs:territory/break_flag_anchor
execute as @e[type=minecraft:marker,tag=flag_anchor,scores={team_id=8}] at @s unless block ~ ~ ~ minecraft:white_banner unless block ~ ~ ~ minecraft:white_wall_banner run function nbs:territory/break_flag_anchor

# เคลียร์และป้องกันหมุดธงที่หลุดเข้าไปในเขต Spawn (in_spawn)
execute at @e[tag=spawn_anchor] positioned ~-86 -64 ~-86 as @e[type=minecraft:marker,tag=flag_anchor,dx=172,dy=384,dz=172] at @s run setblock ~ ~ ~ minecraft:air destroy
execute at @e[tag=spawn_anchor] positioned ~-86 -64 ~-86 as @e[type=minecraft:marker,tag=flag_anchor,dx=172,dy=384,dz=172] at @s run function nbs:territory/break_flag_anchor

scoreboard players add #flag_fx_tick rnd_temp 1
execute if score #flag_fx_tick rnd_temp matches 10.. as @e[type=minecraft:marker,tag=flag_anchor] at @s run function nbs:territory/flag_particles
execute if score #flag_fx_tick rnd_temp matches 10.. run scoreboard players set #flag_fx_tick rnd_temp 0

# ==========================================
# 3. ระบบสร้างรัศมีขุดช้า (Debuff ศัตรูที่เดินเข้าใกล้ฐาน)
# ==========================================
# ล้างสถานะในเขตธงออกก่อนทุกครั้ง
tag @a remove in_enemy_territory

# สั่งให้หมุดธงแต่ละต้น เช็กคนในรัศมี 32 บล็อก (ถ้าไม่ใช่ทีมเดียวกับหมุด ให้แปะแท็ก in_enemy_territory)
execute as @e[type=minecraft:marker,tag=flag_anchor] at @s run function nbs:territory/check_flag_radius

# ปรับความเร็วในการขุดบล็อกเหลือ 25% (0.25 = ขุดช้าลง 75% สำหรับถ่วงเวลาและใช้เป็นเรดาร์หาฐาน)
execute as @a[tag=in_enemy_territory,tag=!admin] run attribute @s minecraft:block_break_speed base set 0.25

# คืนค่าความเร็วขุดปกติ (เฉพาะคนที่อยู่นอกเขตธง และอยู่นอกเขต Spawn ตรงกลางด้วย)
execute as @a[tag=!in_enemy_territory,tag=!in_spawn] run attribute @s minecraft:block_break_speed base set 1

function nbs:territory/check_team_flags