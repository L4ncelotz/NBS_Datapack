# ==========================================
# Fallback สร้างป้อมปราการ The Citadel (0, 0) ขนาด 31x31 (ทำงานอัตโนมัติเมื่อไม่ได้ลงแพ็ก NBs_Worldgen แยก)
# ==========================================
forceload add -24 -24 24 24
kill @e[tag=spawn_anchor]
kill @e[tag=citadel_built_anchor]
kill @e[type=minecraft:text_display,tag=citadel_title]
kill @e[tag=citadel_npc]
kill @e[tag=citadel_npc_hit]

# 1. เสกหมุดและไต่ลงผ่านเรือนยอดไม้/เห็ดยักษ์ จนแตะพื้นดินแข็งจริงตรง (0, 0)
summon minecraft:marker 0 120 0 {Tags:["spawn_anchor","citadel_built_anchor"]}
spreadplayers 0 0 0 1 false @e[tag=spawn_anchor,limit=1]
scoreboard players set #wg_steps rnd_temp 0
execute as @e[tag=spawn_anchor,limit=1] at @s run function nbs:spawn/ground_anchor
execute as @e[tag=spawn_anchor,limit=1] at @s align xyz run tp @s ~0.5 ~ ~0.5

# 2. ปาดหน้าผาและต้นไม้รอบป้อมเป็นแอ่งขั้นบันได 3 ชั้น
execute at @e[tag=spawn_anchor,limit=1] align xyz positioned ~ ~ ~ run fill ~-15 ~16 ~-15 ~15 ~28 ~15 minecraft:air
execute at @e[tag=spawn_anchor,limit=1] align xyz positioned ~ ~ ~ run fill ~-22 ~5 ~-22 ~22 ~18 ~22 minecraft:air
execute at @e[tag=spawn_anchor,limit=1] align xyz positioned ~ ~ ~ run fill ~-18 ~2 ~-18 ~18 ~4 ~18 minecraft:air
execute at @e[tag=spawn_anchor,limit=1] align xyz positioned ~ ~ ~ run fill ~-15 ~ ~-15 ~15 ~1 ~15 minecraft:air

# 3. ถมฐานรากหินลึกลงสู่พื้นล่าง 30 บล็อก (แทนที่เฉพาะอากาศ/น้ำ/ใบไม้ ไม่ลบภูเขาเดิม) กันป้อมลอยกลางเหว 100%
execute at @e[tag=spawn_anchor,limit=1] align xyz positioned ~ ~ ~ run fill ~-15 ~-15 ~-15 ~15 ~-2 ~15 minecraft:stone_bricks replace #nbs:ground_passthrough
execute at @e[tag=spawn_anchor,limit=1] align xyz positioned ~ ~ ~ run fill ~-15 ~-30 ~-15 ~15 ~-16 ~15 minecraft:deepslate_bricks replace #nbs:ground_passthrough

execute at @e[tag=spawn_anchor,limit=1] align xyz positioned ~ ~ ~ run fill ~-15 ~-25 ~-15 ~-14 ~-2 ~-14 minecraft:deepslate_bricks
execute at @e[tag=spawn_anchor,limit=1] align xyz positioned ~ ~ ~ run fill ~14 ~-25 ~-15 ~15 ~-2 ~-14 minecraft:deepslate_bricks
execute at @e[tag=spawn_anchor,limit=1] align xyz positioned ~ ~ ~ run fill ~-15 ~-25 ~14 ~-14 ~-2 ~15 minecraft:deepslate_bricks
execute at @e[tag=spawn_anchor,limit=1] align xyz positioned ~ ~ ~ run fill ~14 ~-25 ~14 ~15 ~-2 ~15 minecraft:deepslate_bricks

# 4. ปูพื้นป้อมปราการขนาด 31x31 + ทางเดินกากบาทเข้าสู่ 4 ประตู
execute at @e[tag=spawn_anchor,limit=1] align xyz positioned ~ ~ ~ run fill ~-15 ~-1 ~-15 ~15 ~-1 ~15 minecraft:deepslate_bricks
execute at @e[tag=spawn_anchor,limit=1] align xyz positioned ~ ~ ~ run fill ~-14 ~-1 ~-14 ~14 ~-1 ~14 minecraft:stone_bricks
execute at @e[tag=spawn_anchor,limit=1] align xyz positioned ~ ~ ~ run fill ~-9 ~-1 ~-9 ~9 ~-1 ~9 minecraft:polished_deepslate
execute at @e[tag=spawn_anchor,limit=1] align xyz positioned ~ ~ ~ run fill ~-14 ~-1 ~-2 ~14 ~-1 ~2 minecraft:polished_andesite
execute at @e[tag=spawn_anchor,limit=1] align xyz positioned ~ ~ ~ run fill ~-2 ~-1 ~-14 ~2 ~-1 ~14 minecraft:polished_andesite
execute at @e[tag=spawn_anchor,limit=1] align xyz positioned ~ ~ ~ run fill ~-14 ~-1 ~-1 ~14 ~-1 ~1 minecraft:chiseled_stone_bricks
execute at @e[tag=spawn_anchor,limit=1] align xyz positioned ~ ~ ~ run fill ~-1 ~-1 ~-14 ~1 ~-1 ~14 minecraft:chiseled_stone_bricks

# 5. เสา Beacon กลางป้อม (0, 0) ยิงแสงขึ้นฟ้าตรงจุดรวมพล
execute at @e[tag=spawn_anchor,limit=1] align xyz positioned ~ ~ ~ run fill ~-1 ~-3 ~-1 ~1 ~-3 ~1 minecraft:iron_block
execute at @e[tag=spawn_anchor,limit=1] align xyz positioned ~ ~ ~ run setblock ~ ~-2 ~ minecraft:beacon
execute at @e[tag=spawn_anchor,limit=1] align xyz positioned ~ ~ ~ run setblock ~ ~-1 ~ minecraft:white_stained_glass

# 6. ตารางไฟสว่าง (Sea Lantern + Shroomlight) ฝังทั่วลาน
execute at @e[tag=spawn_anchor,limit=1] align xyz positioned ~ ~ ~ run setblock ~-4 ~-1 ~-4 minecraft:sea_lantern
execute at @e[tag=spawn_anchor,limit=1] align xyz positioned ~ ~ ~ run setblock ~4 ~-1 ~-4 minecraft:sea_lantern
execute at @e[tag=spawn_anchor,limit=1] align xyz positioned ~ ~ ~ run setblock ~-4 ~-1 ~4 minecraft:sea_lantern
execute at @e[tag=spawn_anchor,limit=1] align xyz positioned ~ ~ ~ run setblock ~4 ~-1 ~4 minecraft:sea_lantern
execute at @e[tag=spawn_anchor,limit=1] align xyz positioned ~ ~ ~ run setblock ~-8 ~-1 ~-8 minecraft:sea_lantern
execute at @e[tag=spawn_anchor,limit=1] align xyz positioned ~ ~ ~ run setblock ~8 ~-1 ~-8 minecraft:sea_lantern
execute at @e[tag=spawn_anchor,limit=1] align xyz positioned ~ ~ ~ run setblock ~-8 ~-1 ~8 minecraft:sea_lantern
execute at @e[tag=spawn_anchor,limit=1] align xyz positioned ~ ~ ~ run setblock ~8 ~-1 ~8 minecraft:sea_lantern
execute at @e[tag=spawn_anchor,limit=1] align xyz positioned ~ ~ ~ run setblock ~-12 ~-1 ~-4 minecraft:sea_lantern
execute at @e[tag=spawn_anchor,limit=1] align xyz positioned ~ ~ ~ run setblock ~12 ~-1 ~-4 minecraft:sea_lantern
execute at @e[tag=spawn_anchor,limit=1] align xyz positioned ~ ~ ~ run setblock ~-12 ~-1 ~4 minecraft:sea_lantern
execute at @e[tag=spawn_anchor,limit=1] align xyz positioned ~ ~ ~ run setblock ~12 ~-1 ~4 minecraft:sea_lantern
execute at @e[tag=spawn_anchor,limit=1] align xyz positioned ~ ~ ~ run setblock ~-4 ~-1 ~-12 minecraft:sea_lantern
execute at @e[tag=spawn_anchor,limit=1] align xyz positioned ~ ~ ~ run setblock ~4 ~-1 ~-12 minecraft:sea_lantern
execute at @e[tag=spawn_anchor,limit=1] align xyz positioned ~ ~ ~ run setblock ~-4 ~-1 ~12 minecraft:sea_lantern
execute at @e[tag=spawn_anchor,limit=1] align xyz positioned ~ ~ ~ run setblock ~4 ~-1 ~12 minecraft:sea_lantern
execute at @e[tag=spawn_anchor,limit=1] align xyz positioned ~ ~ ~ run setblock ~-12 ~-1 ~-12 minecraft:shroomlight
execute at @e[tag=spawn_anchor,limit=1] align xyz positioned ~ ~ ~ run setblock ~12 ~-1 ~-12 minecraft:shroomlight
execute at @e[tag=spawn_anchor,limit=1] align xyz positioned ~ ~ ~ run setblock ~-12 ~-1 ~12 minecraft:shroomlight
execute at @e[tag=spawn_anchor,limit=1] align xyz positioned ~ ~ ~ run setblock ~12 ~-1 ~12 minecraft:shroomlight
execute at @e[tag=spawn_anchor,limit=1] align xyz positioned ~ ~ ~ run setblock ~ ~-1 ~-11 minecraft:shroomlight
execute at @e[tag=spawn_anchor,limit=1] align xyz positioned ~ ~ ~ run setblock ~ ~-1 ~11 minecraft:shroomlight
execute at @e[tag=spawn_anchor,limit=1] align xyz positioned ~ ~ ~ run setblock ~11 ~-1 ~ minecraft:shroomlight
execute at @e[tag=spawn_anchor,limit=1] align xyz positioned ~ ~ ~ run setblock ~-11 ~-1 ~ minecraft:shroomlight

# 7. กำแพงขอบป้อม (เปิดประตู 4 ทิศกว้าง 7 บล็อก) + บันไดทางขึ้นรอบทิศ
execute at @e[tag=spawn_anchor,limit=1] align xyz positioned ~ ~ ~ run fill ~-15 ~ ~-15 ~15 ~ ~-15 minecraft:deepslate_brick_wall
execute at @e[tag=spawn_anchor,limit=1] align xyz positioned ~ ~ ~ run fill ~-15 ~ ~15 ~15 ~ ~15 minecraft:deepslate_brick_wall
execute at @e[tag=spawn_anchor,limit=1] align xyz positioned ~ ~ ~ run fill ~-15 ~ ~-15 ~-15 ~ ~15 minecraft:deepslate_brick_wall
execute at @e[tag=spawn_anchor,limit=1] align xyz positioned ~ ~ ~ run fill ~15 ~ ~-15 ~15 ~ ~15 minecraft:deepslate_brick_wall

execute at @e[tag=spawn_anchor,limit=1] align xyz positioned ~ ~ ~ run fill ~-3 ~ ~-15 ~3 ~ ~-15 minecraft:air
execute at @e[tag=spawn_anchor,limit=1] align xyz positioned ~ ~ ~ run fill ~-3 ~ ~15 ~3 ~ ~15 minecraft:air
execute at @e[tag=spawn_anchor,limit=1] align xyz positioned ~ ~ ~ run fill ~-15 ~ ~-3 ~-15 ~ ~3 minecraft:air
execute at @e[tag=spawn_anchor,limit=1] align xyz positioned ~ ~ ~ run fill ~15 ~ ~-3 ~15 ~ ~3 minecraft:air

execute at @e[tag=spawn_anchor,limit=1] align xyz positioned ~ ~ ~ run fill ~-3 ~-2 ~-16 ~3 ~-2 ~-16 minecraft:stone_bricks
execute at @e[tag=spawn_anchor,limit=1] align xyz positioned ~ ~ ~ run fill ~-3 ~-1 ~-16 ~3 ~-1 ~-16 minecraft:deepslate_brick_stairs[facing=south]
execute at @e[tag=spawn_anchor,limit=1] align xyz positioned ~ ~ ~ run fill ~-3 ~-2 ~16 ~3 ~-2 ~16 minecraft:stone_bricks
execute at @e[tag=spawn_anchor,limit=1] align xyz positioned ~ ~ ~ run fill ~-3 ~-1 ~16 ~3 ~-1 ~16 minecraft:deepslate_brick_stairs[facing=north]
execute at @e[tag=spawn_anchor,limit=1] align xyz positioned ~ ~ ~ run fill ~16 ~-2 ~-3 ~16 ~-2 ~3 minecraft:stone_bricks
execute at @e[tag=spawn_anchor,limit=1] align xyz positioned ~ ~ ~ run fill ~16 ~-1 ~-3 ~16 ~-1 ~3 minecraft:deepslate_brick_stairs[facing=west]
execute at @e[tag=spawn_anchor,limit=1] align xyz positioned ~ ~ ~ run fill ~-16 ~-2 ~-3 ~-16 ~-2 ~3 minecraft:stone_bricks
execute at @e[tag=spawn_anchor,limit=1] align xyz positioned ~ ~ ~ run fill ~-16 ~-1 ~-3 ~-16 ~-1 ~3 minecraft:deepslate_brick_stairs[facing=east]

# 8. ซุ้มประตูใหญ่ 4 ทิศ (สูง 5 บล็อก) + หอคอย 4 มุม (สูง 7 บล็อก)
execute at @e[tag=spawn_anchor,limit=1] align xyz positioned ~ ~ ~ run fill ~-4 ~ ~-15 ~-4 ~4 ~-15 minecraft:deepslate_bricks
execute at @e[tag=spawn_anchor,limit=1] align xyz positioned ~ ~ ~ run fill ~4 ~ ~-15 ~4 ~4 ~-15 minecraft:deepslate_bricks
execute at @e[tag=spawn_anchor,limit=1] align xyz positioned ~ ~ ~ run fill ~-4 ~5 ~-15 ~4 ~5 ~-15 minecraft:deepslate_bricks
execute at @e[tag=spawn_anchor,limit=1] align xyz positioned ~ ~ ~ run setblock ~ ~4 ~-15 minecraft:lantern[hanging=true]

execute at @e[tag=spawn_anchor,limit=1] align xyz positioned ~ ~ ~ run fill ~-4 ~ ~15 ~-4 ~4 ~15 minecraft:deepslate_bricks
execute at @e[tag=spawn_anchor,limit=1] align xyz positioned ~ ~ ~ run fill ~4 ~ ~15 ~4 ~4 ~15 minecraft:deepslate_bricks
execute at @e[tag=spawn_anchor,limit=1] align xyz positioned ~ ~ ~ run fill ~-4 ~5 ~15 ~4 ~5 ~15 minecraft:deepslate_bricks
execute at @e[tag=spawn_anchor,limit=1] align xyz positioned ~ ~ ~ run setblock ~ ~4 ~15 minecraft:lantern[hanging=true]

execute at @e[tag=spawn_anchor,limit=1] align xyz positioned ~ ~ ~ run fill ~15 ~ ~-4 ~15 ~4 ~-4 minecraft:deepslate_bricks
execute at @e[tag=spawn_anchor,limit=1] align xyz positioned ~ ~ ~ run fill ~15 ~ ~4 ~15 ~4 ~4 minecraft:deepslate_bricks
execute at @e[tag=spawn_anchor,limit=1] align xyz positioned ~ ~ ~ run fill ~15 ~5 ~-4 ~15 ~5 ~4 minecraft:deepslate_bricks
execute at @e[tag=spawn_anchor,limit=1] align xyz positioned ~ ~ ~ run setblock ~15 ~4 ~ minecraft:lantern[hanging=true]

execute at @e[tag=spawn_anchor,limit=1] align xyz positioned ~ ~ ~ run fill ~-15 ~ ~-4 ~-15 ~4 ~-4 minecraft:deepslate_bricks
execute at @e[tag=spawn_anchor,limit=1] align xyz positioned ~ ~ ~ run fill ~-15 ~ ~4 ~-15 ~4 ~4 minecraft:deepslate_bricks
execute at @e[tag=spawn_anchor,limit=1] align xyz positioned ~ ~ ~ run fill ~-15 ~5 ~-4 ~-15 ~5 ~4 minecraft:deepslate_bricks
execute at @e[tag=spawn_anchor,limit=1] align xyz positioned ~ ~ ~ run setblock ~-15 ~4 ~ minecraft:lantern[hanging=true]

execute at @e[tag=spawn_anchor,limit=1] align xyz positioned ~ ~ ~ run fill ~-15 ~ ~-15 ~-14 ~6 ~-14 minecraft:deepslate_bricks
execute at @e[tag=spawn_anchor,limit=1] align xyz positioned ~ ~ ~ run setblock ~-14 ~7 ~-14 minecraft:soul_lantern
execute at @e[tag=spawn_anchor,limit=1] align xyz positioned ~ ~ ~ run fill ~14 ~ ~-15 ~15 ~6 ~-14 minecraft:deepslate_bricks
execute at @e[tag=spawn_anchor,limit=1] align xyz positioned ~ ~ ~ run setblock ~14 ~7 ~-14 minecraft:soul_lantern
execute at @e[tag=spawn_anchor,limit=1] align xyz positioned ~ ~ ~ run fill ~-15 ~ ~14 ~-14 ~6 ~15 minecraft:deepslate_bricks
execute at @e[tag=spawn_anchor,limit=1] align xyz positioned ~ ~ ~ run setblock ~-14 ~7 ~14 minecraft:soul_lantern
execute at @e[tag=spawn_anchor,limit=1] align xyz positioned ~ ~ ~ run fill ~14 ~ ~14 ~15 ~6 ~15 minecraft:deepslate_bricks
execute at @e[tag=spawn_anchor,limit=1] align xyz positioned ~ ~ ~ run setblock ~14 ~7 ~14 minecraft:soul_lantern

# 9. เสาโถงกลาง 4 ต้น + หลังคาโดมสูง 9 บล็อก (กัน Phantom และให้ลำแสง Beacon ทะลุขึ้นฟ้า)
execute at @e[tag=spawn_anchor,limit=1] align xyz positioned ~ ~ ~ run fill ~-8 ~ ~-8 ~-8 ~7 ~-8 minecraft:deepslate_bricks
execute at @e[tag=spawn_anchor,limit=1] align xyz positioned ~ ~ ~ run fill ~8 ~ ~-8 ~8 ~7 ~-8 minecraft:deepslate_bricks
execute at @e[tag=spawn_anchor,limit=1] align xyz positioned ~ ~ ~ run fill ~-8 ~ ~8 ~-8 ~7 ~8 minecraft:deepslate_bricks
execute at @e[tag=spawn_anchor,limit=1] align xyz positioned ~ ~ ~ run fill ~8 ~ ~8 ~8 ~7 ~8 minecraft:deepslate_bricks

execute at @e[tag=spawn_anchor,limit=1] align xyz positioned ~ ~ ~ run fill ~-9 ~8 ~-9 ~9 ~8 ~9 minecraft:polished_deepslate_slab[type=bottom]
execute at @e[tag=spawn_anchor,limit=1] align xyz positioned ~ ~ ~ run fill ~-7 ~8 ~-7 ~7 ~8 ~7 minecraft:light_gray_stained_glass
execute at @e[tag=spawn_anchor,limit=1] align xyz positioned ~ ~ ~ run setblock ~ ~8 ~ minecraft:white_stained_glass

execute at @e[tag=spawn_anchor,limit=1] align xyz positioned ~ ~ ~ run setblock ~-7 ~4 ~-8 minecraft:lantern
execute at @e[tag=spawn_anchor,limit=1] align xyz positioned ~ ~ ~ run setblock ~7 ~4 ~-8 minecraft:lantern
execute at @e[tag=spawn_anchor,limit=1] align xyz positioned ~ ~ ~ run setblock ~-7 ~4 ~8 minecraft:lantern
execute at @e[tag=spawn_anchor,limit=1] align xyz positioned ~ ~ ~ run setblock ~7 ~4 ~8 minecraft:lantern

# 10. มุมโต๊ะใช้งานพื้นฐาน (คราฟต์ / ทั่ง / แท่นอ่าน) ขอบโถงกลาง
execute at @e[tag=spawn_anchor,limit=1] align xyz positioned ~ ~ ~ run setblock ~-6 ~ ~-6 minecraft:crafting_table
execute at @e[tag=spawn_anchor,limit=1] align xyz positioned ~ ~ ~ run setblock ~6 ~ ~-6 minecraft:anvil
execute at @e[tag=spawn_anchor,limit=1] align xyz positioned ~ ~ ~ run setblock ~-6 ~ ~6 minecraft:lectern

# 11. ตั้งจุดเกิดโลก วาร์ปคนที่รออยู่ตรง (0,0) ขึ้นมาบนลานป้อม และเสก 3 NPC ประจำป้อม
execute at @e[tag=spawn_anchor,limit=1] run setworldspawn ~ ~ ~
execute at @e[tag=spawn_anchor,limit=1] as @a[distance=..48] run tp @s ~ ~ ~
function nbs:spawn/summon_citadel_npcs
