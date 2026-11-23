# ==========================================
# เมนูแสดงข้อมูลสายอาชีพของทีมที่ล็อกไว้แล้ว (หลังจากเกมเริ่มแล้วจะไม่สามารถเปลี่ยนสายได้)
# ==========================================

tellraw @s {"text":"========================================","color":"dark_gray","bold":true}
tellraw @s {"text":" 🛠️ สายอาชีพประจำทีมของคุณ (ล็อกถาวรแล้ว)","color":"gold","bold":true}
tellraw @s {"text":" [สมาชิกทุกคนในทีมได้รับ Perk เดียวกันและแชร์แต้มร่วมกัน]","color":"yellow","italic":true}
tellraw @s {"text":"========================================","color":"dark_gray","bold":true}

execute if score @s career_id matches 1 run tellraw @s [{"text":"  สายอาชีพของทีม: ","color":"gray"},{"text":"🌾 เกษตรกร (Farmer)","color":"green","bold":true},{"text":" (ล็อกแล้ว)","color":"red"}]
execute if score @s career_id matches 1 run tellraw @s [{"text":"  Passive Perk: ","color":"gray"},{"text":"ถือจอบใน Main-hand ได้ Haste I + Saturation (ทำงานทั้งทีม)","color":"yellow"}]

execute if score @s career_id matches 2 run tellraw @s [{"text":"  สายอาชีพของทีม: ","color":"gray"},{"text":"⚒️ ช่างตีเหล็ก (Blacksmith)","color":"white","bold":true},{"text":" (ล็อกแล้ว)","color":"red"}]
execute if score @s career_id matches 2 run tellraw @s [{"text":"  Passive Perk: ","color":"gray"},{"text":"เมื่อเลือด ≤ 5 หัวใจ ได้รับ Fire Resistance 10 วินาที (ฉุกเฉิน 1 ครั้ง)","color":"yellow"}]

execute if score @s career_id matches 3 run tellraw @s [{"text":"  สายอาชีพของทีม: ","color":"gray"},{"text":"⚔️ นักล่ามอนสเตอร์ (Hunter)","color":"red","bold":true},{"text":" (ล็อกแล้ว)","color":"red"}]
execute if score @s career_id matches 3 run tellraw @s [{"text":"  Passive Perk: ","color":"gray"},{"text":"Night Vision + Strength I (PvE) (ทำงานทั้งทีม)","color":"yellow"}]

execute if score @s career_id matches 4 run tellraw @s [{"text":"  สายอาชีพของทีม: ","color":"gray"},{"text":"🧭 นักผจญภัย (Adventurer)","color":"aqua","bold":true},{"text":" (ล็อกแล้ว)","color":"red"}]
execute if score @s career_id matches 4 run tellraw @s [{"text":"  Passive Perk: ","color":"gray"},{"text":"Speed I + Dolphin's Grace (นอก PvP) (ทำงานทั้งทีม)","color":"yellow"}]

tellraw @s [{"text":"  ⚠️ หมายเหตุ: ","color":"gold"},{"text":"ไม่สามารถเปลี่ยนสายอาชีพได้หลังจากเริ่มเกม","color":"gray"}]
tellraw @s [{"text":"  📋 [ คลิกดูสรุปคะแนนเช็กลิสต์อาชีพของทีม ]","color":"yellow","bold":true,"click_event":{"action":"run_command","command":"/trigger career set 98"}}]
tellraw @s {"text":"========================================","color":"dark_gray","bold":true}
