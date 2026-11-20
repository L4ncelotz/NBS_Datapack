# ตรวจว่าทีม $(team) มีพิกัดจุดเกิดใน storage หรือยัง:
# - ถ้ามีแล้ว (สมาชิกคนที่ 2, 3, 4 หรือคนเข้าทีหลัง) -> วาร์ปไปพิกัดจุดเกิดทีมเดิมทันที
$execute if data storage nbs:game team_spawn.t$(team) run function nbs:rtp/tp_coords with storage nbs:game team_spawn.t$(team)

# - ถ้ายังไม่มี (สมาชิกคนแรกของทีม) -> สุ่มวาร์ปผู้เล่น (@s) ไปในป่าโดยตรงแล้วบันทึกพิกัดของ @s เก็บไว้ให้เพื่อนร่วมทีม
$execute unless data storage nbs:game team_spawn.t$(team) run function nbs:rtp/init_team_spawn {team:$(team)}
