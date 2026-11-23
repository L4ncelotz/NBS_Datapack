# ==========================================
# คำสั่งเริ่มเกมสำหรับแอดมิน (/function nbs:game/start) — ตรวจสอบความพร้อมแบบ Type-Safe ก่อนเริ่มเกม!
# ==========================================

# 0. ตรวจสอบว่าเกมเริ่มไปแล้วหรือไม่
execute if score #game_state game_state matches 1.. run tellraw @s [{"text":"⚠️ [NBs SMP] ","color":"gold","bold":true},{"text":"เกมเริ่มไปแล้ว! หากต้องการเริ่มใหม่ กรุณากด ","color":"yellow"},{"text":"[ ↺ รีเซ็ตกลับ Lobby ]","color":"red","bold":true,"click_event":{"action":"run_command","command":"/function nbs:game/reset"}}]
execute if score #game_state game_state matches 1.. run return 0

# 1. ตรวจสอบ Default 4 ทีมและบังคับกำหนดค่าเริ่มต้นให้ผู้เล่นทุกคน (ป้องกันค่า NULL)
function nbs:team/ensure_defaults
scoreboard players add @a team_id 0
scoreboard players add @a career_id 0
scoreboard players add #t1_career career_id 0
scoreboard players add #t2_career career_id 0
scoreboard players add #t3_career career_id 0
scoreboard players add #t4_career career_id 0
scoreboard players add #t5_career career_id 0
scoreboard players add #t6_career career_id 0
scoreboard players add #t7_career career_id 0
scoreboard players add #t8_career career_id 0

# 2. ซิงค์ Vanilla Team -> team_id และตรวจความถูกต้องของ Type & ช่วงค่า (Type-Safe Validation)
execute as @a[team=team_1] run scoreboard players set @s team_id 1
execute as @a[team=team_2] run scoreboard players set @s team_id 2
execute as @a[team=team_3] run scoreboard players set @s team_id 3
execute as @a[team=team_4] run scoreboard players set @s team_id 4
execute as @a[team=team_5] run scoreboard players set @s team_id 5
execute as @a[team=team_6] run scoreboard players set @s team_id 6
execute as @a[team=team_7] run scoreboard players set @s team_id 7
execute as @a[team=team_8] run scoreboard players set @s team_id 8
execute as @a[team=] run scoreboard players set @s team_id 0

# Backward Compatibility: โอนสายอาชีพจากสมาชิกคนแรกเข้าทีม หาก #t<N>_career ยังเป็น 0
execute if score #t1_career career_id matches 0 as @a[scores={team_id=1,career_id=1..4},limit=1] run scoreboard players operation #t1_career career_id = @s career_id
execute if score #t2_career career_id matches 0 as @a[scores={team_id=2,career_id=1..4},limit=1] run scoreboard players operation #t2_career career_id = @s career_id
execute if score #t3_career career_id matches 0 as @a[scores={team_id=3,career_id=1..4},limit=1] run scoreboard players operation #t3_career career_id = @s career_id
execute if score #t4_career career_id matches 0 as @a[scores={team_id=4,career_id=1..4},limit=1] run scoreboard players operation #t4_career career_id = @s career_id
execute if score #t5_career career_id matches 0 as @a[scores={team_id=5,career_id=1..4},limit=1] run scoreboard players operation #t5_career career_id = @s career_id
execute if score #t6_career career_id matches 0 as @a[scores={team_id=6,career_id=1..4},limit=1] run scoreboard players operation #t6_career career_id = @s career_id
execute if score #t7_career career_id matches 0 as @a[scores={team_id=7,career_id=1..4},limit=1] run scoreboard players operation #t7_career career_id = @s career_id
execute if score #t8_career career_id matches 0 as @a[scores={team_id=8,career_id=1..4},limit=1] run scoreboard players operation #t8_career career_id = @s career_id

# ซิงค์สายอาชีพของทีมให้สมาชิกทุกคนในทีม
execute if score #t1_career career_id matches 1..4 run scoreboard players operation @a[scores={team_id=1}] career_id = #t1_career career_id
execute if score #t2_career career_id matches 1..4 run scoreboard players operation @a[scores={team_id=2}] career_id = #t2_career career_id
execute if score #t3_career career_id matches 1..4 run scoreboard players operation @a[scores={team_id=3}] career_id = #t3_career career_id
execute if score #t4_career career_id matches 1..4 run scoreboard players operation @a[scores={team_id=4}] career_id = #t4_career career_id
execute if score #t5_career career_id matches 1..4 run scoreboard players operation @a[scores={team_id=5}] career_id = #t5_career career_id
execute if score #t6_career career_id matches 1..4 run scoreboard players operation @a[scores={team_id=6}] career_id = #t6_career career_id
execute if score #t7_career career_id matches 1..4 run scoreboard players operation @a[scores={team_id=7}] career_id = #t7_career career_id
execute if score #t8_career career_id matches 1..4 run scoreboard players operation @a[scores={team_id=8}] career_id = #t8_career career_id
scoreboard players set @a[scores={team_id=0}] career_id 0

# ห้ามผู้เล่นค้างอยู่ในทีมที่ถูกปิดใช้งาน หรือมี team_id นอกช่วง 1..8
execute unless score #t1_active game_state matches 1 as @a[scores={team_id=1}] run function nbs:team/kick_inactive_team
execute unless score #t2_active game_state matches 1 as @a[scores={team_id=2}] run function nbs:team/kick_inactive_team
execute unless score #t3_active game_state matches 1 as @a[scores={team_id=3}] run function nbs:team/kick_inactive_team
execute unless score #t4_active game_state matches 1 as @a[scores={team_id=4}] run function nbs:team/kick_inactive_team
execute unless score #t5_active game_state matches 1 as @a[scores={team_id=5}] run function nbs:team/kick_inactive_team
execute unless score #t6_active game_state matches 1 as @a[scores={team_id=6}] run function nbs:team/kick_inactive_team
execute unless score #t7_active game_state matches 1 as @a[scores={team_id=7}] run function nbs:team/kick_inactive_team
execute unless score #t8_active game_state matches 1 as @a[scores={team_id=8}] run function nbs:team/kick_inactive_team
execute as @a unless score @s team_id matches 1..8 run scoreboard players set @s team_id 0

# ตรวจสอบค่าสายอาชีพต้องอยู่ในช่วง 1..4 เท่านั้น (1=Farmer, 2=Blacksmith, 3=Hunter, 4=Adventurer)
execute as @a unless score @s career_id matches 1..4 run scoreboard players set @s career_id 0

# 3. นับจำนวนผู้เล่นที่เล่นจริง (ไม่ใช่ Spectator) และจำนวนคนที่ยังไม่เลือกทีม / ยังไม่เลือกสายอาชีพ
scoreboard players set #ready_players rnd_temp 0
scoreboard players set #no_team_cnt rnd_temp 0
scoreboard players set #no_career_cnt rnd_temp 0
scoreboard players set #start_blocked rnd_temp 0

execute as @a[gamemode=!spectator] run scoreboard players add #ready_players rnd_temp 1
execute as @a[gamemode=!spectator,scores={team_id=0}] run scoreboard players add #no_team_cnt rnd_temp 1
execute as @a[gamemode=!spectator,scores={team_id=1..8,career_id=0}] run scoreboard players add #no_career_cnt rnd_temp 1

# 4. เช็กกรณีไม่มีผู้เล่นเลย
execute if score #ready_players rnd_temp matches 0 run tellraw @s [{"text":"❌ [NBs SMP] ","color":"red","bold":true},{"text":"ไม่พบผู้เล่นที่พร้อมเริ่มเกม (ทุกคนอยู่ในโหมด Spectator)","color":"yellow"}]

# 5. ถ้ายังมีคนเลือกทีม หรือเลือกสายอาชีพไม่ครบ -> บล็อกการเริ่มเกมและประกาศรายชื่อทันที!
execute if score #ready_players rnd_temp matches 1.. if score #no_team_cnt rnd_temp matches 1.. run scoreboard players set #start_blocked rnd_temp 1
execute if score #ready_players rnd_temp matches 1.. if score #no_career_cnt rnd_temp matches 1.. run scoreboard players set #start_blocked rnd_temp 1

execute if score #ready_players rnd_temp matches 1.. if score #start_blocked rnd_temp matches 1 run tellraw @a {"text":"========================================","color":"dark_red","bold":true}
execute if score #ready_players rnd_temp matches 1.. if score #start_blocked rnd_temp matches 1 run tellraw @a {"text":" ⛔ ไม่สามารถเริ่มเกมได้ (ผู้เล่นยังไม่พร้อม!)","color":"red","bold":true}
execute if score #ready_players rnd_temp matches 1.. if score #start_blocked rnd_temp matches 1 run tellraw @a {"text":"========================================","color":"dark_red","bold":true}

# แจ้งเตือนคนที่ยังไม่เลือกทีม
execute if score #ready_players rnd_temp matches 1.. if score #no_team_cnt rnd_temp matches 1.. run tellraw @a [{"text":"⚠️ ผู้เล่นที่ยังไม่เลือกทีม (","color":"gold"},{"score":{"name":"#no_team_cnt","objective":"rnd_temp"},"color":"yellow","bold":true},{"text":" คน):","color":"gold"}]
execute if score #ready_players rnd_temp matches 1.. if score #no_team_cnt rnd_temp matches 1.. as @a[gamemode=!spectator,scores={team_id=0}] run tellraw @a [{"text":" - ","color":"gray"},{"selector":"@s","color":"white","bold":true},{"text":" กรุณากด ","color":"gray"},{"text":"[👥 เลือกทีม]","color":"green","bold":true,"click_event":{"action":"run_command","command":"/trigger join_team set 98"}}]

# แจ้งเตือนคนที่ทีมยังไม่ได้เลือกสายอาชีพ
execute if score #ready_players rnd_temp matches 1.. if score #no_career_cnt rnd_temp matches 1.. run tellraw @a [{"text":"⚠️ ผู้เล่นที่ทีมยังไม่เลือกสายอาชีพ (","color":"gold"},{"score":{"name":"#no_career_cnt","objective":"rnd_temp"},"color":"yellow","bold":true},{"text":" คน):","color":"gold"}]
execute if score #ready_players rnd_temp matches 1.. if score #no_career_cnt rnd_temp matches 1.. as @a[gamemode=!spectator,scores={team_id=1..8,career_id=0}] run tellraw @a [{"text":" - ","color":"gray"},{"selector":"@s","color":"white","bold":true},{"text":" กรุณากด ","color":"gray"},{"text":"[🛠️ เลือกสายอาชีพ]","color":"aqua","bold":true,"click_event":{"action":"run_command","command":"/trigger career"}}]

# ปุ่มลัดสำหรับ Admin ให้จัดการอัตโนมัติหรือ Force Start ได้ (ส่งให้ผู้รันคำสั่ง @s)
execute if score #ready_players rnd_temp matches 1.. if score #start_blocked rnd_temp matches 1 run tellraw @s {"text":"----------------------------------------","color":"dark_gray"}
execute if score #ready_players rnd_temp matches 1.. if score #start_blocked rnd_temp matches 1 run tellraw @s [{"text":"👑 สำหรับแอดมิน: ","color":"gold","bold":true},{"text":"[🎲 สุ่มทีม+อาชีพคนไม่พร้อม] ","color":"aqua","bold":true,"click_event":{"action":"run_command","command":"/function nbs:game/auto_ready"}},{"text":"[▶ เริ่มเกมทันที (Force Start)]","color":"red","bold":true,"click_event":{"action":"run_command","command":"/function nbs:game/do_start"}}]
execute if score #ready_players rnd_temp matches 1.. if score #start_blocked rnd_temp matches 1 run tellraw @a {"text":"========================================","color":"dark_red","bold":true}
execute if score #ready_players rnd_temp matches 1.. if score #start_blocked rnd_temp matches 1 run playsound minecraft:block.note_block.bass master @a ~ ~ ~ 1 0.5

# 6. ถ้าพร้อมครบทุกคนแล้ว -> เรียกฟังก์ชันเริ่มเกมทันที
execute if score #ready_players rnd_temp matches 1.. if score #start_blocked rnd_temp matches 0 run function nbs:game/do_start
