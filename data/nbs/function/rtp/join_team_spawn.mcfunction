# ==========================================
# วาร์ปผู้เล่นไปยังจุดเกิดของทีม (ถ้าทีมยังไม่มีจุดเกิด ให้สุ่มจุดเกิดใหม่ในป่า 5,000 บล็อก)
# ==========================================

# 1. กำหนดเป้าหมายหาหมุดของทีมผู้เล่น
tag @e[type=minecraft:marker,tag=team_spawn] remove target_team_spawn
execute if score @s team_id matches 1 as @e[type=minecraft:marker,tag=team_spawn,tag=spawn_team_1] run tag @s add target_team_spawn
execute if score @s team_id matches 2 as @e[type=minecraft:marker,tag=team_spawn,tag=spawn_team_2] run tag @s add target_team_spawn
execute if score @s team_id matches 3 as @e[type=minecraft:marker,tag=team_spawn,tag=spawn_team_3] run tag @s add target_team_spawn
execute if score @s team_id matches 4 as @e[type=minecraft:marker,tag=team_spawn,tag=spawn_team_4] run tag @s add target_team_spawn

# 2. ถ้าทีมนี้ "ยังไม่มีจุดเกิด" -> สุ่มกระจายตัวผู้เล่นคนแรกออกไปในป่า 5,000 บล็อก แล้วปักหมุดตรงนั้น!
execute unless entity @e[type=minecraft:marker,tag=target_team_spawn] run function nbs:rtp/do_spread
execute unless entity @e[type=minecraft:marker,tag=target_team_spawn] if score @s team_id matches 1 at @s run summon minecraft:marker ~ ~ ~ {Tags:["team_spawn","spawn_team_1"]}
execute unless entity @e[type=minecraft:marker,tag=target_team_spawn] if score @s team_id matches 2 at @s run summon minecraft:marker ~ ~ ~ {Tags:["team_spawn","spawn_team_2"]}
execute unless entity @e[type=minecraft:marker,tag=target_team_spawn] if score @s team_id matches 3 at @s run summon minecraft:marker ~ ~ ~ {Tags:["team_spawn","spawn_team_3"]}
execute unless entity @e[type=minecraft:marker,tag=target_team_spawn] if score @s team_id matches 4 at @s run summon minecraft:marker ~ ~ ~ {Tags:["team_spawn","spawn_team_4"]}

# 3. ถ้าทีมนี้ "มีจุดเกิดอยู่แล้ว" (เช่น สมาชิกคนที่ 2 เป็นต้นไป) -> วาร์ปไปหาหมุดของทีมทันที!
execute if entity @e[type=minecraft:marker,tag=target_team_spawn] run tp @s @e[type=minecraft:marker,tag=target_team_spawn,limit=1]

# 4. ล้างแท็กค้นหา
tag @e[type=minecraft:marker,tag=target_team_spawn] remove target_team_spawn

# 5. ลบสมุดเลือกทีมออกจากตัว
clear @s minecraft:written_book[custom_data={team_book:1b}]

# 6. บัฟกันดาเมจ 5 วินาที
effect give @s minecraft:resistance 5 255 true
effect give @s minecraft:slow_falling 5 1 true
effect give @s minecraft:fire_resistance 5 1 true

# 7. ปลดสถานะในสปอว์นและบันทึกว่าเข้าเกมแล้ว
tag @s remove in_spawn
tag @s add rtp_joined

# 8. แจ้งเตือนและเอฟเฟกต์
title @s times 10 70 20
title @s title {"text":"เข้าสู่สนามแข่ง NBs SMP!","color":"gold","bold":true}
title @s subtitle {"text":"วาร์ปมายังจุดประจำทีมในป่า 5,000 บล็อกเรียบร้อยแล้ว!","color":"yellow"}
playsound minecraft:entity.player.levelup master @s ~ ~ ~ 1 1
