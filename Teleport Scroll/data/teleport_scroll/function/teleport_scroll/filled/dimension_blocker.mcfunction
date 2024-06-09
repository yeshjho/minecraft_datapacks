$execute as @s store result bossbar teleporting_$(player_id) value run scoreboard players set @s teleport_scroll_continuous_use_tick 1
$bossbar set teleporting_$(player_id) color red
$bossbar set teleporting_$(player_id) name {"type": "translatable", "translate": "teleport_scroll_blocked", "fallback": "Teleport Dimension Blocked", "color": "dark_red"}
recipe give @s teleport_scroll:empty_interdimension_teleport_scroll