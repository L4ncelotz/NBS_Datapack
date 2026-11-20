# เมนูจัดการทีมสำหรับแอดมิน (/function nbs:team/admin_menu) — เพิ่ม/ลดทีม, เปลี่ยนชื่อทีม, เปลี่ยนสีทีม
tellraw @s {"text":"========================================","color":"dark_gray","bold":true}
tellraw @s [{"text":" ⚙️ จัดการระบบทีม (Team Manager)  ","color":"gold","bold":true},{"text":"[ ➕ เพิ่มทีมใหม่ ]","color":"green","bold":true,"click_event":{"action":"run_command","command":"/function nbs:team/add_team"}}]
tellraw @s {"text":"========================================","color":"dark_gray","bold":true}

execute if score #t1_active game_state matches 1 run function nbs:team/print_admin_row with storage nbs:team t1
execute if score #t2_active game_state matches 1 run function nbs:team/print_admin_row with storage nbs:team t2
execute if score #t3_active game_state matches 1 run function nbs:team/print_admin_row with storage nbs:team t3
execute if score #t4_active game_state matches 1 run function nbs:team/print_admin_row with storage nbs:team t4
execute if score #t5_active game_state matches 1 run function nbs:team/print_admin_row with storage nbs:team t5
execute if score #t6_active game_state matches 1 run function nbs:team/print_admin_row with storage nbs:team t6
execute if score #t7_active game_state matches 1 run function nbs:team/print_admin_row with storage nbs:team t7
execute if score #t8_active game_state matches 1 run function nbs:team/print_admin_row with storage nbs:team t8

tellraw @s {"text":" 💡 กด [✏️เปลี่ยนชื่อ] แล้วพิมพ์ชื่อทีมใหม่ในช่องแชตได้เลย!","color":"gray"}
tellraw @s {"text":"========================================","color":"dark_gray","bold":true}
