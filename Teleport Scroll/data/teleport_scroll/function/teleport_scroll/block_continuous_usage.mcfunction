scoreboard players set @s just_used_teleport_scroll 1
$bossbar set teleporting_$(player_id) value 0
$bossbar set teleporting_$(player_id) visible false
item modify entity @s weapon teleport_scroll:unlock_movement
item modify entity @s weapon teleport_scroll:hide_attribute_modifiers