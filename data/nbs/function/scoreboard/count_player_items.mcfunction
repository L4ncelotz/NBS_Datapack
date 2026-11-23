# ==========================================
# นับไอเทมชิงชัยในตัวผู้เล่น @s เข้าคะแนนทีม
# (Dragon Egg, Nether Star, ป้ายชื่อคะแนน PvP)
# ==========================================

# 1. นับไข่มังกร (ฟองละ 150 แต้ม)
scoreboard players set #egg_in_inv item_count 0
execute store result score #egg_in_inv item_count run clear @s minecraft:dragon_egg 0
scoreboard players set #val item_value 150
execute if score #egg_in_inv item_count matches 1.. run scoreboard players operation #egg_in_inv item_count *= #val item_value

execute if score @s team_id matches 1 if score #egg_in_inv item_count matches 1.. run scoreboard players operation ทีมที่_1 team_score += #egg_in_inv item_count
execute if score @s team_id matches 2 if score #egg_in_inv item_count matches 1.. run scoreboard players operation ทีมที่_2 team_score += #egg_in_inv item_count
execute if score @s team_id matches 3 if score #egg_in_inv item_count matches 1.. run scoreboard players operation ทีมที่_3 team_score += #egg_in_inv item_count
execute if score @s team_id matches 4 if score #egg_in_inv item_count matches 1.. run scoreboard players operation ทีมที่_4 team_score += #egg_in_inv item_count
execute if score @s team_id matches 5 if score #egg_in_inv item_count matches 1.. run scoreboard players operation ทีมที่_5 team_score += #egg_in_inv item_count
execute if score @s team_id matches 6 if score #egg_in_inv item_count matches 1.. run scoreboard players operation ทีมที่_6 team_score += #egg_in_inv item_count
execute if score @s team_id matches 7 if score #egg_in_inv item_count matches 1.. run scoreboard players operation ทีมที่_7 team_score += #egg_in_inv item_count
execute if score @s team_id matches 8 if score #egg_in_inv item_count matches 1.. run scoreboard players operation ทีมที่_8 team_score += #egg_in_inv item_count

# 2. นับป้ายชื่อคะแนน (ชิ้นละ 15 แต้ม — เฉพาะป้ายชื่อที่มี score_tag:1b)
scoreboard players set #nametag_in_inv item_count 0
execute store result score #nametag_in_inv item_count run clear @s minecraft:name_tag[custom_data={score_tag:1b}] 0
scoreboard players set #val item_value 15
execute if score #nametag_in_inv item_count matches 1.. run scoreboard players operation #nametag_in_inv item_count *= #val item_value

execute if score @s team_id matches 1 if score #nametag_in_inv item_count matches 1.. run scoreboard players operation ทีมที่_1 team_score += #nametag_in_inv item_count
execute if score @s team_id matches 2 if score #nametag_in_inv item_count matches 1.. run scoreboard players operation ทีมที่_2 team_score += #nametag_in_inv item_count
execute if score @s team_id matches 3 if score #nametag_in_inv item_count matches 1.. run scoreboard players operation ทีมที่_3 team_score += #nametag_in_inv item_count
execute if score @s team_id matches 4 if score #nametag_in_inv item_count matches 1.. run scoreboard players operation ทีมที่_4 team_score += #nametag_in_inv item_count
execute if score @s team_id matches 5 if score #nametag_in_inv item_count matches 1.. run scoreboard players operation ทีมที่_5 team_score += #nametag_in_inv item_count
execute if score @s team_id matches 6 if score #nametag_in_inv item_count matches 1.. run scoreboard players operation ทีมที่_6 team_score += #nametag_in_inv item_count
execute if score @s team_id matches 7 if score #nametag_in_inv item_count matches 1.. run scoreboard players operation ทีมที่_7 team_score += #nametag_in_inv item_count
execute if score @s team_id matches 8 if score #nametag_in_inv item_count matches 1.. run scoreboard players operation ทีมที่_8 team_score += #nametag_in_inv item_count

# 3. รวมจำนวน Nether Star เข้าตัวแปรทีม (ล็อก Cap 5 ดวงใน calc_team_total)
scoreboard players set #star_in_inv item_count 0
execute store result score #star_in_inv item_count run clear @s minecraft:nether_star 0

execute if score @s team_id matches 1 if score #star_in_inv item_count matches 1.. run scoreboard players operation #t1_star team_boss_cnt += #star_in_inv item_count
execute if score @s team_id matches 2 if score #star_in_inv item_count matches 1.. run scoreboard players operation #t2_star team_boss_cnt += #star_in_inv item_count
execute if score @s team_id matches 3 if score #star_in_inv item_count matches 1.. run scoreboard players operation #t3_star team_boss_cnt += #star_in_inv item_count
execute if score @s team_id matches 4 if score #star_in_inv item_count matches 1.. run scoreboard players operation #t4_star team_boss_cnt += #star_in_inv item_count
execute if score @s team_id matches 5 if score #star_in_inv item_count matches 1.. run scoreboard players operation #t5_star team_boss_cnt += #star_in_inv item_count
execute if score @s team_id matches 6 if score #star_in_inv item_count matches 1.. run scoreboard players operation #t6_star team_boss_cnt += #star_in_inv item_count
execute if score @s team_id matches 7 if score #star_in_inv item_count matches 1.. run scoreboard players operation #t7_star team_boss_cnt += #star_in_inv item_count
execute if score @s team_id matches 8 if score #star_in_inv item_count matches 1.. run scoreboard players operation #t8_star team_boss_cnt += #star_in_inv item_count
