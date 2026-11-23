# ==========================================
# ตรวจสอบบล็อก Shulker Box ที่หมุด @s ปักอยู่
# ==========================================

# 1. เช็กว่าบล็อกนี้ยังคงเป็น Shulker Box หรือไม่ ถ้าไม่มีให้ลบหมุดทิ้ง
execute unless block ~ ~ ~ #nbs:shulker_boxes run kill @s

# 2. ตรวจสอบไข่มังกร (Dragon Egg)
execute if block ~ ~ ~ #nbs:shulker_boxes if data block ~ ~ ~ Items[{id:"minecraft:dragon_egg"}] run function nbs:anti_container/eject_egg_from_placed_shulker

# 3. ตรวจสอบ Nether Star
execute if block ~ ~ ~ #nbs:shulker_boxes if data block ~ ~ ~ Items[{id:"minecraft:nether_star"}] run function nbs:anti_container/eject_star_from_placed_shulker

# 4. ตรวจสอบป้ายชื่อคะแนน (Name Tag ที่มี score_tag:1b)
execute if block ~ ~ ~ #nbs:shulker_boxes if data block ~ ~ ~ Items[{id:"minecraft:name_tag",components:{"minecraft:custom_data":{score_tag:1b}}}] run function nbs:anti_container/eject_tag_from_placed_shulker
