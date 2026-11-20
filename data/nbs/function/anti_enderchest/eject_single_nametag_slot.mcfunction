# 1. สร้างไอเทมดรอปจำลองไว้ที่เท้าผู้เล่น 1 ชิ้น
execute at @s run summon minecraft:item ~ ~0.5 ~ {Tags:["temp_nametag"],Item:{id:"minecraft:stone",count:1}}

# 2. คัดลอกข้อมูลป้ายชื่อคะแนนทั้งหมดจาก Ender Chest มาใส่ไอเทมบนพื้น
execute at @s run data modify entity @e[type=minecraft:item,tag=temp_nametag,limit=1] Item set from entity @s EnderItems[{id:"minecraft:name_tag",components:{"minecraft:custom_data":{score_tag:1b}}}]

# กรณีสำรอง หากไม่ตรงฟิลด์ (เช่นโครงสร้าง NBT อื่น) ให้คัดลอก name_tag ทั่วไปใน EnderItems
execute as @e[type=minecraft:item,tag=temp_nametag,limit=1] if data entity @s {Item:{id:"minecraft:stone"}} run data modify entity @s Item set from entity @p EnderItems[{id:"minecraft:name_tag"}]

# กรณีสำรองขั้นสุดท้าย เสกไอเทมป้ายชื่อคะแนนทดแทนทันที
execute as @e[type=minecraft:item,tag=temp_nametag,limit=1] if data entity @s {Item:{id:"minecraft:stone"}} run data modify entity @s Item set value {id:"minecraft:name_tag",count:1,components:{"minecraft:custom_data":{score_tag:1b},"minecraft:custom_name":{text:"ป้ายชื่อคะแนน (+5)",color:"gold",bold:true,italic:false},"minecraft:lore":[{text:"ได้รับจากการสังหารผู้เล่น",color:"gray",italic:false},{text:"มูลค่า 5 คะแนน",color:"yellow",italic:false},{text:"⚠️ ห้ามซ่อนใน Ender Chest",color:"red",italic:false}]}}

# 3. ลบป้ายชื่อคะแนนออกจากช่อง Ender Chest (0 ถึง 26) เท่านั้น (ไม่ไปยุ่งกับกระเป๋าหลัก)
execute if items entity @s enderchest.0 minecraft:name_tag[custom_data={score_tag:1b}] run item replace entity @s enderchest.0 with minecraft:air
execute if items entity @s enderchest.1 minecraft:name_tag[custom_data={score_tag:1b}] run item replace entity @s enderchest.1 with minecraft:air
execute if items entity @s enderchest.2 minecraft:name_tag[custom_data={score_tag:1b}] run item replace entity @s enderchest.2 with minecraft:air
execute if items entity @s enderchest.3 minecraft:name_tag[custom_data={score_tag:1b}] run item replace entity @s enderchest.3 with minecraft:air
execute if items entity @s enderchest.4 minecraft:name_tag[custom_data={score_tag:1b}] run item replace entity @s enderchest.4 with minecraft:air
execute if items entity @s enderchest.5 minecraft:name_tag[custom_data={score_tag:1b}] run item replace entity @s enderchest.5 with minecraft:air
execute if items entity @s enderchest.6 minecraft:name_tag[custom_data={score_tag:1b}] run item replace entity @s enderchest.6 with minecraft:air
execute if items entity @s enderchest.7 minecraft:name_tag[custom_data={score_tag:1b}] run item replace entity @s enderchest.7 with minecraft:air
execute if items entity @s enderchest.8 minecraft:name_tag[custom_data={score_tag:1b}] run item replace entity @s enderchest.8 with minecraft:air
execute if items entity @s enderchest.9 minecraft:name_tag[custom_data={score_tag:1b}] run item replace entity @s enderchest.9 with minecraft:air
execute if items entity @s enderchest.10 minecraft:name_tag[custom_data={score_tag:1b}] run item replace entity @s enderchest.10 with minecraft:air
execute if items entity @s enderchest.11 minecraft:name_tag[custom_data={score_tag:1b}] run item replace entity @s enderchest.11 with minecraft:air
execute if items entity @s enderchest.12 minecraft:name_tag[custom_data={score_tag:1b}] run item replace entity @s enderchest.12 with minecraft:air
execute if items entity @s enderchest.13 minecraft:name_tag[custom_data={score_tag:1b}] run item replace entity @s enderchest.13 with minecraft:air
execute if items entity @s enderchest.14 minecraft:name_tag[custom_data={score_tag:1b}] run item replace entity @s enderchest.14 with minecraft:air
execute if items entity @s enderchest.15 minecraft:name_tag[custom_data={score_tag:1b}] run item replace entity @s enderchest.15 with minecraft:air
execute if items entity @s enderchest.16 minecraft:name_tag[custom_data={score_tag:1b}] run item replace entity @s enderchest.16 with minecraft:air
execute if items entity @s enderchest.17 minecraft:name_tag[custom_data={score_tag:1b}] run item replace entity @s enderchest.17 with minecraft:air
execute if items entity @s enderchest.18 minecraft:name_tag[custom_data={score_tag:1b}] run item replace entity @s enderchest.18 with minecraft:air
execute if items entity @s enderchest.19 minecraft:name_tag[custom_data={score_tag:1b}] run item replace entity @s enderchest.19 with minecraft:air
execute if items entity @s enderchest.20 minecraft:name_tag[custom_data={score_tag:1b}] run item replace entity @s enderchest.20 with minecraft:air
execute if items entity @s enderchest.21 minecraft:name_tag[custom_data={score_tag:1b}] run item replace entity @s enderchest.21 with minecraft:air
execute if items entity @s enderchest.22 minecraft:name_tag[custom_data={score_tag:1b}] run item replace entity @s enderchest.22 with minecraft:air
execute if items entity @s enderchest.23 minecraft:name_tag[custom_data={score_tag:1b}] run item replace entity @s enderchest.23 with minecraft:air
execute if items entity @s enderchest.24 minecraft:name_tag[custom_data={score_tag:1b}] run item replace entity @s enderchest.24 with minecraft:air
execute if items entity @s enderchest.25 minecraft:name_tag[custom_data={score_tag:1b}] run item replace entity @s enderchest.25 with minecraft:air
execute if items entity @s enderchest.26 minecraft:name_tag[custom_data={score_tag:1b}] run item replace entity @s enderchest.26 with minecraft:air

# 4. ปลดแท็กชั่วคราวและแจ้งเตือนผู้เล่น
tag @e[type=minecraft:item,tag=temp_nametag] remove temp_nametag
title @s actionbar {"text":"⚠️ ห้ามเก็บป้ายชื่อคะแนนใน Ender Chest! คืนไอเทมให้ที่พื้นแล้ว","color":"red"}
