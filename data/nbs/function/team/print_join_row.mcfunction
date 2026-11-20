# แสดงปุ่มคลิกเข้าร่วมทีมแต่ละทีมตามชื่อและสีที่แอดมินตั้งไว้
$tellraw @s [{"text":"  [ ▶ เข้าร่วม $(name) ]","color":"$(color)","bold":true,"click_event":{"action":"run_command","command":"/trigger join_team set $(team)"}}]
