# คัดลอกเลข team_id ของหมุดต้นนี้ไปเก็บไว้ในตัวแปรกลางชั่วคราว
scoreboard players operation #current_flag team_id = @s team_id

# สั่งให้ผู้เล่นทุกคนในระยะ 32 บล็อก (ที่อยู่นอกเขต in_spawn) เทียบเลข team_id ของตัวเองกับหมุดต้นนี้
# ถ้าเลขไม่เท่ากัน (คนละทีม) หรือผู้เล่นคนนั้นยังไม่มีทีม (team_id = 0) ให้ติดแท็ก in_enemy_territory
execute as @a[distance=..32,tag=!in_spawn] unless score @s team_id = #current_flag team_id run tag @s add in_enemy_territory
execute as @a[distance=..32,tag=!in_spawn,scores={team_id=0}] run tag @s add in_enemy_territory