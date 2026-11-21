# ==========================================
# สร้างหมุดจุดเกิดและลานป้อมปราการ The Citadel (0, 0) บนพื้นผิวจริงอัตโนมัติ
# ==========================================
forceload add -16 -16 16 16
kill @e[tag=spawn_anchor]
kill @e[type=minecraft:text_display,tag=citadel_title]

# 1. เสกหมุดแล้วใช้ spreadplayers หาความสูงพื้นผิวบนสุดตรงพิกัด (0, 0)
summon minecraft:marker 0 120 0 {Tags:["spawn_anchor"]}
spreadplayers 0 0 0 1 false @e[tag=spawn_anchor,limit=1]
execute as @e[tag=spawn_anchor,limit=1] at @s align xyz run tp @s ~0.5 ~ ~0.5

# 2. สร้างลานป้อมปราการ The Citadel (13x13) รอบหมุด เพื่อไม่ให้จมดินหรือตกน้ำ
execute at @e[tag=spawn_anchor,limit=1] align xyz positioned ~ ~ ~ run fill ~-6 ~-2 ~-6 ~6 ~-1 ~6 minecraft:stone_bricks
execute at @e[tag=spawn_anchor,limit=1] align xyz positioned ~ ~ ~ run fill ~-6 ~-1 ~-6 ~6 ~-1 ~-6 minecraft:polished_deepslate_bricks
execute at @e[tag=spawn_anchor,limit=1] align xyz positioned ~ ~ ~ run fill ~-6 ~-1 ~6 ~6 ~-1 ~6 minecraft:polished_deepslate_bricks
execute at @e[tag=spawn_anchor,limit=1] align xyz positioned ~ ~ ~ run fill ~-6 ~-1 ~-6 ~-6 ~-1 ~6 minecraft:polished_deepslate_bricks
execute at @e[tag=spawn_anchor,limit=1] align xyz positioned ~ ~ ~ run fill ~6 ~-1 ~-6 ~6 ~-1 ~6 minecraft:polished_deepslate_bricks

# เคลียร์พื้นที่อากาศด้านบนลานให้โล่ง (ไม่ติดต้นไม้หรือภูเขา)
execute at @e[tag=spawn_anchor,limit=1] align xyz positioned ~ ~ ~ run fill ~-6 ~ ~-6 ~6 ~7 ~6 minecraft:air

# ตกแต่งจุดกึ่งกลางและเสาไฟ 4 มุม
execute at @e[tag=spawn_anchor,limit=1] align xyz positioned ~ ~ ~ run setblock ~ ~-1 ~ minecraft:lodestone
execute at @e[tag=spawn_anchor,limit=1] align xyz positioned ~ ~ ~ run setblock ~-3 ~-1 ~-3 minecraft:sea_lantern
execute at @e[tag=spawn_anchor,limit=1] align xyz positioned ~ ~ ~ run setblock ~3 ~-1 ~-3 minecraft:sea_lantern
execute at @e[tag=spawn_anchor,limit=1] align xyz positioned ~ ~ ~ run setblock ~-3 ~-1 ~3 minecraft:sea_lantern
execute at @e[tag=spawn_anchor,limit=1] align xyz positioned ~ ~ ~ run setblock ~3 ~-1 ~3 minecraft:sea_lantern

execute at @e[tag=spawn_anchor,limit=1] align xyz positioned ~ ~ ~ run fill ~-6 ~ ~-6 ~-6 ~2 ~-6 minecraft:deepslate_brick_wall
execute at @e[tag=spawn_anchor,limit=1] align xyz positioned ~ ~ ~ run setblock ~-6 ~3 ~-6 minecraft:soul_lantern
execute at @e[tag=spawn_anchor,limit=1] align xyz positioned ~ ~ ~ run fill ~6 ~ ~-6 ~6 ~2 ~-6 minecraft:deepslate_brick_wall
execute at @e[tag=spawn_anchor,limit=1] align xyz positioned ~ ~ ~ run setblock ~6 ~3 ~-6 minecraft:soul_lantern
execute at @e[tag=spawn_anchor,limit=1] align xyz positioned ~ ~ ~ run fill ~-6 ~ ~6 ~-6 ~2 ~6 minecraft:deepslate_brick_wall
execute at @e[tag=spawn_anchor,limit=1] align xyz positioned ~ ~ ~ run setblock ~-6 ~3 ~6 minecraft:soul_lantern
execute at @e[tag=spawn_anchor,limit=1] align xyz positioned ~ ~ ~ run fill ~6 ~ ~6 ~6 ~2 ~6 minecraft:deepslate_brick_wall
execute at @e[tag=spawn_anchor,limit=1] align xyz positioned ~ ~ ~ run setblock ~6 ~3 ~6 minecraft:soul_lantern

# 3. สร้างป้ายลอยต้อนรับเหนือจุดกึ่งกลาง The Citadel และตั้งค่าจุดเกิดโลก
execute at @e[tag=spawn_anchor,limit=1] run summon minecraft:text_display ~ ~3.2 ~ {Tags:["citadel_title"],billboard:"center",background:1073741824,view_range:0.4f,text:["",{"text":"🏰 THE CITADEL (0, 0)\n","color":"gold","bold":true},{"text":"พิมพ์ ","color":"gray"},{"text":"/trigger citadel","color":"yellow","bold":true},{"text":" เพื่อซื้อธง • ฝากเพชร • ส่งเควส","color":"gray"}]}
execute at @e[tag=spawn_anchor,limit=1] run setworldspawn ~ ~ ~
