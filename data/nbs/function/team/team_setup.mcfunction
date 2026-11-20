# สร้าง 4 ทีมหลัก (แอดมินสามารถปรับสี/ชื่อแสดง/Prefix เพิ่มเติมได้ด้วย /team modify)
team add team_1 {"text":"Team 1","color":"red"}
team modify team_1 color red
team modify team_1 nametagVisibility hideForOtherTeams
team modify team_1 friendlyFire false

team add team_2 {"text":"Team 2","color":"blue"}
team modify team_2 color blue
team modify team_2 nametagVisibility hideForOtherTeams
team modify team_2 friendlyFire false

team add team_3 {"text":"Team 3","color":"green"}
team modify team_3 color green
team modify team_3 nametagVisibility hideForOtherTeams
team modify team_3 friendlyFire false

team add team_4 {"text":"Team 4","color":"yellow"}
team modify team_4 color yellow
team modify team_4 nametagVisibility hideForOtherTeams
team modify team_4 friendlyFire false

# ผูกชื่อบนตารางคะแนน Sidebar ให้แสดงสี/Prefix ตามทีม Vanilla อัตโนมัติ
team join team_1 ทีมที่_1
team join team_2 ทีมที่_2
team join team_3 ทีมที่_3
team join team_4 ทีมที่_4
