# สุ่มวาร์ปออกไปในป่า รัศมี 5,000 บล็อก (กระจายตัว 4 ทิศทาง ไม่ตกในสปอว์น 100%)
function nbs:rtp/do_spread

# ให้สถานะกันดาเมจตกจากที่สูงและดาเมจทุกชนิด 5 วินาที
effect give @s minecraft:resistance 5 255 true
effect give @s minecraft:slow_falling 5 1 true
effect give @s minecraft:fire_resistance 5 1 true

# ปลดแท็กการตายออก
tag @s remove just_died

# แจ้งเตือนผู้เล่น
title @s times 10 50 20
title @s title {"text":"สุ่มเกิดใหม่ในป่า!","color":"red","bold":true}
title @s subtitle {"text":"ไม่พบจุดเกิดเตียง จึงสุ่มวาร์ปกลางป่า 5,000 บล็อก","color":"gold"}
playsound minecraft:item.chorus_fruit.teleport master @s ~ ~ ~ 1 1
