# ==========================================
# อีเวนต์: ผู้เล่นเดินก้าวออกจากอาณาเขตธง (> 32 บล็อก)
# ==========================================

# ปลดสถานะว่าอยู่ในอาณาเขต
tag @s remove in_own_territory

# เล่นเสียงเตือนภัย (Note Block Bass ทุ้มต่ำ + กระดิ่งเตือน)
playsound minecraft:block.note_block.bass player @s ~ ~ ~ 1 0.7
playsound minecraft:block.bell.use player @s ~ ~ ~ 0.5 1.5

# กำหนดระยะเวลาแสดงผล (fadein 5, stay 40, fadeout 15 ticks = รวม ~3 วินาที)
title @s times 5 40 15

# แจ้งเตือนตัวหนังสือสีแดงบน Actionbar เฉพาะตอนเดินออกจากเขต (แสดง 3 วินาทีแล้วจางหายไปเอง)
execute unless entity @s[tag=hide_flag_hud] run title @s actionbar ["",{"text":"⚠️ คุณได้ก้าวออกจากอาณาเขตแล้ว! ","color":"red","bold":true},{"text":"(ห่างจากธง ","color":"gray"},{"score":{"name":"@s","objective":"flag_dist"},"color":"gold","bold":true},{"text":" บล็อก)","color":"gray"}]
