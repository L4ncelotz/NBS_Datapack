# ฝากเพชรเข้าธนาคารทีม (The Wealthiest) ครั้งละ $(amt) เม็ด
execute store result score #have_dia item_count run clear @s minecraft:diamond 0
$execute if score #have_dia item_count matches ..$(amt) unless score #have_dia item_count matches $(amt) run tellraw @s [{"text":"❌ [The Citadel] ","color":"red","bold":true},{"text":"เพชรในตัวไม่ถึง $(amt) เม็ด!","color":"yellow"}]
$execute if score #have_dia item_count matches $(amt).. run clear @s minecraft:diamond $(amt)
$execute if score #have_dia item_count matches $(amt).. if score @s team_id matches 1 run scoreboard players add #team_1 team_diamonds $(amt)
$execute if score #have_dia item_count matches $(amt).. if score @s team_id matches 2 run scoreboard players add #team_2 team_diamonds $(amt)
$execute if score #have_dia item_count matches $(amt).. if score @s team_id matches 3 run scoreboard players add #team_3 team_diamonds $(amt)
$execute if score #have_dia item_count matches $(amt).. if score @s team_id matches 4 run scoreboard players add #team_4 team_diamonds $(amt)
$execute if score #have_dia item_count matches $(amt).. run tellraw @s [{"text":"💎 [The Citadel] ","color":"aqua","bold":true},{"text":"ฝากเพชร $(amt) เม็ดเข้าธนาคารทีมเรียบร้อยแล้ว!","color":"green"}]
execute if score #have_dia item_count matches 16.. at @s run playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 1 1.4
