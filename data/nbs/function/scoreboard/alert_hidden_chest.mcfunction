# ==========================================
# จัดการแจ้งเตือนเมื่อตรวจพบกล่องที่ซ่อนไอเทมนอกเขตธง (เตือนครั้งแรกเมื่อตรวจพบ)
# ==========================================

# ดึงพิกัด X, Y, Z ของกล่องลงตัวแปร Scoreboard
execute store result score #pos flag_x run data get entity @s Pos[0]
execute store result score #pos flag_y run data get entity @s Pos[1]
execute store result score #pos flag_z run data get entity @s Pos[2]

# กรณีเพิ่งตรวจพบครั้งแรก (ยังไม่มีแท็ก hidden_chest) -> แจ้งเตือนแชตทั้งเซิร์ฟเวอร์ครั้งเดียว
execute unless entity @s[tag=hidden_chest] at @s run forceload add ~ ~
execute unless entity @s[tag=hidden_chest] run function nbs:scoreboard/send_hidden_alert
tag @s add hidden_chest
