# ปรับจำนวนทีมที่เปิดใช้งานแบบ 1-Click (/function nbs:team/set_count {count:4})
function nbs:team/ensure_defaults
$scoreboard players set #target_cnt rnd_temp $(count)

# Type-Safe Clamp 1..8
execute if score #target_cnt rnd_temp matches ..0 run scoreboard players set #target_cnt rnd_temp 1
execute if score #target_cnt rnd_temp matches 9.. run scoreboard players set #target_cnt rnd_temp 8

# อัปเดตสถานะทีม 1-8 ตามจำนวนเป้าหมาย (และนำผู้เล่นออกจากทีมที่ถูกปิดทันที)
execute if score #target_cnt rnd_temp matches 1.. run scoreboard players set #t1_active game_state 1

execute if score #target_cnt rnd_temp matches 2.. run scoreboard players set #t2_active game_state 1
execute if score #target_cnt rnd_temp matches ..1 run scoreboard players set #t2_active game_state 0
execute if score #target_cnt rnd_temp matches ..1 as @a[team=team_2] run function nbs:team/kick_inactive_team

execute if score #target_cnt rnd_temp matches 3.. run scoreboard players set #t3_active game_state 1
execute if score #target_cnt rnd_temp matches ..2 run scoreboard players set #t3_active game_state 0
execute if score #target_cnt rnd_temp matches ..2 as @a[team=team_3] run function nbs:team/kick_inactive_team

execute if score #target_cnt rnd_temp matches 4.. run scoreboard players set #t4_active game_state 1
execute if score #target_cnt rnd_temp matches ..3 run scoreboard players set #t4_active game_state 0
execute if score #target_cnt rnd_temp matches ..3 as @a[team=team_4] run function nbs:team/kick_inactive_team

execute if score #target_cnt rnd_temp matches 5.. run scoreboard players set #t5_active game_state 1
execute if score #target_cnt rnd_temp matches ..4 run scoreboard players set #t5_active game_state 0
execute if score #target_cnt rnd_temp matches ..4 as @a[team=team_5] run function nbs:team/kick_inactive_team

execute if score #target_cnt rnd_temp matches 6.. run scoreboard players set #t6_active game_state 1
execute if score #target_cnt rnd_temp matches ..5 run scoreboard players set #t6_active game_state 0
execute if score #target_cnt rnd_temp matches ..5 as @a[team=team_6] run function nbs:team/kick_inactive_team

execute if score #target_cnt rnd_temp matches 7.. run scoreboard players set #t7_active game_state 1
execute if score #target_cnt rnd_temp matches ..6 run scoreboard players set #t7_active game_state 0
execute if score #target_cnt rnd_temp matches ..6 as @a[team=team_7] run function nbs:team/kick_inactive_team

execute if score #target_cnt rnd_temp matches 8.. run scoreboard players set #t8_active game_state 1
execute if score #target_cnt rnd_temp matches ..7 run scoreboard players set #t8_active game_state 0
execute if score #target_cnt rnd_temp matches ..7 as @a[team=team_8] run function nbs:team/kick_inactive_team

# คงตัวนับปลอม ทีมที่_1..8 ให้อยู่ใน Vanilla Team ของตัวเองสำหรับสี Sidebar
team join team_1 ทีมที่_1
team join team_2 ทีมที่_2
team join team_3 ทีมที่_3
team join team_4 ทีมที่_4
team join team_5 ทีมที่_5
team join team_6 ทีมที่_6
team join team_7 ทีมที่_7
team join team_8 ทีมที่_8

function nbs:team/refresh_all_styles
$tellraw @a [{"text":"⚙️ [ระบบทีม] ","color":"gold","bold":true},{"text":"ปรับจำนวนทีมที่เปิดใช้งานเป็น ","color":"gray"},{"text":"$(count) ทีม","color":"green","bold":true},{"text":" เรียบร้อยแล้ว!","color":"gray"}]
function nbs:team/admin_menu
