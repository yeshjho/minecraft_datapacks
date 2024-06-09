scoreboard players set @s used_teleport_scroll_last_tick 0
scoreboard players set @s teleport_scroll_continuous_use_tick 0
$bossbar set teleporting_$(player_id) value 0
$bossbar set teleporting_$(player_id) visible false
item modify entity @s weapon yeshjho:unlock_movement