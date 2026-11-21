# ส่งเควสด่วน (Random Boost Quest) ที่ The Citadel
execute if score #flash_timer rnd_temp matches ..0 run tellraw @s [{"text":"❌ [เควสด่วน] ","color":"red","bold":true},{"text":"ขณะนี้ยังไม่มีเควสด่วนเปิดอยู่!","color":"yellow"}]
execute if score #flash_timer rnd_temp matches 1.. run data modify storage nbs:temp flash_ctx set from storage nbs:citadel flash
execute if score #flash_timer rnd_temp matches 1.. store result storage nbs:temp flash_ctx.team int 1 run scoreboard players get @s team_id
execute if score #flash_timer rnd_temp matches 1.. run function nbs:citadel/try_flash_quest with storage nbs:temp flash_ctx
