# เตรียมข้อมูลทีมและหมายเลขเควสส่งให้ Macro ตรวจสอบ
execute store result storage nbs:temp ctx.team int 1 run scoreboard players get @s team_id
execute store result storage nbs:temp ctx.q int 1 run scoreboard players get @s citadel
function nbs:citadel/run_quest with storage nbs:temp ctx
