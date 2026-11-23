# จัดพิกัดเข้ากึ่งกลางบล็อกก่อนเช็ก ถ้าเป็น Shulker Box และยังไม่มีหมุดในระยะ 0.5 บล็อก ให้ฝังหมุดทันที
execute align xyz positioned ~0.5 ~0.5 ~0.5 if block ~ ~ ~ #nbs:shulker_boxes unless entity @e[type=minecraft:marker,tag=shulker_anchor,distance=..0.5] run summon minecraft:marker ~ ~ ~ {Tags:["shulker_anchor"]}

# ตรวจเช็กของใน Shulker Box ทันที
execute align xyz positioned ~0.5 ~0.5 ~0.5 if block ~ ~ ~ #nbs:shulker_boxes as @e[type=minecraft:marker,tag=shulker_anchor,distance=..0.5] at @s run function nbs:anti_container/check_placed_shulker

# หยุดยิง Raycast ทันทีเมื่อเจอ Shulker Box หากยังไม่เจอให้ขยับไปข้างหน้าทีละ 0.25 บล็อก จนถึงระยะ 6 บล็อก
execute unless block ~ ~ ~ #nbs:shulker_boxes positioned ^ ^ ^0.25 if entity @s[distance=..6] run function nbs:anti_container/raycast_shulker
