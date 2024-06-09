execute as @s run function yeshjho:utility/player_uuid_function_arguments
execute as @s run function yeshjho:utility/player_pos_function_arguments
data modify storage yeshjho:teleport_scroll_function_arguments bossbar_title set value "{\"type\": \"translatable\", \"translate\": \"using_teleport_scroll\", \"fallback\": \"Teleporting...\", \"color\": \"dark_purple\"}"
execute store result storage yeshjho:teleport_scroll_function_arguments delay int 1 run scoreboard players get #teleport_delay_tick teleport_scroll_config
data modify storage yeshjho:teleport_scroll_function_arguments bossbar_color set value "purple"
data modify storage yeshjho:teleport_scroll_function_arguments usage_function set value "yeshjho:teleport_scroll/filled/use"
data modify storage yeshjho:teleport_scroll_function_arguments target_dim set from entity @s SelectedItem.components."minecraft:custom_data".dim