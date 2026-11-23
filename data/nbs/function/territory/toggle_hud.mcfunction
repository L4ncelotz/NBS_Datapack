# ==========================================
# สลับเปิด/ปิดการแสดงผลระยะห่างธงบน Actionbar (/trigger flag_hud)
# ==========================================

execute if entity @s[tag=hide_flag_hud] run tag @s add just_unhidden
execute if entity @s[tag=just_unhidden] run tag @s remove hide_flag_hud
execute if entity @s[tag=just_unhidden] run tellraw @s {"text":"🔔 เปิดการแสดงผลระยะห่างธงอาณาเขตบน Actionbar แล้ว","color":"green"}

execute unless entity @s[tag=just_unhidden] run tag @s add hide_flag_hud
execute unless entity @s[tag=just_unhidden] run title @s actionbar ""
execute unless entity @s[tag=just_unhidden] run tellraw @s {"text":"🔕 ซ่อนการแสดงผลระยะห่างธงอาณาเขตแล้ว (พิมพ์ /trigger flag_hud เพื่อเปิดใหม่)","color":"gray"}

tag @s remove just_unhidden
scoreboard players set @s flag_hud 0
