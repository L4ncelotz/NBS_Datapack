# ==========================================
# ล้างไอเทมนับคะแนนออกจากไอเทม Shulker Box ในมือรอง (Offhand) ของผู้เล่น
# ==========================================

setblock 0 319 0 minecraft:barrel
item replace block 0 319 0 container.0 from entity @s weapon.offhand

execute if data block 0 319 0 Items[0].components."minecraft:container"[{item:{id:"minecraft:dragon_egg"}}] at @s run summon minecraft:item ~ ~0.5 ~ {Item:{id:"minecraft:dragon_egg",count:1}}
data remove block 0 319 0 Items[0].components."minecraft:container"[{item:{id:"minecraft:dragon_egg"}}]

execute if data block 0 319 0 Items[0].components."minecraft:container"[{item:{id:"minecraft:nether_star"}}] at @s run summon minecraft:item ~ ~0.5 ~ {Tags:["temp_shulker_star"],Item:{id:"minecraft:stone",count:1}}
execute if entity @e[type=minecraft:item,tag=temp_shulker_star,limit=1] run data modify entity @e[type=minecraft:item,tag=temp_shulker_star,limit=1] Item set from block 0 319 0 Items[0].components."minecraft:container"[{item:{id:"minecraft:nether_star"}}].item
tag @e[type=minecraft:item,tag=temp_shulker_star] remove temp_shulker_star
data remove block 0 319 0 Items[0].components."minecraft:container"[{item:{id:"minecraft:nether_star"}}]

execute if data block 0 319 0 Items[0].components."minecraft:container"[{item:{id:"minecraft:name_tag",components:{"minecraft:custom_data":{score_tag:1b}}}}] at @s run summon minecraft:item ~ ~0.5 ~ {Tags:["temp_shulker_tag"],Item:{id:"minecraft:stone",count:1}}
execute if entity @e[type=minecraft:item,tag=temp_shulker_tag,limit=1] run data modify entity @e[type=minecraft:item,tag=temp_shulker_tag,limit=1] Item set from block 0 319 0 Items[0].components."minecraft:container"[{item:{id:"minecraft:name_tag",components:{"minecraft:custom_data":{score_tag:1b}}}}].item
tag @e[type=minecraft:item,tag=temp_shulker_tag] remove temp_shulker_tag
data remove block 0 319 0 Items[0].components."minecraft:container"[{item:{id:"minecraft:name_tag",components:{"minecraft:custom_data":{score_tag:1b}}}}]

item replace entity @s weapon.offhand from block 0 319 0 container.0
setblock 0 319 0 minecraft:air

playsound minecraft:block.note_block.bass master @s ~ ~ ~ 1 0.8
playsound minecraft:entity.item.break master @s ~ ~ ~ 1 1
title @s actionbar {"text":"⚠️ ห้ามเก็บไอเท็มนับคะแนนใน Shulker Box! ดีดไอเทมลงพื้นแล้ว","color":"red","bold":true}
