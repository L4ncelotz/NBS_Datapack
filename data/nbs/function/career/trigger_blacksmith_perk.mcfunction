# ==========================================
# อีเวนต์: Blacksmith Emergency Fire Resistance Perk (ฉุกเฉินเมื่อ HP <= 10)
# ทำงานครั้งเดียว ได้รับสถานะ 10 วินาที และไม่แจกซ้ำค้างในลาวา
# ==========================================

# 1. มอบเอฟเฟกต์ Fire Resistance 10 วินาที (ซ่อน Particle)
effect give @s minecraft:fire_resistance 10 0 true

# 2. ติดแท็กใช้ไปแล้ว และตั้งเวลาคูลดาวน์ 60 วินาที
tag @s add blacksmith_fire_used
scoreboard players set @s blacksmith_cd 60

# 3. เล่นเสียงเอฟเฟกต์ไฟฉุกเฉินปกป้อง
playsound minecraft:item.firecharge.use player @s ~ ~ ~ 1 1
playsound minecraft:entity.blaze.shoot player @s ~ ~ ~ 0.8 1.2

# 4. แสดงข้อความแจ้งเตือนตัวหนังสือเล็กบน Actionbar
title @s actionbar {"text":"🔥 [ช่างตีเหล็ก] ฉุกเฉิน! ได้รับ Fire Resistance 10 วินาที","color":"gold","bold":true}
