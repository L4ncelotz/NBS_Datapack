# ==========================================
# ล้างไอเทมนับคะแนนออกจาก Bundle ในช่อง $(slot) ของกระเป๋าผู้เล่น
# ==========================================

# 1. วางถังพักชั่วคราวที่จุดปลอดภัยของโลก (0, 319, 0)
setblock 0 319 0 minecraft:barrel

# 2. ย้าย Bundle จากช่อง $(slot) มาพักไว้ในถัง
$item replace block 0 319 0 container.0 from entity @s container.$(slot)

# 3.1 ตรวจและดีดไข่มังกรลงพื้น
execute if data block 0 319 0 Items[0].components."minecraft:bundle_contents"[{id:"minecraft:dragon_egg"}] at @s run summon minecraft:item ~ ~0.5 ~ {Item:{id:"minecraft:dragon_egg",count:1}}
data remove block 0 319 0 Items[0].components."minecraft:bundle_contents"[{id:"minecraft:dragon_egg"}]

# 3.2 ตรวจและดีด Nether Star ลงพื้น
execute if data block 0 319 0 Items[0].components."minecraft:bundle_contents"[{id:"minecraft:nether_star"}] at @s run summon minecraft:item ~ ~0.5 ~ {Tags:["temp_bundle_star"],Item:{id:"minecraft:stone",count:1}}
execute if entity @e[type=minecraft:item,tag=temp_bundle_star,limit=1] run data modify entity @e[type=minecraft:item,tag=temp_bundle_star,limit=1] Item set from block 0 319 0 Items[0].components."minecraft:bundle_contents"[{id:"minecraft:nether_star"}]
tag @e[type=minecraft:item,tag=temp_bundle_star] remove temp_bundle_star
data remove block 0 319 0 Items[0].components."minecraft:bundle_contents"[{id:"minecraft:nether_star"}]

# 3.3 ตรวจและดีดป้ายชื่อคะแนนลงพื้น
execute if data block 0 319 0 Items[0].components."minecraft:bundle_contents"[{id:"minecraft:name_tag",components:{"minecraft:custom_data":{score_tag:1b}}}] at @s run summon minecraft:item ~ ~0.5 ~ {Tags:["temp_bundle_tag"],Item:{id:"minecraft:stone",count:1}}
execute if entity @e[type=minecraft:item,tag=temp_bundle_tag,limit=1] run data modify entity @e[type=minecraft:item,tag=temp_bundle_tag,limit=1] Item set from block 0 319 0 Items[0].components."minecraft:bundle_contents"[{id:"minecraft:name_tag",components:{"minecraft:custom_data":{score_tag:1b}}}]
tag @e[type=minecraft:item,tag=temp_bundle_tag] remove temp_bundle_tag
data remove block 0 319 0 Items[0].components."minecraft:bundle_contents"[{id:"minecraft:name_tag",components:{"minecraft:custom_data":{score_tag:1b}}}]

# 4. ส่ง Bundle ที่ล้างของออกแล้วกลับไปคืนช่อง $(slot) เดิมของผู้เล่น
$item replace entity @s container.$(slot) from block 0 319 0 container.0

# 5. ล้างถังพักออก
setblock 0 319 0 minecraft:air

# 6. แจ้งเตือนผู้เล่น
playsound minecraft:block.note_block.bass master @s ~ ~ ~ 1 0.8
playsound minecraft:entity.item.break master @s ~ ~ ~ 1 1
title @s actionbar {"text":"⚠️ ห้ามเก็บไอเท็มนับคะแนนใน Bundle! ดีดไอเทมลงพื้นแล้ว","color":"red","bold":true}
