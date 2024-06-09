execute as @s run function teleport_scroll:utility/player_uuid_function_arguments
execute as @s run function teleport_scroll:utility/player_pos_function_arguments
data modify storage teleport_scroll:function_arguments bossbar_title set value "{\"type\": \"translatable\", \"translate\": \"using_empty_teleport_scroll\", \"fallback\": \"Calibrating Coordinate...\", \"color\": \"aqua\"}"
execute store result storage teleport_scroll:function_arguments delay int 1 run scoreboard players get #destination_set_delay_tick teleport_scroll_config
data modify storage teleport_scroll:function_arguments bossbar_color set value "blue"
data modify storage teleport_scroll:function_arguments usage_function set value "teleport_scroll:teleport_scroll/empty/use"
execute as @s if data entity @s SelectedItem.components."minecraft:custom_data".interdimension run function teleport_scroll:teleport_scroll/empty/setup_interdimension
execute as @s unless data entity @s SelectedItem.components."minecraft:custom_data".interdimension run function teleport_scroll:teleport_scroll/empty/setup_non_interdimension