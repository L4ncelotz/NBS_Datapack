# ==========================================
# ตั้งค่าระบบทีมแบบยืดหยุ่น (Default 4 ทีม — รองรับ 1 ถึง 8 ทีม, เปลี่ยนชื่อบน Sidebar, เปลี่ยนสี, เพิ่ม/ลดทีมได้ตลอดเวลา)
# ==========================================
scoreboard objectives add game_state dummy
scoreboard objectives add team_score dummy {"text":"คะแนนทีม","color":"gold","bold":true}

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

# ตรวจสอบและกำหนดค่า Default 4 ทีมแบบ Self-Healing (ไม่ทับชื่อเดิมที่ตั้งไว้แล้ว)
function nbs:team/ensure_defaults
scoreboard players set #team_init game_state 1

# อัปเดตชื่อและสีทีมทั้งหมดขึ้น Sidebar และระบบทีม
function nbs:team/refresh_all_styles
