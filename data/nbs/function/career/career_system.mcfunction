# ==========================================
# ระบบ 4 สายอาชีพประจำทีม (1 ทีม = 1 สายอาชีพร่วมกัน), Passive Perks, Combat Tag และ Team Milestones
# ==========================================
scoreboard players add @a career_id 0
scoreboard players add @a combat_tag 0
scoreboard players add @a blacksmith_cd 0
scoreboard players remove @a[scores={combat_tag=1..}] combat_tag 1

# ลดเวลาคูลดาวน์ Perk กันไฟของ Blacksmith ทุกๆ 1 วินาที (20 ticks)
scoreboard players add #perk_sec_tick rnd_temp 1
execute if score #perk_sec_tick rnd_temp matches 20.. run scoreboard players remove @a[scores={blacksmith_cd=1..}] blacksmith_cd 1
execute if score #perk_sec_tick rnd_temp matches 20.. run scoreboard players set #perk_sec_tick rnd_temp 0

# ตรวจจับฉุกเฉิน Blacksmith (เลือด <= 10): ได้รับ Fire Resistance 10 วินาทีครั้งเดียว (ไม่แจกซ้ำค้างในลาวา)
execute as @a[scores={career_id=2,player_hp=1..10,blacksmith_cd=..0},tag=!blacksmith_fire_used] at @s run function nbs:career/trigger_blacksmith_perk

# รีชาร์จ Perk เมื่อฟื้นฟูเลือดกลับมาเกิน 5 หัวใจ (HP >= 11) และหมดคูลดาวน์แล้ว
execute as @a[scores={career_id=2,player_hp=11..,blacksmith_cd=..0},tag=blacksmith_fire_used] run tag @s remove blacksmith_fire_used

scoreboard players enable @a career

# 1. ดูสรุปเช็กลิสต์ (set 98) หรือดูรายชื่อทีมและอาชีพ (set 97) — สามารถดูได้ตลอดเวลา
execute as @a[scores={career=98}] run function nbs:career/show_checklist
execute as @a[scores={career=97}] run function nbs:team/show_roster

# 2. เปิดเมนูสายอาชีพ (/trigger career หรือ set 1 / set 99)
# 2.1 ช่วง Waiting Room (#game_state == 0) หรือผู้เล่นที่ทีมยังไม่ได้เลือกสาย (career_id == 0)
execute if score #game_state game_state matches 0 as @a[scores={career=1}] run function nbs:career/open_menu
execute if score #game_state game_state matches 0 as @a[scores={career=99}] run function nbs:career/open_menu
execute if score #game_state game_state matches 1.. as @a[scores={career=1,career_id=0}] run function nbs:career/open_menu
execute if score #game_state game_state matches 1.. as @a[scores={career=99,career_id=0}] run function nbs:career/open_menu

# 2.2 เมื่อเกมเริ่มแล้ว (#game_state >= 1) และทีมมีสายอาชีพอยู่แล้ว -> แสดงข้อมูลสายอาชีพที่ล็อกถาวรไว้
execute if score #game_state game_state matches 1.. as @a[scores={career=1,career_id=1..4}] run function nbs:career/show_locked_career
execute if score #game_state game_state matches 1.. as @a[scores={career=99,career_id=1..4}] run function nbs:career/show_locked_career

# 3. เลือกสายอาชีพประจำทีม (11=Farmer, 12=Blacksmith, 13=Monster Hunter, 14=Adventurer)
# 3.1 กรณีอยู่ใน Waiting Room (#game_state == 0) -> เลือกหรือเปลี่ยนสายอาชีพให้ทั้งทีมได้อย่างอิสระ
execute if score #game_state game_state matches 0 as @a[scores={career=11}] run function nbs:career/set_team_career {cid:1,icon:"🌾",name:"เกษตรกร (Farmer)",color:"green",perk:"ถือจอบใน Main-hand ได้ Haste I + Saturation"}
execute if score #game_state game_state matches 0 as @a[scores={career=12}] run function nbs:career/set_team_career {cid:2,icon:"⚒️",name:"ช่างตีเหล็ก (Blacksmith)",color:"white",perk:"เมื่อเลือด ≤ 5 หัวใจ ได้รับ Fire Resistance 10 วินาที (ฉุกเฉิน 1 ครั้ง)"}
execute if score #game_state game_state matches 0 as @a[scores={career=13}] run function nbs:career/set_team_career {cid:3,icon:"⚔️",name:"นักล่ามอนสเตอร์ (Hunter)",color:"red",perk:"Night Vision + Strength I (PvE)"}
execute if score #game_state game_state matches 0 as @a[scores={career=14}] run function nbs:career/set_team_career {cid:4,icon:"🧭",name:"นักผจญภัย (Adventurer)",color:"aqua",perk:"Speed I + Dolphin's Grace (นอก PvP)"}

# 3.2 กรณีเริ่มเกมแล้ว และทีมยังไม่มีสายอาชีพ (career_id == 0) -> อนุญาตให้เลือกกำหนดสายอาชีพของทีมครั้งแรก
execute if score #game_state game_state matches 1.. as @a[scores={career=11,career_id=0}] run function nbs:career/set_team_career {cid:1,icon:"🌾",name:"เกษตรกร (Farmer)",color:"green",perk:"ถือจอบใน Main-hand ได้ Haste I + Saturation"}
execute if score #game_state game_state matches 1.. as @a[scores={career=12,career_id=0}] run function nbs:career/set_team_career {cid:2,icon:"⚒️",name:"ช่างตีเหล็ก (Blacksmith)",color:"white",perk:"เมื่อเลือด ≤ 5 หัวใจ ได้รับ Fire Resistance 10 วินาที (ฉุกเฉิน 1 ครั้ง)"}
execute if score #game_state game_state matches 1.. as @a[scores={career=13,career_id=0}] run function nbs:career/set_team_career {cid:3,icon:"⚔️",name:"นักล่ามอนสเตอร์ (Hunter)",color:"red",perk:"Night Vision + Strength I (PvE)"}
execute if score #game_state game_state matches 1.. as @a[scores={career=14,career_id=0}] run function nbs:career/set_team_career {cid:4,icon:"🧭",name:"นักผจญภัย (Adventurer)",color:"aqua",perk:"Speed I + Dolphin's Grace (นอก PvP)"}

# 3.3 กรณีเกมเริ่มแล้ว และทีมมีสายอาชีพอยู่แล้ว แต่พยายามกดเปลี่ยนสายอาชีพ -> บล็อกและแจ้งเตือน
execute if score #game_state game_state matches 1.. as @a[scores={career=11..14,career_id=1..4}] run tellraw @s [{"text":"❌ [สายอาชีพ] ","color":"red","bold":true},{"text":"เกมเริ่มแล้ว! ไม่สามารถเปลี่ยนสายอาชีพของทีมได้ (ทีมของคุณสังกัดสายอาชีพนี้อย่างถาวร)","color":"yellow"}]
execute if score #game_state game_state matches 1.. as @a[scores={career=11..14,career_id=1..4}] at @s run playsound minecraft:block.note_block.bass player @s ~ ~ ~ 1 0.5

# รีเซ็ตตัวแปร trigger
scoreboard players set @a[scores={career=1..}] career 0

# 4. ซิงค์และส่งต่อสายอาชีพทีม (1 ทีม = 1 สายอาชีพ)
# Backward Compatibility: โอนสายอาชีพจากสมาชิกคนแรกเข้าทีม หาก #t<N>_career ยังเป็น 0
execute if score #t1_career career_id matches 0 as @a[scores={team_id=1,career_id=1..4},limit=1] run scoreboard players operation #t1_career career_id = @s career_id
execute if score #t2_career career_id matches 0 as @a[scores={team_id=2,career_id=1..4},limit=1] run scoreboard players operation #t2_career career_id = @s career_id
execute if score #t3_career career_id matches 0 as @a[scores={team_id=3,career_id=1..4},limit=1] run scoreboard players operation #t3_career career_id = @s career_id
execute if score #t4_career career_id matches 0 as @a[scores={team_id=4,career_id=1..4},limit=1] run scoreboard players operation #t4_career career_id = @s career_id
execute if score #t5_career career_id matches 0 as @a[scores={team_id=5,career_id=1..4},limit=1] run scoreboard players operation #t5_career career_id = @s career_id
execute if score #t6_career career_id matches 0 as @a[scores={team_id=6,career_id=1..4},limit=1] run scoreboard players operation #t6_career career_id = @s career_id
execute if score #t7_career career_id matches 0 as @a[scores={team_id=7,career_id=1..4},limit=1] run scoreboard players operation #t7_career career_id = @s career_id
execute if score #t8_career career_id matches 0 as @a[scores={team_id=8,career_id=1..4},limit=1] run scoreboard players operation #t8_career career_id = @s career_id

# ซิงค์ค่า #t<N>_career ให้สมาชิกทุกคนในทีมเสมอ
execute if score #t1_career career_id matches 1..4 run scoreboard players operation @a[scores={team_id=1}] career_id = #t1_career career_id
execute if score #t2_career career_id matches 1..4 run scoreboard players operation @a[scores={team_id=2}] career_id = #t2_career career_id
execute if score #t3_career career_id matches 1..4 run scoreboard players operation @a[scores={team_id=3}] career_id = #t3_career career_id
execute if score #t4_career career_id matches 1..4 run scoreboard players operation @a[scores={team_id=4}] career_id = #t4_career career_id
execute if score #t5_career career_id matches 1..4 run scoreboard players operation @a[scores={team_id=5}] career_id = #t5_career career_id
execute if score #t6_career career_id matches 1..4 run scoreboard players operation @a[scores={team_id=6}] career_id = #t6_career career_id
execute if score #t7_career career_id matches 1..4 run scoreboard players operation @a[scores={team_id=7}] career_id = #t7_career career_id
execute if score #t8_career career_id matches 1..4 run scoreboard players operation @a[scores={team_id=8}] career_id = #t8_career career_id
scoreboard players set @a[scores={team_id=0}] career_id 0

# 5. แจก Passive Perks ทุกๆ 40 Tick (2 วินาที) เพื่อไม่ให้กิน TPS
scoreboard players add #career_tick rnd_temp 1
execute if score #career_tick rnd_temp matches 40.. run function nbs:career/apply_perks
