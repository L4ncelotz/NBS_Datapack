# ส่งผู้เล่นที่มีไข่มังกรใน Ender Chest ไปทำการย้ายของออกทีละช่อง
execute as @a if items entity @s enderchest.* minecraft:dragon_egg at @s run function nbs:anti_enderchest/eject_single_ender_slot

# ส่งผู้เล่นที่มีป้ายชื่อคะแนนใน Ender Chest ไปทำการย้ายของออกทีละช่อง
execute as @a if items entity @s enderchest.* minecraft:name_tag[custom_data={score_tag:1b}] at @s run function nbs:anti_enderchest/eject_single_nametag_slot
