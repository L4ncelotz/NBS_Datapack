# สุ่มวาร์ปออกไปในป่า รัศมี 5,000 บล็อก (กระจายตัว 4 ทิศทาง ไม่ตกในสปอว์น 100%)
function nbs:rtp/do_spread

# ให้สถานะกันดาเมจตกจากที่สูงและดาเมจทุกชนิด 5 วินาที
effect give @s minecraft:resistance 5 255 true
effect give @s minecraft:slow_falling 5 1 true
effect give @s minecraft:fire_resistance 5 1 true

# บันทึกว่าผ่านการเข้าเซิร์ฟครั้งแรกแล้ว
tag @s add rtp_joined

# แจ้งเตือนและเอฟเฟกต์ต้อนรับ
title @s times 10 70 20
title @s title {"text":"ยินดีต้อนรับสู่ NBs SMP!","color":"gold","bold":true}
title @s subtitle {"text":"สุ่มเกิดในป่า 5,000 บล็อกเรียบร้อยแล้ว ขอให้โชคดี!","color":"yellow"}
playsound minecraft:entity.player.levelup master @s ~ ~ ~ 1 1
