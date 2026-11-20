# 1. สร้างไอเทมดรอปจำลองไว้ที่เท้าผู้เล่น 1 ชิ้น
execute at @s run summon minecraft:item ~ ~0.5 ~ {Tags:["temp_dragon"],Item:{id:"minecraft:stone",count:1}}

# 2. คัดลอกข้อมูลไข่มังกรทั้งหมดจาก Ender Chest (รวมจำนวนจริง เช่น 64 ชิ้น) มาใส่ไอเทมบนพื้น
execute at @s run data modify entity @e[type=minecraft:item,tag=temp_dragon,limit=1] Item set from entity @s EnderItems[{id:"minecraft:dragon_egg"}]

# 3. ลบไข่มังกรออกจากช่อง Ender Chest (0 ถึง 26) เท่านั้น (ไม่ไปยุ่งกับกระเป๋าหลัก)
execute if items entity @s enderchest.0 minecraft:dragon_egg run item replace entity @s enderchest.0 with minecraft:air
execute if items entity @s enderchest.1 minecraft:dragon_egg run item replace entity @s enderchest.1 with minecraft:air
execute if items entity @s enderchest.2 minecraft:dragon_egg run item replace entity @s enderchest.2 with minecraft:air
execute if items entity @s enderchest.3 minecraft:dragon_egg run item replace entity @s enderchest.3 with minecraft:air
execute if items entity @s enderchest.4 minecraft:dragon_egg run item replace entity @s enderchest.4 with minecraft:air
execute if items entity @s enderchest.5 minecraft:dragon_egg run item replace entity @s enderchest.5 with minecraft:air
execute if items entity @s enderchest.6 minecraft:dragon_egg run item replace entity @s enderchest.6 with minecraft:air
execute if items entity @s enderchest.7 minecraft:dragon_egg run item replace entity @s enderchest.7 with minecraft:air
execute if items entity @s enderchest.8 minecraft:dragon_egg run item replace entity @s enderchest.8 with minecraft:air
execute if items entity @s enderchest.9 minecraft:dragon_egg run item replace entity @s enderchest.9 with minecraft:air
execute if items entity @s enderchest.10 minecraft:dragon_egg run item replace entity @s enderchest.10 with minecraft:air
execute if items entity @s enderchest.11 minecraft:dragon_egg run item replace entity @s enderchest.11 with minecraft:air
execute if items entity @s enderchest.12 minecraft:dragon_egg run item replace entity @s enderchest.12 with minecraft:air
execute if items entity @s enderchest.13 minecraft:dragon_egg run item replace entity @s enderchest.13 with minecraft:air
execute if items entity @s enderchest.14 minecraft:dragon_egg run item replace entity @s enderchest.14 with minecraft:air
execute if items entity @s enderchest.15 minecraft:dragon_egg run item replace entity @s enderchest.15 with minecraft:air
execute if items entity @s enderchest.16 minecraft:dragon_egg run item replace entity @s enderchest.16 with minecraft:air
execute if items entity @s enderchest.17 minecraft:dragon_egg run item replace entity @s enderchest.17 with minecraft:air
execute if items entity @s enderchest.18 minecraft:dragon_egg run item replace entity @s enderchest.18 with minecraft:air
execute if items entity @s enderchest.19 minecraft:dragon_egg run item replace entity @s enderchest.19 with minecraft:air
execute if items entity @s enderchest.20 minecraft:dragon_egg run item replace entity @s enderchest.20 with minecraft:air
execute if items entity @s enderchest.21 minecraft:dragon_egg run item replace entity @s enderchest.21 with minecraft:air
execute if items entity @s enderchest.22 minecraft:dragon_egg run item replace entity @s enderchest.22 with minecraft:air
execute if items entity @s enderchest.23 minecraft:dragon_egg run item replace entity @s enderchest.23 with minecraft:air
execute if items entity @s enderchest.24 minecraft:dragon_egg run item replace entity @s enderchest.24 with minecraft:air
execute if items entity @s enderchest.25 minecraft:dragon_egg run item replace entity @s enderchest.25 with minecraft:air
execute if items entity @s enderchest.26 minecraft:dragon_egg run item replace entity @s enderchest.26 with minecraft:air

# 4. ปลดแท็กชั่วคราวและแจ้งเตือนผู้เล่น
tag @e[type=minecraft:item,tag=temp_dragon] remove temp_dragon
title @s actionbar {"text":"ห้ามเก็บไข่มังกรใน Ender Chest! คืนไอเทมให้ที่พื้นแล้ว","color":"red"}
