# ==========================================
# คำนวณระยะห่างระหว่างผู้เล่น (@s) กับธงอาณาเขตของทีมตนเอง
# ==========================================

# คัดลอกเลขทีมของผู้เล่นไว้ในตัวแปรชั่วคราว
scoreboard players operation #player_team team_id = @s team_id

# รีเซ็ตตัวแปรคำนวณ
scoreboard players set #min_dist_sq flag_dist 2147483647
scoreboard players set #has_flag flag_dist 0
scoreboard players set #is_in_territory flag_dist 0

# ดึงพิกัดปัจจุบันของผู้เล่น (แปลงเป็นจำนวนเต็ม)
execute store result score #player_x flag_dist run data get entity @s Pos[0]
execute store result score #player_y flag_dist run data get entity @s Pos[1]
execute store result score #player_z flag_dist run data get entity @s Pos[2]

# สั่งให้หมุดธงทุกต้นของทีมเดียวกันคำนวณระยะห่าง
execute as @e[type=minecraft:marker,tag=flag_anchor] if score @s team_id = #player_team team_id run function nbs:territory/calc_single_flag_dist

# กรณีทีมนี้ยังไม่มีการปักธงอาณาเขตในโลก (ไม่มีธงให้เทียบระยะ)
execute if score #has_flag flag_dist matches 0 run tag @s remove in_own_territory
execute if score #has_flag flag_dist matches 0 run scoreboard players set @s flag_dist 0
execute if score #has_flag flag_dist matches 0 run return 0

# หากมีธงของทีมอยู่ในโลก ให้ถอดรากที่สองเพื่อหาระยะห่างจริงเป็นบล็อก
function nbs:territory/calc_sqrt

# บันทึกระยะห่างลงในตัวผู้เล่น
scoreboard players operation @s flag_dist = #dist flag_dist

# ==========================================
# ตรวจจับการก้าวข้ามเส้นเขตธง (32 บล็อก)
# ==========================================

# 1. จังหวะเดินหลุดออกจากอาณาเขต (เดิมอยู่ในเขต แต่ตอนนี้อยู่นอกระยะ 32 บล็อก)
execute if score #is_in_territory flag_dist matches 0 if entity @s[tag=in_own_territory] run function nbs:territory/on_exit_territory

# 2. จังหวะเดินกลับเข้าสู่อาณาเขต (เดิมอยู่นอกเขต แต่ตอนนี้ก้าวเข้าสู่ระยะ 32 บล็อก)
execute if score #is_in_territory flag_dist matches 1 unless entity @s[tag=in_own_territory] run function nbs:territory/on_enter_territory
