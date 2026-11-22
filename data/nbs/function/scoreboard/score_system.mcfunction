# ==========================================
# 1. ตรวจจับการเปิดกล่อง/ถัง เพื่อปักหมุดจดจำตำแหน่งกล่อง (ทำงานทุก Tick เพื่อไม่ให้พลาดจังหวะเปิด/วาง)
# ==========================================
execute as @a[scores={open_chest=1..}] at @s run function nbs:scoreboard/register_chest
execute as @a[scores={open_barrel=1..}] at @s run function nbs:scoreboard/register_chest
execute as @a[scores={place_chest=1..}] at @s run function nbs:scoreboard/register_chest
execute as @a[scores={place_trapped=1..}] at @s run function nbs:scoreboard/register_chest
execute as @a[scores={place_barrel=1..}] at @s run function nbs:scoreboard/register_chest
scoreboard players set @a open_chest 0
scoreboard players set @a open_barrel 0
scoreboard players set @a place_chest 0
scoreboard players set @a place_trapped 0
scoreboard players set @a place_barrel 0

# ==========================================
# 2. คำนวณคะแนนผู้เล่นและสแกนกล่องทีมทุกๆ 20 Tick (1 วินาที) เพื่อลดภาระ TPS
# ==========================================
scoreboard players add #score_tick rnd_temp 1
execute if score #score_tick rnd_temp matches 20.. run function nbs:scoreboard/recalc_scores

# ==========================================
# 3. ละอองระยิบระยับรอบกล่องที่ซ่อนไอเท็มนอกเขตธง (รัศมี 20 บล็อก ทำงานทุก 10 Tick)
# ==========================================
scoreboard players add #hidden_fx_tick rnd_temp 1
execute if score #hidden_fx_tick rnd_temp matches 10.. as @e[type=minecraft:marker,tag=hidden_chest] at @s run function nbs:scoreboard/hidden_chest_particles
execute if score #hidden_fx_tick rnd_temp matches 10.. run scoreboard players set #hidden_fx_tick rnd_temp 0

# ==========================================
# 4. ระบบคำสั่งดูพิกัดกล่องของชิงชัยนอกเขตธง (/trigger check_hidden)
# ==========================================
scoreboard players enable @a check_hidden
execute as @a[scores={check_hidden=1..}] run function nbs:scoreboard/show_hidden_chests
scoreboard players set @a[scores={check_hidden=1..}] check_hidden 0
