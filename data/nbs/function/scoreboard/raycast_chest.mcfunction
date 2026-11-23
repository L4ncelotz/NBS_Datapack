# จัดพิกัดเข้ากึ่งกลางบล็อกก่อนเช็ก ถ้าเป็นกล่องและยังไม่มีหมุดในระยะ 0.5 บล็อก ให้ฝังหมุดทันที
execute align xyz positioned ~0.5 ~0.5 ~0.5 if block ~ ~ ~ minecraft:chest unless entity @e[type=minecraft:marker,tag=chest_anchor,distance=..0.5] run summon minecraft:marker ~ ~ ~ {Tags:["chest_anchor","new_chest"]}
execute align xyz positioned ~0.5 ~0.5 ~0.5 if block ~ ~ ~ minecraft:trapped_chest unless entity @e[type=minecraft:marker,tag=chest_anchor,distance=..0.5] run summon minecraft:marker ~ ~ ~ {Tags:["chest_anchor","new_chest"]}
execute align xyz positioned ~0.5 ~0.5 ~0.5 if block ~ ~ ~ minecraft:barrel unless entity @e[type=minecraft:marker,tag=chest_anchor,distance=..0.5] run summon minecraft:marker ~ ~ ~ {Tags:["chest_anchor","new_chest"]}
execute align xyz positioned ~0.5 ~0.5 ~0.5 if block ~ ~ ~ #nbs:shulker_boxes unless entity @e[type=minecraft:marker,tag=chest_anchor,distance=..0.5] run summon minecraft:marker ~ ~ ~ {Tags:["chest_anchor","new_chest"]}

# กรณีเป็นหีบคู่ (Double Chest) ให้สแกนบล็อกข้างๆ ก่อนบันทึก team_id เพื่อครอบคลุมทั้ง 2 ฝั่ง
execute align xyz positioned ~0.5 ~0.5 ~0.5 if block ~ ~ ~ minecraft:chest run function nbs:scoreboard/check_adjacent_chest
execute align xyz positioned ~0.5 ~0.5 ~0.5 if block ~ ~ ~ minecraft:trapped_chest run function nbs:scoreboard/check_adjacent_chest

# บันทึก team_id ตามเขตธงอาณาเขต (ถ้านอกเขตธง team_id จะเป็น 0 ไม่นับคะแนน)
scoreboard players set #new_chest_owner team_id 0
execute if entity @e[type=minecraft:marker,tag=flag_anchor,distance=..32] run scoreboard players operation #new_chest_owner team_id = @e[type=minecraft:marker,tag=flag_anchor,distance=..32,sort=nearest,limit=1] team_id
execute as @e[type=minecraft:marker,tag=new_chest] run scoreboard players operation @s team_id = #new_chest_owner team_id
tag @e[type=minecraft:marker,tag=new_chest] remove new_chest

# หยุดยิง Raycast ทันทีเมื่อเจอกล่องแล้ว หากยังไม่เจอให้ขยับไปข้างหน้าทีละ 0.25 บล็อก จนถึงระยะ 6 บล็อก
execute unless block ~ ~ ~ minecraft:chest unless block ~ ~ ~ minecraft:trapped_chest unless block ~ ~ ~ minecraft:barrel unless block ~ ~ ~ #nbs:shulker_boxes positioned ^ ^ ^0.25 if entity @s[distance=..6] run function nbs:scoreboard/raycast_chest
