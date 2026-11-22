# ค้นหาสล็อตของ Bundle ที่มีไข่มังกรในตัวผู้เล่น
execute store result storage nbs:temp clean_slot.slot int 1 run data get entity @s Inventory[{components:{"minecraft:bundle_contents":[{id:"minecraft:dragon_egg"}]}}].Slot

# กรณีอยู่ในมือรอง (Offhand: Slot -106)
execute if data storage nbs:temp clean_slot{slot:-106} run function nbs:anti_container/clean_bundle_offhand

# กรณีอยู่ในช่องเก็บของปกติ (Slot 0-35)
execute unless data storage nbs:temp clean_slot{slot:-106} run function nbs:anti_container/clean_bundle_slot with storage nbs:temp clean_slot
