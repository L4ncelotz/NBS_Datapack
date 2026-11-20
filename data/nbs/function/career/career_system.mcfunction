# ==========================================
# ระบบ 4 สายอาชีพ, Passive Perks, Combat Tag และ Team Milestones
# ==========================================
scoreboard players add @a career_id 0
scoreboard players add @a combat_tag 0
scoreboard players remove @a[scores={combat_tag=1..}] combat_tag 1

scoreboard players enable @a career

# 1. เปิดเมนูเลือกสายอาชีพ (/trigger career set 99) หรือดูสรุปเช็กลิสต์ (/trigger career set 98)
execute as @a[scores={career=98}] run function nbs:career/show_checklist
execute as @a[scores={career=99}] run function nbs:career/open_menu

# 2. เลือกสายอาชีพ (1=Farmer, 2=Blacksmith, 3=Monster Hunter, 4=Adventurer)
execute as @a[scores={career=1}] run scoreboard players set @s career_id 1
execute as @a[scores={career=1}] run tellraw @s [{"text":"🌾 [สายอาชีพ] ","color":"green","bold":true},{"text":"คุณเลือกสาย ","color":"gray"},{"text":"เกษตรกร (Farmer)","color":"green","bold":true},{"text":" — Passive: ถือจอบใน Main-hand ได้ Haste I + Saturation","color":"yellow"}]

execute as @a[scores={career=2}] run scoreboard players set @s career_id 2
execute as @a[scores={career=2}] run tellraw @s [{"text":"⚒️ [สายอาชีพ] ","color":"gray","bold":true},{"text":"คุณเลือกสาย ","color":"gray"},{"text":"ช่างตีเหล็ก (Blacksmith)","color":"white","bold":true},{"text":" — Passive: เมื่อเลือด ≤ 5 หัวใจ ได้ Fire Resistance","color":"yellow"}]

execute as @a[scores={career=3}] run scoreboard players set @s career_id 3
execute as @a[scores={career=3}] run tellraw @s [{"text":"⚔️ [สายอาชีพ] ","color":"red","bold":true},{"text":"คุณเลือกสาย ","color":"gray"},{"text":"นักล่ามอนสเตอร์ (Monster Hunter)","color":"red","bold":true},{"text":" — Passive: Night Vision + Strength I (PvE)","color":"yellow"}]

execute as @a[scores={career=4}] run scoreboard players set @s career_id 4
execute as @a[scores={career=4}] run tellraw @s [{"text":"🧭 [สายอาชีพ] ","color":"aqua","bold":true},{"text":"คุณเลือกสาย ","color":"gray"},{"text":"นักผจญภัย (Adventurer)","color":"aqua","bold":true},{"text":" — Passive: Speed I + Dolphin's Grace (ปิดเมื่อติด PvP)","color":"yellow"}]

execute as @a[scores={career=1..4}] at @s run playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 1 1.2
scoreboard players set @a[scores={career=1..}] career 0

# 3. แจก Passive Perks ทุกๆ 40 Tick (2 วินาที) เพื่อไม่ให้กิน TPS
scoreboard players add #career_tick rnd_temp 1
execute if score #career_tick rnd_temp matches 40.. run function nbs:career/apply_perks
