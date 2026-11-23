# ตรวจจำนวนไอเทม หักไอเทม และจ่ายแต้ม (+35 ทีมแรก / +25 ทีมถัดไป)
$execute store result score #have_fq item_count run clear @s $(item) 0
scoreboard players set #fq_ok item_count 0
$execute if score #have_fq item_count matches $(count).. run scoreboard players set #fq_ok item_count 1
$execute if score #fq_ok item_count matches 0 run tellraw @s [{"text":"❌ [เควสด่วน] ","color":"red","bold":true},{"text":"ไอเทมไม่ครบ! ต้องการ $(name)","color":"yellow"}]

$execute if score #fq_ok item_count matches 1 run clear @s $(item) $(count)
$execute if score #fq_ok item_count matches 1 run data modify storage nbs:citadel flash_done.t$(team) set value 1b

scoreboard players set #was_first item_count 0
execute if score #fq_ok item_count matches 1 if score #flash_first rnd_temp matches 0 run scoreboard players set #was_first item_count 1

$execute if score #fq_ok item_count matches 1 if score #was_first item_count matches 1 run function nbs:citadel/reward_flash_first {team:$(team),name:"$(name)"}
$execute if score #fq_ok item_count matches 1 if score #was_first item_count matches 0 run function nbs:citadel/reward_flash_normal {team:$(team),name:"$(name)"}
