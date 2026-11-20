# ตรวจว่าทีม $(team) มีพิกัดจุดเกิดใน storage หรือยัง ถ้ายังไม่มีให้สุ่มและบันทึกพิกัด X, Y, Z เก็บถาวร (ไม่หายแม้ Chunk Unload)
$execute unless data storage nbs:game team_spawn.t$(team) run summon minecraft:marker 0 100 0 {Tags:["new_team_spawn"]}
execute as @e[type=minecraft:marker,tag=new_team_spawn,limit=1] at @s run function nbs:rtp/do_spread
$execute if entity @e[type=minecraft:marker,tag=new_team_spawn] store result storage nbs:game team_spawn.t$(team).x int 1 run data get entity @e[type=minecraft:marker,tag=new_team_spawn,limit=1] Pos[0]
$execute if entity @e[type=minecraft:marker,tag=new_team_spawn] store result storage nbs:game team_spawn.t$(team).y int 1 run data get entity @e[type=minecraft:marker,tag=new_team_spawn,limit=1] Pos[1]
$execute if entity @e[type=minecraft:marker,tag=new_team_spawn] store result storage nbs:game team_spawn.t$(team).z int 1 run data get entity @e[type=minecraft:marker,tag=new_team_spawn,limit=1] Pos[2]
kill @e[type=minecraft:marker,tag=new_team_spawn]

# วาร์ปผู้เล่นไปยังพิกัดจุดเกิดของทีมตัวเอง
$function nbs:rtp/tp_coords with storage nbs:game team_spawn.t$(team)
