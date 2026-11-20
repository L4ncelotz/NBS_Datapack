# ==========================================
# ดีดตัวผู้เล่นที่ตายแบบไม่มีเตียง ออกจาก Spawn สู่จุดเกิดทีมหรือป่า 5,000 บล็อก
# ==========================================

# 1. ถ้าทีมของผู้เล่นมีจุดเกิดอยู่แล้ว ให้ส่งกลับไปรวมกลุ่มกับเพื่อนในทีม
tag @e[type=minecraft:marker,tag=team_spawn] remove target_team_spawn
execute if score @s team_id matches 1 as @e[type=minecraft:marker,tag=team_spawn,tag=spawn_team_1] run tag @s add target_team_spawn
execute if score @s team_id matches 2 as @e[type=minecraft:marker,tag=team_spawn,tag=spawn_team_2] run tag @s add target_team_spawn
execute if score @s team_id matches 3 as @e[type=minecraft:marker,tag=team_spawn,tag=spawn_team_3] run tag @s add target_team_spawn
execute if score @s team_id matches 4 as @e[type=minecraft:marker,tag=team_spawn,tag=spawn_team_4] run tag @s add target_team_spawn

execute if entity @e[type=minecraft:marker,tag=target_team_spawn] run tp @s @e[type=minecraft:marker,tag=target_team_spawn,limit=1]

# 2. ถ้าไม่มีจุดเกิดทีม ให้สุ่มกระจายตัว 5,000 บล็อก
execute unless entity @e[type=minecraft:marker,tag=target_team_spawn] run function nbs:rtp/do_spread

tag @e[type=minecraft:marker,tag=target_team_spawn] remove target_team_spawn

# 3. ให้สถานะกันดาเมจตกจากที่สูงและดาเมจทุกชนิด 5 วินาที
effect give @s minecraft:resistance 5 255 true
effect give @s minecraft:slow_falling 5 1 true
effect give @s minecraft:fire_resistance 5 1 true

# 4. ปลดแท็กการตายออก
tag @s remove just_died
tag @s remove in_spawn

# 5. แจ้งเตือนผู้เล่น
title @s times 10 50 20
title @s title {"text":"สุ่มเกิดใหม่ในป่า!","color":"red","bold":true}
title @s subtitle {"text":"ไม่พบจุดเกิดเตียง จึงส่งกลับสู่สนามรบ 5,000 บล็อก","color":"gold"}
playsound minecraft:item.chorus_fruit.teleport master @s ~ ~ ~ 1 1
