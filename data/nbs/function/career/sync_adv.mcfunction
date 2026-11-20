# ตรวจแต่ละทีมว่าปลดล็อก Advancement $(adv) แล้วหรือยัง (ถ้ายังและมีสมาชิกทำสำเร็จ ให้บวกคะแนน 1 ครั้งต่อทีม)
$execute unless data storage nbs:adv done.$(key).t1 if entity @a[scores={team_id=1},advancements={$(adv)=true}] run function nbs:career/award_team_adv {team:1,key:"$(key)",pts:$(pts),name:"$(name)"}
$execute unless data storage nbs:adv done.$(key).t2 if entity @a[scores={team_id=2},advancements={$(adv)=true}] run function nbs:career/award_team_adv {team:2,key:"$(key)",pts:$(pts),name:"$(name)"}
$execute unless data storage nbs:adv done.$(key).t3 if entity @a[scores={team_id=3},advancements={$(adv)=true}] run function nbs:career/award_team_adv {team:3,key:"$(key)",pts:$(pts),name:"$(name)"}
$execute unless data storage nbs:adv done.$(key).t4 if entity @a[scores={team_id=4},advancements={$(adv)=true}] run function nbs:career/award_team_adv {team:4,key:"$(key)",pts:$(pts),name:"$(name)"}
