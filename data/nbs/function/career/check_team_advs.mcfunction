# ==========================================
# ตรวจจับ Milestones และ Hard Advancements ของทีม (นับสูงสุด 1 ครั้งต่อทีม)
# เฉพาะผู้เล่นที่มีสายอาชีพตรงกับความสำเร็จเท่านั้นจึงจะปลดล็อกให้ทีมได้!
# ==========================================

# 1. 🌾 Farmer's Milestones (career 1: Farmer เท่านั้น)
function nbs:career/sync_adv {adv:"minecraft:husbandry/obtain_netherite_hoe",career:1,key:"serious_dedication",pts:25,name:"Serious Dedication"}
function nbs:career/sync_adv {adv:"minecraft:husbandry/complete_catalogue",career:1,key:"complete_catalogue",pts:60,name:"A Complete Catalogue"}
function nbs:career/sync_adv {adv:"minecraft:husbandry/whole_pack",career:1,key:"whole_pack",pts:60,name:"The Whole Pack"}
function nbs:career/sync_adv {adv:"minecraft:husbandry/balanced_diet",career:1,key:"balanced_diet",pts:70,name:"A Balanced Diet"}
function nbs:career/sync_adv {adv:"minecraft:husbandry/bred_all_animals",career:1,key:"two_by_two",pts:120,name:"Two by Two"}

# 2. ⚒️ Blacksmith's Milestones (career 2: Blacksmith เท่านั้น)
function nbs:career/sync_adv {adv:"minecraft:story/mine_diamond",career:2,key:"diamonds",pts:15,name:"Diamonds!"}
function nbs:career/sync_adv {adv:"minecraft:story/shiny_gear",career:2,key:"cover_me_diamonds",pts:25,name:"Cover Me with Diamonds"}
function nbs:career/sync_adv {adv:"minecraft:adventure/trim_with_any_armor_pattern",career:2,key:"crafting_new_look",pts:25,name:"Crafting a New Look"}
function nbs:career/sync_adv {adv:"minecraft:nether/netherite_armor",career:2,key:"cover_me_in_debris",pts:40,name:"Cover Me in Debris"}
function nbs:career/sync_adv {adv:"minecraft:adventure/overoverkill",career:2,key:"over_overkill",pts:60,name:"Over-Overkill"}
function nbs:career/sync_adv {adv:"minecraft:adventure/trim_with_all_exclusive_armor_patterns",career:2,key:"smithing_with_style",pts:80,name:"Smithing with Style"}

# 3. ⚔️ Monster Hunter's Milestones (career 3: Monster Hunter เท่านั้น)
function nbs:career/sync_adv {adv:"minecraft:adventure/voluntary_exile",career:3,key:"voluntary_exile",pts:15,name:"Voluntary Exile"}
function nbs:career/sync_adv {adv:"minecraft:nether/return_to_sender",career:3,key:"return_to_sender",pts:25,name:"Return to Sender"}
function nbs:career/sync_adv {adv:"minecraft:adventure/hero_of_the_village",career:3,key:"hero_of_village",pts:35,name:"Hero of the Village"}
function nbs:career/sync_adv {adv:"minecraft:adventure/two_birds_one_arrow",career:3,key:"two_birds",pts:50,name:"Two Birds, One Arrow"}
function nbs:career/sync_adv {adv:"minecraft:adventure/kill_all_mobs",career:3,key:"monsters_hunted",pts:80,name:"Monsters Hunted"}

# 4. 🧭 Adventurer's Milestones (career 4: Adventurer เท่านั้น)
function nbs:career/sync_adv {adv:"minecraft:adventure/salvage_sherd",career:4,key:"respecting_remnants",pts:20,name:"Respecting the Remnants"}
function nbs:career/sync_adv {adv:"minecraft:adventure/craft_decorated_pot_using_only_sherds",career:4,key:"careful_restoration",pts:25,name:"Careful Restoration"}
function nbs:career/sync_adv {adv:"minecraft:nether/explore_nether",career:4,key:"hot_tourist",pts:40,name:"Hot Tourist Destinations"}
function nbs:career/sync_adv {adv:"minecraft:end/find_end_city",career:4,key:"city_at_end",pts:40,name:"The City at the End of the Game"}
function nbs:career/sync_adv {adv:"minecraft:adventure/adventuring_time",career:4,key:"adventuring_time",pts:90,name:"Adventuring Time"}

# 5. 🏅 Hard Advancements (ภารกิจท้าทายกลาง — ทุกสายอาชีพทำได้ career:"1..4")
function nbs:career/sync_adv {adv:"minecraft:adventure/trade_at_world_height",career:"1..4",key:"star_trader",pts:25,name:"Star Trader"}
function nbs:career/sync_adv {adv:"minecraft:nether/fast_travel",career:"1..4",key:"subspace_bubble",pts:30,name:"Subspace Bubble"}
function nbs:career/sync_adv {adv:"minecraft:adventure/arbalistic",career:"1..4",key:"arbalistic",pts:30,name:"Arbalistic"}
function nbs:career/sync_adv {adv:"minecraft:nether/uneasy_alliance",career:"1..4",key:"uneasy_alliance",pts:40,name:"Uneasy Alliance"}
function nbs:career/sync_adv {adv:"minecraft:adventure/fall_from_world_height",career:"1..4",key:"caves_and_cliffs",pts:50,name:"Caves & Cliffs"}
function nbs:career/sync_adv {adv:"minecraft:end/levitate",career:"1..4",key:"great_view",pts:50,name:"Great View From Up Here"}
function nbs:career/sync_adv {adv:"minecraft:adventure/sniper_duel",career:"1..4",key:"sniper_duel",pts:50,name:"Sniper Duel"}
function nbs:career/sync_adv {adv:"minecraft:nether/all_potions",career:"1..4",key:"furious_cocktail",pts:90,name:"A Furious Cocktail"}
function nbs:career/sync_adv {adv:"minecraft:nether/all_effects",career:"1..4",key:"how_did_we_get_here",pts:150,name:"How Did We Get Here?"}
