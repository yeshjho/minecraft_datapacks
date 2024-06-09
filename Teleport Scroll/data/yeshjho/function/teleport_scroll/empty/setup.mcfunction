execute as @s run function yeshjho:utility/player_uuid_teleport_scroll_function_arguments
execute as @s run function yeshjho:utility/player_pos_teleport_scroll_function_arguments
data modify storage yeshjho:teleport_scroll_function_arguments bossbar_title set value "{\"type\": \"translatable\", \"translate\": \"using_empty_teleport_scroll\", \"fallback\": \"Calibrating Coordinate...\", \"color\": \"aqua\"}"
execute store result storage yeshjho:teleport_scroll_function_arguments delay int 1 run scoreboard players get #destination_set_delay_tick teleport_scroll_config
data modify storage yeshjho:teleport_scroll_function_arguments bossbar_color set value "blue"
data modify storage yeshjho:teleport_scroll_function_arguments tick_count_objective set value "empty_teleport_scroll_continuous_use_tick"
data modify storage yeshjho:teleport_scroll_function_arguments usage_function set value "yeshjho:teleport_scroll/empty/use"