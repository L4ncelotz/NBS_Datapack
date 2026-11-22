# ค้นหาสล็อตของ Bundle ที่มี Nether Star ใน Ender Chest
execute store result storage nbs:temp clean_slot.slot int 1 run data get entity @s EnderItems[{components:{"minecraft:bundle_contents":[{id:"minecraft:nether_star"}]}}].Slot
function nbs:anti_container/clean_bundle_ender_slot with storage nbs:temp clean_slot
