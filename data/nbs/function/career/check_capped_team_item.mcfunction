# ==========================================
# ตรวจสอบการครอบครองไอเทมสะสมที่มีเพดาน $(cap_id) ของ Team $(team) ในสายอาชีพ $(career)
# นับคะแนนเฉพาะเมื่อ Team $(team) สังกัดสายอาชีพ $(career)
# ทุกคนในทีมแชร์คะแนนร่วมกัน (ในตัวผู้เล่น, Ender Chest, กล่องในเขตธง)
# ==========================================
scoreboard players set #has_item rnd_temp 0

# ตรวจเฉพาะเมื่อ Team $(team) สังกัดสายอาชีพ $(career) เท่านั้น!
$execute if score #t$(team)_active game_state matches 1 if score #t$(team)_career career_id matches $(career) if items entity @a[scores={team_id=$(team)}] container.* $(item) run scoreboard players set #has_item rnd_temp 1
$execute if score #t$(team)_active game_state matches 1 if score #t$(team)_career career_id matches $(career) unless score #has_item rnd_temp matches 1 if items entity @a[scores={team_id=$(team)}] weapon.* $(item) run scoreboard players set #has_item rnd_temp 1
$execute if score #t$(team)_active game_state matches 1 if score #t$(team)_career career_id matches $(career) unless score #has_item rnd_temp matches 1 if items entity @a[scores={team_id=$(team)}] armor.* $(item) run scoreboard players set #has_item rnd_temp 1
$execute if score #t$(team)_active game_state matches 1 if score #t$(team)_career career_id matches $(career) unless score #has_item rnd_temp matches 1 if items entity @a[scores={team_id=$(team)}] enderchest.* $(item) run scoreboard players set #has_item rnd_temp 1
$execute if score #t$(team)_active game_state matches 1 if score #t$(team)_career career_id matches $(career) unless score #has_item rnd_temp matches 1 as @e[type=minecraft:marker,tag=chest_anchor,scores={team_id=$(team)}] at @s if items block ~ ~ ~ container.* $(item) run scoreboard players set #has_item rnd_temp 1

# หากครอบครอง และยังไม่เกินโควตาสูงสุด ให้บวกคะแนนและเพิ่มตัวนับ Cap
$execute if score #has_item rnd_temp matches 1 if score #t$(team)_$(cap_id) team_boss_cnt matches ..$(max_prev) run scoreboard players add #t$(team)_it_$(cat) rnd_temp $(pts)
$execute if score #has_item rnd_temp matches 1 if score #t$(team)_$(cap_id) team_boss_cnt matches ..$(max_prev) run scoreboard players add #t$(team)_$(cap_id) team_boss_cnt 1
