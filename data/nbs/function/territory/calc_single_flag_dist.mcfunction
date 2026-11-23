# ==========================================
# คำนวณระยะห่างระหว่างหมุดธงนี้ (@s) กับผู้เล่น
# ==========================================

# บันทึกว่าทีมมีธงอยู่ในโลกจริง
scoreboard players set #has_flag flag_dist 1

# คำนวณผลต่างพิกัดแกน X, Y, Z
scoreboard players operation #dx flag_dist = #player_x flag_dist
scoreboard players operation #dx flag_dist -= @s flag_x
scoreboard players operation #dy flag_dist = #player_y flag_dist
scoreboard players operation #dy flag_dist -= @s flag_y
scoreboard players operation #dz flag_dist = #player_z flag_dist
scoreboard players operation #dz flag_dist -= @s flag_z

# คำนวณกำลังสองของแต่ละแกน
scoreboard players operation #dx flag_dist *= #dx flag_dist
scoreboard players operation #dy flag_dist *= #dy flag_dist
scoreboard players operation #dz flag_dist *= #dz flag_dist

# รวมเป็นระยะทางกำลังสองแบบ 3 มิติ (3D Distance Squared)
scoreboard players operation #dist_sq flag_dist = #dx flag_dist
scoreboard players operation #dist_sq flag_dist += #dy flag_dist
scoreboard players operation #dist_sq flag_dist += #dz flag_dist

# บันทึกระยะห่างกำลังสองของธงที่ใกล้ตัวผู้เล่นที่สุด
execute if score #dist_sq flag_dist < #min_dist_sq flag_dist run scoreboard players operation #min_dist_sq flag_dist = #dist_sq flag_dist

# ตรวจสอบว่าผู้เล่นอยู่ในรัศมี 32 บล็อกของธงนี้หรือไม่ (32^2 = 1024)
execute if score #dist_sq flag_dist matches ..1024 run scoreboard players set #is_in_territory flag_dist 1
