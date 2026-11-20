# ==========================================
# คำสั่งเริ่มเกมสำหรับแอดมิน (/function nbs:game/start)
# ==========================================
scoreboard players set #game_state game_state 1
scoreboard players set #flash_timer rnd_temp 0
scoreboard players set #flash_cooldown rnd_temp 1800
bossbar set nbs:flash_quest visible false

# ล้างหมุดจุดเกิดทีมเก่า (ถ้ามี)
kill @e[type=minecraft:marker,tag=team_spawn]

# วาร์ปผู้เล่นทุกคนที่มีทีมแล้ว (team_id 1-4) ไปยังจุดเกิดทีมของตัวเอง
execute as @a[tag=!rtp_joined,scores={team_id=1..4}] at @s run function nbs:rtp/join_team_spawn

# แจ้งเตือนทั้งเซิร์ฟเวอร์
tellraw @a [{"text":"🚀 [NBs SMP] ","color":"gold","bold":true},{"text":"แอดมินได้เริ่มเกมแล้ว! สมาชิกแต่ละทีมถูกส่งไปยังจุดเกิดในป่าเรียบร้อย","color":"green"}]
playsound minecraft:ui.toast.challenge_complete master @a ~ ~ ~ 1 1
