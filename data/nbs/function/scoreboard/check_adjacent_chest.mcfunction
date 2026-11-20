# ตรวจสอบหีบข้างเคียง (Double Chest ทั้งแบบปกติและ Trapped Chest) พร้อมติดแท็ก new_chest เพื่อรับ team_id
execute positioned ~1 ~ ~ if block ~ ~ ~ minecraft:chest unless entity @e[type=minecraft:marker,tag=chest_anchor,distance=..0.5] run summon minecraft:marker ~ ~ ~ {Tags:["chest_anchor","new_chest"]}
execute positioned ~-1 ~ ~ if block ~ ~ ~ minecraft:chest unless entity @e[type=minecraft:marker,tag=chest_anchor,distance=..0.5] run summon minecraft:marker ~ ~ ~ {Tags:["chest_anchor","new_chest"]}
execute positioned ~ ~ ~1 if block ~ ~ ~ minecraft:chest unless entity @e[type=minecraft:marker,tag=chest_anchor,distance=..0.5] run summon minecraft:marker ~ ~ ~ {Tags:["chest_anchor","new_chest"]}
execute positioned ~ ~ ~-1 if block ~ ~ ~ minecraft:chest unless entity @e[type=minecraft:marker,tag=chest_anchor,distance=..0.5] run summon minecraft:marker ~ ~ ~ {Tags:["chest_anchor","new_chest"]}

execute positioned ~1 ~ ~ if block ~ ~ ~ minecraft:trapped_chest unless entity @e[type=minecraft:marker,tag=chest_anchor,distance=..0.5] run summon minecraft:marker ~ ~ ~ {Tags:["chest_anchor","new_chest"]}
execute positioned ~-1 ~ ~ if block ~ ~ ~ minecraft:trapped_chest unless entity @e[type=minecraft:marker,tag=chest_anchor,distance=..0.5] run summon minecraft:marker ~ ~ ~ {Tags:["chest_anchor","new_chest"]}
execute positioned ~ ~ ~1 if block ~ ~ ~ minecraft:trapped_chest unless entity @e[type=minecraft:marker,tag=chest_anchor,distance=..0.5] run summon minecraft:marker ~ ~ ~ {Tags:["chest_anchor","new_chest"]}
execute positioned ~ ~ ~-1 if block ~ ~ ~ minecraft:trapped_chest unless entity @e[type=minecraft:marker,tag=chest_anchor,distance=..0.5] run summon minecraft:marker ~ ~ ~ {Tags:["chest_anchor","new_chest"]}
