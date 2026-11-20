# ==========================================
# คำสั่งรีเซ็ตเกมกลับสู่ Lobby สำหรับแอดมิน (/function nbs:game/reset)
# ==========================================
scoreboard players set #game_state game_state 0
kill @e[type=minecraft:marker,tag=team_spawn]
tag @a remove rtp_joined
tag @a remove just_died

# วาร์ปผู้เล่นทุกคนกลับจุด Spawn / Lobby
execute at @e[tag=spawn_anchor,limit=1] run tp @a ~ ~ ~
tellraw @a [{"text":"↺ [NBs SMP] ","color":"yellow","bold":true},{"text":"รีเซ็ตกลับสู่หน้า Lobby แล้ว กรุณาเปิดสมุดเพื่อเลือกทีมใหม่!","color":"gray"}]
