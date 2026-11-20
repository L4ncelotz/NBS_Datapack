# สร้างทีม A และตั้งค่าให้เห็นเฉพาะพวกเดียวกัน
team add team_a {"text":"Team A","color":"red"}
team modify team_a nametagVisibility hideForOtherTeams
team modify team_a friendlyFire false

# สร้างทีม B และตั้งค่าให้เห็นเฉพาะพวกเดียวกัน
team add team_b {"text":"Team B","color":"blue"}
team modify team_b nametagVisibility hideForOtherTeams
team modify team_b friendlyFire false
