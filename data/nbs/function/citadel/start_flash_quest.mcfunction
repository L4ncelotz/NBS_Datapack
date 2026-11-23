# สุ่มเลือกเควสด่วน 1 จาก 15 รูปแบบโดยไม่ให้ซ้ำรอบก่อนหน้า (/function nbs:citadel/start_flash_quest)
scoreboard players add #last_rnd_q rnd_temp 0
execute store result score #rnd_q rnd_temp run random value 1..15
execute if score #rnd_q rnd_temp = #last_rnd_q rnd_temp run scoreboard players add #rnd_q rnd_temp 1
execute if score #rnd_q rnd_temp matches 16.. run scoreboard players set #rnd_q rnd_temp 1
scoreboard players operation #last_rnd_q rnd_temp = #rnd_q rnd_temp

execute if score #rnd_q rnd_temp matches 1 run function nbs:citadel/set_flash_quest {item:"minecraft:baked_potato",count:32,name:"Baked Potato x32"}
execute if score #rnd_q rnd_temp matches 2 run function nbs:citadel/set_flash_quest {item:"minecraft:cooked_beef",count:32,name:"Cooked Beef x32"}
execute if score #rnd_q rnd_temp matches 3 run function nbs:citadel/set_flash_quest {item:"minecraft:golden_apple",count:2,name:"Golden Apple x2"}
execute if score #rnd_q rnd_temp matches 4 run function nbs:citadel/set_flash_quest {item:"minecraft:iron_ingot",count:32,name:"Iron Ingot x32"}
execute if score #rnd_q rnd_temp matches 5 run function nbs:citadel/set_flash_quest {item:"minecraft:ender_pearl",count:8,name:"Ender Pearl x8"}
execute if score #rnd_q rnd_temp matches 6 run function nbs:citadel/set_flash_quest {item:"minecraft:emerald",count:16,name:"Emerald x16"}
execute if score #rnd_q rnd_temp matches 7 run function nbs:citadel/set_flash_quest {item:"minecraft:quartz",count:32,name:"Nether Quartz x32"}
execute if score #rnd_q rnd_temp matches 8 run function nbs:citadel/set_flash_quest {item:"minecraft:cookie",count:64,name:"Cookie x64"}
execute if score #rnd_q rnd_temp matches 9 run function nbs:citadel/set_flash_quest {item:"minecraft:tnt",count:8,name:"TNT x8"}
execute if score #rnd_q rnd_temp matches 10 run function nbs:citadel/set_flash_quest {item:"minecraft:book",count:16,name:"Book x16"}
execute if score #rnd_q rnd_temp matches 11 run function nbs:citadel/set_flash_quest {item:"minecraft:glass",count:64,name:"Glass x64"}
execute if score #rnd_q rnd_temp matches 12 run function nbs:citadel/set_flash_quest {item:"minecraft:cooked_salmon",count:32,name:"Cooked Salmon x32"}
execute if score #rnd_q rnd_temp matches 13 run function nbs:citadel/set_flash_quest {item:"minecraft:slime_ball",count:8,name:"Slimeball x8"}
execute if score #rnd_q rnd_temp matches 14 run function nbs:citadel/set_flash_quest {item:"minecraft:amethyst_shard",count:16,name:"Amethyst Shard x16"}
execute if score #rnd_q rnd_temp matches 15 run function nbs:citadel/set_flash_quest {item:"minecraft:dried_kelp_block",count:16,name:"Dried Kelp Block x16"}
