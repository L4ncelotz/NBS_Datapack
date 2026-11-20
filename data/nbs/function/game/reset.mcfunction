# ==========================================
# คำสั่งรีเซ็ตเกมกลับสู่ Lobby สำหรับแอดมิน (/function nbs:game/reset)
# ==========================================
scoreboard players set #game_state game_state 0
scoreboard players set #raid_day game_state 0
kill @e[type=minecraft:marker,tag=team_spawn]
tag @a remove rtp_joined
tag @a remove just_died

# รีเซ็ตคะแนนซีซัน อาชีพ และเควสทีมทั้งหมด
scoreboard players set @a career_id 0
scoreboard players set @a combat_tag 0
scoreboard players set @a pvp_cd 0
scoreboard players set @a total_pvp_kills 0
scoreboard players reset * team_diamonds
scoreboard players reset * team_quest_pts
scoreboard players reset * team_adv_pts
scoreboard players reset * team_career_pts
scoreboard players reset * team_boss_cnt
data remove storage nbs:citadel quests
data remove storage nbs:adv done
data remove storage nbs:career done

# วาร์ปผู้เล่นทุกคนกลับจุด Spawn / Lobby
execute at @e[tag=spawn_anchor,limit=1] run tp @a ~ ~ ~
tellraw @a [{"text":"↺ [NBs SMP] ","color":"yellow","bold":true},{"text":"รีเซ็ตกลับสู่หน้า Lobby แล้ว กรุณาเปิดสมุดเพื่อเลือกทีมใหม่!","color":"gray"}]
