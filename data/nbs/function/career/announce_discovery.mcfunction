# ==========================================
# ประกาศการค้นพบไอเทม/ความสำเร็จครั้งแรกของทีม (กันแจ้งเตือนซ้ำ)
# ==========================================
$data modify storage nbs:career announced.$(key).t$(team) set value 1b
$tellraw @a [{"text":"📋 [เช็กลิสต์อาชีพ] ","color":"green","bold":true},{"text":"Team $(team) ","color":"aqua","bold":true},{"text":"ครอบครอง ","color":"gray"},{"text":"$(name)","color":"yellow","bold":true},{"text":"! (+$(pts) แต้ม)","color":"green"}]
playsound minecraft:entity.experience_orb.pickup master @a 0 64 0 0.7 1.3
