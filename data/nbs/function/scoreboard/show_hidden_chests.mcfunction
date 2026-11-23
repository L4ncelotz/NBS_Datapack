# ==========================================
# แสดงรายการพิกัดไอเท็มนับคะแนนทั้งหมดที่ถูกซ่อนอยู่นอกอาณาเขตธง
# ==========================================

# ติดแท็กให้ผู้เล่นที่กดเรียกดูพิกัด
tag @s add checking_hidden

# 1. กรณีไม่มีกล่องที่ซ่อนของชิงชัยนอกเขตเลย
execute unless entity @e[type=minecraft:marker,tag=hidden_chest] run tellraw @s ["",{"text":"📦 [ระบบเรดาร์] ","color":"gold","bold":true},{"text":"ขณะนี้","color":"gray"},{"text":"ไม่มี","color":"green","bold":true},{"text":"ไอเท็มนับคะแนนถูกซ่อนอยู่นอกอาณาเขตธงเลย (ปลอดภัย)","color":"gray"}]
execute unless entity @e[type=minecraft:marker,tag=hidden_chest] run playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 1 1

# 2. กรณีตรวจพบกล่องที่ซ่อนของนอกเขตธง
execute if entity @e[type=minecraft:marker,tag=hidden_chest] run tellraw @s ["",{"text":"=== 📦 พิกัดของชิงชัยที่ซ่อนอยู่นอกอาณาเขตธง ===","color":"gold","bold":true}]
execute if entity @e[type=minecraft:marker,tag=hidden_chest] as @e[type=minecraft:marker,tag=hidden_chest] at @s run function nbs:scoreboard/print_single_hidden_chest
execute if entity @e[type=minecraft:marker,tag=hidden_chest] run tellraw @s ["",{"text":"✨ ละอองระยิบระยับลอยฟุ้งรอบกล่องในรัศมี 20 บล็อก","color":"dark_gray","italic":true}]
execute if entity @e[type=minecraft:marker,tag=hidden_chest] run playsound minecraft:block.bell.resonate master @s ~ ~ ~ 0.8 1.2

tag @s remove checking_hidden
