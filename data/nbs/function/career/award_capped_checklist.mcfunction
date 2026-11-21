# บวกตัวนับโควตาหมวดที่มี Cap ต่อทีม แล้วให้รางวัลเช็กลิสต์
$scoreboard players add #t$(team)_$(cap_id) team_boss_cnt 1
$function nbs:career/award_checklist {team:$(team),cat:"$(cat)",key:"$(key)",pts:$(pts),name:"$(name)"}
