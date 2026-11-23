# ==========================================
# เคลียร์สถานะการแจ้งเตือนเมื่อไอเทมถูกนำออกจากกล่องนอกเขต หรือกล่องถูกทำลาย
# ==========================================
execute store result score #pos flag_x run data get entity @s Pos[0]
execute store result score #pos flag_y run data get entity @s Pos[1]
execute store result score #pos flag_z run data get entity @s Pos[2]

# แจ้งเตือนผู้เล่นว่าไอเท็มถูกนำออกไปแล้ว (เช็กว่าไม่มีหีบคู่ติดกันที่ยังซ่อนของอยู่)
execute unless entity @e[type=minecraft:marker,tag=hidden_chest,distance=0.1..1.5] run tellraw @a ["",{"text":"✨ [แจ้งเตือน] ","color":"green","bold":true},{"text":"ไอเท็มที่เคยซ่อนอยู่นอกอาณาเขตธงที่พิกัด ","color":"yellow"},{"text":"[ X: ","color":"gray"},{"score":{"name":"#pos","objective":"flag_x"},"color":"aqua","bold":true},{"text":", Y: ","color":"gray"},{"score":{"name":"#pos","objective":"flag_y"},"color":"aqua","bold":true},{"text":", Z: ","color":"gray"},{"score":{"name":"#pos","objective":"flag_z"},"color":"aqua","bold":true},{"text":" ]","color":"gray"},{"text":" ถูกนำออกไปแล้ว!","color":"green"}]
execute unless entity @e[type=minecraft:marker,tag=hidden_chest,distance=0.1..1.5] as @a at @s run playsound minecraft:block.amethyst_block.resonate master @s ~ ~ ~ 1 1.2

# ถอด forceload ปลดโหลด Chunk และล้างสถานะ
execute unless entity @e[type=minecraft:marker,tag=hidden_chest,distance=0.1..1.5] at @s run forceload remove ~ ~
tag @s remove hidden_chest
scoreboard players reset @s alert_timer
