# ดึงชื่อจากไอเทมในมือหลัก (ที่ตั้งชื่อในทั่ง Anvil หรือสมุด Written Book) มาตั้งเป็นชื่อทีม $(team) ทันทีโดยไม่ต้องพิมพ์คำสั่ง!
data remove storage nbs:temp hand_name
data remove storage nbs:temp hand_rename

execute if data entity @s SelectedItem.components."minecraft:custom_name" run data modify storage nbs:temp hand_name set from entity @s SelectedItem.components."minecraft:custom_name"
execute unless data storage nbs:temp hand_name if data entity @s SelectedItem.components."minecraft:written_book_content".title run data modify storage nbs:temp hand_name set from entity @s SelectedItem.components."minecraft:written_book_content".title

# แปลงให้เป็น String เสมอ (Type-Safe กรณี Text Component เป็น Compound {text:"..."} หรือ Filterable {raw:"..."})
execute if data storage nbs:temp hand_name.text run data modify storage nbs:temp hand_name set from storage nbs:temp hand_name.text
execute if data storage nbs:temp hand_name.raw run data modify storage nbs:temp hand_name set from storage nbs:temp hand_name.raw

# ถ้าไม่พบชื่อไอเทมในมือ ให้แจ้งวิธีใช้งานอย่างชัดเจน
execute unless data storage nbs:temp hand_name run tellraw @s [{"text":"❌ [ระบบทีม] ","color":"red","bold":true},{"text":"ไม่พบชื่อไอเทมในมือ! ให้นำไอเทม (เช่น กระดาษ) ไปตั้งชื่อในทั่ง (Anvil) ถือไว้ในมือหลัก แล้วค่อยกดปุ่ม ","color":"yellow"},{"text":"[🏷️ใช้ชื่อไอเทมในมือ]","color":"aqua","bold":true}]
execute unless data storage nbs:temp hand_name run playsound minecraft:block.note_block.bass master @s ~ ~ ~ 1 0.8

# ถ้าพบชื่อไอเทม -> ตั้งเป็นชื่อทีมทันทีและเปิดเมนูใหม่
$execute if data storage nbs:temp hand_name run data modify storage nbs:temp hand_rename.team set value $(team)
execute if data storage nbs:temp hand_name run data modify storage nbs:temp hand_rename.name set from storage nbs:temp hand_name
execute if data storage nbs:temp hand_name run function nbs:team/rename with storage nbs:temp hand_rename
execute if data storage nbs:temp hand_name at @s run playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 1 1.3
