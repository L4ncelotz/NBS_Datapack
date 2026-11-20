# บันทึก Flag ของทีม บวกคะแนนทีม และประกาศความสำเร็จ
$data modify storage nbs:adv done.$(key).t$(team) set value 1b
$scoreboard players add #team_$(team) team_adv_pts $(pts)
$tellraw @a [{"text":"🏅 [Milestone] ","color":"gold","bold":true},{"text":"Team $(team) ","color":"aqua","bold":true},{"text":"พิชิตภารกิจ ","color":"gray"},{"text":"$(name)","color":"yellow","bold":true},{"text":"! (+$(pts) แต้ม)","color":"green"}]
playsound minecraft:ui.toast.challenge_complete master @a 0 64 0 0.8 1.1
