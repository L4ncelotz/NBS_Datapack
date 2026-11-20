# ตรวจว่าทีม $(team) ส่งเควสด่วนรอบนี้ไปแล้วหรือยัง
$execute if data storage nbs:citadel flash_done.t$(team) run tellraw @s [{"text":"❌ [เควสด่วน] ","color":"red","bold":true},{"text":"ทีมของคุณส่งเควสด่วนรอบนี้ไปแล้ว!","color":"yellow"}]
$execute unless data storage nbs:citadel flash_done.t$(team) run function nbs:citadel/do_flash_quest {team:$(team),item:"$(item)",count:$(count),name:"$(name)"}
