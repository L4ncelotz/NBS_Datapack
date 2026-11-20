# ตรวจสอบไอเทมครบทั้ง 3 ชนิดก่อนหักของ (ป้องกันหักไปแล้วพบว่าชิ้นที่ 2-3 ไม่ครบ)
$execute store result score #c1 item_count run clear @s $(i1) 0
$execute store result score #c2 item_count run clear @s $(i2) 0
$execute store result score #c3 item_count run clear @s $(i3) 0
scoreboard players set #ok item_count 0
$execute if score #c1 item_count matches $(n1).. if score #c2 item_count matches $(n2).. if score #c3 item_count matches $(n3).. run scoreboard players set #ok item_count 1
$execute if score #ok item_count matches 0 run tellraw @s [{"text":"❌ [The Citadel] ","color":"red","bold":true},{"text":"ไอเทมไม่ครบสำหรับ $(name)! ต้องการ: $(req)","color":"yellow"}]
$execute if score #ok item_count matches 1 run clear @s $(i1) $(n1)
$execute if score #ok item_count matches 1 run clear @s $(i2) $(n2)
$execute if score #ok item_count matches 1 run clear @s $(i3) $(n3)
$execute if score #ok item_count matches 1 run function nbs:citadel/complete_quest {team:$(team),q:"$(q)",pts:$(pts),name:"$(name)"}
