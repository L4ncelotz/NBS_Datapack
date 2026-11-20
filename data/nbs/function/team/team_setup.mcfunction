# ==========================================
# ตั้งค่าระบบทีมแบบยืดหยุ่น (รองรับ 1 ถึง 8 ทีม, เปลี่ยนชื่อบน Sidebar, เปลี่ยนสี, เพิ่ม/ลดทีมได้ตลอดเวลา)
# ==========================================
team add team_1 {"text":"Team 1"}
team add team_2 {"text":"Team 2"}
team add team_3 {"text":"Team 3"}
team add team_4 {"text":"Team 4"}
team add team_5 {"text":"Team 5"}
team add team_6 {"text":"Team 6"}
team add team_7 {"text":"Team 7"}
team add team_8 {"text":"Team 8"}

team modify team_1 nametagVisibility hideForOtherTeams
team modify team_2 nametagVisibility hideForOtherTeams
team modify team_3 nametagVisibility hideForOtherTeams
team modify team_4 nametagVisibility hideForOtherTeams
team modify team_5 nametagVisibility hideForOtherTeams
team modify team_6 nametagVisibility hideForOtherTeams
team modify team_7 nametagVisibility hideForOtherTeams
team modify team_8 nametagVisibility hideForOtherTeams

team modify team_1 friendlyFire false
team modify team_2 friendlyFire false
team modify team_3 friendlyFire false
team modify team_4 friendlyFire false
team modify team_5 friendlyFire false
team modify team_6 friendlyFire false
team modify team_7 friendlyFire false
team modify team_8 friendlyFire false

team join team_1 ทีมที่_1
team join team_2 ทีมที่_2
team join team_3 ทีมที่_3
team join team_4 ทีมที่_4
team join team_5 ทีมที่_5
team join team_6 ทีมที่_6
team join team_7 ทีมที่_7
team join team_8 ทีมที่_8

# กำหนดข้อมูลเริ่มต้นของทั้ง 8 ทีม (เฉพาะครั้งแรก ยังไม่เคยตั้งชื่อ)
execute unless data storage nbs:team t1 run data modify storage nbs:team t1 set value {team:1,name:"Team 1",color:"red"}
execute unless data storage nbs:team t2 run data modify storage nbs:team t2 set value {team:2,name:"Team 2",color:"blue"}
execute unless data storage nbs:team t3 run data modify storage nbs:team t3 set value {team:3,name:"Team 3",color:"green"}
execute unless data storage nbs:team t4 run data modify storage nbs:team t4 set value {team:4,name:"Team 4",color:"yellow"}
execute unless data storage nbs:team t5 run data modify storage nbs:team t5 set value {team:5,name:"Team 5",color:"light_purple"}
execute unless data storage nbs:team t6 run data modify storage nbs:team t6 set value {team:6,name:"Team 6",color:"aqua"}
execute unless data storage nbs:team t7 run data modify storage nbs:team t7 set value {team:7,name:"Team 7",color:"gold"}
execute unless data storage nbs:team t8 run data modify storage nbs:team t8 set value {team:8,name:"Team 8",color:"white"}

# เปิดใช้งานเริ่มต้น 4 ทีม (แอดมินกดเพิ่มถึง 8 ทีม หรือลดเหลือ 1-3 ทีมได้ในเมนูจัดการทีม)
execute unless score #team_init game_state matches 1 run scoreboard players set #t1_active game_state 1
execute unless score #team_init game_state matches 1 run scoreboard players set #t2_active game_state 1
execute unless score #team_init game_state matches 1 run scoreboard players set #t3_active game_state 1
execute unless score #team_init game_state matches 1 run scoreboard players set #t4_active game_state 1
execute unless score #team_init game_state matches 1 run scoreboard players set #t5_active game_state 0
execute unless score #team_init game_state matches 1 run scoreboard players set #t6_active game_state 0
execute unless score #team_init game_state matches 1 run scoreboard players set #t7_active game_state 0
execute unless score #team_init game_state matches 1 run scoreboard players set #t8_active game_state 0
scoreboard players set #team_init game_state 1

# อัปเดตชื่อและสีทีมทั้งหมดขึ้น Sidebar และระบบทีม
function nbs:team/refresh_all_styles
