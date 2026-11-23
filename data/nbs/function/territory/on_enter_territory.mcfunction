# ==========================================
# อีเวนต์: ผู้เล่นเดินกลับเข้าสู่อาณาเขตธง (<= 32 บล็อก)
# ==========================================

# ติดแท็กสถานะว่าอยู่ในอาณาเขตของทีม
tag @s add in_own_territory

# เล่นเสียงยินดีต้อนรับเข้าเขตปลอดภัย
playsound minecraft:entity.experience_orb.pickup player @s ~ ~ ~ 0.8 1.2

# กำหนดระยะเวลาแสดงผล (fadein 5, stay 40, fadeout 15 ticks = รวม ~3 วินาที)
title @s times 5 40 15

# แจ้งเตือนตัวหนังสือสีเขียวบน Actionbar เฉพาะตอนเดินเข้าเขต (แสดง 3 วินาทีแล้วจางหายไปเอง)
execute unless entity @s[tag=hide_flag_hud] run title @s actionbar ["",{"text":"✅ เข้าสู่อาณาเขตทีมแล้ว! ","color":"green","bold":true},{"text":"(ห่างจากธง ","color":"gray"},{"score":{"name":"@s","objective":"flag_dist"},"color":"aqua","bold":true},{"text":" บล็อก)","color":"gray"}]
