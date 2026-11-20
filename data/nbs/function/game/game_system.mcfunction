# ==========================================
# ระบบสถานะเกม (Waiting Lobby -> Active Game)
# ==========================================

# ตรวจสอบว่าผู้เล่นมีสมุดเลือกทีมอยู่ในตัวหรือไม่ (ป้องกันการแจกซ้ำรัวๆ)
scoreboard players set @a has_book 0
execute as @a store result score @s has_book run clear @s minecraft:written_book[custom_data={team_book:1b}] 0

# กรณีที่ 1: ช่วง Waiting / Lobby (#game_state == 0)
# แจกสมุดเลือกทีมให้ผู้เล่นที่ยังไม่มีสมุด
execute if score #game_state game_state matches 0 as @a[scores={has_book=0}] run function nbs:game/give_team_book

# กรณีที่ 2: เกมเริ่มแล้ว (#game_state == 1) — จัดการผู้เล่นที่เข้ามาทีหลัง (Late Join)
# 2.1 ถ้ายังไม่มีทีม (team_id == 0) -> แจกสมุดเลือกทีมให้เลือกก่อน
execute if score #game_state game_state matches 1 as @a[tag=!rtp_joined,scores={team_id=0,has_book=0}] run function nbs:game/give_team_book
execute if score #game_state game_state matches 1 as @a[tag=!rtp_joined,scores={team_id=0}] run title @s actionbar {"text":"เปิดสมุดในมือเพื่อเลือกทีมก่อนเข้าสู่เกม!","color":"yellow"}

# 2.2 ถ้าเลือกทีมแล้ว (team_id 1-4) -> ลบสมุดออกและวาร์ปไปจุดเกิดทีมทันที
execute if score #game_state game_state matches 1 as @a[tag=!rtp_joined,scores={team_id=1..4}] at @s run function nbs:rtp/join_team_spawn
