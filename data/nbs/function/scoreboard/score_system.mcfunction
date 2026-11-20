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
