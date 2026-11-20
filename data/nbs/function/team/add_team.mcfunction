# เปิดใช้งานช่องทีมถัดไปที่ยังว่างอยู่ (รองรับสูงสุด 8 ทีม)
scoreboard players set #added_team rnd_temp 0

execute if score #added_team rnd_temp matches 0 if score #t1_active game_state matches 0 run scoreboard players set #added_team rnd_temp 1
execute if score #added_team rnd_temp matches 0 if score #t2_active game_state matches 0 run scoreboard players set #added_team rnd_temp 2
execute if score #added_team rnd_temp matches 0 if score #t3_active game_state matches 0 run scoreboard players set #added_team rnd_temp 3
execute if score #added_team rnd_temp matches 0 if score #t4_active game_state matches 0 run scoreboard players set #added_team rnd_temp 4
execute if score #added_team rnd_temp matches 0 if score #t5_active game_state matches 0 run scoreboard players set #added_team rnd_temp 5
execute if score #added_team rnd_temp matches 0 if score #t6_active game_state matches 0 run scoreboard players set #added_team rnd_temp 6
execute if score #added_team rnd_temp matches 0 if score #t7_active game_state matches 0 run scoreboard players set #added_team rnd_temp 7
execute if score #added_team rnd_temp matches 0 if score #t8_active game_state matches 0 run scoreboard players set #added_team rnd_temp 8

execute if score #added_team rnd_temp matches 0 run tellraw @s [{"text":"❌ [ระบบทีม] ","color":"red","bold":true},{"text":"เปิดใช้งานครบสูงสุด 8 ทีมแล้ว!","color":"yellow"}]

execute if score #added_team rnd_temp matches 1 run scoreboard players set #t1_active game_state 1
execute if score #added_team rnd_temp matches 2 run scoreboard players set #t2_active game_state 1
execute if score #added_team rnd_temp matches 3 run scoreboard players set #t3_active game_state 1
execute if score #added_team rnd_temp matches 4 run scoreboard players set #t4_active game_state 1
execute if score #added_team rnd_temp matches 5 run scoreboard players set #t5_active game_state 1
execute if score #added_team rnd_temp matches 6 run scoreboard players set #t6_active game_state 1
execute if score #added_team rnd_temp matches 7 run scoreboard players set #t7_active game_state 1
execute if score #added_team rnd_temp matches 8 run scoreboard players set #t8_active game_state 1

execute if score #added_team rnd_temp matches 1.. run function nbs:team/refresh_all_styles
execute if score #added_team rnd_temp matches 1.. run tellraw @a [{"text":"➕ [ระบบทีม] ","color":"green","bold":true},{"text":"แอดมินได้เพิ่มทีมใหม่เข้าสู่ระบบแล้ว!","color":"yellow"}]
execute if score #added_team rnd_temp matches 1.. run function nbs:team/admin_menu
