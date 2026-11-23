# ==========================================
# ตรวจสอบไอเทมนับคะแนนในกล่องที่อยู่นอกรัศมีเขตธง
# ==========================================

# 1. รวมจำนวนไอเทมนับคะแนนทั้งหมดในกล่องนอกเขต
scoreboard players set #total_hidden item_count 0
scoreboard players operation #total_hidden item_count += #egg_in_chest item_count
scoreboard players operation #total_hidden item_count += #nametag_in_chest item_count
scoreboard players operation #total_hidden item_count += #star_in_chest item_count

# 2. หากมีไอเทมนับคะแนนอยู่ในกล่องนอกเขต -> ส่งฟังก์ชันแจ้งเตือน
execute if score #total_hidden item_count matches 1.. run function nbs:scoreboard/alert_hidden_chest

# 3. หากไม่มีไอเทมนับคะแนนแล้ว แต่กล่องนี้เคยติดสถานะ hidden_chest ไว้ (ถูกหยิบออกไปแล้ว) -> เคลียร์สถานะ
execute if score #total_hidden item_count matches 0 if entity @s[tag=hidden_chest] run function nbs:scoreboard/clear_hidden_chest
