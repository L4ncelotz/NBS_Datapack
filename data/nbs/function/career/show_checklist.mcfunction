# แสดงสรุปคะแนนเช็กลิสต์ย่อยทั้ง 4 สายอาชีพของทีมผู้เล่น (@s)
scoreboard players add #team_1 team_career_pts 0
scoreboard players add #team_2 team_career_pts 0
scoreboard players add #team_3 team_career_pts 0
scoreboard players add #team_4 team_career_pts 0

execute if score @s team_id matches 0 run tellraw @s [{"text":"❌ [สายอาชีพ] ","color":"red","bold":true},{"text":"คุณต้องมีทีมก่อนจึงจะดูสรุปคะแนนเช็กลิสต์ของทีมได้!","color":"yellow"}]

execute if score @s team_id matches 1..4 run tellraw @s {"text":"========================================","color":"dark_gray","bold":true}
execute if score @s team_id matches 1..4 run tellraw @s {"text":" 📋 สรุปคะแนนเช็กลิสต์สายอาชีพของทีมคุณ","color":"gold","bold":true}
execute if score @s team_id matches 1..4 run tellraw @s {"text":"========================================","color":"dark_gray","bold":true}

execute if score @s team_id matches 1 run function nbs:career/print_team_checklist {team:1}
execute if score @s team_id matches 2 run function nbs:career/print_team_checklist {team:2}
execute if score @s team_id matches 3 run function nbs:career/print_team_checklist {team:3}
execute if score @s team_id matches 4 run function nbs:career/print_team_checklist {team:4}

execute if score @s team_id matches 1..4 run tellraw @s {"text":"========================================","color":"dark_gray","bold":true}
