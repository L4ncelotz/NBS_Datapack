# 1. ดีดไข่มังกรขึ้นมาลอยเหนือกล่อง Shulker Box
summon minecraft:item ~ ~1 ~ {Item:{id:"minecraft:dragon_egg",count:1}}

# 2. ลบไข่มังกรออกจากช่องของ Shulker Box ทันที
data remove block ~ ~ ~ Items[{id:"minecraft:dragon_egg"}]

# 3. แจ้งเตือนผู้เล่นใกล้เคียงและส่งเอฟเฟกต์
playsound minecraft:block.note_block.bass master @a[distance=..8] ~ ~ ~ 1 0.8
playsound minecraft:entity.item.break master @a[distance=..8] ~ ~ ~ 1 1
title @a[distance=..8] actionbar {"text":"⚠️ ห้ามเก็บไข่มังกรใน Shulker Box! ดีดไอเทมลงพื้นแล้ว","color":"red","bold":true}
particle minecraft:smoke ~ ~1 ~ 0.3 0.3 0.3 0.05 10 normal
