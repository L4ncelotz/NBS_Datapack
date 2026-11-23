# เมนูเลือกสายอาชีพ (/trigger career) — 1 ทีม = 1 สายอาชีพร่วมกัน
tellraw @s {"text":"========================================","color":"dark_gray","bold":true}
tellraw @s {"text":" 🛠️ เลือกสายอาชีพประจำทีม (Team Career)","color":"gold","bold":true}
tellraw @s {"text":" [1 ทีม = 1 สายอาชีพ | ทุกคนในทีมแชร์ Perk & แต้มร่วมกัน]","color":"yellow","italic":true}
tellraw @s {"text":"========================================","color":"dark_gray","bold":true}
tellraw @s [{"text":"  [ 🌾 เกษตรกร (Farmer) ] ","color":"green","bold":true,"click_event":{"action":"run_command","command":"/trigger career set 11"}},{"text":"— ถือจอบ Main-hand ได้ Haste I + Saturation","color":"gray"}]
tellraw @s [{"text":"  [ ⚒️ ช่างตีเหล็ก (Blacksmith) ] ","color":"white","bold":true,"click_event":{"action":"run_command","command":"/trigger career set 12"}},{"text":"— เลือด ≤ 5 หัวใจ ได้รับ Fire Resistance 10 วิ (ฉุกเฉิน 1 ครั้ง)","color":"gray"}]
tellraw @s [{"text":"  [ ⚔️ นักล่ามอนสเตอร์ (Hunter) ] ","color":"red","bold":true,"click_event":{"action":"run_command","command":"/trigger career set 13"}},{"text":"— Night Vision + Strength I (PvE)","color":"gray"}]
tellraw @s [{"text":"  [ 🧭 นักผจญภัย (Adventurer) ] ","color":"aqua","bold":true,"click_event":{"action":"run_command","command":"/trigger career set 14"}},{"text":"— Speed I + Dolphin's Grace (นอก PvP)","color":"gray"}]
tellraw @s [{"text":"  📋 [ คลิกดูสรุปคะแนนเช็กลิสต์อาชีพของทีม ]","color":"yellow","bold":true,"click_event":{"action":"run_command","command":"/trigger career set 98"}}]
tellraw @s [{"text":"  ⚠️ หมายเหตุ: ","color":"gold"},{"text":"เมื่อเกมเริ่มแล้วจะไม่สามารถเปลี่ยนสายอาชีพของทีมได้!","color":"yellow","italic":true}]
tellraw @s {"text":"========================================","color":"dark_gray","bold":true}
