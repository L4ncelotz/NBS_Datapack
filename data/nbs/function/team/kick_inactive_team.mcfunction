# นำผู้เล่นออกจากทีมที่ถูกปิดใช้งานและแจ้งเตือนให้เลือกทีมใหม่
team leave @s
scoreboard players set @s team_id 0
tellraw @s [{"text":"⚠️ [ระบบทีม] ","color":"gold","bold":true},{"text":"ทีมเดิมของคุณถูกปิดใช้งานแล้ว กรุณาเลือกทีมใหม่","color":"yellow"}]
