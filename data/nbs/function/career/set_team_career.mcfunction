# ==========================================
# ตั้งค่าสายอาชีพให้ทั้งทีม (1 ทีม = 1 สายอาชีพร่วมกัน)
# ==========================================
execute if score @s team_id matches 0 run tellraw @s [{"text":"❌ [สายอาชีพ] ","color":"red","bold":true},{"text":"คุณต้องเลือกทีมก่อน จึงจะเลือกสายอาชีพให้ทีมได้!","color":"yellow"}]
execute if score @s team_id matches 0 at @s run playsound minecraft:block.note_block.bass player @s ~ ~ ~ 1 0.5

# บันทึกสายอาชีพของทีม 1 ถึง 8 และอัปเดตสมาชิกทุกคนในทีมทันที
$execute if score @s team_id matches 1 run scoreboard players set #t1_career career_id $(cid)
$execute if score @s team_id matches 1 run scoreboard players set @a[scores={team_id=1}] career_id $(cid)

$execute if score @s team_id matches 2 run scoreboard players set #t2_career career_id $(cid)
$execute if score @s team_id matches 2 run scoreboard players set @a[scores={team_id=2}] career_id $(cid)

$execute if score @s team_id matches 3 run scoreboard players set #t3_career career_id $(cid)
$execute if score @s team_id matches 3 run scoreboard players set @a[scores={team_id=3}] career_id $(cid)

$execute if score @s team_id matches 4 run scoreboard players set #t4_career career_id $(cid)
$execute if score @s team_id matches 4 run scoreboard players set @a[scores={team_id=4}] career_id $(cid)

$execute if score @s team_id matches 5 run scoreboard players set #t5_career career_id $(cid)
$execute if score @s team_id matches 5 run scoreboard players set @a[scores={team_id=5}] career_id $(cid)

$execute if score @s team_id matches 6 run scoreboard players set #t6_career career_id $(cid)
$execute if score @s team_id matches 6 run scoreboard players set @a[scores={team_id=6}] career_id $(cid)

$execute if score @s team_id matches 7 run scoreboard players set #t7_career career_id $(cid)
$execute if score @s team_id matches 7 run scoreboard players set @a[scores={team_id=7}] career_id $(cid)

$execute if score @s team_id matches 8 run scoreboard players set #t8_career career_id $(cid)
$execute if score @s team_id matches 8 run scoreboard players set @a[scores={team_id=8}] career_id $(cid)

# แจ้งเตือนทุกคนในทีมว่าได้เลือกสายอาชีพร่วมกันแล้ว
$execute if score @s team_id matches 1 run tellraw @a[scores={team_id=1}] [{"text":"$(icon) [สายอาชีพทีม] ","color":"$(color)","bold":true},{"text":"ทีมของคุณเลือกสาย ","color":"gray"},{"text":"$(name)","color":"$(color)","bold":true},{"text":" — Passive: $(perk) (ทุกคนในทีมได้รับ Perk และแชร์คะแนนร่วมกัน)","color":"yellow"}]
$execute if score @s team_id matches 2 run tellraw @a[scores={team_id=2}] [{"text":"$(icon) [สายอาชีพทีม] ","color":"$(color)","bold":true},{"text":"ทีมของคุณเลือกสาย ","color":"gray"},{"text":"$(name)","color":"$(color)","bold":true},{"text":" — Passive: $(perk) (ทุกคนในทีมได้รับ Perk และแชร์คะแนนร่วมกัน)","color":"yellow"}]
$execute if score @s team_id matches 3 run tellraw @a[scores={team_id=3}] [{"text":"$(icon) [สายอาชีพทีม] ","color":"$(color)","bold":true},{"text":"ทีมของคุณเลือกสาย ","color":"gray"},{"text":"$(name)","color":"$(color)","bold":true},{"text":" — Passive: $(perk) (ทุกคนในทีมได้รับ Perk และแชร์คะแนนร่วมกัน)","color":"yellow"}]
$execute if score @s team_id matches 4 run tellraw @a[scores={team_id=4}] [{"text":"$(icon) [สายอาชีพทีม] ","color":"$(color)","bold":true},{"text":"ทีมของคุณเลือกสาย ","color":"gray"},{"text":"$(name)","color":"$(color)","bold":true},{"text":" — Passive: $(perk) (ทุกคนในทีมได้รับ Perk และแชร์คะแนนร่วมกัน)","color":"yellow"}]
$execute if score @s team_id matches 5 run tellraw @a[scores={team_id=5}] [{"text":"$(icon) [สายอาชีพทีม] ","color":"$(color)","bold":true},{"text":"ทีมของคุณเลือกสาย ","color":"gray"},{"text":"$(name)","color":"$(color)","bold":true},{"text":" — Passive: $(perk) (ทุกคนในทีมได้รับ Perk และแชร์คะแนนร่วมกัน)","color":"yellow"}]
$execute if score @s team_id matches 6 run tellraw @a[scores={team_id=6}] [{"text":"$(icon) [สายอาชีพทีม] ","color":"$(color)","bold":true},{"text":"ทีมของคุณเลือกสาย ","color":"gray"},{"text":"$(name)","color":"$(color)","bold":true},{"text":" — Passive: $(perk) (ทุกคนในทีมได้รับ Perk และแชร์คะแนนร่วมกัน)","color":"yellow"}]
$execute if score @s team_id matches 7 run tellraw @a[scores={team_id=7}] [{"text":"$(icon) [สายอาชีพทีม] ","color":"$(color)","bold":true},{"text":"ทีมของคุณเลือกสาย ","color":"gray"},{"text":"$(name)","color":"$(color)","bold":true},{"text":" — Passive: $(perk) (ทุกคนในทีมได้รับ Perk และแชร์คะแนนร่วมกัน)","color":"yellow"}]
$execute if score @s team_id matches 8 run tellraw @a[scores={team_id=8}] [{"text":"$(icon) [สายอาชีพทีม] ","color":"$(color)","bold":true},{"text":"ทีมของคุณเลือกสาย ","color":"gray"},{"text":"$(name)","color":"$(color)","bold":true},{"text":" — Passive: $(perk) (ทุกคนในทีมได้รับ Perk และแชร์คะแนนร่วมกัน)","color":"yellow"}]

execute if score @s team_id matches 1..8 at @s run playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 1 1.2
