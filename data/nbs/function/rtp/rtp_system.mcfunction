# ==========================================
# ระบบสุ่มจุดเกิดและเกิดใหม่ (RTP System)
# ==========================================

# ตรวจสอบและสร้าง Scoreboard ที่จำเป็นอัตโนมัติ
scoreboard objectives add death_track deathCount
scoreboard objectives add rnd_temp dummy

# 1. ตรวจจับการเข้าเซิร์ฟครั้งแรก (เฉพาะเมื่อเริ่มเกมแล้ว และยังไม่มีทีม)
execute if score #game_state game_state matches 1 as @a[tag=!rtp_joined,scores={team_id=0}] at @s run function nbs:rtp/first_join

# 2. บันทึกผู้เล่นที่เพิ่งตาย (เมื่อตายให้ติดแท็ก just_died)
execute as @a[scores={death_track=1..}] run tag @s add just_died
scoreboard players set @a[scores={death_track=1..}] death_track 0

# 3. เมื่อผู้เล่น "กดปุ่มเกิดใหม่แล้ว" (@e[type=player] จะจับเฉพาะคนที่กด Respawn คืนชีพกลับมาในโลกแล้วเท่านั้น):
# 3.1 กรณีเกิดที่ Spawn กลาง (ไม่มีเตียง หรือเตียงพัง) -> ส่งกลับสู่จุดเกิดทีมหรือสุ่มวาร์ปเข้าป่า 5,000 บล็อกทันที!
execute as @e[type=player,tag=just_died,tag=in_spawn] at @s run function nbs:rtp/respawn_rtp

# 3.2 กรณีเกิดที่เตียง/Respawn Anchor (อยู่นอกเขต Spawn กลาง) -> ปลดแท็กทิ้ง ให้อยู่ที่เตียงตามปกติ
execute as @e[type=player,tag=just_died,tag=!in_spawn] run tag @s remove just_died
