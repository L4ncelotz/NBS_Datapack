# ==========================================
# ระบบการสังหารผู้เล่น (PvP Kill Drop & Announcement)
# ==========================================

# 1. ดรอปป้ายชื่อคะแนนที่จุดคนตาย (เฉพาะผู้เล่นที่ถูกผู้เล่นคนอื่นสังหารจริง)
execute as @a[scores={killed_by_player=1..}] at @s run summon minecraft:item ~ ~0.5 ~ {Item:{id:"minecraft:name_tag",count:1,components:{"minecraft:custom_data":{score_tag:1b},"minecraft:custom_name":{text:"ป้ายชื่อคะแนน (+5)",color:"gold",bold:true,italic:false},"minecraft:lore":[{text:"ได้รับจากการสังหารผู้เล่น",color:"gray",italic:false},{text:"มูลค่า 5 คะแนน",color:"yellow",italic:false},{text:"⚠️ ห้ามซ่อนใน Ender Chest",color:"red",italic:false}]}}}

# 2. กรณีคนตายหลุดออกเกมในจังหวะตายพอดี ให้ดรอปที่ตัวคนฆ่าแทน
execute as @a[scores={player_kills=1..}] unless entity @a[scores={killed_by_player=1..}] at @s run summon minecraft:item ~ ~0.5 ~ {Item:{id:"minecraft:name_tag",count:1,components:{"minecraft:custom_data":{score_tag:1b},"minecraft:custom_name":{text:"ป้ายชื่อคะแนน (+5)",color:"gold",bold:true,italic:false},"minecraft:lore":[{text:"ได้รับจากการสังหารผู้เล่น",color:"gray",italic:false},{text:"มูลค่า 5 คะแนน",color:"yellow",italic:false},{text:"⚠️ ห้ามซ่อนใน Ender Chest",color:"red",italic:false}]}}}

# 3. แจ้งเตือนในแชตและเล่นเสียงเอฟเฟกต์
execute as @a[scores={player_kills=1..}] at @s run tellraw @a [{"text":"⚔️ [PvP] ","color":"red","bold":true},{"selector":"@s","color":"yellow"},{"text":" สังหารศัตรูสำเร็จ! ได้รับ ","color":"gray"},{"text":"[ป้ายชื่อคะแนน +5]","color":"gold","bold":true}]
execute as @a[scores={player_kills=1..}] at @s run playsound minecraft:entity.player.levelup master @a ~ ~ ~ 1 1.2

# 4. รีเซ็ตคะแนนรอบนั้น
scoreboard players set @a player_kills 0
scoreboard players set @a player_deaths 0
scoreboard players set @a killed_by_player 0
