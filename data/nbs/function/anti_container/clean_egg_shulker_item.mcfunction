# ค้นหาสล็อตของไอเทม Shulker Box ที่มีไข่มังกรในตัวผู้เล่น
execute store result storage nbs:temp clean_slot.slot int 1 run data get entity @s Inventory[{components:{"minecraft:container":[{item:{id:"minecraft:dragon_egg"}}]}}].Slot

execute if data storage nbs:temp clean_slot{slot:-106} run function nbs:anti_container/clean_shulker_item_offhand
execute unless data storage nbs:temp clean_slot{slot:-106} run function nbs:anti_container/clean_shulker_item_slot with storage nbs:temp clean_slot
