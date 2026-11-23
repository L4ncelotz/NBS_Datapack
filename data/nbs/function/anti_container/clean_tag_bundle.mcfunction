# ค้นหาสล็อตของ Bundle ที่มีป้ายชื่อคะแนนในตัวผู้เล่น
execute store result storage nbs:temp clean_slot.slot int 1 run data get entity @s Inventory[{components:{"minecraft:bundle_contents":[{id:"minecraft:name_tag",components:{"minecraft:custom_data":{score_tag:1b}}}]}}].Slot

execute if data storage nbs:temp clean_slot{slot:-106} run function nbs:anti_container/clean_bundle_offhand
execute unless data storage nbs:temp clean_slot{slot:-106} run function nbs:anti_container/clean_bundle_slot with storage nbs:temp clean_slot
