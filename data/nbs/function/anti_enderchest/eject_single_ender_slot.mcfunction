# ตรวจและดีดไข่มังกรออกจาก Ender Chest ทีละช่อง (0 ถึง 26) เพื่อไม่ให้กองอื่นสูญหาย
execute if items entity @s enderchest.0 minecraft:dragon_egg run function nbs:anti_enderchest/eject_slot {slot:0}
execute if items entity @s enderchest.1 minecraft:dragon_egg run function nbs:anti_enderchest/eject_slot {slot:1}
execute if items entity @s enderchest.2 minecraft:dragon_egg run function nbs:anti_enderchest/eject_slot {slot:2}
execute if items entity @s enderchest.3 minecraft:dragon_egg run function nbs:anti_enderchest/eject_slot {slot:3}
execute if items entity @s enderchest.4 minecraft:dragon_egg run function nbs:anti_enderchest/eject_slot {slot:4}
execute if items entity @s enderchest.5 minecraft:dragon_egg run function nbs:anti_enderchest/eject_slot {slot:5}
execute if items entity @s enderchest.6 minecraft:dragon_egg run function nbs:anti_enderchest/eject_slot {slot:6}
execute if items entity @s enderchest.7 minecraft:dragon_egg run function nbs:anti_enderchest/eject_slot {slot:7}
execute if items entity @s enderchest.8 minecraft:dragon_egg run function nbs:anti_enderchest/eject_slot {slot:8}
execute if items entity @s enderchest.9 minecraft:dragon_egg run function nbs:anti_enderchest/eject_slot {slot:9}
execute if items entity @s enderchest.10 minecraft:dragon_egg run function nbs:anti_enderchest/eject_slot {slot:10}
execute if items entity @s enderchest.11 minecraft:dragon_egg run function nbs:anti_enderchest/eject_slot {slot:11}
execute if items entity @s enderchest.12 minecraft:dragon_egg run function nbs:anti_enderchest/eject_slot {slot:12}
execute if items entity @s enderchest.13 minecraft:dragon_egg run function nbs:anti_enderchest/eject_slot {slot:13}
execute if items entity @s enderchest.14 minecraft:dragon_egg run function nbs:anti_enderchest/eject_slot {slot:14}
execute if items entity @s enderchest.15 minecraft:dragon_egg run function nbs:anti_enderchest/eject_slot {slot:15}
execute if items entity @s enderchest.16 minecraft:dragon_egg run function nbs:anti_enderchest/eject_slot {slot:16}
execute if items entity @s enderchest.17 minecraft:dragon_egg run function nbs:anti_enderchest/eject_slot {slot:17}
execute if items entity @s enderchest.18 minecraft:dragon_egg run function nbs:anti_enderchest/eject_slot {slot:18}
execute if items entity @s enderchest.19 minecraft:dragon_egg run function nbs:anti_enderchest/eject_slot {slot:19}
execute if items entity @s enderchest.20 minecraft:dragon_egg run function nbs:anti_enderchest/eject_slot {slot:20}
execute if items entity @s enderchest.21 minecraft:dragon_egg run function nbs:anti_enderchest/eject_slot {slot:21}
execute if items entity @s enderchest.22 minecraft:dragon_egg run function nbs:anti_enderchest/eject_slot {slot:22}
execute if items entity @s enderchest.23 minecraft:dragon_egg run function nbs:anti_enderchest/eject_slot {slot:23}
execute if items entity @s enderchest.24 minecraft:dragon_egg run function nbs:anti_enderchest/eject_slot {slot:24}
execute if items entity @s enderchest.25 minecraft:dragon_egg run function nbs:anti_enderchest/eject_slot {slot:25}
execute if items entity @s enderchest.26 minecraft:dragon_egg run function nbs:anti_enderchest/eject_slot {slot:26}

# แจ้งเตือนผู้เล่น
title @s actionbar {"text":"ห้ามเก็บไข่มังกรใน Ender Chest! คืนไอเทมให้ที่พื้นแล้ว","color":"red"}
