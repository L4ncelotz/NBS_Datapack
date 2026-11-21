# รีเซ็ตทีมทั้งหมดกลับเป็นค่าเริ่มต้น (Default 4 ทีม: Team 1-4)
data modify storage nbs:team t1 set value {team:1,name:"Team 1",color:"red"}
data modify storage nbs:team t2 set value {team:2,name:"Team 2",color:"blue"}
data modify storage nbs:team t3 set value {team:3,name:"Team 3",color:"green"}
data modify storage nbs:team t4 set value {team:4,name:"Team 4",color:"yellow"}
data modify storage nbs:team t5 set value {team:5,name:"Team 5",color:"light_purple"}
data modify storage nbs:team t6 set value {team:6,name:"Team 6",color:"aqua"}
data modify storage nbs:team t7 set value {team:7,name:"Team 7",color:"gold"}
data modify storage nbs:team t8 set value {team:8,name:"Team 8",color:"white"}

scoreboard players set #t1_active game_state 1
scoreboard players set #t2_active game_state 1
scoreboard players set #t3_active game_state 1
scoreboard players set #t4_active game_state 1
scoreboard players set #t5_active game_state 0
scoreboard players set #t6_active game_state 0
scoreboard players set #t7_active game_state 0
scoreboard players set #t8_active game_state 0

execute as @a[team=team_5] run function nbs:team/kick_inactive_team
execute as @a[team=team_6] run function nbs:team/kick_inactive_team
execute as @a[team=team_7] run function nbs:team/kick_inactive_team
execute as @a[team=team_8] run function nbs:team/kick_inactive_team

function nbs:team/team_setup
tellraw @a [{"text":"🔄 [ระบบทีม] ","color":"aqua","bold":true},{"text":"รีเซ็ตชื่อ สี และจำนวนทีมกลับเป็นค่าเริ่มต้น (Default 4 ทีม) เรียบร้อยแล้ว!","color":"yellow"}]
function nbs:team/admin_menu
