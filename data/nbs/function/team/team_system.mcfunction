# ==========================================
# ระบบจัดการและซิงค์ทีม (Vanilla /team <-> Scoreboard team_id)
# ==========================================
scoreboard players enable @a join_team

# 1. ประมวลผลคำสั่งเลือกทีมจากสมุด (หรือ /trigger join_team set <1-4 | 99>)
execute as @a[scores={join_team=1}] run team join team_1 @s
execute as @a[scores={join_team=1}] run tellraw @s [{"text":"[NBs SMP] ","color":"green","bold":true},{"text":"คุณได้เข้าร่วม ","color":"yellow"},{"text":"Team 1","color":"red","bold":true}]
execute as @a[scores={join_team=1}] at @s run playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 1 1.2

execute as @a[scores={join_team=2}] run team join team_2 @s
execute as @a[scores={join_team=2}] run tellraw @s [{"text":"[NBs SMP] ","color":"green","bold":true},{"text":"คุณได้เข้าร่วม ","color":"yellow"},{"text":"Team 2","color":"blue","bold":true}]
execute as @a[scores={join_team=2}] at @s run playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 1 1.2

execute as @a[scores={join_team=3}] run team join team_3 @s
execute as @a[scores={join_team=3}] run tellraw @s [{"text":"[NBs SMP] ","color":"green","bold":true},{"text":"คุณได้เข้าร่วม ","color":"yellow"},{"text":"Team 3","color":"green","bold":true}]
execute as @a[scores={join_team=3}] at @s run playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 1 1.2

execute as @a[scores={join_team=4}] run team join team_4 @s
execute as @a[scores={join_team=4}] run tellraw @s [{"text":"[NBs SMP] ","color":"green","bold":true},{"text":"คุณได้เข้าร่วม ","color":"yellow"},{"text":"Team 4","color":"yellow","bold":true}]
execute as @a[scores={join_team=4}] at @s run playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 1 1.2

execute as @a[scores={join_team=99}] run team leave @s
execute as @a[scores={join_team=99}] run tellraw @s [{"text":"[NBs SMP] ","color":"gray","bold":true},{"text":"คุณได้ออกจากทีมแล้ว","color":"yellow"}]

scoreboard players set @a[scores={join_team=1..}] join_team 0

# 2. ซิงค์ทีม Vanilla (/team) -> team_id เสมอ (รองรับทั้งการกดสมุดและ /team join ของแอดมิน)
execute as @a[team=team_1] run scoreboard players set @s team_id 1
execute as @a[team=team_2] run scoreboard players set @s team_id 2
execute as @a[team=team_3] run scoreboard players set @s team_id 3
execute as @a[team=team_4] run scoreboard players set @s team_id 4
execute as @a[team=] run scoreboard players set @s team_id 0
