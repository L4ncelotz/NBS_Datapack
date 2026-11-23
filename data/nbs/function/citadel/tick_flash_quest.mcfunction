# อัปเดตเวลานับถอยหลังเควสด่วน (รันวินาทีละ 1 ครั้งใน recalc_scores)

# 1. กรณีมีเควสด่วนเปิดอยู่ (#flash_timer >= 1)
execute if score #flash_timer rnd_temp matches 1.. run scoreboard players remove #flash_timer rnd_temp 1
execute if score #flash_timer rnd_temp matches 1.. store result bossbar nbs:flash_quest value run scoreboard players get #flash_timer rnd_temp
execute if score #flash_timer rnd_temp matches 1.. run bossbar set nbs:flash_quest players @a

# เมื่อหมดเวลา (ลดลงเหลือ 0 พอดีขณะ Bossbar ยังแสดงอยู่)
execute if score #flash_timer rnd_temp matches 0 store result score #bb_vis rnd_temp run bossbar get nbs:flash_quest visible
execute if score #flash_timer rnd_temp matches 0 if score #bb_vis rnd_temp matches 1 run bossbar set nbs:flash_quest visible false
execute if score #flash_timer rnd_temp matches 0 if score #bb_vis rnd_temp matches 1 run tellraw @a [{"text":"⌛ [เควสด่วน] ","color":"gray","bold":true},{"text":"หมดเวลาส่งเควสด่วนรอบนี้แล้ว! รอรอบถัดไป","color":"yellow"}]

# 2. กรณีไม่มีเควสด่วน และเกมเริ่มแล้ว (#game_state == 1) -> นับถอยหลังวันแรก (24 ชม.) ก่อนสุ่ม และหลังจบเควส 1 วันสุ่มรอบถัดไปต่อเนื่อง
execute if score #flash_timer rnd_temp matches 0 if score #game_state game_state matches 1 run scoreboard players remove #flash_cooldown rnd_temp 1
execute if score #flash_timer rnd_temp matches 0 if score #game_state game_state matches 1 if score #flash_cooldown rnd_temp matches ..0 run function nbs:citadel/start_flash_quest
