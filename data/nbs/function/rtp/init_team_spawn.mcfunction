# สุ่มวาร์ปผู้เล่นคนแรกของทีม (@s) ไปในป่า แล้วบันทึกพิกัด X, Y, Z ของผู้เล่นลง storage ถาวร
function nbs:rtp/do_spread
$execute store result storage nbs:game team_spawn.t$(team).x int 1 run data get entity @s Pos[0]
$execute store result storage nbs:game team_spawn.t$(team).y int 1 run data get entity @s Pos[1]
$execute store result storage nbs:game team_spawn.t$(team).z int 1 run data get entity @s Pos[2]
