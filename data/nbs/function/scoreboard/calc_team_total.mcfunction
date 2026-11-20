# คำนวณคะแนนบอส/Nether Star ที่ล็อก Cap + เควส + อาชีพ + Advancements ของ Team $(team)
$execute if score #t$(team)_star team_boss_cnt matches 6.. run scoreboard players set #t$(team)_star team_boss_cnt 5

scoreboard players set #val item_value 30
$scoreboard players operation #pts rnd_temp = #t$(team)_star team_boss_cnt
scoreboard players operation #pts rnd_temp *= #val item_value
$scoreboard players operation ทีมที่_$(team) team_score += #pts rnd_temp

scoreboard players set #val item_value 45
$scoreboard players operation #pts rnd_temp = #t$(team)_warden team_boss_cnt
scoreboard players operation #pts rnd_temp *= #val item_value
$scoreboard players operation ทีมที่_$(team) team_score += #pts rnd_temp

scoreboard players set #val item_value 20
$scoreboard players operation #pts rnd_temp = #t$(team)_elder team_boss_cnt
scoreboard players operation #pts rnd_temp *= #val item_value
$scoreboard players operation ทีมที่_$(team) team_score += #pts rnd_temp

scoreboard players set #val item_value 15
$scoreboard players operation #pts rnd_temp = #t$(team)_raid team_boss_cnt
scoreboard players operation #pts rnd_temp *= #val item_value
$scoreboard players operation ทีมที่_$(team) team_score += #pts rnd_temp

scoreboard players set #val item_value 30
$scoreboard players operation #pts rnd_temp = #t$(team)_trial team_boss_cnt
scoreboard players operation #pts rnd_temp *= #val item_value
$scoreboard players operation ทีมที่_$(team) team_score += #pts rnd_temp

$scoreboard players operation ทีมที่_$(team) team_score += #team_$(team) team_quest_pts
$scoreboard players operation ทีมที่_$(team) team_score += #team_$(team) team_career_pts
$scoreboard players operation ทีมที่_$(team) team_score += #team_$(team) team_adv_pts
