# ตรวจสอบว่าทีมที่ผู้เล่นกดเลือก (1-8) เปิดใช้งานอยู่หรือไม่
execute if score @s join_team matches 1 if score #t1_active game_state matches 0 run tellraw @s [{"text":"❌ [ระบบทีม] ","color":"red","bold":true},{"text":"ทีมที่ 1 ถูกปิดใช้งานอยู่!","color":"yellow"}]
execute if score @s join_team matches 2 if score #t2_active game_state matches 0 run tellraw @s [{"text":"❌ [ระบบทีม] ","color":"red","bold":true},{"text":"ทีมที่ 2 ถูกปิดใช้งานอยู่!","color":"yellow"}]
execute if score @s join_team matches 3 if score #t3_active game_state matches 0 run tellraw @s [{"text":"❌ [ระบบทีม] ","color":"red","bold":true},{"text":"ทีมที่ 3 ถูกปิดใช้งานอยู่!","color":"yellow"}]
execute if score @s join_team matches 4 if score #t4_active game_state matches 0 run tellraw @s [{"text":"❌ [ระบบทีม] ","color":"red","bold":true},{"text":"ทีมที่ 4 ถูกปิดใช้งานอยู่!","color":"yellow"}]
execute if score @s join_team matches 5 if score #t5_active game_state matches 0 run tellraw @s [{"text":"❌ [ระบบทีม] ","color":"red","bold":true},{"text":"ทีมที่ 5 ถูกปิดใช้งานอยู่!","color":"yellow"}]
execute if score @s join_team matches 6 if score #t6_active game_state matches 0 run tellraw @s [{"text":"❌ [ระบบทีม] ","color":"red","bold":true},{"text":"ทีมที่ 6 ถูกปิดใช้งานอยู่!","color":"yellow"}]
execute if score @s join_team matches 7 if score #t7_active game_state matches 0 run tellraw @s [{"text":"❌ [ระบบทีม] ","color":"red","bold":true},{"text":"ทีมที่ 7 ถูกปิดใช้งานอยู่!","color":"yellow"}]
execute if score @s join_team matches 8 if score #t8_active game_state matches 0 run tellraw @s [{"text":"❌ [ระบบทีม] ","color":"red","bold":true},{"text":"ทีมที่ 8 ถูกปิดใช้งานอยู่!","color":"yellow"}]

execute if score @s join_team matches 1 if score #t1_active game_state matches 1 run function nbs:team/do_join_team with storage nbs:team t1
execute if score @s join_team matches 2 if score #t2_active game_state matches 1 run function nbs:team/do_join_team with storage nbs:team t2
execute if score @s join_team matches 3 if score #t3_active game_state matches 1 run function nbs:team/do_join_team with storage nbs:team t3
execute if score @s join_team matches 4 if score #t4_active game_state matches 1 run function nbs:team/do_join_team with storage nbs:team t4
execute if score @s join_team matches 5 if score #t5_active game_state matches 1 run function nbs:team/do_join_team with storage nbs:team t5
execute if score @s join_team matches 6 if score #t6_active game_state matches 1 run function nbs:team/do_join_team with storage nbs:team t6
execute if score @s join_team matches 7 if score #t7_active game_state matches 1 run function nbs:team/do_join_team with storage nbs:team t7
execute if score @s join_team matches 8 if score #t8_active game_state matches 1 run function nbs:team/do_join_team with storage nbs:team t8
