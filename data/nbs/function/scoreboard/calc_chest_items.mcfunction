data modify storage nbs:temp ChestItems set from block ~ ~ ~ Items
execute if data storage nbs:temp ChestItems[0] run function nbs:scoreboard/sum_chest_items
