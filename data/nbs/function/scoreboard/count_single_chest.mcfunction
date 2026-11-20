# 1. เช็กว่าตำแหน่งของหมุดนี้ยังมีบล็อกกล่องหรือถังอยู่จริงไหม ถ้าไม่มีให้ลบหมุดทิ้ง
execute unless block ~ ~ ~ minecraft:chest unless block ~ ~ ~ minecraft:trapped_chest unless block ~ ~ ~ minecraft:barrel run kill @s

# ==========================================
# 2. ตรวจสอบว่ากล่องนี้เป็นของทีมไหน (ระบบแยกทีม)
# ==========================================
# ลำดับ 1: อิงจากธงอาณาเขตที่อยู่ใกล้ที่สุดในรัศมี 32 บล็อก (ถ้าอยู่ในเขตธงทีมไหน กล่องนั้นเป็นของทีมนั้นทันที)
scoreboard players set #chest_owner team_id 0
execute if entity @e[type=minecraft:marker,tag=flag_anchor,distance=..32] run scoreboard players operation #chest_owner team_id = @e[type=minecraft:marker,tag=flag_anchor,distance=..32,sort=nearest,limit=1] team_id

# ลำดับ 2: ถ้าอยู่นอกเขตธง ให้ตรวจจากชื่อที่ตั้งที่ Anvil (เช่น "Team 1", "ทีม 1")
execute if score #chest_owner team_id matches 0 if data block ~ ~ ~ {CustomName:"Team 1"} run scoreboard players set #chest_owner team_id 1
execute if score #chest_owner team_id matches 0 if data block ~ ~ ~ {CustomName:"ทีม 1"} run scoreboard players set #chest_owner team_id 1
execute if score #chest_owner team_id matches 0 if data block ~ ~ ~ {CustomName:{text:"Team 1"}} run scoreboard players set #chest_owner team_id 1
execute if score #chest_owner team_id matches 0 if data block ~ ~ ~ {CustomName:{text:"ทีม 1"}} run scoreboard players set #chest_owner team_id 1
execute if score #chest_owner team_id matches 0 if data block ~ ~ ~ {CustomName:'"Team 1"'} run scoreboard players set #chest_owner team_id 1
execute if score #chest_owner team_id matches 0 if data block ~ ~ ~ {CustomName:'"ทีม 1"'} run scoreboard players set #chest_owner team_id 1
execute if score #chest_owner team_id matches 0 if data block ~ ~ ~ {CustomName:'{"text":"Team 1"}'} run scoreboard players set #chest_owner team_id 1
execute if score #chest_owner team_id matches 0 if data block ~ ~ ~ {CustomName:'{"text":"ทีม 1"}'} run scoreboard players set #chest_owner team_id 1

execute if score #chest_owner team_id matches 0 if data block ~ ~ ~ {CustomName:"Team 2"} run scoreboard players set #chest_owner team_id 2
execute if score #chest_owner team_id matches 0 if data block ~ ~ ~ {CustomName:"ทีม 2"} run scoreboard players set #chest_owner team_id 2
execute if score #chest_owner team_id matches 0 if data block ~ ~ ~ {CustomName:{text:"Team 2"}} run scoreboard players set #chest_owner team_id 2
execute if score #chest_owner team_id matches 0 if data block ~ ~ ~ {CustomName:{text:"ทีม 2"}} run scoreboard players set #chest_owner team_id 2
execute if score #chest_owner team_id matches 0 if data block ~ ~ ~ {CustomName:'"Team 2"'} run scoreboard players set #chest_owner team_id 2
execute if score #chest_owner team_id matches 0 if data block ~ ~ ~ {CustomName:'"ทีม 2"'} run scoreboard players set #chest_owner team_id 2
execute if score #chest_owner team_id matches 0 if data block ~ ~ ~ {CustomName:'{"text":"Team 2"}'} run scoreboard players set #chest_owner team_id 2
execute if score #chest_owner team_id matches 0 if data block ~ ~ ~ {CustomName:'{"text":"ทีม 2"}'} run scoreboard players set #chest_owner team_id 2

execute if score #chest_owner team_id matches 0 if data block ~ ~ ~ {CustomName:"Team 3"} run scoreboard players set #chest_owner team_id 3
execute if score #chest_owner team_id matches 0 if data block ~ ~ ~ {CustomName:"ทีม 3"} run scoreboard players set #chest_owner team_id 3
execute if score #chest_owner team_id matches 0 if data block ~ ~ ~ {CustomName:{text:"Team 3"}} run scoreboard players set #chest_owner team_id 3
execute if score #chest_owner team_id matches 0 if data block ~ ~ ~ {CustomName:{text:"ทีม 3"}} run scoreboard players set #chest_owner team_id 3
execute if score #chest_owner team_id matches 0 if data block ~ ~ ~ {CustomName:'"Team 3"'} run scoreboard players set #chest_owner team_id 3
execute if score #chest_owner team_id matches 0 if data block ~ ~ ~ {CustomName:'"ทีม 3"'} run scoreboard players set #chest_owner team_id 3
execute if score #chest_owner team_id matches 0 if data block ~ ~ ~ {CustomName:'{"text":"Team 3"}'} run scoreboard players set #chest_owner team_id 3
execute if score #chest_owner team_id matches 0 if data block ~ ~ ~ {CustomName:'{"text":"ทีม 3"}'} run scoreboard players set #chest_owner team_id 3

execute if score #chest_owner team_id matches 0 if data block ~ ~ ~ {CustomName:"Team 4"} run scoreboard players set #chest_owner team_id 4
execute if score #chest_owner team_id matches 0 if data block ~ ~ ~ {CustomName:"ทีม 4"} run scoreboard players set #chest_owner team_id 4
execute if score #chest_owner team_id matches 0 if data block ~ ~ ~ {CustomName:{text:"Team 4"}} run scoreboard players set #chest_owner team_id 4
execute if score #chest_owner team_id matches 0 if data block ~ ~ ~ {CustomName:{text:"ทีม 4"}} run scoreboard players set #chest_owner team_id 4
execute if score #chest_owner team_id matches 0 if data block ~ ~ ~ {CustomName:'"Team 4"'} run scoreboard players set #chest_owner team_id 4
execute if score #chest_owner team_id matches 0 if data block ~ ~ ~ {CustomName:'"ทีม 4"'} run scoreboard players set #chest_owner team_id 4
execute if score #chest_owner team_id matches 0 if data block ~ ~ ~ {CustomName:'{"text":"Team 4"}'} run scoreboard players set #chest_owner team_id 4
execute if score #chest_owner team_id matches 0 if data block ~ ~ ~ {CustomName:'{"text":"ทีม 4"}'} run scoreboard players set #chest_owner team_id 4

# ลำดับ 3: ถ้าไม่มีชื่อ ให้ดึง team_id ของคนที่วาง/เปิดกล่องที่บันทึกไว้ในหมุด
execute if score #chest_owner team_id matches 0 if score @s team_id matches 1.. run scoreboard players operation #chest_owner team_id = @s team_id

# ==========================================
# 3. ถ้ารู้ว่าเป็นของทีมใด (team_id 1-4) ให้นับไอเทมทั้งหมดในกล่อง
# ==========================================
scoreboard players set #egg_in_chest item_count 0
scoreboard players set #nametag_in_chest item_count 0
scoreboard players set #star_in_chest item_count 0

execute if score #chest_owner team_id matches 1.. run function nbs:scoreboard/calc_chest_items

# ==========================================
# 4. คำนวณคะแนนไข่มังกร (ฟองละ 150 แต้ม)
# ==========================================
scoreboard players set #val item_value 150
execute if score #egg_in_chest item_count matches 1.. run scoreboard players operation #egg_in_chest item_count *= #val item_value

# ==========================================
# 5. คำนวณคะแนนป้ายชื่อ (ชิ้นละ 15 แต้ม)
# ==========================================
scoreboard players set #val item_value 15
execute if score #nametag_in_chest item_count matches 1.. run scoreboard players operation #nametag_in_chest item_count *= #val item_value

# ==========================================
# 6. รวมคะแนนเข้าทีมที่เป็นเจ้าของกล่องใบนั้น! (ใส่กล่องทีมไหน ทีมนั้นได้คะแนนทันที)
# ==========================================
# รวมคะแนนไข่มังกรเข้าทีมเจ้าของกล่อง
execute if score #chest_owner team_id matches 1 if score #egg_in_chest item_count matches 1.. run scoreboard players operation ทีมที่_1 team_score += #egg_in_chest item_count
execute if score #chest_owner team_id matches 2 if score #egg_in_chest item_count matches 1.. run scoreboard players operation ทีมที่_2 team_score += #egg_in_chest item_count
execute if score #chest_owner team_id matches 3 if score #egg_in_chest item_count matches 1.. run scoreboard players operation ทีมที่_3 team_score += #egg_in_chest item_count
execute if score #chest_owner team_id matches 4 if score #egg_in_chest item_count matches 1.. run scoreboard players operation ทีมที่_4 team_score += #egg_in_chest item_count

# รวมคะแนนป้ายชื่อเข้าทีมเจ้าของกล่อง
execute if score #chest_owner team_id matches 1 if score #nametag_in_chest item_count matches 1.. run scoreboard players operation ทีมที่_1 team_score += #nametag_in_chest item_count
execute if score #chest_owner team_id matches 2 if score #nametag_in_chest item_count matches 1.. run scoreboard players operation ทีมที่_2 team_score += #nametag_in_chest item_count
execute if score #chest_owner team_id matches 3 if score #nametag_in_chest item_count matches 1.. run scoreboard players operation ทีมที่_3 team_score += #nametag_in_chest item_count
execute if score #chest_owner team_id matches 4 if score #nametag_in_chest item_count matches 1.. run scoreboard players operation ทีมที่_4 team_score += #nametag_in_chest item_count

# รวมจำนวน Nether Star เข้าตัวแปรทีม (เพื่อล็อก Cap สูงสุด 5 ดวง/ทีม ใน recalc_scores)
execute if score #chest_owner team_id matches 1 if score #star_in_chest item_count matches 1.. run scoreboard players operation #t1_star team_boss_cnt += #star_in_chest item_count
execute if score #chest_owner team_id matches 2 if score #star_in_chest item_count matches 1.. run scoreboard players operation #t2_star team_boss_cnt += #star_in_chest item_count
execute if score #chest_owner team_id matches 3 if score #star_in_chest item_count matches 1.. run scoreboard players operation #t3_star team_boss_cnt += #star_in_chest item_count
execute if score #chest_owner team_id matches 4 if score #star_in_chest item_count matches 1.. run scoreboard players operation #t4_star team_boss_cnt += #star_in_chest item_count
