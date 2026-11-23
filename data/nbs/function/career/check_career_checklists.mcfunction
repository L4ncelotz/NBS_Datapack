# สลับตรวจเช็กลิสต์อาชีพทีละสายต่อวินาที (4 วินาทีครบ 4 สาย) เพื่อไม่ให้โหลด TPS
scoreboard players add #checklist_phase rnd_temp 1
execute if score #checklist_phase rnd_temp matches 5.. run scoreboard players set #checklist_phase rnd_temp 1

execute if score #checklist_phase rnd_temp matches 1 run function nbs:career/check_farmer
execute if score #checklist_phase rnd_temp matches 2 run function nbs:career/check_blacksmith
execute if score #checklist_phase rnd_temp matches 3 run function nbs:career/check_hunter
execute if score #checklist_phase rnd_temp matches 4 run function nbs:career/check_adventurer
