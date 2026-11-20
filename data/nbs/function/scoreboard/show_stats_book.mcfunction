# ติดแท็กชั่วคราวให้ผู้เล่นที่เปิดดูสถิติเพื่อให้ส่งข้อความกลับถูกคน
tag @s add viewing_stats

tellraw @s {"text":"========================================","color":"dark_gray","bold":true}
tellraw @s {"text":" 📖 สมุดบันทึกสถิติการผจญภัย NBs SMP","color":"gold","bold":true}
tellraw @s {"text":"========================================","color":"dark_gray","bold":true}

execute as @a run function nbs:scoreboard/print_player_stats

tellraw @s {"text":"========================================","color":"dark_gray","bold":true}
tag @s remove viewing_stats
