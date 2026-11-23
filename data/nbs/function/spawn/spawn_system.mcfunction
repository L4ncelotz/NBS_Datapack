# ==========================================
# 1. ล้างและอัปเดตสิทธิ์คนที่อยู่ในเขต 5 Chunk (ขยับจุดอ้างอิงจากหมุดไปมุมกล่อง -86, -64, -86)
# ==========================================
execute unless entity @e[tag=spawn_anchor] run summon minecraft:marker 0 64 0 {Tags:["spawn_anchor"]}
tag @a remove in_spawn
execute at @e[tag=spawn_anchor] positioned ~-86 -64 ~-86 as @a[dx=172,dy=384,dz=172] run tag @s add in_spawn

# ==========================================
# 2. ปิดการทุบและวางบล็อกด้วย Adventure Mode (แก้บัคเอาหน้าชิดบล็อกแล้วทุบได้)
# ==========================================
gamemode adventure @a[tag=in_spawn,gamemode=survival,tag=!admin]
gamemode survival @a[tag=!in_spawn,gamemode=adventure]

# ==========================================
# 3. ปิด PvP และกันระเบิด TNT / Creeper รอบตัวหมุด
# ==========================================
execute at @e[tag=spawn_anchor] positioned ~-80 -64 ~-80 run effect give @a[dx=160,dy=384,dz=160] minecraft:resistance 1 255 true
execute at @e[tag=spawn_anchor] positioned ~-80 -64 ~-80 run effect give @a[dx=160,dy=384,dz=160] minecraft:weakness 1 255 true

execute at @e[tag=spawn_anchor] positioned ~-86 -64 ~-86 run kill @e[type=minecraft:tnt,dx=172,dy=384,dz=172]
execute at @e[tag=spawn_anchor] positioned ~-86 -64 ~-86 run kill @e[type=minecraft:tnt_minecart,dx=172,dy=384,dz=172]
execute at @e[tag=spawn_anchor] positioned ~-86 -64 ~-86 as @e[type=minecraft:creeper,dx=172,dy=384,dz=172] run data modify entity @s ExplosionRadius set value 0b

# ==========================================
# 4. สร้างกำแพงเส้นเดียวตรงเส้นขอบ 80 บล็อกเป๊ะๆ (ใช้ marker ล่องหน 100%)
# ==========================================
# --- แนวขอบ +X (ตะวันออก) ---
execute at @e[tag=spawn_anchor] positioned ~65 -64 ~-80 as @a[dx=30,dy=384,dz=160] at @s run summon minecraft:marker ~ ~ ~ {Tags:["border_draw","px"]}
execute as @e[tag=px] run data modify entity @s Pos[0] set from entity @e[tag=spawn_anchor,limit=1] Pos[0]
execute as @e[tag=px] at @s run tp @s ~80 ~ ~
execute as @e[tag=px] at @s run particle minecraft:happy_villager ~ ~1 ~ 0 1.5 4 0 25 force

# --- แนวขอบ -X (ตะวันตก) ---
execute at @e[tag=spawn_anchor] positioned ~-95 -64 ~-80 as @a[dx=30,dy=384,dz=160] at @s run summon minecraft:marker ~ ~ ~ {Tags:["border_draw","nx"]}
execute as @e[tag=nx] run data modify entity @s Pos[0] set from entity @e[tag=spawn_anchor,limit=1] Pos[0]
execute as @e[tag=nx] at @s run tp @s ~-80 ~ ~
execute as @e[tag=nx] at @s run particle minecraft:happy_villager ~ ~1 ~ 0 1.5 4 0 25 force

# --- แนวขอบ +Z (ใต้) ---
execute at @e[tag=spawn_anchor] positioned ~-80 -64 ~65 as @a[dx=160,dy=384,dz=30] at @s run summon minecraft:marker ~ ~ ~ {Tags:["border_draw","pz"]}
execute as @e[tag=pz] run data modify entity @s Pos[2] set from entity @e[tag=spawn_anchor,limit=1] Pos[2]
execute as @e[tag=pz] at @s run tp @s ~ ~ ~80
execute as @e[tag=pz] at @s run particle minecraft:happy_villager ~ ~1 ~ 4 1.5 0 0 25 force

# --- แนวขอบ -Z (เหนือ) ---
execute at @e[tag=spawn_anchor] positioned ~-80 -64 ~-95 as @a[dx=160,dy=384,dz=30] at @s run summon minecraft:marker ~ ~ ~ {Tags:["border_draw","nz"]}
execute as @e[tag=nz] run data modify entity @s Pos[2] set from entity @e[tag=spawn_anchor,limit=1] Pos[2]
execute as @e[tag=nz] at @s run tp @s ~ ~ ~-80
execute as @e[tag=nz] at @s run particle minecraft:happy_villager ~ ~1 ~ 4 1.5 0 0 25 force

# ล้าง marker ที่ใช้ช่วยวาดเส้นขอบทิ้งทันทีเมื่อยิง Particle เสร็จ (ไม่กระทบ spawn_anchor)
kill @e[type=minecraft:marker,tag=border_draw]
