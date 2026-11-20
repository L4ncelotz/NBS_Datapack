# ดึงค่าพิกัด X, Y, Z ของหมุดธงต้นนี้แปลงเป็น "จำนวนเต็ม" ลงใน Scoreboard ชั่วคราว
execute store result score #pos flag_x run data get entity @s Pos[0]
execute store result score #pos flag_y run data get entity @s Pos[1]
execute store result score #pos flag_z run data get entity @s Pos[2]

# พิมพ์ข้อความส่งให้คนที่กดเช็ก (จัดรูปแบบตัวเลขจำนวนเต็มให้สวยงาม อ่านง่าย)
tellraw @p[scores={check_flag=1..}] ["",{"text":" • ธงอาณาเขตอยู่ที่พิกัด: ","color":"yellow"},{"text":"[ ","color":"dark_gray"},{"score":{"name":"#pos","objective":"flag_x"},"color":"aqua","bold":true},{"text":", ","color":"gray"},{"score":{"name":"#pos","objective":"flag_y"},"color":"aqua","bold":true},{"text":", ","color":"gray"},{"score":{"name":"#pos","objective":"flag_z"},"color":"aqua","bold":true},{"text":" ]","color":"dark_gray"}]