# ==========================================
# พิมพ์พิกัดและรายการของในกล่องนอกเขต 1 ใบ
# ==========================================

# 1. ดึงพิกัด X, Y, Z ของกล่องใบนี้
execute store result score #pos flag_x run data get entity @s Pos[0]
execute store result score #pos flag_y run data get entity @s Pos[1]
execute store result score #pos flag_z run data get entity @s Pos[2]

# 2. ตรวจนับจำนวนไอเทมปัจจุบันในกล่องนี้สดๆ
scoreboard players set #egg_in_chest item_count 0
scoreboard players set #nametag_in_chest item_count 0
scoreboard players set #star_in_chest item_count 0
execute if data block ~ ~ ~ Items[0] run function nbs:scoreboard/calc_chest_items

# 3. แสดงผลให้ผู้เล่นที่กดเรียกดู (@a[tag=checking_hidden]) ตามประเภทไอเทมที่พบ
# 3.1 พบเฉพาะไข่มังกร
execute if score #egg_in_chest item_count matches 1.. if score #star_in_chest item_count matches 0 if score #nametag_in_chest item_count matches 0 run tellraw @a[tag=checking_hidden] ["",{"text":" • ","color":"gray"},{"text":"[ไข่มังกร] ","color":"light_purple","bold":true},{"text":"พิกัด: ","color":"yellow"},{"text":"[ X: ","color":"gray"},{"score":{"name":"#pos","objective":"flag_x"},"color":"aqua","bold":true},{"text":", Y: ","color":"gray"},{"score":{"name":"#pos","objective":"flag_y"},"color":"aqua","bold":true},{"text":", Z: ","color":"gray"},{"score":{"name":"#pos","objective":"flag_z"},"color":"aqua","bold":true},{"text":" ]","color":"gray"}]

# 3.2 พบเฉพาะ Nether Star
execute if score #egg_in_chest item_count matches 0 if score #star_in_chest item_count matches 1.. if score #nametag_in_chest item_count matches 0 run tellraw @a[tag=checking_hidden] ["",{"text":" • ","color":"gray"},{"text":"[Nether Star] ","color":"dark_purple","bold":true},{"text":"พิกัด: ","color":"yellow"},{"text":"[ X: ","color":"gray"},{"score":{"name":"#pos","objective":"flag_x"},"color":"aqua","bold":true},{"text":", Y: ","color":"gray"},{"score":{"name":"#pos","objective":"flag_y"},"color":"aqua","bold":true},{"text":", Z: ","color":"gray"},{"score":{"name":"#pos","objective":"flag_z"},"color":"aqua","bold":true},{"text":" ]","color":"gray"}]

# 3.3 พบเฉพาะป้ายชื่อคะแนน PvP
execute if score #egg_in_chest item_count matches 0 if score #star_in_chest item_count matches 0 if score #nametag_in_chest item_count matches 1.. run tellraw @a[tag=checking_hidden] ["",{"text":" • ","color":"gray"},{"text":"[ป้ายชื่อคะแนน PvP] ","color":"gold","bold":true},{"text":"พิกัด: ","color":"yellow"},{"text":"[ X: ","color":"gray"},{"score":{"name":"#pos","objective":"flag_x"},"color":"aqua","bold":true},{"text":", Y: ","color":"gray"},{"score":{"name":"#pos","objective":"flag_y"},"color":"aqua","bold":true},{"text":", Z: ","color":"gray"},{"score":{"name":"#pos","objective":"flag_z"},"color":"aqua","bold":true},{"text":" ]","color":"gray"}]

# 3.4 พบไข่มังกร และ Nether Star
execute if score #egg_in_chest item_count matches 1.. if score #star_in_chest item_count matches 1.. if score #nametag_in_chest item_count matches 0 run tellraw @a[tag=checking_hidden] ["",{"text":" • ","color":"gray"},{"text":"[ไข่มังกร + Nether Star] ","color":"light_purple","bold":true},{"text":"พิกัด: ","color":"yellow"},{"text":"[ X: ","color":"gray"},{"score":{"name":"#pos","objective":"flag_x"},"color":"aqua","bold":true},{"text":", Y: ","color":"gray"},{"score":{"name":"#pos","objective":"flag_y"},"color":"aqua","bold":true},{"text":", Z: ","color":"gray"},{"score":{"name":"#pos","objective":"flag_z"},"color":"aqua","bold":true},{"text":" ]","color":"gray"}]

# 3.5 พบไข่มังกร และ ป้ายชื่อคะแนน PvP
execute if score #egg_in_chest item_count matches 1.. if score #star_in_chest item_count matches 0 if score #nametag_in_chest item_count matches 1.. run tellraw @a[tag=checking_hidden] ["",{"text":" • ","color":"gray"},{"text":"[ไข่มังกร + ป้ายชื่อคะแนน] ","color":"light_purple","bold":true},{"text":"พิกัด: ","color":"yellow"},{"text":"[ X: ","color":"gray"},{"score":{"name":"#pos","objective":"flag_x"},"color":"aqua","bold":true},{"text":", Y: ","color":"gray"},{"score":{"name":"#pos","objective":"flag_y"},"color":"aqua","bold":true},{"text":", Z: ","color":"gray"},{"score":{"name":"#pos","objective":"flag_z"},"color":"aqua","bold":true},{"text":" ]","color":"gray"}]

# 3.6 พบ Nether Star และ ป้ายชื่อคะแนน PvP
execute if score #egg_in_chest item_count matches 0 if score #star_in_chest item_count matches 1.. if score #nametag_in_chest item_count matches 1.. run tellraw @a[tag=checking_hidden] ["",{"text":" • ","color":"gray"},{"text":"[Nether Star + ป้ายชื่อคะแนน] ","color":"dark_purple","bold":true},{"text":"พิกัด: ","color":"yellow"},{"text":"[ X: ","color":"gray"},{"score":{"name":"#pos","objective":"flag_x"},"color":"aqua","bold":true},{"text":", Y: ","color":"gray"},{"score":{"name":"#pos","objective":"flag_y"},"color":"aqua","bold":true},{"text":", Z: ","color":"gray"},{"score":{"name":"#pos","objective":"flag_z"},"color":"aqua","bold":true},{"text":" ]","color":"gray"}]

# 3.7 พบทั้ง 3 รายการ
execute if score #egg_in_chest item_count matches 1.. if score #star_in_chest item_count matches 1.. if score #nametag_in_chest item_count matches 1.. run tellraw @a[tag=checking_hidden] ["",{"text":" • ","color":"gray"},{"text":"[ไข่มังกร + Nether Star + ป้ายชื่อ] ","color":"light_purple","bold":true},{"text":"พิกัด: ","color":"yellow"},{"text":"[ X: ","color":"gray"},{"score":{"name":"#pos","objective":"flag_x"},"color":"aqua","bold":true},{"text":", Y: ","color":"gray"},{"score":{"name":"#pos","objective":"flag_y"},"color":"aqua","bold":true},{"text":", Z: ","color":"gray"},{"score":{"name":"#pos","objective":"flag_z"},"color":"aqua","bold":true},{"text":" ]","color":"gray"}]
