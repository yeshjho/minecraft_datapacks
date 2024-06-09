execute as @s run function yeshjho:teleport_scroll/empty/setup
execute as @s if score @s used_teleport_scroll_last_tick matches 1 if score @s teleport_scroll_continuous_use_tick matches 0 run function yeshjho:teleport_scroll/start with storage yeshjho:teleport_scroll_function_arguments
execute as @s if score @s used_teleport_scroll_last_tick matches 1 run function yeshjho:teleport_scroll/continuous with storage yeshjho:teleport_scroll_function_arguments
execute as @s if score @s used_teleport_scroll_last_tick matches 0 run function yeshjho:teleport_scroll/cancel with storage yeshjho:teleport_scroll_function_arguments
scoreboard players set @s used_teleport_scroll_last_tick 0
schedule function yeshjho:cancel_checker/check 2t replace