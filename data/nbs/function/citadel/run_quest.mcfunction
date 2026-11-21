# ตรวจว่าทีมนี้เคยส่งเควสนี้แล้วหรือยัง (จำกัด 1 ครั้งต่อทีม)
$execute if data storage nbs:citadel quests.q$(q).t$(team) run tellraw @s [{"text":"❌ [The Citadel] ","color":"red","bold":true},{"text":"ทีมของคุณส่งเควสนี้ไปแล้ว! (จำกัด 1 ครั้งต่อทีม)","color":"yellow"}]
$execute unless data storage nbs:citadel quests.q$(q).t$(team) run function nbs:citadel/submit_quest {team:$(team),q:$(q)}
