# ==========================================
# ระบบการสังหารผู้เล่น (PvP Kill Drop & Cooldown)
# อนุญาตให้ PvP ดรอปป้ายชื่อคะแนนได้ตลอดเวลาทุกวัน (ยกเลิกข้อจำกัด Raid Day)
# ==========================================
scoreboard players add @a pvp_cd 0
scoreboard players add @a total_pvp_kills 0
scoreboard players remove @a[scores={pvp_cd=1..}] pvp_cd 1

# 1. การดรอปป้ายชื่อคะแนน (+15) เมื่อสังหารผู้เล่น
# 1.1 ดรอปป้ายชื่อคะแนน (+15) ที่จุดคนตาย (เฉพาะผู้เล่นที่ถูกฆ่าและไม่ติด Cooldown กันปั๊ม 5 นาที)
execute as @a[scores={killed_by_player=1..,pvp_cd=0}] at @s run summon minecraft:item ~ ~0.5 ~ {Item:{id:"minecraft:name_tag",count:1,components:{"minecraft:custom_data":{score_tag:1b},"minecraft:custom_name":{text:"ป้ายชื่อคะแนน (+15)",color:"gold",bold:true,italic:false},"minecraft:lore":[{text:"ได้รับจากการสังหารผู้เล่น",color:"gray",italic:false},{text:"มูลค่า 15 คะแนน",color:"yellow",italic:false},{text:"⚠️ ห้ามซ่อนใน Ender Chest",color:"red",italic:false}]}}}

# 1.2 กรณีคนตายหลุดออกเกมในจังหวะตายพอดี ให้ดรอปที่ตัวคนฆ่าแทน
execute as @a[scores={player_kills=1..}] unless entity @a[scores={killed_by_player=1..}] at @s run summon minecraft:item ~ ~0.5 ~ {Item:{id:"minecraft:name_tag",count:1,components:{"minecraft:custom_data":{score_tag:1b},"minecraft:custom_name":{text:"ป้ายชื่อคะแนน (+15)",color:"gold",bold:true,italic:false},"minecraft:lore":[{text:"ได้รับจากการสังหารผู้เล่น",color:"gray",italic:false},{text:"มูลค่า 15 คะแนน",color:"yellow",italic:false},{text:"⚠️ ห้ามซ่อนใน Ender Chest",color:"red",italic:false}]}}}

# 1.3 บวกสถิติ Top Killer เฉพาะเมื่อเหยื่อไม่ติด Cooldown กันปั๊ม
execute if entity @a[scores={killed_by_player=1..,pvp_cd=0}] as @a[scores={player_kills=1..}] run scoreboard players operation @s total_pvp_kills += @s player_kills
execute as @a[scores={killed_by_player=1..,pvp_cd=0}] at @s run tellraw @a [{"text":"⚔️ [PvP] ","color":"red","bold":true},{"selector":"@s","color":"yellow"},{"text":" ถูกสังหาร! ดรอป ","color":"gray"},{"text":"[ป้ายชื่อคะแนน +15]","color":"gold","bold":true}]
execute as @a[scores={player_kills=1..}] if entity @a[scores={killed_by_player=1..,pvp_cd=0}] at @s run playsound minecraft:entity.player.levelup master @a ~ ~ ~ 1 1.2

# แจ้งเตือนหากติด Cooldown กันปั๊ม Kill
execute if entity @a[scores={killed_by_player=1..,pvp_cd=1..}] as @a[scores={player_kills=1..}] run tellraw @s [{"text":"⏳ [PvP] ","color":"yellow","bold":true},{"text":"ผู้เล่นนี้เพิ่งถูกสังหารไปไม่นาน (ติด Cooldown 5 นาที) จึงไม่ดรอปป้ายชื่อคะแนน","color":"gray"}]

# ตั้ง Cooldown 5 นาที (6000 ticks) ให้เหยื่อที่เพิ่งดรอปป้ายชื่อ
scoreboard players set @a[scores={killed_by_player=1..,pvp_cd=0}] pvp_cd 6000

# 2. รีเซ็ตตัวตรวจจับรอบนั้น
scoreboard players set @a player_kills 0
scoreboard players set @a player_deaths 0
scoreboard players set @a killed_by_player 0
