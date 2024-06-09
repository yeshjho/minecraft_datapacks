$bossbar add teleporting_$(player_id) {"text": "."}
$bossbar set teleporting_$(player_id) name $(bossbar_title)
$bossbar set teleporting_$(player_id) max $(delay)
$bossbar set teleporting_$(player_id) color $(bossbar_color)
$bossbar set teleporting_$(player_id) players @s
$bossbar set teleporting_$(player_id) visible true
item modify entity @s weapon teleport_scroll:lock_movement
item modify entity @s weapon teleport_scroll:hide_attribute_modifiers
execute as @s store result score @s teleport_scroll_use_start_x run data get entity @s Pos[0] 1000
execute as @s store result score @s teleport_scroll_use_start_y run data get entity @s Pos[1] 1000
execute as @s store result score @s teleport_scroll_use_start_z run data get entity @s Pos[2] 1000