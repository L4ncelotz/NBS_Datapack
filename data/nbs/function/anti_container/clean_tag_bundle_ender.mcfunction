# ค้นหาสล็อตของ Bundle ที่มีป้ายชื่อคะแนนใน Ender Chest
execute store result storage nbs:temp clean_slot.slot int 1 run data get entity @s EnderItems[{components:{"minecraft:bundle_contents":[{id:"minecraft:name_tag",components:{"minecraft:custom_data":{score_tag:1b}}}]}}].Slot
function nbs:anti_container/clean_bundle_ender_slot with storage nbs:temp clean_slot
