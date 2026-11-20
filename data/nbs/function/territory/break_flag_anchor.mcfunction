# เล่นเสียงเตือนและแจ้งคนที่อยู่ใกล้ๆ ว่าธงอาณาเขตถูกทำลายแล้ว
playsound minecraft:entity.ender_dragon.growl master @a[distance=..40] ~ ~ ~ 0.5 1.5
title @a[distance=..40] actionbar {"text":"ธงอาณาเขตถูกทำลายลงแล้ว!","color":"red"}

kill @e[type=minecraft:text_display,tag=flag_text,distance=..3]
# ลบหมุดล่องหนทิ้ง
kill @s