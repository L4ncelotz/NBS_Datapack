# สุ่มเลือกสายอาชีพ (1-4) ให้แต่ละทีมที่ยังไม่ได้เลือกสายอาชีพ (#t<N>_career == 0)
scoreboard players set #assigned_career rnd_temp 0

# ตรวจสอบและสุ่มสายอาชีพให้ทีม 1 ถึง 8 ที่เปิดใช้งานอยู่
execute if score #t1_active game_state matches 1 if score #t1_career career_id matches ..0 run scoreboard players set #assigned_career rnd_temp 1
execute if score #t1_active game_state matches 1 if score #t1_career career_id matches ..0 store result score #t1_career career_id run random value 1..4
execute if score #t1_career career_id matches 1..4 run scoreboard players operation @a[scores={team_id=1}] career_id = #t1_career career_id

execute if score #t2_active game_state matches 1 if score #t2_career career_id matches ..0 run scoreboard players set #assigned_career rnd_temp 1
execute if score #t2_active game_state matches 1 if score #t2_career career_id matches ..0 store result score #t2_career career_id run random value 1..4
execute if score #t2_career career_id matches 1..4 run scoreboard players operation @a[scores={team_id=2}] career_id = #t2_career career_id

execute if score #t3_active game_state matches 1 if score #t3_career career_id matches ..0 run scoreboard players set #assigned_career rnd_temp 1
execute if score #t3_active game_state matches 1 if score #t3_career career_id matches ..0 store result score #t3_career career_id run random value 1..4
execute if score #t3_career career_id matches 1..4 run scoreboard players operation @a[scores={team_id=3}] career_id = #t3_career career_id

execute if score #t4_active game_state matches 1 if score #t4_career career_id matches ..0 run scoreboard players set #assigned_career rnd_temp 1
execute if score #t4_active game_state matches 1 if score #t4_career career_id matches ..0 store result score #t4_career career_id run random value 1..4
execute if score #t4_career career_id matches 1..4 run scoreboard players operation @a[scores={team_id=4}] career_id = #t4_career career_id

execute if score #t5_active game_state matches 1 if score #t5_career career_id matches ..0 run scoreboard players set #assigned_career rnd_temp 1
execute if score #t5_active game_state matches 1 if score #t5_career career_id matches ..0 store result score #t5_career career_id run random value 1..4
execute if score #t5_career career_id matches 1..4 run scoreboard players operation @a[scores={team_id=5}] career_id = #t5_career career_id

execute if score #t6_active game_state matches 1 if score #t6_career career_id matches ..0 run scoreboard players set #assigned_career rnd_temp 1
execute if score #t6_active game_state matches 1 if score #t6_career career_id matches ..0 store result score #t6_career career_id run random value 1..4
execute if score #t6_career career_id matches 1..4 run scoreboard players operation @a[scores={team_id=6}] career_id = #t6_career career_id

execute if score #t7_active game_state matches 1 if score #t7_career career_id matches ..0 run scoreboard players set #assigned_career rnd_temp 1
execute if score #t7_active game_state matches 1 if score #t7_career career_id matches ..0 store result score #t7_career career_id run random value 1..4
execute if score #t7_career career_id matches 1..4 run scoreboard players operation @a[scores={team_id=7}] career_id = #t7_career career_id

execute if score #t8_active game_state matches 1 if score #t8_career career_id matches ..0 run scoreboard players set #assigned_career rnd_temp 1
execute if score #t8_active game_state matches 1 if score #t8_career career_id matches ..0 store result score #t8_career career_id run random value 1..4
execute if score #t8_career career_id matches 1..4 run scoreboard players operation @a[scores={team_id=8}] career_id = #t8_career career_id

# แจ้งเตือนผู้เล่นแต่ละคนในทีมตามสายอาชีพที่ทีมได้รับ
execute as @a[scores={career_id=1}] if score #assigned_career rnd_temp matches 1.. run tellraw @s [{"text":"🎲 [สายอาชีพทีม] ","color":"green","bold":true},{"text":"ทีมของคุณได้รับสายอาชีพสุ่ม: ","color":"gray"},{"text":"🌾 เกษตรกร (Farmer)","color":"green","bold":true}]
execute as @a[scores={career_id=2}] if score #assigned_career rnd_temp matches 1.. run tellraw @s [{"text":"🎲 [สายอาชีพทีม] ","color":"green","bold":true},{"text":"ทีมของคุณได้รับสายอาชีพสุ่ม: ","color":"gray"},{"text":"⚒️ ช่างตีเหล็ก (Blacksmith)","color":"white","bold":true}]
execute as @a[scores={career_id=3}] if score #assigned_career rnd_temp matches 1.. run tellraw @s [{"text":"🎲 [สายอาชีพทีม] ","color":"green","bold":true},{"text":"ทีมของคุณได้รับสายอาชีพสุ่ม: ","color":"gray"},{"text":"⚔️ นักล่ามอนสเตอร์ (Hunter)","color":"red","bold":true}]
execute as @a[scores={career_id=4}] if score #assigned_career rnd_temp matches 1.. run tellraw @s [{"text":"🎲 [สายอาชีพทีม] ","color":"green","bold":true},{"text":"ทีมของคุณได้รับสายอาชีพสุ่ม: ","color":"gray"},{"text":"🧭 นักผจญภัย (Adventurer)","color":"aqua","bold":true}]

execute if score #assigned_career rnd_temp matches 1.. run tellraw @a [{"text":"🎲 [สายอาชีพทีม] ","color":"aqua","bold":true},{"text":"สุ่มสายอาชีพให้ทีมที่ยังไม่ได้เลือกเรียบร้อยแล้ว! (1 ทีม = 1 สายอาชีพ)","color":"yellow"}]
