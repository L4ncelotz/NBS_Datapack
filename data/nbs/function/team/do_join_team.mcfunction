# นำผู้เล่นเข้าสู่ทีม $(team) พร้อมแสดงชื่อทีมและสีจริงที่ตั้งไว้
$team join team_$(team) @s
$scoreboard players set @s team_id $(team)
$scoreboard players operation @s career_id = #t$(team)_career career_id
$tellraw @s [{"text":"[NBs SMP] ","color":"green","bold":true},{"text":"คุณได้เข้าร่วมทีม ","color":"yellow"},{"text":"$(name)","color":"$(color)","bold":true}]

$execute if score #t$(team)_career career_id matches 1 run tellraw @s [{"text":"🌾 [สายอาชีพทีม] ","color":"green","bold":true},{"text":"ทีมนี้สังกัดสายอาชีพ ","color":"gray"},{"text":"เกษตรกร (Farmer)","color":"green","bold":true},{"text":" — คุณได้รับ Perk และแชร์คะแนนร่วมกับทีม","color":"yellow"}]
$execute if score #t$(team)_career career_id matches 2 run tellraw @s [{"text":"⚒️ [สายอาชีพทีม] ","color":"white","bold":true},{"text":"ทีมนี้สังกัดสายอาชีพ ","color":"gray"},{"text":"ช่างตีเหล็ก (Blacksmith)","color":"white","bold":true},{"text":" — คุณได้รับ Perk และแชร์คะแนนร่วมกับทีม","color":"yellow"}]
$execute if score #t$(team)_career career_id matches 3 run tellraw @s [{"text":"⚔️ [สายอาชีพทีม] ","color":"red","bold":true},{"text":"ทีมนี้สังกัดสายอาชีพ ","color":"gray"},{"text":"นักล่ามอนสเตอร์ (Hunter)","color":"red","bold":true},{"text":" — คุณได้รับ Perk และแชร์คะแนนร่วมกับทีม","color":"yellow"}]
$execute if score #t$(team)_career career_id matches 4 run tellraw @s [{"text":"🧭 [สายอาชีพทีม] ","color":"aqua","bold":true},{"text":"ทีมนี้สังกัดสายอาชีพ ","color":"gray"},{"text":"นักผจญภัย (Adventurer)","color":"aqua","bold":true},{"text":" — คุณได้รับ Perk และแชร์คะแนนร่วมกับทีม","color":"yellow"}]
$execute unless score #t$(team)_career career_id matches 1..4 run tellraw @s [{"text":"❓ [สายอาชีพทีม] ","color":"gold","bold":true},{"text":"ทีมนี้ยังไม่ได้เลือกสายอาชีพ! สามารถกด [🛠️ เลือกสายอาชีพ] เพื่อเลือกให้ทีมได้","color":"yellow"}]

execute at @s run playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 1 1.2
