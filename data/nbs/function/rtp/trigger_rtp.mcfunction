# คำสั่งวาร์ปสุ่มเกิดแบบแมนนวล (สำหรับแอดมินหรือทดสอบ)
function nbs:rtp/do_spread
effect give @s minecraft:resistance 5 255 true
effect give @s minecraft:slow_falling 5 1 true
effect give @s minecraft:fire_resistance 5 1 true
tellraw @s [{"text":"[NBs SMP] ","color":"green","bold":true},{"text":"สุ่มวาร์ปในพื้นที่โลก 5,000 บล็อกเรียบร้อยแล้ว!","color":"yellow"}]
playsound minecraft:item.chorus_fruit.teleport master @s ~ ~ ~ 1 1
