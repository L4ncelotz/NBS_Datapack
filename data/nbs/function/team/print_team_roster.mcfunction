# ==========================================
# แสดงสมาชิกและสายอาชีพของทีม $(team) ด้วย Macro
# ==========================================
# 1. นับจำนวนสมาชิกในทีมนี้
scoreboard players set #team_members rnd_temp 0
$execute as @a[team=team_$(team)] run scoreboard players add #team_members rnd_temp 1

# 2. แสดงหัวข้อชื่อทีมและจำนวนสมาชิก พร้อมสายอาชีพประจำทีม (ถ้ามี) และปุ่มคลิกเข้าร่วม
$execute if score #t$(team)_career career_id matches 1 run tellraw @a[tag=viewing_roster] [{"text":" • ","color":"gray"},{"text":"$(name)","color":"$(color)","bold":true},{"text":" [🌾 เกษตรกร]","color":"green","bold":true},{"text":" (","color":"dark_gray"},{"score":{"name":"#team_members","objective":"rnd_temp"},"color":"yellow","bold":true},{"text":" คน) ","color":"dark_gray"},{"text":"[▶ เข้าร่วม]","color":"dark_green","bold":true,"click_event":{"action":"run_command","command":"/trigger join_team set $(team)"}}]
$execute if score #t$(team)_career career_id matches 2 run tellraw @a[tag=viewing_roster] [{"text":" • ","color":"gray"},{"text":"$(name)","color":"$(color)","bold":true},{"text":" [⚒️ ช่างตีเหล็ก]","color":"white","bold":true},{"text":" (","color":"dark_gray"},{"score":{"name":"#team_members","objective":"rnd_temp"},"color":"yellow","bold":true},{"text":" คน) ","color":"dark_gray"},{"text":"[▶ เข้าร่วม]","color":"dark_green","bold":true,"click_event":{"action":"run_command","command":"/trigger join_team set $(team)"}}]
$execute if score #t$(team)_career career_id matches 3 run tellraw @a[tag=viewing_roster] [{"text":" • ","color":"gray"},{"text":"$(name)","color":"$(color)","bold":true},{"text":" [⚔️ นักล่ามอน]","color":"red","bold":true},{"text":" (","color":"dark_gray"},{"score":{"name":"#team_members","objective":"rnd_temp"},"color":"yellow","bold":true},{"text":" คน) ","color":"dark_gray"},{"text":"[▶ เข้าร่วม]","color":"dark_green","bold":true,"click_event":{"action":"run_command","command":"/trigger join_team set $(team)"}}]
$execute if score #t$(team)_career career_id matches 4 run tellraw @a[tag=viewing_roster] [{"text":" • ","color":"gray"},{"text":"$(name)","color":"$(color)","bold":true},{"text":" [🧭 นักผจญภัย]","color":"aqua","bold":true},{"text":" (","color":"dark_gray"},{"score":{"name":"#team_members","objective":"rnd_temp"},"color":"yellow","bold":true},{"text":" คน) ","color":"dark_gray"},{"text":"[▶ เข้าร่วม]","color":"dark_green","bold":true,"click_event":{"action":"run_command","command":"/trigger join_team set $(team)"}}]
$execute unless score #t$(team)_career career_id matches 1..4 run tellraw @a[tag=viewing_roster] [{"text":" • ","color":"gray"},{"text":"$(name)","color":"$(color)","bold":true},{"text":" [❓ ยังไม่เลือกสาย]","color":"dark_gray","italic":true},{"text":" (","color":"dark_gray"},{"score":{"name":"#team_members","objective":"rnd_temp"},"color":"yellow","bold":true},{"text":" คน) ","color":"dark_gray"},{"text":"[▶ เข้าร่วม]","color":"dark_green","bold":true,"click_event":{"action":"run_command","command":"/trigger join_team set $(team)"}}]

# 3. ถ้าไม่มีสมาชิกในทีม
execute if score #team_members rnd_temp matches 0 run tellraw @a[tag=viewing_roster] [{"text":"     - (ยังไม่มีสมาชิก)","color":"dark_gray","italic":true}]

# 4. แสดงรายชื่อสมาชิกในทีม (ทุกคนในทีมสังกัดสายอาชีพเดียวกัน)
$execute as @a[team=team_$(team)] run tellraw @a[tag=viewing_roster] [{"text":"     • ","color":"gray"},{"selector":"@s","color":"white","bold":true}]
