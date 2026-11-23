# ตั้งค่าและเปิดใช้งาน Random Boost Quest ปัจจุบัน (รองรับทั้งตัวสุ่มในเกมและ RCON/AI ในอนาคต)
$data modify storage nbs:citadel flash set value {item:"$(item)",count:$(count),name:"$(name)",pts:25,bonus:10}
data remove storage nbs:citadel flash_done
scoreboard players set #flash_timer rnd_temp 86400
scoreboard players set #flash_first rnd_temp 0
scoreboard players set #flash_cooldown rnd_temp 1

$bossbar set nbs:flash_quest name {"text":"⚡ [เควสด่วน +25/+35] ส่ง $(name) ที่ The Citadel!","color":"gold","bold":true}
bossbar set nbs:flash_quest max 86400
bossbar set nbs:flash_quest value 86400
bossbar set nbs:flash_quest visible true
bossbar set nbs:flash_quest players @a

$tellraw @a [{"text":"⚡ [เควสด่วนมาแล้ว!] ","color":"gold","bold":true},{"text":"ส่ง ","color":"gray"},{"text":"$(name)","color":"yellow","bold":true},{"text":" ที่ The Citadel (0,0) ภายใน 24 ชั่วโมง (1 วัน)! (ทีมแรกรับ +35 แต้ม | ทีมถัดไป +25 แต้ม)","color":"green"}]
playsound minecraft:entity.ender_dragon.growl master @a 0 64 0 0.6 1.2
