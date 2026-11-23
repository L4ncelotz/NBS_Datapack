# ซื้อธงอาณาเขตเพิ่มในเขต The Citadel ราคา 32 Diamonds
execute store result score #have_dia item_count run clear @s minecraft:diamond 0
execute if score #have_dia item_count matches ..31 run tellraw @s [{"text":"❌ [The Citadel] ","color":"red","bold":true},{"text":"เพชรไม่พอ! การซื้อธงอาณาเขตต้องใช้ 32 Diamonds","color":"yellow"}]
execute if score #have_dia item_count matches 32.. run clear @s minecraft:diamond 32
execute if score #have_dia item_count matches 32.. run function nbs:territory/give_flag
execute if score #have_dia item_count matches 32.. run tellraw @s [{"text":"🚩 [The Citadel] ","color":"gold","bold":true},{"text":"ซื้อธงอาณาเขตด้วย 32 Diamonds สำเร็จ!","color":"green"}]
execute if score #have_dia item_count matches 32.. at @s run playsound minecraft:entity.player.levelup master @s ~ ~ ~ 1 1.3
