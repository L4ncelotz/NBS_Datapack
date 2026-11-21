# โหลดระบบ NBs Worldgen: ถ้ายังไม่มี Citadel ของแพ็กนี้ในโลก ให้สร้างป้อมปราการ (0,0) อัตโนมัติ
scoreboard objectives add nbs_wg_tmp dummy
forceload add -24 -24 24 24
execute unless entity @e[tag=citadel_built_anchor] run function nbs_worldgen:build_citadel
