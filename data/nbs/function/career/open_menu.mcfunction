# เมนูเลือกสายอาชีพ (/trigger career set 99)
tellraw @s {"text":"========================================","color":"dark_gray","bold":true}
tellraw @s {"text":" 🛠️ เลือกสายอาชีพ (Career Path)","color":"gold","bold":true}
tellraw @s {"text":"========================================","color":"dark_gray","bold":true}
tellraw @s [{"text":"  [ 🌾 เกษตรกร (Farmer) ] ","color":"green","bold":true,"click_event":{"action":"run_command","command":"/trigger career set 1"}},{"text":"— ถือจอบ Main-hand ได้ Haste I + Saturation","color":"gray"}]
tellraw @s [{"text":"  [ ⚒️ ช่างตีเหล็ก (Blacksmith) ] ","color":"white","bold":true,"click_event":{"action":"run_command","command":"/trigger career set 2"}},{"text":"— เลือด ≤ 5 หัวใจ ได้ Fire Resistance","color":"gray"}]
tellraw @s [{"text":"  [ ⚔️ นักล่ามอนสเตอร์ (Hunter) ] ","color":"red","bold":true,"click_event":{"action":"run_command","command":"/trigger career set 3"}},{"text":"— Night Vision + Strength I (PvE)","color":"gray"}]
tellraw @s [{"text":"  [ 🧭 นักผจญภัย (Adventurer) ] ","color":"aqua","bold":true,"click_event":{"action":"run_command","command":"/trigger career set 4"}},{"text":"— Speed I + Dolphin's Grace (นอก PvP)","color":"gray"}]
tellraw @s {"text":"========================================","color":"dark_gray","bold":true}
