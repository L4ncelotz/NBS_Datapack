# 1. ดีดป้ายชื่อคะแนนออกมาจากกล่อง Shulker Box (คงค่า NBT ชื่อและคะแนนครบถ้วน)
summon minecraft:item ~ ~1 ~ {Tags:["temp_tag"],Item:{id:"minecraft:stone",count:1}}
data modify entity @e[type=minecraft:item,tag=temp_tag,limit=1] Item set from block ~ ~ ~ Items[{id:"minecraft:name_tag",components:{"minecraft:custom_data":{score_tag:1b}}}]
tag @e[type=minecraft:item,tag=temp_tag] remove temp_tag

# 2. ลบป้ายชื่อคะแนนออกจากช่องของ Shulker Box ทันที
data remove block ~ ~ ~ Items[{id:"minecraft:name_tag",components:{"minecraft:custom_data":{score_tag:1b}}}]

# 3. แจ้งเตือนผู้เล่นใกล้เคียงและส่งเอฟเฟกต์
playsound minecraft:block.note_block.bass master @a[distance=..8] ~ ~ ~ 1 0.8
playsound minecraft:entity.item.break master @a[distance=..8] ~ ~ ~ 1 1
title @a[distance=..8] actionbar {"text":"⚠️ ห้ามเก็บป้ายชื่อคะแนนใน Shulker Box! ดีดไอเทมลงพื้นแล้ว","color":"red","bold":true}
particle minecraft:smoke ~ ~1 ~ 0.3 0.3 0.3 0.05 10 normal
