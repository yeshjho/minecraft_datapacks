$bossbar add teleporting_$(player_id) {"text": "."}
$bossbar set teleporting_$(player_id) name $(bossbar_title)
$bossbar set teleporting_$(player_id) max $(delay)
$bossbar set teleporting_$(player_id) color $(bossbar_color)
$bossbar set teleporting_$(player_id) players @s
$bossbar set teleporting_$(player_id) visible true