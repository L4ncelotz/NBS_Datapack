# ==========================================
# ระบบจัดการและซิงค์ทีม (Vanilla /team <-> Scoreboard team_id 1-8)
# ==========================================
scoreboard players enable @a join_team

# 1. เปิดเมนูรายชื่อทีมทั้งหมดที่เปิดอยู่ (/trigger join_team set 98)
execute as @a[scores={join_team=98}] run function nbs:team/open_join_menu

# 2. ประมวลผลคำสั่งเลือกทีม (1-8) เฉพาะทีมที่เปิดใช้งานอยู่ (#t<N>_active == 1)
execute as @a[scores={join_team=1..8}] run function nbs:team/try_join_team

# 3. ออกจากทีม (99)
execute as @a[scores={join_team=99}] run team leave @s
execute as @a[scores={join_team=99}] run tellraw @s [{"text":"[NBs SMP] ","color":"gray","bold":true},{"text":"คุณได้ออกจากทีมแล้ว","color":"yellow"}]

scoreboard players set @a[scores={join_team=1..}] join_team 0

# 4. ซิงค์ทีม Vanilla (/team) -> team_id เสมอ (รองรับทั้ง 1-8 ทีม)
execute as @a[team=team_1] run scoreboard players set @s team_id 1
execute as @a[team=team_2] run scoreboard players set @s team_id 2
execute as @a[team=team_3] run scoreboard players set @s team_id 3
execute as @a[team=team_4] run scoreboard players set @s team_id 4
execute as @a[team=team_5] run scoreboard players set @s team_id 5
execute as @a[team=team_6] run scoreboard players set @s team_id 6
execute as @a[team=team_7] run scoreboard players set @s team_id 7
execute as @a[team=team_8] run scoreboard players set @s team_id 8
execute as @a[team=] run scoreboard players set @s team_id 0
