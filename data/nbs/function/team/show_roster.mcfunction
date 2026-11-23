# ==========================================
# แสดงรายชื่อสมาชิกแต่ละทีมและสายอาชีพ (/trigger team_roster หรือ /function nbs:team/show_roster)
# ==========================================
function nbs:team/ensure_defaults

# 1. ซิงค์ทีม Vanilla -> team_id ให้แม่นยำ
execute as @a[team=team_1] run scoreboard players set @s team_id 1
execute as @a[team=team_2] run scoreboard players set @s team_id 2
execute as @a[team=team_3] run scoreboard players set @s team_id 3
execute as @a[team=team_4] run scoreboard players set @s team_id 4
execute as @a[team=team_5] run scoreboard players set @s team_id 5
execute as @a[team=team_6] run scoreboard players set @s team_id 6
execute as @a[team=team_7] run scoreboard players set @s team_id 7
execute as @a[team=team_8] run scoreboard players set @s team_id 8
execute as @a[team=] run scoreboard players set @s team_id 0

# 2. ติดแท็กผู้ขอดูข้อมูล (@s) เพื่อให้แสดงผลเฉพาะคนที่กดเปิด
tag @s add viewing_roster

tellraw @a[tag=viewing_roster] {"text":"========================================","color":"dark_gray","bold":true}
tellraw @a[tag=viewing_roster] {"text":" 📋 รายชื่อสมาชิกแต่ละทีม และสายอาชีพ","color":"gold","bold":true}
tellraw @a[tag=viewing_roster] {"text":" [1 ทีม = 1 สายอาชีพ | สมาชิกทุกคนในทีมแชร์คะแนนร่วมกัน]","color":"yellow","italic":true}
tellraw @a[tag=viewing_roster] {"text":"========================================","color":"dark_gray","bold":true}

# 3. แสดงข้อมูลสมาชิกและอาชีพของทีม 1-8 ที่เปิดใช้งานอยู่
execute if score #t1_active game_state matches 1 run function nbs:team/print_team_roster with storage nbs:team t1
execute if score #t2_active game_state matches 1 run function nbs:team/print_team_roster with storage nbs:team t2
execute if score #t3_active game_state matches 1 run function nbs:team/print_team_roster with storage nbs:team t3
execute if score #t4_active game_state matches 1 run function nbs:team/print_team_roster with storage nbs:team t4
execute if score #t5_active game_state matches 1 run function nbs:team/print_team_roster with storage nbs:team t5
execute if score #t6_active game_state matches 1 run function nbs:team/print_team_roster with storage nbs:team t6
execute if score #t7_active game_state matches 1 run function nbs:team/print_team_roster with storage nbs:team t7
execute if score #t8_active game_state matches 1 run function nbs:team/print_team_roster with storage nbs:team t8

# 4. แสดงรายชื่อผู้เล่นที่ยังไม่มีทีม (เฉพาะผู้เล่นที่ไม่ใช่ Spectator)
scoreboard players set #noteam_cnt rnd_temp 0
execute as @a[gamemode=!spectator,scores={team_id=0}] run scoreboard players add #noteam_cnt rnd_temp 1

execute if score #noteam_cnt rnd_temp matches 1.. run tellraw @a[tag=viewing_roster] [{"text":" • ยังไม่มีทีม ","color":"gray","bold":true},{"text":"(","color":"dark_gray"},{"score":{"name":"#noteam_cnt","objective":"rnd_temp"},"color":"yellow","bold":true},{"text":" คน):","color":"dark_gray"}]
execute if score #noteam_cnt rnd_temp matches 1.. as @a[gamemode=!spectator,scores={team_id=0}] run tellraw @a[tag=viewing_roster] [{"text":"     • ","color":"gray"},{"selector":"@s","color":"white","bold":true},{"text":" - ","color":"dark_gray"},{"text":"(ยังไม่ได้เลือกทีม)","color":"yellow","italic":true}]

# 5. ปุ่มลัดด้านล่าง
tellraw @a[tag=viewing_roster] {"text":"----------------------------------------","color":"dark_gray"}
tellraw @a[tag=viewing_roster] [{"text":" ลิงก์ด่วน: ","color":"gray"},{"text":"[👥 เมนูเลือกทีม] ","color":"green","bold":true,"click_event":{"action":"run_command","command":"/trigger join_team set 98"}},{"text":"[🛠️ เลือกสายอาชีพ] ","color":"aqua","bold":true,"click_event":{"action":"run_command","command":"/trigger career"}},{"text":"[✖ ออกจากทีม]","color":"gray","bold":true,"click_event":{"action":"run_command","command":"/trigger join_team set 99"}}]
tellraw @a[tag=viewing_roster] {"text":"========================================","color":"dark_gray","bold":true}

tag @s remove viewing_roster
