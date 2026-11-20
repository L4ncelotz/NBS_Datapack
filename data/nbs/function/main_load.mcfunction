say Welcome
function nbs:scoreboard/score_setup
function nbs:team/team_setup
function nbs:border/border_setup

# สร้าง Scoreboard ระบบสถานะเกม, Raid Day, The Citadel และสายอาชีพ
scoreboard objectives add game_state dummy
scoreboard objectives add join_team trigger
scoreboard objectives add citadel trigger
scoreboard objectives add career trigger
scoreboard objectives add career_id dummy
scoreboard objectives add combat_tag dummy
scoreboard objectives add pvp_cd dummy
scoreboard players add #game_state game_state 0
scoreboard players add #raid_day game_state 0

# สร้าง Scoreboard ตรวจจับการวางธงอาณาเขตแยกตามสีทีม (แดง, น้ำเงิน, เขียว, เหลือง)
scoreboard objectives add place_flag_1 minecraft.used:minecraft.red_banner
scoreboard objectives add place_flag_2 minecraft.used:minecraft.blue_banner
scoreboard objectives add place_flag_3 minecraft.used:minecraft.green_banner
scoreboard objectives add place_flag_4 minecraft.used:minecraft.yellow_banner
scoreboard objectives add team_id dummy
scoreboard objectives add flag_count dummy
scoreboard objectives add check_flag trigger
scoreboard objectives add flag_x dummy
scoreboard objectives add flag_y dummy
scoreboard objectives add flag_z dummy

# สร้างตัวปักหมุดจุด Spawn (ถ้ายังไม่มีในโลก)
# หมายเหตุ: หากต้องการย้ายจุด Spawn ใหม่ ให้พิมพ์ /kill @e[tag=spawn_anchor] แล้วใช้คำสั่ง /summon minecraft:marker ~ ~ ~ {Tags:["spawn_anchor"]} ตรงจุดเกิดใหม่
execute unless entity @e[tag=spawn_anchor] run summon minecraft:marker 0 64 0 {Tags:["spawn_anchor"]}
