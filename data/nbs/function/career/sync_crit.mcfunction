# ==========================================
# ตรวจ Criterion ย่อยของ Advancement ให้กับทีม 1 ถึง 8 ตามสายอาชีพ $(career)
# นับคะแนนเฉพาะเมื่อทีมสังกัดสายอาชีพ $(career) และแชร์คะแนนร่วมกันทั้งทีม
# ==========================================
$execute if score #t1_active game_state matches 1 if score #t1_career career_id matches $(career) if entity @a[scores={team_id=1},advancements={$(adv)={$(crit)=true}}] run scoreboard players add #t1_cr_$(cat) rnd_temp $(pts)
$execute if score #t2_active game_state matches 1 if score #t2_career career_id matches $(career) if entity @a[scores={team_id=2},advancements={$(adv)={$(crit)=true}}] run scoreboard players add #t2_cr_$(cat) rnd_temp $(pts)
$execute if score #t3_active game_state matches 1 if score #t3_career career_id matches $(career) if entity @a[scores={team_id=3},advancements={$(adv)={$(crit)=true}}] run scoreboard players add #t3_cr_$(cat) rnd_temp $(pts)
$execute if score #t4_active game_state matches 1 if score #t4_career career_id matches $(career) if entity @a[scores={team_id=4},advancements={$(adv)={$(crit)=true}}] run scoreboard players add #t4_cr_$(cat) rnd_temp $(pts)
$execute if score #t5_active game_state matches 1 if score #t5_career career_id matches $(career) if entity @a[scores={team_id=5},advancements={$(adv)={$(crit)=true}}] run scoreboard players add #t5_cr_$(cat) rnd_temp $(pts)
$execute if score #t6_active game_state matches 1 if score #t6_career career_id matches $(career) if entity @a[scores={team_id=6},advancements={$(adv)={$(crit)=true}}] run scoreboard players add #t6_cr_$(cat) rnd_temp $(pts)
$execute if score #t7_active game_state matches 1 if score #t7_career career_id matches $(career) if entity @a[scores={team_id=7},advancements={$(adv)={$(crit)=true}}] run scoreboard players add #t7_cr_$(cat) rnd_temp $(pts)
$execute if score #t8_active game_state matches 1 if score #t8_career career_id matches $(career) if entity @a[scores={team_id=8},advancements={$(adv)={$(crit)=true}}] run scoreboard players add #t8_cr_$(cat) rnd_temp $(pts)
