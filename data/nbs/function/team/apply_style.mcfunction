# อัปเดตชื่อแสดงผลบน Sidebar และ Prefix/สี ของทีมที่ระบุ ($(team), $(name), $(color))
$team modify team_$(team) displayName {"text":"$(name)","color":"$(color)","bold":true}
$team modify team_$(team) color $(color)
$team modify team_$(team) prefix {"text":"[$(name)] ","color":"$(color)"}
$execute if score #t$(team)_active game_state matches 1 run scoreboard players add ทีมที่_$(team) team_score 0
$execute if score #t$(team)_active game_state matches 1 run scoreboard players display name ทีมที่_$(team) team_score {"text":"$(name)","color":"$(color)","bold":true}
$execute if score #t$(team)_active game_state matches 0 run scoreboard players reset ทีมที่_$(team) team_score
