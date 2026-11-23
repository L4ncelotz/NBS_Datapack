# เปลี่ยนสีทีม: /function nbs:team/set_color {team:1,color:"red"}
$data modify storage nbs:team t$(team).color set value "$(color)"
$function nbs:team/apply_style with storage nbs:team t$(team)
$tellraw @a [{"text":"🎨 [ระบบทีม] ","color":"gold","bold":true},{"text":"เปลี่ยนสีของทีมที่ $(team) เป็นสี ","color":"gray"},{"text":"$(color)","color":"$(color)","bold":true},{"text":" เรียบร้อยแล้ว!","color":"green"}]
function nbs:team/admin_menu
