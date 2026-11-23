# ==========================================
# ติดแท็กชั่วคราวให้ผู้เล่นที่กดเช็กเพื่อส่งข้อความกลับถูกคน
# ==========================================
tag @s add checking_flag

# เก็บเลขทีมของคนกดเช็ก
scoreboard players operation #checker_team team_id = @s team_id

tellraw @s {"text":"=== พิกัดธงอาณาเขตของทีมคุณ ===","color":"gold","bold":true}

# สั่งให้หมุดธงทุกต้นที่อยู่ทีมเดียวกัน รันฟังก์ชันแปลงเลขและพิมพ์พิกัดของตัวเอง
execute as @e[type=minecraft:marker,tag=flag_anchor] if score @s team_id = #checker_team team_id run function nbs:territory/print_single_flag

# แสดงระยะห่างปัจจุบันจากธงที่ใกล้ที่สุด
execute if score @s flag_dist matches 1.. run tellraw @s ["",{"text":" • ระยะห่างจากธงที่ใกล้ที่สุด: ","color":"yellow"},{"score":{"name":"@s","objective":"flag_dist"},"color":"aqua","bold":true},{"text":" บล็อก","color":"yellow"}]
execute if score @s flag_dist matches 0 run tellraw @s {"text":" • คุณยืนอยู่ตรงจุดธงอาณาเขตพอดี (0 บล็อก)","color":"yellow"}

tag @s remove checking_flag
