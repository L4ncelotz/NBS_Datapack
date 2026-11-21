# ==========================================
# Fallback สร้างจุดเกิดกลางเมื่อไม่ได้ติดตั้งแพ็ก NBs_Worldgen (ถ้าติดตั้ง NBs_Worldgen จะเรียกใช้แทนอัตโนมัติ)
# ==========================================
forceload add -16 -16 16 16
execute unless entity @e[tag=spawn_anchor] run summon minecraft:marker 0 120 0 {Tags:["spawn_anchor"]}
execute unless entity @e[tag=citadel_built_anchor] run spreadplayers 0 0 0 1 false @e[tag=spawn_anchor,limit=1]
execute as @e[tag=spawn_anchor,limit=1] at @s align xyz run tp @s ~0.5 ~ ~0.5
execute at @e[tag=spawn_anchor,limit=1] run setworldspawn ~ ~ ~
function nbs:spawn/summon_citadel_npcs
