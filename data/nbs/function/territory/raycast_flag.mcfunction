# เช็กว่าจุดปัจจุบันเป็นธงอาณาเขตลายพิเศษประจำทีม (แบบตั้งพื้น หรือ แปะกำแพง) และยังไม่มีหมุดธงอยู่ตรงนี้
execute if block ~ ~ ~ minecraft:red_banner if data block ~ ~ ~ {CustomName:{text:"🚩 ธงอาณาเขต Team 1"}} unless entity @e[type=minecraft:marker,tag=flag_anchor,distance=..1.2] run summon minecraft:marker ~ ~ ~ {Tags:["temp_flag_check"]}
execute if block ~ ~ ~ minecraft:red_wall_banner if data block ~ ~ ~ {CustomName:{text:"🚩 ธงอาณาเขต Team 1"}} unless entity @e[type=minecraft:marker,tag=flag_anchor,distance=..1.2] run summon minecraft:marker ~ ~ ~ {Tags:["temp_flag_check"]}

execute if block ~ ~ ~ minecraft:blue_banner if data block ~ ~ ~ {CustomName:{text:"🚩 ธงอาณาเขต Team 2"}} unless entity @e[type=minecraft:marker,tag=flag_anchor,distance=..1.2] run summon minecraft:marker ~ ~ ~ {Tags:["temp_flag_check"]}
execute if block ~ ~ ~ minecraft:blue_wall_banner if data block ~ ~ ~ {CustomName:{text:"🚩 ธงอาณาเขต Team 2"}} unless entity @e[type=minecraft:marker,tag=flag_anchor,distance=..1.2] run summon minecraft:marker ~ ~ ~ {Tags:["temp_flag_check"]}

execute if block ~ ~ ~ minecraft:green_banner if data block ~ ~ ~ {CustomName:{text:"🚩 ธงอาณาเขต Team 3"}} unless entity @e[type=minecraft:marker,tag=flag_anchor,distance=..1.2] run summon minecraft:marker ~ ~ ~ {Tags:["temp_flag_check"]}
execute if block ~ ~ ~ minecraft:green_wall_banner if data block ~ ~ ~ {CustomName:{text:"🚩 ธงอาณาเขต Team 3"}} unless entity @e[type=minecraft:marker,tag=flag_anchor,distance=..1.2] run summon minecraft:marker ~ ~ ~ {Tags:["temp_flag_check"]}

execute if block ~ ~ ~ minecraft:yellow_banner if data block ~ ~ ~ {CustomName:{text:"🚩 ธงอาณาเขต Team 4"}} unless entity @e[type=minecraft:marker,tag=flag_anchor,distance=..1.2] run summon minecraft:marker ~ ~ ~ {Tags:["temp_flag_check"]}
execute if block ~ ~ ~ minecraft:yellow_wall_banner if data block ~ ~ ~ {CustomName:{text:"🚩 ธงอาณาเขต Team 4"}} unless entity @e[type=minecraft:marker,tag=flag_anchor,distance=..1.2] run summon minecraft:marker ~ ~ ~ {Tags:["temp_flag_check"]}

# ถ้ายังไม่เจอตัวเช็ก (แปลว่ายังไม่ชนธง) และยังไม่เกินระยะ 6.5 บล็อก จากตัวผู้เล่น ให้ขยับไปข้างหน้าอีก 0.25 บล็อกแล้วเช็กซ้ำ
execute unless entity @e[type=minecraft:marker,tag=temp_flag_check] positioned ^ ^ ^0.25 if entity @s[distance=..6.5] run function nbs:territory/raycast_flag
