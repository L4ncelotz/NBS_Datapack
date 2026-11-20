# ==========================================
# สุ่มกระจายตัวในพื้นที่โลก 5,000 บล็อก โดยไม่ตกใน Spawn 100%
# (แบ่งพื้นที่สุ่มเป็น 4 ทิศทางรอบโลก ห่างจากศูนย์กลางอย่างน้อย 200 บล็อก)
# ==========================================

# สุ่มเลข 1 ถึง 4 เพื่อกระจายผู้เล่นไปยัง 4 ทิศทางของแผนที่โลก 5,000 บล็อก
execute store result score #rnd rnd_temp run random value 1..4

# ทิศที่ 1: โซนตะวันออกเฉียงเหนือ (+X, +Z) พิกัดประมาณ +200 ถึง +4,800
execute if score #rnd rnd_temp matches 1 run spreadplayers 2500 2500 50 2300 false @s

# ทิศที่ 2: โซนตะวันตกเฉียงเหนือ (-X, +Z) พิกัดประมาณ -4,800 ถึง -200
execute if score #rnd rnd_temp matches 2 run spreadplayers -2500 2500 50 2300 false @s

# ทิศที่ 3: โซนตะวันออกเฉียงใต้ (+X, -Z) พิกัดประมาณ +200 ถึง +4,800
execute if score #rnd rnd_temp matches 3 run spreadplayers 2500 -2500 50 2300 false @s

# ทิศที่ 4: โซนตะวันตกเฉียงใต้ (-X, -Z) พิกัดประมาณ -4,800 ถึง -200
execute if score #rnd rnd_temp matches 4 run spreadplayers -2500 -2500 50 2300 false @s

# กรณีระบบสุ่มไม่ได้เลข 1-4 ให้ใช้ทิศที่ 1 เป็นค่าเริ่มต้น
execute unless score #rnd rnd_temp matches 1..4 run spreadplayers 2500 2500 50 2300 false @s

# ระบบป้องกันขั้นสูงสุด: หากตัวละครยังอยู่ในระยะ 150 บล็อกของสปอว์น ให้ดีดออกไปพิกัดปลอดภัยทันที
execute at @e[tag=spawn_anchor] as @s[distance=..150] run spreadplayers 2000 2000 50 1500 false @s

# ล้างสถานะ in_spawn ทันทีที่วาร์ปออกสู่ป่า
tag @s remove in_spawn
