# ==========================================
# ระบบสถานะเกม (Waiting Lobby -> Active Game) และสมุดคู่มือ (/trigger guide)
# ==========================================
scoreboard players enable @a guide
execute as @a[scores={guide=1..}] run function nbs:game/give_guide_book
scoreboard players set @a[scores={guide=1..}] guide 0

# กรณีที่ 1: ช่วง Waiting / Lobby (#game_state == 0)
# ดึงผู้เล่นที่เพิ่งเข้าโลกครั้งแรกแล้วยังอยู่นอกเขต The Citadel (0,0) มารวมตัวที่ลาน The Citadel
execute if score #game_state game_state matches 0 as @a[tag=!in_spawn,tag=!admin] at @e[tag=spawn_anchor,limit=1] run tp @s ~ ~ ~

# แจกสมุดเลือกทีมให้ผู้เล่นที่ยังไม่มีสมุด (ตรวจรวมถึงเมาส์ player.cursor ป้องกันเสกซ้ำตอนลากย้ายช่อง)
execute if score #game_state game_state matches 0 as @a unless items entity @s container.* minecraft:written_book[custom_data={team_book:1b}] unless items entity @s weapon.offhand minecraft:written_book[custom_data={team_book:1b}] unless items entity @s player.cursor minecraft:written_book[custom_data={team_book:1b}] run function nbs:game/give_team_book

# กรณีที่ 2: เกมเริ่มแล้ว (#game_state == 1) — จัดการผู้เล่นที่เข้ามาทีหลัง (Late Join)
# 2.1 ถ้ายังไม่มีทีม (team_id == 0) -> ดึงมารอในเขต The Citadel และแจกสมุดเลือกทีมให้เลือกก่อน
execute if score #game_state game_state matches 1 as @a[tag=!rtp_joined,scores={team_id=0},tag=!in_spawn,tag=!admin] at @e[tag=spawn_anchor,limit=1] run tp @s ~ ~ ~
execute if score #game_state game_state matches 1 as @a[tag=!rtp_joined,scores={team_id=0}] unless items entity @s container.* minecraft:written_book[custom_data={team_book:1b}] unless items entity @s weapon.offhand minecraft:written_book[custom_data={team_book:1b}] unless items entity @s player.cursor minecraft:written_book[custom_data={team_book:1b}] run function nbs:game/give_team_book
execute if score #game_state game_state matches 1 as @a[tag=!rtp_joined,scores={team_id=0}] run title @s actionbar {"text":"เปิดสมุดในมือเพื่อเลือกทีมก่อนเข้าสู่เกม!","color":"yellow"}

# 2.2 ถ้าเลือกทีมแล้ว (team_id 1-4) -> ลบสมุดออกและวาร์ปไปจุดเกิดทีมทันที
execute if score #game_state game_state matches 1 as @a[tag=!rtp_joined,scores={team_id=1..4}] at @s run function nbs:rtp/join_team_spawn
