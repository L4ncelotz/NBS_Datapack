# เช็กว่าจุดปัจจุบันเป็นธงสีขาว (แบบตั้งพื้น หรือ แบบแปะกำแพง) และยังไม่มีหมุดธงอยู่ตรงนี้
execute if block ~ ~ ~ minecraft:white_banner unless entity @e[type=minecraft:marker,tag=flag_anchor,distance=..1.2] run summon minecraft:marker ~ ~ ~ {Tags:["temp_flag_check"]}
execute if block ~ ~ ~ minecraft:white_wall_banner unless entity @e[type=minecraft:marker,tag=flag_anchor,distance=..1.2] run summon minecraft:marker ~ ~ ~ {Tags:["temp_flag_check"]}

# ถ้ายังไม่เจอตัวเช็ก (แปลว่ายังไม่ชนธง) และยังไม่เกินระยะ 6.5 บล็อก จากตัวผู้เล่น ให้ขยับไปข้างหน้าอีก 0.25 บล็อกแล้วเช็กซ้ำ
execute unless entity @e[type=minecraft:marker,tag=temp_flag_check] positioned ^ ^ ^0.25 if entity @s[distance=..6.5] run function nbs:territory/raycast_flag