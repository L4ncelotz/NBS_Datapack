# ==========================================
# สุ่มกระจายตัวในพื้นที่โลก โดยไม่ตกใน Spawn 100% และไม่ทะลุ World Border
# (รองรับทั้ง World Border 5,000x5,000 และ 10,000x10,000 อัตโนมัติ)
# ==========================================

# ตรวจสอบขนาด World Border ปัจจุบัน และสุ่มเลข 1 ถึง 4 เพื่อกระจายผู้เล่นไปยัง 4 ทิศทาง
execute store result score #wb_size rnd_temp run worldborder get
execute store result score #rnd rnd_temp run random value 1..4

# กรณีที่ 1: World Border ขนาด <= 6,000 (เช่น 5,000x5,000 พิกัด -2,500 ถึง +2,500) -> สุ่มในช่วงพิกัด ±200 ถึง ±2,300
execute if score #wb_size rnd_temp matches ..6000 if score #rnd rnd_temp matches 1 run spreadplayers 1250 1250 50 1050 false @s
execute if score #wb_size rnd_temp matches ..6000 if score #rnd rnd_temp matches 2 run spreadplayers -1250 1250 50 1050 false @s
execute if score #wb_size rnd_temp matches ..6000 if score #rnd rnd_temp matches 3 run spreadplayers 1250 -1250 50 1050 false @s
execute if score #wb_size rnd_temp matches ..6000 if score #rnd rnd_temp matches 4 run spreadplayers -1250 -1250 50 1050 false @s
execute if score #wb_size rnd_temp matches ..6000 unless score #rnd rnd_temp matches 1..4 run spreadplayers 1250 1250 50 1050 false @s

# กรณีที่ 2: World Border ขนาด > 6,000 (เช่น 10,000x10,000 พิกัด -5,000 ถึง +5,000) -> สุ่มในช่วงพิกัด ±200 ถึง ±4,800
execute if score #wb_size rnd_temp matches 6001.. if score #rnd rnd_temp matches 1 run spreadplayers 2500 2500 50 2300 false @s
execute if score #wb_size rnd_temp matches 6001.. if score #rnd rnd_temp matches 2 run spreadplayers -2500 2500 50 2300 false @s
execute if score #wb_size rnd_temp matches 6001.. if score #rnd rnd_temp matches 3 run spreadplayers 2500 -2500 50 2300 false @s
execute if score #wb_size rnd_temp matches 6001.. if score #rnd rnd_temp matches 4 run spreadplayers -2500 -2500 50 2300 false @s
execute if score #wb_size rnd_temp matches 6001.. unless score #rnd rnd_temp matches 1..4 run spreadplayers 2500 2500 50 2300 false @s

# ระบบป้องกันขั้นสูงสุด: หากตัวละครยังอยู่ในระยะ 150 บล็อกของสปอว์น ให้ดีดออกไปพิกัดปลอดภัยทันที
execute at @e[tag=spawn_anchor] as @s[distance=..150] run spreadplayers 1200 1200 50 900 false @s

# ล้างสถานะ in_spawn และปลดโหมด Adventure ทันทีที่วาร์ปออกสู่ป่า
tag @s remove in_spawn
gamemode survival @s[gamemode=adventure]
