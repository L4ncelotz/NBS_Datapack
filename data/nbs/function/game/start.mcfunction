# ==========================================
# คำสั่งเริ่มเกมสำหรับแอดมิน (/function nbs:game/start)
# ==========================================
scoreboard players set #game_state game_state 1
scoreboard players set #flash_timer rnd_temp 0
scoreboard players set #flash_cooldown rnd_temp 1800
bossbar set nbs:flash_quest visible false

# ล้างพิกัดจุดเกิดทีมเก่าและสถานะการวาร์ปเดิม เพื่อให้ทุกคนถูกสุ่มวาร์ปแยกตามทีมพร้อมกัน
kill @e[type=minecraft:marker,tag=team_spawn]
data remove storage nbs:game team_spawn
tag @a remove rtp_joined
tag @a remove just_died

# วาร์ปผู้เล่นทุกคนที่มีทีมแล้ว (team_id 1-8) ไปยังจุดเกิดทีมของตัวเอง
execute as @a[scores={team_id=1..8}] at @s run function nbs:rtp/join_team_spawn

# แจ้งเตือนผู้เล่นที่ยังไม่ได้เลือกทีม (team_id == 0)
execute as @a[scores={team_id=0}] run tellraw @s [{"text":"⚠️ [NBs SMP] ","color":"gold","bold":true},{"text":"เกมเริ่มแล้ว! กรุณาเปิดสมุดเลือกทีมเพื่อวาร์ปไปยังจุดเกิดของทีม","color":"yellow"}]

# แจ้งเตือนทั้งเซิร์ฟเวอร์
tellraw @a [{"text":"🚀 [NBs SMP] ","color":"gold","bold":true},{"text":"แอดมินได้เริ่มเกมแล้ว! สมาชิกแต่ละทีมถูกส่งไปยังจุดเกิดในป่าเรียบร้อย","color":"green"}]
playsound minecraft:ui.toast.challenge_complete master @a ~ ~ ~ 1 1
