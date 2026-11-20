# เปลี่ยนชื่อทีม: /function nbs:team/rename {team:1,name:"ชื่อทีมใหม่"}
$data modify storage nbs:team t$(team).name set value "$(name)"
$function nbs:team/apply_style with storage nbs:team t$(team)
$tellraw @a [{"text":"⚙️ [ระบบทีม] ","color":"gold","bold":true},{"text":"เปลี่ยนชื่อทีมที่ $(team) เป็น ","color":"gray"},{"text":"$(name)","color":"yellow","bold":true},{"text":" เรียบร้อยแล้ว!","color":"green"}]
function nbs:team/admin_menu
