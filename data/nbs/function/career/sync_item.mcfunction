# ตรวจว่าสมาชิกในทีมมีไอเทม $(item) หรือไม่ (นับ 1 ครั้งต่อทีมในหมวด $(cat))
$execute unless data storage nbs:career done.$(key).t1 if items entity @a[scores={team_id=1}] container.* $(item) run function nbs:career/award_checklist {team:1,cat:"$(cat)",key:"$(key)",pts:$(pts),name:"$(name)"}
$execute unless data storage nbs:career done.$(key).t2 if items entity @a[scores={team_id=2}] container.* $(item) run function nbs:career/award_checklist {team:2,cat:"$(cat)",key:"$(key)",pts:$(pts),name:"$(name)"}
$execute unless data storage nbs:career done.$(key).t3 if items entity @a[scores={team_id=3}] container.* $(item) run function nbs:career/award_checklist {team:3,cat:"$(cat)",key:"$(key)",pts:$(pts),name:"$(name)"}
$execute unless data storage nbs:career done.$(key).t4 if items entity @a[scores={team_id=4}] container.* $(item) run function nbs:career/award_checklist {team:4,cat:"$(cat)",key:"$(key)",pts:$(pts),name:"$(name)"}
