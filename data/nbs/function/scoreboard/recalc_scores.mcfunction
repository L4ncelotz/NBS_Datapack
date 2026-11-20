# รีเซ็ตตัวนับรอบเป็น 0
scoreboard players set #score_tick rnd_temp 0

# ==========================================
# 2. คำนวณคะแนนส่วนตัวทั้งหมดของผู้เล่นแต่ละคน
# ==========================================
scoreboard players set @a player_score 0

# 2.1 คะแนนจากไข่มังกรในตัว (ชิ้นละ 100 คะแนน)
scoreboard players set #val item_value 100
execute as @a store result score @s item_count run clear @s minecraft:dragon_egg 0
execute as @a[scores={item_count=1..}] run scoreboard players operation @s item_count *= #val item_value
execute as @a[scores={item_count=1..}] run scoreboard players operation @s player_score += @s item_count

# 2.2 คะแนนจากป้ายชื่อคะแนนในตัว (ชิ้นละ 5 คะแนน)
scoreboard players set #val item_value 5
execute as @a store result score @s item_count run clear @s minecraft:name_tag[custom_data={score_tag:1b}] 0
execute as @a[scores={item_count=1..}] run scoreboard players operation @s item_count *= #val item_value
execute as @a[scores={item_count=1..}] run scoreboard players operation @s player_score += @s item_count

# 2.3 บวกคะแนนจากการปราบ Boss และเคลียร์ Event เข้า player_score ด้วย!
execute as @a run scoreboard players operation @s player_score += @s pts_dragon
execute as @a run scoreboard players operation @s player_score += @s pts_wither
execute as @a run scoreboard players operation @s player_score += @s pts_warden
execute as @a run scoreboard players operation @s player_score += @s pts_elder
execute as @a run scoreboard players operation @s player_score += @s pts_raid
execute as @a run scoreboard players operation @s player_score += @s pts_trial

# ==========================================
# 3. รวมคะแนนเข้าตารางทีมด้านขวา (จากตัวผู้เล่น + จากกล่องในรัศมีธง)
# ==========================================
scoreboard players set ทีมที่_1 team_score 0
scoreboard players set ทีมที่_2 team_score 0
scoreboard players set ทีมที่_3 team_score 0
scoreboard players set ทีมที่_4 team_score 0

# 3.1 รวมคะแนนจากตัวสมาชิกในทีม
execute as @a[scores={team_id=1}] run scoreboard players operation ทีมที่_1 team_score += @s player_score
execute as @a[scores={team_id=2}] run scoreboard players operation ทีมที่_2 team_score += @s player_score
execute as @a[scores={team_id=3}] run scoreboard players operation ทีมที่_3 team_score += @s player_score
execute as @a[scores={team_id=4}] run scoreboard players operation ทีมที่_4 team_score += @s player_score

# 3.2 รวมคะแนนจากกล่องทุกใบที่อยู่ในรัศมีธงอาณาเขต (32 บล็อก)
execute as @e[type=minecraft:marker,tag=chest_anchor] at @s run function nbs:scoreboard/count_single_chest
