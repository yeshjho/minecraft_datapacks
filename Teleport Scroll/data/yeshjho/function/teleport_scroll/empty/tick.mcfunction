execute as @s run function yeshjho:teleport_scroll/empty/setup
execute if score @s used_empty_teleport_scroll_last_tick matches 1 if score @s empty_teleport_scroll_continuous_use_tick matches 0 as @s run function yeshjho:teleport_scroll/start with storage yeshjho:teleport_scroll_function_arguments
execute if score @s used_empty_teleport_scroll_last_tick matches 1 as @s run function yeshjho:teleport_scroll/continuous with storage yeshjho:teleport_scroll_function_arguments
execute if score @s used_empty_teleport_scroll_last_tick matches 0 unless score @s empty_teleport_scroll_continuous_use_tick matches 0 as @s run function yeshjho:teleport_scroll/cancel with storage yeshjho:teleport_scroll_function_arguments
scoreboard players set @s used_empty_teleport_scroll_last_tick 0