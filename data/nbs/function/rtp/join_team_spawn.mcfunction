# คัดลอก team_id ของผู้เล่นมาเก็บไว้เทียบกับจุดเกิดทีม
scoreboard players operation #join_team team_id = @s team_id

# ตรวจว่าทีมนี้มีหมุดจุดเกิด (team_spawn) แล้วหรือยัง
tag @e[type=minecraft:marker,tag=team_spawn] remove target_team_spawn
execute as @e[type=minecraft:marker,tag=team_spawn] if score @s team_id = #join_team team_id run tag @s add target_team_spawn

# ถ้าทีมนี้ยังไม่มีจุดเกิด -> เสกหมุดใหม่และสุ่มกระจายตัว 5,000 บล็อก
execute unless entity @e[type=minecraft:marker,tag=target_team_spawn] run summon minecraft:marker 0 64 0 {Tags:["team_spawn","new_team_spawn","target_team_spawn"]}
execute as @e[type=minecraft:marker,tag=new_team_spawn] run scoreboard players operation @s team_id = #join_team team_id
execute as @e[type=minecraft:marker,tag=new_team_spawn] at @s run function nbs:rtp/do_spread
tag @e[type=minecraft:marker,tag=new_team_spawn] remove new_team_spawn

# วาร์ปผู้เล่นไปยังจุดเกิดของทีมตัวเอง
tp @s @e[type=minecraft:marker,tag=target_team_spawn,limit=1]
tag @e[type=minecraft:marker,tag=target_team_spawn] remove target_team_spawn

# ลบสมุดเลือกทีมออกจากตัว และแจกธงอาณาเขตประจำทีม (1 ต้น)
clear @s minecraft:written_book[custom_data={team_book:1b}]
function nbs:territory/give_flag

# ให้สถานะกันดาเมจ 5 วินาที
effect give @s minecraft:resistance 5 255 true
effect give @s minecraft:slow_falling 5 1 true
effect give @s minecraft:fire_resistance 5 1 true

# บันทึกสถานะเข้าสู่เกมแล้ว
tag @s remove in_spawn
tag @s add rtp_joined

# แจ้งเตือนและเอฟเฟกต์ต้อนรับ
title @s times 10 70 20
title @s title {"text":"ยินดีต้อนรับสู่ NBs SMP!","color":"gold","bold":true}
title @s subtitle {"text":"วาร์ปเข้าสู่จุดเกิดของทีมในป่า 5,000 บล็อกเรียบร้อยแล้ว!","color":"yellow"}
playsound minecraft:entity.player.levelup master @s ~ ~ ~ 1 1
