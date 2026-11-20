# เช็กว่าจุดปัจจุบันเป็นธงอาณาเขตลายพิเศษที่ตรงกับทีมของผู้เล่น (@s) หรือไม่
# 1. กรณีวางธงตรงกับทีมตัวเอง -> สร้างหมุดตรวจสอบ temp_flag_check
execute if score @s team_id matches 1 if block ~ ~ ~ minecraft:red_banner if data block ~ ~ ~ {CustomName:{text:"🚩 ธงอาณาเขต Team 1"}} unless entity @e[type=minecraft:marker,tag=flag_anchor,distance=..1.2] run summon minecraft:marker ~ ~ ~ {Tags:["temp_flag_check"]}
execute if score @s team_id matches 1 if block ~ ~ ~ minecraft:red_wall_banner if data block ~ ~ ~ {CustomName:{text:"🚩 ธงอาณาเขต Team 1"}} unless entity @e[type=minecraft:marker,tag=flag_anchor,distance=..1.2] run summon minecraft:marker ~ ~ ~ {Tags:["temp_flag_check"]}

execute if score @s team_id matches 2 if block ~ ~ ~ minecraft:blue_banner if data block ~ ~ ~ {CustomName:{text:"🚩 ธงอาณาเขต Team 2"}} unless entity @e[type=minecraft:marker,tag=flag_anchor,distance=..1.2] run summon minecraft:marker ~ ~ ~ {Tags:["temp_flag_check"]}
execute if score @s team_id matches 2 if block ~ ~ ~ minecraft:blue_wall_banner if data block ~ ~ ~ {CustomName:{text:"🚩 ธงอาณาเขต Team 2"}} unless entity @e[type=minecraft:marker,tag=flag_anchor,distance=..1.2] run summon minecraft:marker ~ ~ ~ {Tags:["temp_flag_check"]}

execute if score @s team_id matches 3 if block ~ ~ ~ minecraft:green_banner if data block ~ ~ ~ {CustomName:{text:"🚩 ธงอาณาเขต Team 3"}} unless entity @e[type=minecraft:marker,tag=flag_anchor,distance=..1.2] run summon minecraft:marker ~ ~ ~ {Tags:["temp_flag_check"]}
execute if score @s team_id matches 3 if block ~ ~ ~ minecraft:green_wall_banner if data block ~ ~ ~ {CustomName:{text:"🚩 ธงอาณาเขต Team 3"}} unless entity @e[type=minecraft:marker,tag=flag_anchor,distance=..1.2] run summon minecraft:marker ~ ~ ~ {Tags:["temp_flag_check"]}

execute if score @s team_id matches 4 if block ~ ~ ~ minecraft:yellow_banner if data block ~ ~ ~ {CustomName:{text:"🚩 ธงอาณาเขต Team 4"}} unless entity @e[type=minecraft:marker,tag=flag_anchor,distance=..1.2] run summon minecraft:marker ~ ~ ~ {Tags:["temp_flag_check"]}
execute if score @s team_id matches 4 if block ~ ~ ~ minecraft:yellow_wall_banner if data block ~ ~ ~ {CustomName:{text:"🚩 ธงอาณาเขต Team 4"}} unless entity @e[type=minecraft:marker,tag=flag_anchor,distance=..1.2] run summon minecraft:marker ~ ~ ~ {Tags:["temp_flag_check"]}

# 2. กรณีเอาธงอาณาเขตของทีมอื่นมาวาง -> ดีดธงออกและแจ้งเตือนทันที
execute unless score @s team_id matches 1 if block ~ ~ ~ minecraft:red_banner if data block ~ ~ ~ {CustomName:{text:"🚩 ธงอาณาเขต Team 1"}} run function nbs:territory/reject_wrong_team_flag
execute unless score @s team_id matches 1 if block ~ ~ ~ minecraft:red_wall_banner if data block ~ ~ ~ {CustomName:{text:"🚩 ธงอาณาเขต Team 1"}} run function nbs:territory/reject_wrong_team_flag
execute unless score @s team_id matches 2 if block ~ ~ ~ minecraft:blue_banner if data block ~ ~ ~ {CustomName:{text:"🚩 ธงอาณาเขต Team 2"}} run function nbs:territory/reject_wrong_team_flag
execute unless score @s team_id matches 2 if block ~ ~ ~ minecraft:blue_wall_banner if data block ~ ~ ~ {CustomName:{text:"🚩 ธงอาณาเขต Team 2"}} run function nbs:territory/reject_wrong_team_flag
execute unless score @s team_id matches 3 if block ~ ~ ~ minecraft:green_banner if data block ~ ~ ~ {CustomName:{text:"🚩 ธงอาณาเขต Team 3"}} run function nbs:territory/reject_wrong_team_flag
execute unless score @s team_id matches 3 if block ~ ~ ~ minecraft:green_wall_banner if data block ~ ~ ~ {CustomName:{text:"🚩 ธงอาณาเขต Team 3"}} run function nbs:territory/reject_wrong_team_flag
execute unless score @s team_id matches 4 if block ~ ~ ~ minecraft:yellow_banner if data block ~ ~ ~ {CustomName:{text:"🚩 ธงอาณาเขต Team 4"}} run function nbs:territory/reject_wrong_team_flag
execute unless score @s team_id matches 4 if block ~ ~ ~ minecraft:yellow_wall_banner if data block ~ ~ ~ {CustomName:{text:"🚩 ธงอาณาเขต Team 4"}} run function nbs:territory/reject_wrong_team_flag

# ถ้ายังไม่เจอตัวเช็ก และยังไม่เกินระยะ 6.5 บล็อก ให้ขยับไปข้างหน้าอีก 0.25 บล็อกแล้วเช็กซ้ำ
execute unless entity @e[type=minecraft:marker,tag=temp_flag_check] positioned ^ ^ ^0.25 if entity @s[distance=..6.5] run function nbs:territory/raycast_flag
