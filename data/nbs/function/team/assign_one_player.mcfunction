# เลือกทีมที่เปิดใช้งานอยู่ที่มีจำนวนสมาชิกน้อยที่สุดให้ผู้เล่นคนนี้ (@s)
scoreboard players set #cnt_1 rnd_temp 999999
scoreboard players set #cnt_2 rnd_temp 999999
scoreboard players set #cnt_3 rnd_temp 999999
scoreboard players set #cnt_4 rnd_temp 999999
scoreboard players set #cnt_5 rnd_temp 999999
scoreboard players set #cnt_6 rnd_temp 999999
scoreboard players set #cnt_7 rnd_temp 999999
scoreboard players set #cnt_8 rnd_temp 999999

execute if score #t1_active game_state matches 1 run scoreboard players set #cnt_1 rnd_temp 0
execute if score #t2_active game_state matches 1 run scoreboard players set #cnt_2 rnd_temp 0
execute if score #t3_active game_state matches 1 run scoreboard players set #cnt_3 rnd_temp 0
execute if score #t4_active game_state matches 1 run scoreboard players set #cnt_4 rnd_temp 0
execute if score #t5_active game_state matches 1 run scoreboard players set #cnt_5 rnd_temp 0
execute if score #t6_active game_state matches 1 run scoreboard players set #cnt_6 rnd_temp 0
execute if score #t7_active game_state matches 1 run scoreboard players set #cnt_7 rnd_temp 0
execute if score #t8_active game_state matches 1 run scoreboard players set #cnt_8 rnd_temp 0

execute if score #t1_active game_state matches 1 as @a[gamemode=!spectator,scores={team_id=1}] run scoreboard players add #cnt_1 rnd_temp 1
execute if score #t2_active game_state matches 1 as @a[gamemode=!spectator,scores={team_id=2}] run scoreboard players add #cnt_2 rnd_temp 1
execute if score #t3_active game_state matches 1 as @a[gamemode=!spectator,scores={team_id=3}] run scoreboard players add #cnt_3 rnd_temp 1
execute if score #t4_active game_state matches 1 as @a[gamemode=!spectator,scores={team_id=4}] run scoreboard players add #cnt_4 rnd_temp 1
execute if score #t5_active game_state matches 1 as @a[gamemode=!spectator,scores={team_id=5}] run scoreboard players add #cnt_5 rnd_temp 1
execute if score #t6_active game_state matches 1 as @a[gamemode=!spectator,scores={team_id=6}] run scoreboard players add #cnt_6 rnd_temp 1
execute if score #t7_active game_state matches 1 as @a[gamemode=!spectator,scores={team_id=7}] run scoreboard players add #cnt_7 rnd_temp 1
execute if score #t8_active game_state matches 1 as @a[gamemode=!spectator,scores={team_id=8}] run scoreboard players add #cnt_8 rnd_temp 1

scoreboard players set #min_cnt rnd_temp 999999
scoreboard players operation #min_cnt rnd_temp < #cnt_1 rnd_temp
scoreboard players operation #min_cnt rnd_temp < #cnt_2 rnd_temp
scoreboard players operation #min_cnt rnd_temp < #cnt_3 rnd_temp
scoreboard players operation #min_cnt rnd_temp < #cnt_4 rnd_temp
scoreboard players operation #min_cnt rnd_temp < #cnt_5 rnd_temp
scoreboard players operation #min_cnt rnd_temp < #cnt_6 rnd_temp
scoreboard players operation #min_cnt rnd_temp < #cnt_7 rnd_temp
scoreboard players operation #min_cnt rnd_temp < #cnt_8 rnd_temp

scoreboard players set #picked_team rnd_temp 0
execute if score #picked_team rnd_temp matches 0 if score #t1_active game_state matches 1 if score #cnt_1 rnd_temp = #min_cnt rnd_temp run scoreboard players set #picked_team rnd_temp 1
execute if score #picked_team rnd_temp matches 0 if score #t2_active game_state matches 1 if score #cnt_2 rnd_temp = #min_cnt rnd_temp run scoreboard players set #picked_team rnd_temp 2
execute if score #picked_team rnd_temp matches 0 if score #t3_active game_state matches 1 if score #cnt_3 rnd_temp = #min_cnt rnd_temp run scoreboard players set #picked_team rnd_temp 3
execute if score #picked_team rnd_temp matches 0 if score #t4_active game_state matches 1 if score #cnt_4 rnd_temp = #min_cnt rnd_temp run scoreboard players set #picked_team rnd_temp 4
execute if score #picked_team rnd_temp matches 0 if score #t5_active game_state matches 1 if score #cnt_5 rnd_temp = #min_cnt rnd_temp run scoreboard players set #picked_team rnd_temp 5
execute if score #picked_team rnd_temp matches 0 if score #t6_active game_state matches 1 if score #cnt_6 rnd_temp = #min_cnt rnd_temp run scoreboard players set #picked_team rnd_temp 6
execute if score #picked_team rnd_temp matches 0 if score #t7_active game_state matches 1 if score #cnt_7 rnd_temp = #min_cnt rnd_temp run scoreboard players set #picked_team rnd_temp 7
execute if score #picked_team rnd_temp matches 0 if score #t8_active game_state matches 1 if score #cnt_8 rnd_temp = #min_cnt rnd_temp run scoreboard players set #picked_team rnd_temp 8

execute if score #picked_team rnd_temp matches 1 run scoreboard players set @s team_id 1
execute if score #picked_team rnd_temp matches 2 run scoreboard players set @s team_id 2
execute if score #picked_team rnd_temp matches 3 run scoreboard players set @s team_id 3
execute if score #picked_team rnd_temp matches 4 run scoreboard players set @s team_id 4
execute if score #picked_team rnd_temp matches 5 run scoreboard players set @s team_id 5
execute if score #picked_team rnd_temp matches 6 run scoreboard players set @s team_id 6
execute if score #picked_team rnd_temp matches 7 run scoreboard players set @s team_id 7
execute if score #picked_team rnd_temp matches 8 run scoreboard players set @s team_id 8

execute if score #picked_team rnd_temp matches 1 run function nbs:team/do_join_team with storage nbs:team t1
execute if score #picked_team rnd_temp matches 2 run function nbs:team/do_join_team with storage nbs:team t2
execute if score #picked_team rnd_temp matches 3 run function nbs:team/do_join_team with storage nbs:team t3
execute if score #picked_team rnd_temp matches 4 run function nbs:team/do_join_team with storage nbs:team t4
execute if score #picked_team rnd_temp matches 5 run function nbs:team/do_join_team with storage nbs:team t5
execute if score #picked_team rnd_temp matches 6 run function nbs:team/do_join_team with storage nbs:team t6
execute if score #picked_team rnd_temp matches 7 run function nbs:team/do_join_team with storage nbs:team t7
execute if score #picked_team rnd_temp matches 8 run function nbs:team/do_join_team with storage nbs:team t8

execute if score #picked_team rnd_temp matches 1..8 run scoreboard players add #assigned_cnt rnd_temp 1
