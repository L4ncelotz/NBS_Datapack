# ลบ/ปิดใช้งานทีมที่ระบุ ($(team)) ออกจากตารางคะแนน Sidebar และนำสมาชิกออกจากทีมนั้น (ล็อกต้องเหลืออย่างน้อย 1 ทีม)
$scoreboard players set #t$(team)_active game_state 0

# ตรวจสอบว่ายังเหลือทีมที่เปิดใช้งานอยู่อย่างน้อย 1 ทีมหรือไม่
scoreboard players set #remain_cnt rnd_temp 0
execute if score #t1_active game_state matches 1 run scoreboard players add #remain_cnt rnd_temp 1
execute if score #t2_active game_state matches 1 run scoreboard players add #remain_cnt rnd_temp 1
execute if score #t3_active game_state matches 1 run scoreboard players add #remain_cnt rnd_temp 1
execute if score #t4_active game_state matches 1 run scoreboard players add #remain_cnt rnd_temp 1
execute if score #t5_active game_state matches 1 run scoreboard players add #remain_cnt rnd_temp 1
execute if score #t6_active game_state matches 1 run scoreboard players add #remain_cnt rnd_temp 1
execute if score #t7_active game_state matches 1 run scoreboard players add #remain_cnt rnd_temp 1
execute if score #t8_active game_state matches 1 run scoreboard players add #remain_cnt rnd_temp 1

$execute if score #remain_cnt rnd_temp matches 0 run scoreboard players set #t$(team)_active game_state 1
execute if score #remain_cnt rnd_temp matches 0 run tellraw @s [{"text":"❌ [ระบบทีม] ","color":"red","bold":true},{"text":"ต้องเปิดใช้งานอย่างน้อย 1 ทีม ไม่สามารถปิดทีมสุดท้ายได้!","color":"yellow"}]

$execute if score #remain_cnt rnd_temp matches 1.. as @a[team=team_$(team)] run function nbs:team/kick_inactive_team
$execute if score #remain_cnt rnd_temp matches 1.. run scoreboard players reset ทีมที่_$(team) team_score
$execute if score #remain_cnt rnd_temp matches 1.. run team empty team_$(team)
$execute if score #remain_cnt rnd_temp matches 1.. run team join team_$(team) ทีมที่_$(team)
$execute if score #remain_cnt rnd_temp matches 1.. run tellraw @a [{"text":"➖ [ระบบทีม] ","color":"red","bold":true},{"text":"แอดมินได้ลบ/ปิดใช้งานทีมช่องที่ $(team) แล้ว","color":"yellow"}]
function nbs:team/admin_menu
