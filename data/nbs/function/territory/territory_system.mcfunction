# ==========================================
# 1. ระบบปักธงอาณาเขต (ตรวจจับจังหวะวางบล็อกธง)
# ==========================================
# เมื่อผู้เล่นวางธง (คะแนน place_flag >= 1) ให้เรียกฟังก์ชันหาตำแหน่งธงและปักหมุด
execute as @a[scores={place_flag=1..}] at @s run function nbs:territory/place_flag_anchor
scoreboard players set @a[scores={place_flag=1..}] place_flag 0

# ==========================================
# 2. ระบบตรวจสอบสภาพธง (ถ้าบล็อกธงโดนทุบ ให้ลบหมุดอาณาเขตทิ้งทันที)
# ==========================================
# เช็กว่าตรงตำแหน่งของหมุด flag_anchor ยังมีบล็อกธงสีขาวปักอยู่ไหม (ทั้งแบบปักพื้นและแปะกำแพง)
execute as @e[type=minecraft:marker,tag=flag_anchor] at @s unless block ~ ~ ~ minecraft:white_banner unless block ~ ~ ~ minecraft:white_wall_banner run function nbs:territory/break_flag_anchor

# ==========================================
# 3. ระบบสร้างรัศมีขุดช้า (Debuff ศัตรูที่เดินเข้าใกล้ฐาน)
# ==========================================
# ล้างสถานะในเขตธงออกก่อนทุกครั้ง
tag @a remove in_enemy_territory

# สั่งให้หมุดธงแต่ละต้น เช็กคนในรัศมี 32 บล็อก (ถ้าไม่ใช่ทีมเดียวกับหมุด ให้แปะแท็ก in_enemy_territory)
execute as @e[type=minecraft:marker,tag=flag_anchor] at @s run function nbs:territory/check_flag_radius

# ปรับความเร็วในการขุดบล็อก (0.75 = ช้าลง 25% กำลังดีสำหรับถ่วงเวลาและใช้เป็นเรดาร์หาฐาน)
execute as @a[tag=in_enemy_territory,tag=!admin] run attribute @s minecraft:block_break_speed base set 0.25

# คืนค่าความเร็วขุดปกติ (เฉพาะคนที่อยู่นอกเขตธง และอยู่นอกเขต Spawn ตรงกลางด้วย)
execute as @a[tag=!in_enemy_territory,tag=!in_spawn] run attribute @s minecraft:block_break_speed base set 1

function nbs:territory/check_team_flags