# ==========================================
# 1. โอนสถิติการฆ่า Boss และ Event จริงเข้าสมุดสถิติ + ตัวนับระดับทีม (ล็อก Hard Cap)
# ==========================================
# ลด Cooldown ป้องกัน Raid นับเบิ้ลต่อทีม (200 ticks = 10 วินาที)
scoreboard players remove #t1_raid_lock rnd_temp 1
execute if score #t1_raid_lock rnd_temp matches ..0 run scoreboard players set #t1_raid_lock rnd_temp 0
scoreboard players remove #t2_raid_lock rnd_temp 1
execute if score #t2_raid_lock rnd_temp matches ..0 run scoreboard players set #t2_raid_lock rnd_temp 0
scoreboard players remove #t3_raid_lock rnd_temp 1
execute if score #t3_raid_lock rnd_temp matches ..0 run scoreboard players set #t3_raid_lock rnd_temp 0
scoreboard players remove #t4_raid_lock rnd_temp 1
execute if score #t4_raid_lock rnd_temp matches ..0 run scoreboard players set #t4_raid_lock rnd_temp 0

# Dragon & Wither (เก็บสถิติส่วนตัวสำหรับดูในสมุด — คะแนนหลักมาจาก Dragon Egg / Nether Star)
execute as @a[scores={raw_kill_dragon=1..}] run scoreboard players operation @s stat_dragon += @s raw_kill_dragon
scoreboard players set @a raw_kill_dragon 0

execute as @a[scores={raw_kill_wither=1..}] run scoreboard players operation @s stat_wither += @s raw_kill_wither
scoreboard players set @a raw_kill_wither 0

# Warden (45 แต้ม/ตัว, Cap 4 ตัว/ทีม)
execute as @a[scores={raw_kill_warden=1..}] run scoreboard players operation @s stat_warden += @s raw_kill_warden
execute as @a[scores={raw_kill_warden=1..,team_id=1}] run scoreboard players operation #t1_warden team_boss_cnt += @s raw_kill_warden
execute as @a[scores={raw_kill_warden=1..,team_id=2}] run scoreboard players operation #t2_warden team_boss_cnt += @s raw_kill_warden
execute as @a[scores={raw_kill_warden=1..,team_id=3}] run scoreboard players operation #t3_warden team_boss_cnt += @s raw_kill_warden
execute as @a[scores={raw_kill_warden=1..,team_id=4}] run scoreboard players operation #t4_warden team_boss_cnt += @s raw_kill_warden
execute if score #t1_warden team_boss_cnt matches 5.. run scoreboard players set #t1_warden team_boss_cnt 4
execute if score #t2_warden team_boss_cnt matches 5.. run scoreboard players set #t2_warden team_boss_cnt 4
execute if score #t3_warden team_boss_cnt matches 5.. run scoreboard players set #t3_warden team_boss_cnt 4
execute if score #t4_warden team_boss_cnt matches 5.. run scoreboard players set #t4_warden team_boss_cnt 4
scoreboard players set @a raw_kill_warden 0

# Elder Guardian (20 แต้ม/ตัว, Cap 6 ตัว/ทีม)
execute as @a[scores={raw_kill_elder=1..}] run scoreboard players operation @s stat_elder += @s raw_kill_elder
execute as @a[scores={raw_kill_elder=1..,team_id=1}] run scoreboard players operation #t1_elder team_boss_cnt += @s raw_kill_elder
execute as @a[scores={raw_kill_elder=1..,team_id=2}] run scoreboard players operation #t2_elder team_boss_cnt += @s raw_kill_elder
execute as @a[scores={raw_kill_elder=1..,team_id=3}] run scoreboard players operation #t3_elder team_boss_cnt += @s raw_kill_elder
execute as @a[scores={raw_kill_elder=1..,team_id=4}] run scoreboard players operation #t4_elder team_boss_cnt += @s raw_kill_elder
execute if score #t1_elder team_boss_cnt matches 7.. run scoreboard players set #t1_elder team_boss_cnt 6
execute if score #t2_elder team_boss_cnt matches 7.. run scoreboard players set #t2_elder team_boss_cnt 6
execute if score #t3_elder team_boss_cnt matches 7.. run scoreboard players set #t3_elder team_boss_cnt 6
execute if score #t4_elder team_boss_cnt matches 7.. run scoreboard players set #t4_elder team_boss_cnt 6
scoreboard players set @a raw_kill_elder 0

# Illager Raid (15 แต้ม/รอบ, Cap 10 รอบ/ทีม + Lock 10 วินาทีกันเพื่อนในทีมนับเบิ้ลใน Raid เดียวกัน)
execute as @a[scores={raw_win_raid=1..}] run scoreboard players operation @s stat_raid += @s raw_win_raid
execute if entity @a[scores={raw_win_raid=1..,team_id=1}] if score #t1_raid_lock rnd_temp matches 0 run scoreboard players add #t1_raid team_boss_cnt 1
execute if entity @a[scores={raw_win_raid=1..,team_id=1}] if score #t1_raid_lock rnd_temp matches 0 run scoreboard players set #t1_raid_lock rnd_temp 200
execute if entity @a[scores={raw_win_raid=1..,team_id=2}] if score #t2_raid_lock rnd_temp matches 0 run scoreboard players add #t2_raid team_boss_cnt 1
execute if entity @a[scores={raw_win_raid=1..,team_id=2}] if score #t2_raid_lock rnd_temp matches 0 run scoreboard players set #t2_raid_lock rnd_temp 200
execute if entity @a[scores={raw_win_raid=1..,team_id=3}] if score #t3_raid_lock rnd_temp matches 0 run scoreboard players add #t3_raid team_boss_cnt 1
execute if entity @a[scores={raw_win_raid=1..,team_id=3}] if score #t3_raid_lock rnd_temp matches 0 run scoreboard players set #t3_raid_lock rnd_temp 200
execute if entity @a[scores={raw_win_raid=1..,team_id=4}] if score #t4_raid_lock rnd_temp matches 0 run scoreboard players add #t4_raid team_boss_cnt 1
execute if entity @a[scores={raw_win_raid=1..,team_id=4}] if score #t4_raid_lock rnd_temp matches 0 run scoreboard players set #t4_raid_lock rnd_temp 200
execute if score #t1_raid team_boss_cnt matches 11.. run scoreboard players set #t1_raid team_boss_cnt 10
execute if score #t2_raid team_boss_cnt matches 11.. run scoreboard players set #t2_raid team_boss_cnt 10
execute if score #t3_raid team_boss_cnt matches 11.. run scoreboard players set #t3_raid team_boss_cnt 10
execute if score #t4_raid team_boss_cnt matches 11.. run scoreboard players set #t4_raid team_boss_cnt 10
scoreboard players set @a raw_win_raid 0

# Ominous Trial Chamber (30 แต้ม/รอบ, Cap 5 รอบ/ทีม)
execute as @a[scores={raw_win_trial=1..}] run scoreboard players operation @s stat_trial += @s raw_win_trial
execute as @a[scores={raw_win_trial=1..,team_id=1}] run scoreboard players operation #t1_trial team_boss_cnt += @s raw_win_trial
execute as @a[scores={raw_win_trial=1..,team_id=2}] run scoreboard players operation #t2_trial team_boss_cnt += @s raw_win_trial
execute as @a[scores={raw_win_trial=1..,team_id=3}] run scoreboard players operation #t3_trial team_boss_cnt += @s raw_win_trial
execute as @a[scores={raw_win_trial=1..,team_id=4}] run scoreboard players operation #t4_trial team_boss_cnt += @s raw_win_trial
execute if score #t1_trial team_boss_cnt matches 6.. run scoreboard players set #t1_trial team_boss_cnt 5
execute if score #t2_trial team_boss_cnt matches 6.. run scoreboard players set #t2_trial team_boss_cnt 5
execute if score #t3_trial team_boss_cnt matches 6.. run scoreboard players set #t3_trial team_boss_cnt 5
execute if score #t4_trial team_boss_cnt matches 6.. run scoreboard players set #t4_trial team_boss_cnt 5
scoreboard players set @a raw_win_trial 0

# ==========================================
# 2. คำนวณคะแนนส่วนตัวแสดงในสมุดสถิติ (Dragon/Wither แสดง 0 เพราะนับจาก Egg/Star ของทีม)
# ==========================================
scoreboard players set @a pts_dragon 0
scoreboard players set @a pts_wither 0

execute as @a run scoreboard players operation @s pts_warden = @s stat_warden
scoreboard players set #mult item_value 45
execute as @a run scoreboard players operation @s pts_warden *= #mult item_value

execute as @a run scoreboard players operation @s pts_elder = @s stat_elder
scoreboard players set #mult item_value 20
execute as @a run scoreboard players operation @s pts_elder *= #mult item_value

execute as @a run scoreboard players operation @s pts_raid = @s stat_raid
scoreboard players set #mult item_value 15
execute as @a run scoreboard players operation @s pts_raid *= #mult item_value

execute as @a run scoreboard players operation @s pts_trial = @s stat_trial
scoreboard players set #mult item_value 30
execute as @a run scoreboard players operation @s pts_trial *= #mult item_value

# คำนวณคะแนนผลงานบอส/อีเวนต์ส่วนตัว (player_score) สำหรับแสดงใน /trigger view_stats
scoreboard players set @a player_score 0
execute as @a run scoreboard players operation @s player_score += @s pts_warden
execute as @a run scoreboard players operation @s player_score += @s pts_elder
execute as @a run scoreboard players operation @s player_score += @s pts_raid
execute as @a run scoreboard players operation @s player_score += @s pts_trial

# ==========================================
# 3. ระบบเปิดดูสมุดสถิติ (/trigger view_stats)
# ==========================================
scoreboard players enable @a view_stats

execute as @a[scores={view_stats=1..}] run function nbs:scoreboard/show_stats_book
scoreboard players set @a[scores={view_stats=1..}] view_stats 0
