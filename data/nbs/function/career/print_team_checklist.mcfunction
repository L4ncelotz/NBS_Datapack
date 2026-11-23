# พิมพ์คะแนนเช็กลิสต์แยกสายอาชีพและโควตาของสะสมของ Team $(team)
$scoreboard players add #t$(team)_c_farmer team_career_pts 0
$scoreboard players add #t$(team)_c_blacksmith team_career_pts 0
$scoreboard players add #t$(team)_c_hunter team_career_pts 0
$scoreboard players add #t$(team)_c_adventurer team_career_pts 0
$scoreboard players add #t$(team)_trim team_boss_cnt 0
$scoreboard players add #t$(team)_head team_boss_cnt 0
$scoreboard players add #t$(team)_sherd team_boss_cnt 0

$execute if score #t$(team)_career career_id matches 1 run tellraw @s [{"text":" 🏷️ สายอาชีพประจำทีม: ","color":"gray"},{"text":"🌾 เกษตรกร (Farmer)","color":"green","bold":true},{"text":" (นับเฉพาะคะแนนสายนี้)","color":"yellow"}]
$execute if score #t$(team)_career career_id matches 2 run tellraw @s [{"text":" 🏷️ สายอาชีพประจำทีม: ","color":"gray"},{"text":"⚒️ ช่างตีเหล็ก (Blacksmith)","color":"white","bold":true},{"text":" (นับเฉพาะคะแนนสายนี้)","color":"yellow"}]
$execute if score #t$(team)_career career_id matches 3 run tellraw @s [{"text":" 🏷️ สายอาชีพประจำทีม: ","color":"gray"},{"text":"⚔️ นักล่ามอนสเตอร์ (Hunter)","color":"red","bold":true},{"text":" (นับเฉพาะคะแนนสายนี้)","color":"yellow"}]
$execute if score #t$(team)_career career_id matches 4 run tellraw @s [{"text":" 🏷️ สายอาชีพประจำทีม: ","color":"gray"},{"text":"🧭 นักผจญภัย (Adventurer)","color":"aqua","bold":true},{"text":" (นับเฉพาะคะแนนสายนี้)","color":"yellow"}]
$execute unless score #t$(team)_career career_id matches 1..4 run tellraw @s [{"text":" 🏷️ สายอาชีพประจำทีม: ","color":"gray"},{"text":"❓ ยังไม่เลือกสายอาชีพ","color":"red","italic":true}]

$tellraw @s [{"text":" • 🌾 Farmer (พืช/ไม้/สัตว์): ","color":"green"},{"score":{"name":"#t$(team)_c_farmer","objective":"team_career_pts"},"color":"gold","bold":true},{"text":" แต้ม","color":"gray"}]
$tellraw @s [{"text":" • ⚒️ Blacksmith (แร่/เกราะ/Trim): ","color":"white"},{"score":{"name":"#t$(team)_c_blacksmith","objective":"team_career_pts"},"color":"gold","bold":true},{"text":" แต้ม (Trims: ","color":"gray"},{"score":{"name":"#t$(team)_trim","objective":"team_boss_cnt"},"color":"aqua"},{"text":"/10)","color":"gray"}]
$tellraw @s [{"text":" • ⚔️ Monster Hunter (ล่ามอน/ดรอป/หัว): ","color":"red"},{"score":{"name":"#t$(team)_c_hunter","objective":"team_career_pts"},"color":"gold","bold":true},{"text":" แต้ม (หัวมอน: ","color":"gray"},{"score":{"name":"#t$(team)_head","objective":"team_boss_cnt"},"color":"aqua"},{"text":"/3)","color":"gray"}]
$tellraw @s [{"text":" • 🧭 Adventurer (โครงสร้าง/Sherd/ของโบราณ): ","color":"aqua"},{"score":{"name":"#t$(team)_c_adventurer","objective":"team_career_pts"},"color":"gold","bold":true},{"text":" แต้ม (Sherds: ","color":"gray"},{"score":{"name":"#t$(team)_sherd","objective":"team_boss_cnt"},"color":"aqua"},{"text":"/12)","color":"gray"}]
$tellraw @s [{"text":" ⭐ รวมคะแนนเช็กลิสต์อาชีพของทีม: ","color":"yellow","bold":true},{"score":{"name":"#team_$(team)","objective":"team_career_pts"},"color":"gold","bold":true},{"text":" แต้ม","color":"yellow"}]
