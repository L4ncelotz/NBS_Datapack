# ==========================================
# สร้างหมุดจุดเกิดและป้อมปราการ The Citadel (0, 0) ขนาด 21x21 บล็อก + หลังคากัน Phantom + 3 NPC คลิกขวา
# ==========================================
forceload add -16 -16 16 16
kill @e[tag=spawn_anchor]
kill @e[type=minecraft:text_display,tag=citadel_title]
kill @e[tag=citadel_npc]
kill @e[tag=citadel_npc_hit]

# 1. เสกหมุดแล้วใช้ spreadplayers หาความสูงพื้นผิวบนสุดตรงพิกัด (0, 0)
summon minecraft:marker 0 120 0 {Tags:["spawn_anchor"]}
spreadplayers 0 0 0 1 false @e[tag=spawn_anchor,limit=1]
execute as @e[tag=spawn_anchor,limit=1] at @s align xyz run tp @s ~0.5 ~ ~0.5

# 2. เคลียร์พื้นที่อากาศด้านบนและปูฐานป้อมปราการ The Citadel (21x21)
execute at @e[tag=spawn_anchor,limit=1] align xyz positioned ~ ~ ~ run fill ~-11 ~ ~-11 ~11 ~10 ~11 minecraft:air
execute at @e[tag=spawn_anchor,limit=1] align xyz positioned ~ ~ ~ run fill ~-10 ~-3 ~-10 ~10 ~-1 ~10 minecraft:stone_bricks
execute at @e[tag=spawn_anchor,limit=1] align xyz positioned ~ ~ ~ run fill ~-10 ~-1 ~-10 ~10 ~-1 ~10 minecraft:deepslate_bricks
execute at @e[tag=spawn_anchor,limit=1] align xyz positioned ~ ~ ~ run fill ~-9 ~-1 ~-9 ~9 ~-1 ~9 minecraft:stone_bricks
execute at @e[tag=spawn_anchor,limit=1] align xyz positioned ~ ~ ~ run fill ~-6 ~-1 ~-6 ~6 ~-1 ~6 minecraft:polished_deepslate

# ทางเดินกากบาทเข้าสู่แท่น NPC ทั้ง 3 ทิศ และทางออก 4 ทิศ
execute at @e[tag=spawn_anchor,limit=1] align xyz positioned ~ ~ ~ run fill ~-9 ~-1 ~-1 ~9 ~-1 ~1 minecraft:chiseled_stone_bricks
execute at @e[tag=spawn_anchor,limit=1] align xyz positioned ~ ~ ~ run fill ~-1 ~-1 ~-9 ~1 ~-1 ~9 minecraft:chiseled_stone_bricks

# 3. กำแพงเตี้ยรอบขอบลาน (เว้นประตูโล่งกว้าง 5 บล็อกทั้ง 4 ทิศ) + บันไดทางขึ้น 4 ทิศ
execute at @e[tag=spawn_anchor,limit=1] align xyz positioned ~ ~ ~ run fill ~-10 ~ ~-10 ~10 ~ ~-10 minecraft:deepslate_brick_wall
execute at @e[tag=spawn_anchor,limit=1] align xyz positioned ~ ~ ~ run fill ~-10 ~ ~10 ~10 ~ ~10 minecraft:deepslate_brick_wall
execute at @e[tag=spawn_anchor,limit=1] align xyz positioned ~ ~ ~ run fill ~-10 ~ ~-10 ~-10 ~ ~10 minecraft:deepslate_brick_wall
execute at @e[tag=spawn_anchor,limit=1] align xyz positioned ~ ~ ~ run fill ~10 ~ ~-10 ~10 ~ ~10 minecraft:deepslate_brick_wall

execute at @e[tag=spawn_anchor,limit=1] align xyz positioned ~ ~ ~ run fill ~-2 ~ ~-10 ~2 ~ ~-10 minecraft:air
execute at @e[tag=spawn_anchor,limit=1] align xyz positioned ~ ~ ~ run fill ~-2 ~ ~10 ~2 ~ ~10 minecraft:air
execute at @e[tag=spawn_anchor,limit=1] align xyz positioned ~ ~ ~ run fill ~-10 ~ ~-2 ~-10 ~ ~2 minecraft:air
execute at @e[tag=spawn_anchor,limit=1] align xyz positioned ~ ~ ~ run fill ~10 ~ ~-2 ~10 ~ ~2 minecraft:air

execute at @e[tag=spawn_anchor,limit=1] align xyz positioned ~ ~ ~ run fill ~-2 ~-2 ~-11 ~2 ~-2 ~-11 minecraft:stone_bricks
execute at @e[tag=spawn_anchor,limit=1] align xyz positioned ~ ~ ~ run fill ~-2 ~-1 ~-11 ~2 ~-1 ~-11 minecraft:deepslate_brick_stairs[facing=south]
execute at @e[tag=spawn_anchor,limit=1] align xyz positioned ~ ~ ~ run fill ~-2 ~-2 ~11 ~2 ~-2 ~11 minecraft:stone_bricks
execute at @e[tag=spawn_anchor,limit=1] align xyz positioned ~ ~ ~ run fill ~-2 ~-1 ~11 ~2 ~-1 ~11 minecraft:deepslate_brick_stairs[facing=north]
execute at @e[tag=spawn_anchor,limit=1] align xyz positioned ~ ~ ~ run fill ~11 ~-2 ~-2 ~11 ~-2 ~2 minecraft:stone_bricks
execute at @e[tag=spawn_anchor,limit=1] align xyz positioned ~ ~ ~ run fill ~11 ~-1 ~-2 ~11 ~-1 ~2 minecraft:deepslate_brick_stairs[facing=west]
execute at @e[tag=spawn_anchor,limit=1] align xyz positioned ~ ~ ~ run fill ~-11 ~-2 ~-2 ~-11 ~-2 ~2 minecraft:stone_bricks
execute at @e[tag=spawn_anchor,limit=1] align xyz positioned ~ ~ ~ run fill ~-11 ~-1 ~-2 ~-11 ~-1 ~2 minecraft:deepslate_brick_stairs[facing=east]

# 4. เสาค้ำ 4 มุมลาน + เสาป้อมใน 4 ต้น + หลังคาโดมกระจกกัน Phantom โฉบ
execute at @e[tag=spawn_anchor,limit=1] align xyz positioned ~ ~ ~ run fill ~-10 ~ ~-10 ~-10 ~3 ~-10 minecraft:deepslate_bricks
execute at @e[tag=spawn_anchor,limit=1] align xyz positioned ~ ~ ~ run setblock ~-10 ~4 ~-10 minecraft:soul_lantern
execute at @e[tag=spawn_anchor,limit=1] align xyz positioned ~ ~ ~ run fill ~10 ~ ~-10 ~10 ~3 ~-10 minecraft:deepslate_bricks
execute at @e[tag=spawn_anchor,limit=1] align xyz positioned ~ ~ ~ run setblock ~10 ~4 ~-10 minecraft:soul_lantern
execute at @e[tag=spawn_anchor,limit=1] align xyz positioned ~ ~ ~ run fill ~-10 ~ ~10 ~-10 ~3 ~10 minecraft:deepslate_bricks
execute at @e[tag=spawn_anchor,limit=1] align xyz positioned ~ ~ ~ run setblock ~-10 ~4 ~10 minecraft:soul_lantern
execute at @e[tag=spawn_anchor,limit=1] align xyz positioned ~ ~ ~ run fill ~10 ~ ~10 ~10 ~3 ~10 minecraft:deepslate_bricks
execute at @e[tag=spawn_anchor,limit=1] align xyz positioned ~ ~ ~ run setblock ~10 ~4 ~10 minecraft:soul_lantern

execute at @e[tag=spawn_anchor,limit=1] align xyz positioned ~ ~ ~ run fill ~-5 ~ ~-5 ~-5 ~5 ~-5 minecraft:deepslate_bricks
execute at @e[tag=spawn_anchor,limit=1] align xyz positioned ~ ~ ~ run fill ~5 ~ ~-5 ~5 ~5 ~-5 minecraft:deepslate_bricks
execute at @e[tag=spawn_anchor,limit=1] align xyz positioned ~ ~ ~ run fill ~-5 ~ ~5 ~-5 ~5 ~5 minecraft:deepslate_bricks
execute at @e[tag=spawn_anchor,limit=1] align xyz positioned ~ ~ ~ run fill ~5 ~ ~5 ~5 ~5 ~5 minecraft:deepslate_bricks

execute at @e[tag=spawn_anchor,limit=1] align xyz positioned ~ ~ ~ run fill ~-6 ~6 ~-6 ~6 ~6 ~6 minecraft:polished_deepslate_slab[type=bottom]
execute at @e[tag=spawn_anchor,limit=1] align xyz positioned ~ ~ ~ run fill ~-4 ~6 ~-4 ~4 ~6 ~4 minecraft:light_gray_stained_glass
execute at @e[tag=spawn_anchor,limit=1] align xyz positioned ~ ~ ~ run setblock ~ ~6 ~ minecraft:sea_lantern

# จุดศูนย์กลาง & ไฟส่องสว่างรอบลาน
execute at @e[tag=spawn_anchor,limit=1] align xyz positioned ~ ~ ~ run setblock ~ ~-1 ~ minecraft:lodestone
execute at @e[tag=spawn_anchor,limit=1] align xyz positioned ~ ~ ~ run setblock ~-2 ~-1 ~-2 minecraft:sea_lantern
execute at @e[tag=spawn_anchor,limit=1] align xyz positioned ~ ~ ~ run setblock ~2 ~-1 ~-2 minecraft:sea_lantern
execute at @e[tag=spawn_anchor,limit=1] align xyz positioned ~ ~ ~ run setblock ~-2 ~-1 ~2 minecraft:sea_lantern
execute at @e[tag=spawn_anchor,limit=1] align xyz positioned ~ ~ ~ run setblock ~2 ~-1 ~2 minecraft:sea_lantern

# 5. เสก NPC 3 ตัวรอบศูนย์กลาง (พร้อม Interaction hitbox และป้ายชื่อลอย)
# 5.1 ทิศเหนือ (0, -5): ผู้ดูแลเควส
execute at @e[tag=spawn_anchor,limit=1] positioned ~ ~ ~-5 run summon minecraft:villager ~ ~ ~ {Tags:["citadel_npc"],NoAI:1b,Invulnerable:1b,Silent:1b,PersistenceRequired:1b,Rotation:[0f,0f],VillagerData:{profession:"minecraft:librarian",type:"minecraft:plains",level:5}}
execute at @e[tag=spawn_anchor,limit=1] positioned ~ ~ ~-5 run summon minecraft:interaction ~ ~ ~ {Tags:["citadel_npc","citadel_npc_hit","npc_quest"],width:1.1f,height:2.15f,response:1b}
execute at @e[tag=spawn_anchor,limit=1] positioned ~ ~ ~-5 run summon minecraft:text_display ~ ~2.55 ~ {Tags:["citadel_npc"],billboard:"center",background:1073741824,view_range:0.35f,text:["",{"text":"📜 ผู้ดูแลเควส (Quest Master)\n","color":"yellow","bold":true},{"text":"[คลิกขวาเพื่อส่งเควส 16 ใบ & เควสด่วน]","color":"green"}]}

# 5.2 ทิศตะวันออก (+5, 0): นายธนาคาร & คลังธง
execute at @e[tag=spawn_anchor,limit=1] positioned ~5 ~ ~ run summon minecraft:villager ~ ~ ~ {Tags:["citadel_npc"],NoAI:1b,Invulnerable:1b,Silent:1b,PersistenceRequired:1b,Rotation:[90f,0f],VillagerData:{profession:"minecraft:armorer",type:"minecraft:plains",level:5}}
execute at @e[tag=spawn_anchor,limit=1] positioned ~5 ~ ~ run summon minecraft:interaction ~ ~ ~ {Tags:["citadel_npc","citadel_npc_hit","npc_bank"],width:1.1f,height:2.15f,response:1b}
execute at @e[tag=spawn_anchor,limit=1] positioned ~5 ~ ~ run summon minecraft:text_display ~ ~2.55 ~ {Tags:["citadel_npc"],billboard:"center",background:1073741824,view_range:0.35f,text:["",{"text":"💎 นายธนาคาร & คลังธง\n","color":"aqua","bold":true},{"text":"[คลิกขวาเพื่อซื้อธง 32 เพชร & ฝากเพชรทีม]","color":"green"}]}

# 5.3 ทิศตะวันตก (-5, 0): ครูฝึกอาชีพ & ทีม
execute at @e[tag=spawn_anchor,limit=1] positioned ~-5 ~ ~ run summon minecraft:villager ~ ~ ~ {Tags:["citadel_npc"],NoAI:1b,Invulnerable:1b,Silent:1b,PersistenceRequired:1b,Rotation:[-90f,0f],VillagerData:{profession:"minecraft:weaponsmith",type:"minecraft:plains",level:5}}
execute at @e[tag=spawn_anchor,limit=1] positioned ~-5 ~ ~ run summon minecraft:interaction ~ ~ ~ {Tags:["citadel_npc","citadel_npc_hit","npc_career"],width:1.1f,height:2.15f,response:1b}
execute at @e[tag=spawn_anchor,limit=1] positioned ~-5 ~ ~ run summon minecraft:text_display ~ ~2.55 ~ {Tags:["citadel_npc"],billboard:"center",background:1073741824,view_range:0.35f,text:["",{"text":"⚔️ ครูฝึกอาชีพ & จัดการทีม\n","color":"light_purple","bold":true},{"text":"[คลิกขวาเพื่อเลือกอาชีพ / เช็กลิสต์ / เลือกทีม]","color":"green"}]}

# 6. ป้ายลอยต้อนรับเหนือจุดกึ่งกลาง The Citadel และตั้งค่าจุดเกิดโลก
execute at @e[tag=spawn_anchor,limit=1] run summon minecraft:text_display ~ ~3.8 ~ {Tags:["citadel_title"],billboard:"center",background:1073741824,view_range:0.5f,text:["",{"text":"🏰 THE CITADEL (0, 0)\n","color":"gold","bold":true},{"text":"เขตปลอดภัย (ห้าม PvP) — คลิกขวาที่ NPC รอบลานเพื่อใช้งาน","color":"yellow"}]}
execute at @e[tag=spawn_anchor,limit=1] run setworldspawn ~ ~ ~
