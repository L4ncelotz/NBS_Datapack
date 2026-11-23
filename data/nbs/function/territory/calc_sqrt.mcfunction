# ==========================================
# คำนวณ Square Root ของ #min_dist_sq โดยวิธี Binary Search (10 บิต = รองรับ 0 ถึง 1,023 บล็อก)
# ผลลัพธ์เก็บใน #dist flag_dist
# ==========================================

scoreboard players set #dist flag_dist 0

# Bit 512 (512^2 = 262,144)
scoreboard players operation #temp flag_dist = #dist flag_dist
scoreboard players add #temp flag_dist 512
scoreboard players operation #temp_sq flag_dist = #temp flag_dist
scoreboard players operation #temp_sq flag_dist *= #temp flag_dist
execute if score #temp_sq flag_dist <= #min_dist_sq flag_dist run scoreboard players add #dist flag_dist 512

# Bit 256 (256^2 = 65,536)
scoreboard players operation #temp flag_dist = #dist flag_dist
scoreboard players add #temp flag_dist 256
scoreboard players operation #temp_sq flag_dist = #temp flag_dist
scoreboard players operation #temp_sq flag_dist *= #temp flag_dist
execute if score #temp_sq flag_dist <= #min_dist_sq flag_dist run scoreboard players add #dist flag_dist 256

# Bit 128 (128^2 = 16,384)
scoreboard players operation #temp flag_dist = #dist flag_dist
scoreboard players add #temp flag_dist 128
scoreboard players operation #temp_sq flag_dist = #temp flag_dist
scoreboard players operation #temp_sq flag_dist *= #temp flag_dist
execute if score #temp_sq flag_dist <= #min_dist_sq flag_dist run scoreboard players add #dist flag_dist 128

# Bit 64 (64^2 = 4,096)
scoreboard players operation #temp flag_dist = #dist flag_dist
scoreboard players add #temp flag_dist 64
scoreboard players operation #temp_sq flag_dist = #temp flag_dist
scoreboard players operation #temp_sq flag_dist *= #temp flag_dist
execute if score #temp_sq flag_dist <= #min_dist_sq flag_dist run scoreboard players add #dist flag_dist 64

# Bit 32 (32^2 = 1,024)
scoreboard players operation #temp flag_dist = #dist flag_dist
scoreboard players add #temp flag_dist 32
scoreboard players operation #temp_sq flag_dist = #temp flag_dist
scoreboard players operation #temp_sq flag_dist *= #temp flag_dist
execute if score #temp_sq flag_dist <= #min_dist_sq flag_dist run scoreboard players add #dist flag_dist 32

# Bit 16 (16^2 = 256)
scoreboard players operation #temp flag_dist = #dist flag_dist
scoreboard players add #temp flag_dist 16
scoreboard players operation #temp_sq flag_dist = #temp flag_dist
scoreboard players operation #temp_sq flag_dist *= #temp flag_dist
execute if score #temp_sq flag_dist <= #min_dist_sq flag_dist run scoreboard players add #dist flag_dist 16

# Bit 8 (8^2 = 64)
scoreboard players operation #temp flag_dist = #dist flag_dist
scoreboard players add #temp flag_dist 8
scoreboard players operation #temp_sq flag_dist = #temp flag_dist
scoreboard players operation #temp_sq flag_dist *= #temp flag_dist
execute if score #temp_sq flag_dist <= #min_dist_sq flag_dist run scoreboard players add #dist flag_dist 8

# Bit 4 (4^2 = 16)
scoreboard players operation #temp flag_dist = #dist flag_dist
scoreboard players add #temp flag_dist 4
scoreboard players operation #temp_sq flag_dist = #temp flag_dist
scoreboard players operation #temp_sq flag_dist *= #temp flag_dist
execute if score #temp_sq flag_dist <= #min_dist_sq flag_dist run scoreboard players add #dist flag_dist 4

# Bit 2 (2^2 = 4)
scoreboard players operation #temp flag_dist = #dist flag_dist
scoreboard players add #temp flag_dist 2
scoreboard players operation #temp_sq flag_dist = #temp flag_dist
scoreboard players operation #temp_sq flag_dist *= #temp flag_dist
execute if score #temp_sq flag_dist <= #min_dist_sq flag_dist run scoreboard players add #dist flag_dist 2

# Bit 1 (1^2 = 1)
scoreboard players operation #temp flag_dist = #dist flag_dist
scoreboard players add #temp flag_dist 1
scoreboard players operation #temp_sq flag_dist = #temp flag_dist
scoreboard players operation #temp_sq flag_dist *= #temp flag_dist
execute if score #temp_sq flag_dist <= #min_dist_sq flag_dist run scoreboard players add #dist flag_dist 1
