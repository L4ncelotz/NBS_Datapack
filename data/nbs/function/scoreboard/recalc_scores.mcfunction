# รีเซ็ตตัวนับรอบเป็น 0
scoreboard players set #score_tick rnd_temp 0

# ==========================================
# 1. รีเซ็ตคะแนนทีมและตัวนับ Nether Star (ของชิงชัยนับเฉพาะในกล่องในเขตธงอาณาเขต 32 บล็อกเท่านั้น!)
# ==========================================
scoreboard players set @a player_score 0
scoreboard players set #t1_star team_boss_cnt 0
scoreboard players set #t2_star team_boss_cnt 0
scoreboard players set #t3_star team_boss_cnt 0
scoreboard players set #t4_star team_boss_cnt 0

scoreboard players set ทีมที่_1 team_score 0
scoreboard players set ทีมที่_2 team_score 0
scoreboard players set ทีมที่_3 team_score 0
scoreboard players set ทีมที่_4 team_score 0

# 2.1 คะแนนของชิงชัยจากกล่องทุกใบที่อยู่ในรัศมีธงอาณาเขต (32 บล็อก) เท่านั้น (ป้องกันการถือของติดตัวแล้ว Log off หนี)
execute as @e[type=minecraft:marker,tag=chest_anchor] at @s run function nbs:scoreboard/count_single_chest

# 2.3 คะแนน Nether Star (30 แต้ม/ดวง, ล็อก Cap สูงสุด 5 ดวง/ทีม = 150 แต้ม)
execute if score #t1_star team_boss_cnt matches 6.. run scoreboard players set #t1_star team_boss_cnt 5
execute if score #t2_star team_boss_cnt matches 6.. run scoreboard players set #t2_star team_boss_cnt 5
execute if score #t3_star team_boss_cnt matches 6.. run scoreboard players set #t3_star team_boss_cnt 5
execute if score #t4_star team_boss_cnt matches 6.. run scoreboard players set #t4_star team_boss_cnt 5

scoreboard players set #val item_value 30
scoreboard players operation #pts rnd_temp = #t1_star team_boss_cnt
scoreboard players operation #pts rnd_temp *= #val item_value
scoreboard players operation ทีมที่_1 team_score += #pts rnd_temp

scoreboard players operation #pts rnd_temp = #t2_star team_boss_cnt
scoreboard players operation #pts rnd_temp *= #val item_value
scoreboard players operation ทีมที่_2 team_score += #pts rnd_temp

scoreboard players operation #pts rnd_temp = #t3_star team_boss_cnt
scoreboard players operation #pts rnd_temp *= #val item_value
scoreboard players operation ทีมที่_3 team_score += #pts rnd_temp

scoreboard players operation #pts rnd_temp = #t4_star team_boss_cnt
scoreboard players operation #pts rnd_temp *= #val item_value
scoreboard players operation ทีมที่_4 team_score += #pts rnd_temp

# 2.4 คะแนนบอสและอีเวนต์ระดับทีมที่ล็อก Hard Cap แล้ว
# Warden (45/ตัว, Cap 4)
scoreboard players set #val item_value 45
scoreboard players operation #pts rnd_temp = #t1_warden team_boss_cnt
scoreboard players operation #pts rnd_temp *= #val item_value
scoreboard players operation ทีมที่_1 team_score += #pts rnd_temp
scoreboard players operation #pts rnd_temp = #t2_warden team_boss_cnt
scoreboard players operation #pts rnd_temp *= #val item_value
scoreboard players operation ทีมที่_2 team_score += #pts rnd_temp
scoreboard players operation #pts rnd_temp = #t3_warden team_boss_cnt
scoreboard players operation #pts rnd_temp *= #val item_value
scoreboard players operation ทีมที่_3 team_score += #pts rnd_temp
scoreboard players operation #pts rnd_temp = #t4_warden team_boss_cnt
scoreboard players operation #pts rnd_temp *= #val item_value
scoreboard players operation ทีมที่_4 team_score += #pts rnd_temp

# Elder Guardian (20/ตัว, Cap 6)
scoreboard players set #val item_value 20
scoreboard players operation #pts rnd_temp = #t1_elder team_boss_cnt
scoreboard players operation #pts rnd_temp *= #val item_value
scoreboard players operation ทีมที่_1 team_score += #pts rnd_temp
scoreboard players operation #pts rnd_temp = #t2_elder team_boss_cnt
scoreboard players operation #pts rnd_temp *= #val item_value
scoreboard players operation ทีมที่_2 team_score += #pts rnd_temp
scoreboard players operation #pts rnd_temp = #t3_elder team_boss_cnt
scoreboard players operation #pts rnd_temp *= #val item_value
scoreboard players operation ทีมที่_3 team_score += #pts rnd_temp
scoreboard players operation #pts rnd_temp = #t4_elder team_boss_cnt
scoreboard players operation #pts rnd_temp *= #val item_value
scoreboard players operation ทีมที่_4 team_score += #pts rnd_temp

# Illager Raid (15/รอบ, Cap 10)
scoreboard players set #val item_value 15
scoreboard players operation #pts rnd_temp = #t1_raid team_boss_cnt
scoreboard players operation #pts rnd_temp *= #val item_value
scoreboard players operation ทีมที่_1 team_score += #pts rnd_temp
scoreboard players operation #pts rnd_temp = #t2_raid team_boss_cnt
scoreboard players operation #pts rnd_temp *= #val item_value
scoreboard players operation ทีมที่_2 team_score += #pts rnd_temp
scoreboard players operation #pts rnd_temp = #t3_raid team_boss_cnt
scoreboard players operation #pts rnd_temp *= #val item_value
scoreboard players operation ทีมที่_3 team_score += #pts rnd_temp
scoreboard players operation #pts rnd_temp = #t4_raid team_boss_cnt
scoreboard players operation #pts rnd_temp *= #val item_value
scoreboard players operation ทีมที่_4 team_score += #pts rnd_temp

# Ominous Trial Chamber (30/รอบ, Cap 5)
scoreboard players set #val item_value 30
scoreboard players operation #pts rnd_temp = #t1_trial team_boss_cnt
scoreboard players operation #pts rnd_temp *= #val item_value
scoreboard players operation ทีมที่_1 team_score += #pts rnd_temp
scoreboard players operation #pts rnd_temp = #t2_trial team_boss_cnt
scoreboard players operation #pts rnd_temp *= #val item_value
scoreboard players operation ทีมที่_2 team_score += #pts rnd_temp
scoreboard players operation #pts rnd_temp = #t3_trial team_boss_cnt
scoreboard players operation #pts rnd_temp *= #val item_value
scoreboard players operation ทีมที่_3 team_score += #pts rnd_temp
scoreboard players operation #pts rnd_temp = #t4_trial team_boss_cnt
scoreboard players operation #pts rnd_temp *= #val item_value
scoreboard players operation ทีมที่_4 team_score += #pts rnd_temp

# 2.5 ตรวจและรวมคะแนนเควส The Citadel, เควสด่วน Bossbar, เช็กลิสต์ย่อย 4 สายอาชีพ, และ Advancements ประจำทีม
function nbs:citadel/tick_flash_quest
function nbs:career/check_team_advs
function nbs:career/check_career_checklists

scoreboard players operation ทีมที่_1 team_score += #team_1 team_quest_pts
scoreboard players operation ทีมที่_2 team_score += #team_2 team_quest_pts
scoreboard players operation ทีมที่_3 team_score += #team_3 team_quest_pts
scoreboard players operation ทีมที่_4 team_score += #team_4 team_quest_pts

scoreboard players operation ทีมที่_1 team_score += #team_1 team_career_pts
scoreboard players operation ทีมที่_2 team_score += #team_2 team_career_pts
scoreboard players operation ทีมที่_3 team_score += #team_3 team_career_pts
scoreboard players operation ทีมที่_4 team_score += #team_4 team_career_pts

scoreboard players operation ทีมที่_1 team_score += #team_1 team_adv_pts
scoreboard players operation ทีมที่_2 team_score += #team_2 team_adv_pts
scoreboard players operation ทีมที่_3 team_score += #team_3 team_adv_pts
scoreboard players operation ทีมที่_4 team_score += #team_4 team_adv_pts

# 2.6 โบนัส The Wealthiest (ทีมที่ฝากเพชรในธนาคาร The Citadel มากที่สุด +80 แต้ม)
scoreboard players set #max_dia item_count 1
execute if score #team_1 team_diamonds > #max_dia item_count run scoreboard players operation #max_dia item_count = #team_1 team_diamonds
execute if score #team_2 team_diamonds > #max_dia item_count run scoreboard players operation #max_dia item_count = #team_2 team_diamonds
execute if score #team_3 team_diamonds > #max_dia item_count run scoreboard players operation #max_dia item_count = #team_3 team_diamonds
execute if score #team_4 team_diamonds > #max_dia item_count run scoreboard players operation #max_dia item_count = #team_4 team_diamonds

execute if score #team_1 team_diamonds = #max_dia item_count run scoreboard players add ทีมที่_1 team_score 80
execute if score #team_2 team_diamonds = #max_dia item_count run scoreboard players add ทีมที่_2 team_score 80
execute if score #team_3 team_diamonds = #max_dia item_count run scoreboard players add ทีมที่_3 team_score 80
execute if score #team_4 team_diamonds = #max_dia item_count run scoreboard players add ทีมที่_4 team_score 80

# 2.7 โบนัส Top Killer อันดับ 1 (+80) และ อันดับ 2 (+40)
tag @a remove top1_killer
tag @a remove top2_killer
scoreboard players set #top1_kills item_count 0
scoreboard players set #top2_kills item_count 0

execute as @a[scores={team_id=1..4,total_pvp_kills=1..}] if score @s total_pvp_kills > #top1_kills item_count run scoreboard players operation #top1_kills item_count = @s total_pvp_kills
execute if score #top1_kills item_count matches 1.. as @a[scores={team_id=1..4}] if score @s total_pvp_kills = #top1_kills item_count run tag @s add top1_killer

execute if score #top1_kills item_count matches 2.. as @a[scores={team_id=1..4,total_pvp_kills=1..}] if score @s total_pvp_kills < #top1_kills item_count if score @s total_pvp_kills > #top2_kills item_count run scoreboard players operation #top2_kills item_count = @s total_pvp_kills
execute if score #top2_kills item_count matches 1.. as @a[scores={team_id=1..4}] if score @s total_pvp_kills = #top2_kills item_count run tag @s add top2_killer

execute if entity @a[tag=top1_killer,scores={team_id=1}] run scoreboard players add ทีมที่_1 team_score 80
execute if entity @a[tag=top1_killer,scores={team_id=2}] run scoreboard players add ทีมที่_2 team_score 80
execute if entity @a[tag=top1_killer,scores={team_id=3}] run scoreboard players add ทีมที่_3 team_score 80
execute if entity @a[tag=top1_killer,scores={team_id=4}] run scoreboard players add ทีมที่_4 team_score 80

execute if entity @a[tag=top2_killer,scores={team_id=1}] run scoreboard players add ทีมที่_1 team_score 40
execute if entity @a[tag=top2_killer,scores={team_id=2}] run scoreboard players add ทีมที่_2 team_score 40
execute if entity @a[tag=top2_killer,scores={team_id=3}] run scoreboard players add ทีมที่_3 team_score 40
execute if entity @a[tag=top2_killer,scores={team_id=4}] run scoreboard players add ทีมที่_4 team_score 40
