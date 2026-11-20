# ==========================================
# คำสั่งเริ่มเกมสำหรับแอดมิน (/function nbs:game/start)
# ==========================================
scoreboard players set #game_state game_state 1

# ล้างหมุดจุดเกิดทีมเก่า (ถ้ามี)
kill @e[type=minecraft:marker,tag=team_spawn]

# ลบสมุดเลือกทีมออกจากทุกคน
clear @a minecraft:written_book[custom_data={team_book:1b}]

# วาร์ปผู้เล่นทุกคนที่มีทีมแล้ว (team_id 1-4) ไปยังจุดเกิดทีมของตัวเอง
execute as @a[scores={team_id=1..4}] at @s run function nbs:rtp/join_team_spawn

# แจ้งเตือนทั้งเซิร์ฟเวอร์
tellraw @a [{"text":"🚀 [NBs SMP] ","color":"gold","bold":true},{"text":"แอดมินได้เริ่มเกมแล้ว! สมาชิกแต่ละทีมถูกส่งไปยังจุดเกิดในป่าเรียบร้อย","color":"green"}]
playsound minecraft:ui.toast.challenge_complete master @a ~ ~ ~ 1 1
