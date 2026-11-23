# ค้นหาสล็อตของไอเทม Shulker Box ที่มีไข่มังกรใน Ender Chest
execute store result storage nbs:temp clean_slot.slot int 1 run data get entity @s EnderItems[{components:{"minecraft:container":[{item:{id:"minecraft:dragon_egg"}}]}}].Slot
function nbs:anti_container/clean_shulker_item_ender_slot with storage nbs:temp clean_slot
