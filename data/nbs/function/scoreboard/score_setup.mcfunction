# ==========================================
# ติดตั้งตารางคะแนนและแถบแสดงผลข้างจอ (รันครั้งเดียวตอนโหลด)
# ==========================================
scoreboard objectives add team_score dummy {"text":"คะแนนทีม","color":"gold","bold":true}
scoreboard objectives add player_score dummy
scoreboard objectives add item_count dummy
scoreboard objectives add item_value dummy
scoreboard objectives add chest_score dummy

# ตรวจจับการเปิดและวางกล่อง/ถัง
scoreboard objectives add open_chest minecraft.custom:minecraft.open_chest
scoreboard objectives add open_barrel minecraft.custom:minecraft.open_barrel
scoreboard objectives add place_chest minecraft.used:minecraft.chest
scoreboard objectives add place_trapped minecraft.used:minecraft.trapped_chest
scoreboard objectives add place_barrel minecraft.used:minecraft.barrel

# ==========================================
# ตัวแปรสำหรับระบบสมุดสถิติ (Stats Book) และคะแนนบอส
# ==========================================
scoreboard objectives add stat_dragon dummy {"text":"Ender Dragon","color":"light_purple"}
scoreboard objectives add stat_wither dummy {"text":"Wither","color":"dark_gray"}
scoreboard objectives add stat_warden dummy {"text":"Warden","color":"aqua"}
scoreboard objectives add stat_elder dummy {"text":"Elder Guardian","color":"blue"}
scoreboard objectives add stat_raid dummy {"text":"Illager Raid","color":"gold"}
scoreboard objectives add stat_trial dummy {"text":"Ominous Trial Chamber","color":"green"}

# ตัวแปรเก็บคะแนนที่คูณแล้วของแต่ละหมวด
scoreboard objectives add pts_dragon dummy
scoreboard objectives add pts_wither dummy
scoreboard objectives add pts_warden dummy
scoreboard objectives add pts_elder dummy
scoreboard objectives add pts_raid dummy
scoreboard objectives add pts_trial dummy

# ตัวตรวจจับเหตุการณ์จริงจากระบบของเกม
scoreboard objectives add raw_kill_dragon minecraft.killed:minecraft.ender_dragon
scoreboard objectives add raw_kill_wither minecraft.killed:minecraft.wither
scoreboard objectives add raw_kill_warden minecraft.killed:minecraft.warden
scoreboard objectives add raw_kill_elder minecraft.killed:minecraft.elder_guardian
scoreboard objectives add raw_win_raid minecraft.custom:minecraft.raid_win
scoreboard objectives add player_kills playerKillCount
scoreboard objectives add player_deaths deathCount
scoreboard objectives add death_track deathCount
scoreboard objectives add time_since_death minecraft.custom:minecraft.time_since_death
scoreboard objectives add rnd_temp dummy
scoreboard objectives add player_hp health

# สิทธิ์เปิดดูสมุดสถิติ
scoreboard objectives add view_stats trigger

# แสดงผลคะแนนทีมด้านข้างจอ
scoreboard objectives setdisplay sidebar team_score

# ตั้งค่าเริ่มต้นให้มีชื่อทีมปรากฏบนตารางข้างจอ
scoreboard players set ทีมที่_1 team_score 0
scoreboard players set ทีมที่_2 team_score 0
scoreboard players set ทีมที่_3 team_score 0
scoreboard players set ทีมที่_4 team_score 0