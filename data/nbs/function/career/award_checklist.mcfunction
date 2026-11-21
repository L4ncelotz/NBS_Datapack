# บันทึก Flag ของทีม บวกคะแนนเช็กลิสต์อาชีพ และประกาศในแชต
$data modify storage nbs:career done.$(key).t$(team) set value 1b
$scoreboard players add #team_$(team) team_career_pts $(pts)
$scoreboard players add #t$(team)_c_$(cat) team_career_pts $(pts)
$tellraw @a [{"text":"📋 [เช็กลิสต์อาชีพ] ","color":"green","bold":true},{"text":"Team $(team) ","color":"aqua","bold":true},{"text":"ปลดล็อก ","color":"gray"},{"text":"$(name)","color":"yellow","bold":true},{"text":"! (+$(pts) แต้ม)","color":"green"}]
playsound minecraft:entity.experience_orb.pickup master @a 0 64 0 0.7 1.3
