# สร้างป้ายชื่อลอยเหนือธงโดยดึงชื่อทีมและสีที่แอดมินตั้งไว้จาก storage ($(name), $(color))
$execute at @e[type=minecraft:marker,tag=new_flag,limit=1] run summon minecraft:text_display ~ ~2.2 ~ {Tags:["flag_text","new_text"],billboard:"center",background:1073741824,view_range:0.15f,text:{text:"🚩 อาณาเขต $(name)",color:"$(color)",bold:true}}
