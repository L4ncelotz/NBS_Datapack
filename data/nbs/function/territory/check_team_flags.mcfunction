# เปิดสิทธิ์ให้ผู้เล่นทุกคนพิมพ์คำสั่ง /trigger check_flag ได้ตลอดเวลา
scoreboard players enable @a check_flag

# เมื่อมีคนพิมพ์ /trigger check_flag (คะแนน >= 1) ให้รันระบบแสดงพิกัด
execute as @a[scores={check_flag=1..}] run function nbs:territory/show_flag_coords
scoreboard players set @a[scores={check_flag=1..}] check_flag 0