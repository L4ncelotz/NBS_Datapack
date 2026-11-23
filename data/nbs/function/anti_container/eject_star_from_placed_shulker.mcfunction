# 1. ดีด Nether Star ออกมาจากกล่อง Shulker Box (จำลองจำนวนเต็มตามของจริง)
summon minecraft:item ~ ~1 ~ {Tags:["temp_star"],Item:{id:"minecraft:stone",count:1}}
data modify entity @e[type=minecraft:item,tag=temp_star,limit=1] Item set from block ~ ~ ~ Items[{id:"minecraft:nether_star"}]
tag @e[type=minecraft:item,tag=temp_star] remove temp_star

# 2. ลบ Nether Star ออกจากช่องของ Shulker Box ทันที
data remove block ~ ~ ~ Items[{id:"minecraft:nether_star"}]

# 3. แจ้งเตือนผู้เล่นใกล้เคียงและส่งเอฟเฟกต์
playsound minecraft:block.note_block.bass master @a[distance=..8] ~ ~ ~ 1 0.8
playsound minecraft:entity.item.break master @a[distance=..8] ~ ~ ~ 1 1
title @a[distance=..8] actionbar {"text":"⚠️ ห้ามเก็บ Nether Star ใน Shulker Box! ดีดไอเทมลงพื้นแล้ว","color":"red","bold":true}
particle minecraft:smoke ~ ~1 ~ 0.3 0.3 0.3 0.05 10 normal
