# ดีดไอเทมจากช่อง Ender Chest ที่ระบุ ($(slot)) ลงพื้นและล้างช่องนั้น
execute at @s run summon minecraft:item ~ ~0.5 ~ {Tags:["temp_eject"],Item:{id:"minecraft:stone",count:1}}
$data modify entity @e[type=minecraft:item,tag=temp_eject,limit=1] Item set from entity @s EnderItems[{Slot:$(slot)b}]
$item replace entity @s enderchest.$(slot) with minecraft:air
tag @e[type=minecraft:item,tag=temp_eject] remove temp_eject
