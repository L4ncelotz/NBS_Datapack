# ==========================================
# ระบบสุ่มจุดเกิดและเกิดใหม่ (RTP System)
# ==========================================

# ตรวจสอบและสร้าง Scoreboard ที่จำเป็นอัตโนมัติ
scoreboard objectives add death_track deathCount
scoreboard objectives add player_hp health
scoreboard objectives add rnd_temp dummy

# 1. ตรวจจับการเข้าเซิร์ฟครั้งแรก (First Join)
execute as @a[tag=!rtp_joined] at @s run function nbs:rtp/first_join

# 2. บันทึกผู้เล่นที่เพิ่งตาย (เมื่อตายให้ติดแท็ก just_died)
execute as @a[scores={death_track=1..}] run tag @s add just_died
scoreboard players set @a[scores={death_track=1..}] death_track 0

# 3. เมื่อผู้เล่น "กดปุ่มเกิดใหม่แล้ว" (player_hp >= 1 แปลว่าคืนชีพแล้ว ไม่ได้ค้างอยู่หน้าจอ You Died!):
# 3.1 กรณีเกิดที่เตียง/Respawn Anchor (อยู่นอกเขต Spawn กลาง) -> ปลดแท็กทิ้ง ให้อยู่ที่เตียงตามปกติ
execute as @a[tag=just_died,tag=!in_spawn,scores={player_hp=1..}] run tag @s remove just_died

# 3.2 กรณีเกิดที่ Spawn กลาง (ไม่มีเตียง หรือเตียงพัง) -> สุ่มวาร์ปกระจายตัวเข้าป่า 5,000 บล็อกทันที!
execute as @a[tag=just_died,tag=in_spawn,scores={player_hp=1..}] at @s run function nbs:rtp/respawn_rtp
