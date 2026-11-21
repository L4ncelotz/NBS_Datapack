# ตรวจสอบและซ่อมแซมค่าเริ่มต้นของระบบทีมแบบ Type-Safe (Default 4 ทีม: Team 1-4 เปิด, Team 5-8 ปิด)
scoreboard objectives add game_state dummy
scoreboard objectives add team_score dummy {"text":"คะแนนทีม","color":"gold","bold":true}
scoreboard objectives add rnd_temp dummy

# กำหนดข้อมูลชื่อและสีเริ่มต้นหากยังไม่มีใน storage
execute unless data storage nbs:team t1 run data modify storage nbs:team t1 set value {team:1,name:"Team 1",color:"red"}
execute unless data storage nbs:team t2 run data modify storage nbs:team t2 set value {team:2,name:"Team 2",color:"blue"}
execute unless data storage nbs:team t3 run data modify storage nbs:team t3 set value {team:3,name:"Team 3",color:"green"}
execute unless data storage nbs:team t4 run data modify storage nbs:team t4 set value {team:4,name:"Team 4",color:"yellow"}
execute unless data storage nbs:team t5 run data modify storage nbs:team t5 set value {team:5,name:"Team 5",color:"light_purple"}
execute unless data storage nbs:team t6 run data modify storage nbs:team t6 set value {team:6,name:"Team 6",color:"aqua"}
execute unless data storage nbs:team t7 run data modify storage nbs:team t7 set value {team:7,name:"Team 7",color:"gold"}
execute unless data storage nbs:team t8 run data modify storage nbs:team t8 set value {team:8,name:"Team 8",color:"white"}

# Self-Healing: หากค่าสถานะ #t1..#t8 เป็น NULL หรืออยู่นอกค่า 0..1 ให้ตั้งเป็น Default 4 ทีมทันที
execute unless score #t1_active game_state matches 0..1 run scoreboard players set #t1_active game_state 1
execute unless score #t2_active game_state matches 0..1 run scoreboard players set #t2_active game_state 1
execute unless score #t3_active game_state matches 0..1 run scoreboard players set #t3_active game_state 1
execute unless score #t4_active game_state matches 0..1 run scoreboard players set #t4_active game_state 1
execute unless score #t5_active game_state matches 0..1 run scoreboard players set #t5_active game_state 0
execute unless score #t6_active game_state matches 0..1 run scoreboard players set #t6_active game_state 0
execute unless score #t7_active game_state matches 0..1 run scoreboard players set #t7_active game_state 0
execute unless score #t8_active game_state matches 0..1 run scoreboard players set #t8_active game_state 0

# ป้องกันกรณีไม่มีทีมเปิดใช้งานเลยแม้แต่ทีมเดียว (บังคับคืน Default 4 ทีม)
scoreboard players set #active_team_cnt rnd_temp 0
execute if score #t1_active game_state matches 1 run scoreboard players add #active_team_cnt rnd_temp 1
execute if score #t2_active game_state matches 1 run scoreboard players add #active_team_cnt rnd_temp 1
execute if score #t3_active game_state matches 1 run scoreboard players add #active_team_cnt rnd_temp 1
execute if score #t4_active game_state matches 1 run scoreboard players add #active_team_cnt rnd_temp 1
execute if score #t5_active game_state matches 1 run scoreboard players add #active_team_cnt rnd_temp 1
execute if score #t6_active game_state matches 1 run scoreboard players add #active_team_cnt rnd_temp 1
execute if score #t7_active game_state matches 1 run scoreboard players add #active_team_cnt rnd_temp 1
execute if score #t8_active game_state matches 1 run scoreboard players add #active_team_cnt rnd_temp 1

execute if score #active_team_cnt rnd_temp matches 0 run scoreboard players set #t1_active game_state 1
execute if score #active_team_cnt rnd_temp matches 0 run scoreboard players set #t2_active game_state 1
execute if score #active_team_cnt rnd_temp matches 0 run scoreboard players set #t3_active game_state 1
execute if score #active_team_cnt rnd_temp matches 0 run scoreboard players set #t4_active game_state 1
