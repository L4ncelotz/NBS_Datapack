# ==========================================
# 1. โอนสถิติการฆ่า Boss และ Event จริงเข้าสมุดสถิติ
# ==========================================
execute as @a[scores={raw_kill_dragon=1..}] run scoreboard players operation @s stat_dragon += @s raw_kill_dragon
scoreboard players set @a raw_kill_dragon 0

execute as @a[scores={raw_kill_wither=1..}] run scoreboard players operation @s stat_wither += @s raw_kill_wither
scoreboard players set @a raw_kill_wither 0

execute as @a[scores={raw_kill_warden=1..}] run scoreboard players operation @s stat_warden += @s raw_kill_warden
scoreboard players set @a raw_kill_warden 0

execute as @a[scores={raw_kill_elder=1..}] run scoreboard players operation @s stat_elder += @s raw_kill_elder
scoreboard players set @a raw_kill_elder 0

execute as @a[scores={raw_win_raid=1..}] run scoreboard players operation @s stat_raid += @s raw_win_raid
scoreboard players set @a raw_win_raid 0

# ==========================================
# 2. คำนวณคะแนนของแต่ละหัวข้อ (จำนวนตัว x คะแนนต่อตัว)
# ==========================================
# Ender Dragon (ตัวละ 100 แต้ม)
execute as @a run scoreboard players operation @s pts_dragon = @s stat_dragon
scoreboard players set #mult item_value 50
execute as @a run scoreboard players operation @s pts_dragon *= #mult item_value

# Wither (ตัวละ 25 แต้ม - แก้ตัวเลขตรงนี้ได้ตามต้องการ)
execute as @a run scoreboard players operation @s pts_wither = @s stat_wither
scoreboard players set #mult item_value 25
execute as @a run scoreboard players operation @s pts_wither *= #mult item_value

# Warden (ตัวละ 80 แต้ม)
execute as @a run scoreboard players operation @s pts_warden = @s stat_warden
scoreboard players set #mult item_value 15
execute as @a run scoreboard players operation @s pts_warden *= #mult item_value

# Elder Guardian (ตัวละ 50 แต้ม)
execute as @a run scoreboard players operation @s pts_elder = @s stat_elder
scoreboard players set #mult item_value 10
execute as @a run scoreboard players operation @s pts_elder *= #mult item_value

# Illager Raid (รอบละ 15 แต้ม ตามคู่มือ)
execute as @a run scoreboard players operation @s pts_raid = @s stat_raid
scoreboard players set #mult item_value 7
execute as @a run scoreboard players operation @s pts_raid *= #mult item_value

# Ominous Trial Chamber (รอบละ 30 แต้ม ตามคู่มือ)
execute as @a run scoreboard players operation @s pts_trial = @s stat_trial
scoreboard players set #mult item_value 15
execute as @a run scoreboard players operation @s pts_trial *= #mult item_value

# ==========================================
# 3. ระบบเปิดดูสมุดสถิติ (/trigger view_stats)
# ==========================================
scoreboard players enable @a view_stats

execute as @a[scores={view_stats=1..}] run tellraw @s {"text":"========================================","color":"dark_gray","bold":true}
execute as @a[scores={view_stats=1..}] run tellraw @s {"text":" 📖 สมุดบันทึกสถิติการผจญภัย NBs SMP","color":"gold","bold":true}
execute as @a[scores={view_stats=1..}] run tellraw @s {"text":"========================================","color":"dark_gray","bold":true}

execute if entity @a[scores={view_stats=1..}] as @a run function nbs:scoreboard/print_player_stats

execute as @a[scores={view_stats=1..}] run tellraw @s {"text":"========================================","color":"dark_gray","bold":true}
scoreboard players set @a[scores={view_stats=1..}] view_stats 0