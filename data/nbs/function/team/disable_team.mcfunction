# ลบ/ปิดใช้งานทีมที่ระบุ ($(team)) ออกจากตารางคะแนน Sidebar และนำสมาชิกออกจากทีมนั้น
$scoreboard players set #t$(team)_active game_state 0
$scoreboard players reset ทีมที่_$(team) team_score
$team empty team_$(team)
$team join team_$(team) ทีมที่_$(team)
$tellraw @a [{"text":"➖ [ระบบทีม] ","color":"red","bold":true},{"text":"แอดมินได้ลบ/ปิดใช้งานทีมช่องที่ $(team) แล้ว","color":"yellow"}]
function nbs:team/admin_menu
