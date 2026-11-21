# 1. ดึงไอเทมช่องแรกสุดออกมาเก็บใน CurrentItem แล้วลบช่องแรกทิ้ง
data modify storage nbs:temp CurrentItem set from storage nbs:temp ChestItems[0]
data remove storage nbs:temp ChestItems[0]

# 2. ตรวจสอบไข่มังกร (Dragon Egg: 150 คะแนน)
scoreboard players set #slot_count item_count 0
execute if data storage nbs:temp CurrentItem{id:"minecraft:dragon_egg"} store result score #slot_count item_count run data get storage nbs:temp CurrentItem.count
execute if data storage nbs:temp CurrentItem{id:"minecraft:dragon_egg"} if score #slot_count item_count matches 0 store result score #slot_count item_count run data get storage nbs:temp CurrentItem.Count
execute if data storage nbs:temp CurrentItem{id:"minecraft:dragon_egg"} if score #slot_count item_count matches 0 run scoreboard players set #slot_count item_count 1
scoreboard players operation #egg_in_chest item_count += #slot_count item_count

# 3. ตรวจสอบป้ายชื่อคะแนน (Name Tag ที่มี score_tag:1b เท่านั้น: 15 คะแนน)
scoreboard players set #slot_count item_count 0
execute if data storage nbs:temp CurrentItem{id:"minecraft:name_tag",components:{"minecraft:custom_data":{score_tag:1b}}} store result score #slot_count item_count run data get storage nbs:temp CurrentItem.count
execute if data storage nbs:temp CurrentItem{id:"minecraft:name_tag",components:{"minecraft:custom_data":{score_tag:1b}}} if score #slot_count item_count matches 0 store result score #slot_count item_count run data get storage nbs:temp CurrentItem.Count
execute if data storage nbs:temp CurrentItem{id:"minecraft:name_tag",components:{"minecraft:custom_data":{score_tag:1b}}} if score #slot_count item_count matches 0 run scoreboard players set #slot_count item_count 1
scoreboard players operation #nametag_in_chest item_count += #slot_count item_count

# 4. ตรวจสอบ Nether Star (30 คะแนน — นับรวมเข้าทีมเพื่อล็อก Cap 5 ดวง/ทีม)
scoreboard players set #slot_count item_count 0
execute if data storage nbs:temp CurrentItem{id:"minecraft:nether_star"} store result score #slot_count item_count run data get storage nbs:temp CurrentItem.count
execute if data storage nbs:temp CurrentItem{id:"minecraft:nether_star"} if score #slot_count item_count matches 0 store result score #slot_count item_count run data get storage nbs:temp CurrentItem.Count
execute if data storage nbs:temp CurrentItem{id:"minecraft:nether_star"} if score #slot_count item_count matches 0 run scoreboard players set #slot_count item_count 1
scoreboard players operation #star_in_chest item_count += #slot_count item_count

# 5. หากยังมีไอเทมเหลือในกล่อง ให้ทำซ้ำช่องถัดไปจนหมด
execute if data storage nbs:temp ChestItems[0] run function nbs:scoreboard/sum_chest_items
