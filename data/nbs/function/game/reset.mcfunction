# ==========================================
# คำสั่งรีเซ็ตเกมกลับสู่ Lobby สำหรับแอดมิน (/function nbs:game/reset)
# ==========================================
scoreboard players set #game_state game_state 0
scoreboard players set #raid_day game_state 0
kill @e[type=minecraft:marker,tag=team_spawn]
tag @a remove rtp_joined
tag @a remove just_died
clear @a minecraft:written_book[custom_data={guide_book:1b}]

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
data remove storage nbs:citadel flash
data remove storage nbs:citadel flash_done
data remove storage nbs:adv done
data remove storage nbs:career done
scoreboard players set #flash_timer rnd_temp 0
scoreboard players set #flash_first rnd_temp 0
scoreboard players set #flash_cooldown rnd_temp 1800
bossbar set nbs:flash_quest visible false

# วาร์ปผู้เล่นทุกคนกลับจุด Spawn / Lobby
execute at @e[tag=spawn_anchor,limit=1] run tp @a ~ ~ ~
tellraw @a [{"text":"↺ [NBs SMP] ","color":"yellow","bold":true},{"text":"รีเซ็ตกลับสู่หน้า Lobby แล้ว กรุณาเปิดสมุดเพื่อเลือกทีมใหม่!","color":"gray"}]
