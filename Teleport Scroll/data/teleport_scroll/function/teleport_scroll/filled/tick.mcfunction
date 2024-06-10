execute as @s run function teleport_scroll:teleport_scroll/filled/setup
execute as @s if score @s used_teleport_scroll_last_tick matches 1 unless score @s just_used_teleport_scroll matches 1 if score @s teleport_scroll_continuous_use_tick matches 0 run function teleport_scroll:teleport_scroll/start with storage teleport_scroll:function_arguments
execute as @s if score @s used_teleport_scroll_last_tick matches 1 unless score @s just_used_teleport_scroll matches 1 run function teleport_scroll:teleport_scroll/continuous with storage teleport_scroll:function_arguments
execute as @s if score @s used_teleport_scroll_last_tick matches 1 unless score @s just_used_teleport_scroll matches 1 unless data entity @s SelectedItem.components."minecraft:custom_data".interdimension run function teleport_scroll:teleport_scroll/filled/dimension_checker with storage teleport_scroll:function_arguments
execute as @s if score @s used_teleport_scroll_last_tick matches 1 unless score @s just_used_teleport_scroll matches 1 run function teleport_scroll:teleport_scroll/position_checker
execute as @s if score @s used_teleport_scroll_last_tick matches 1 unless score @s just_used_teleport_scroll matches 1 run function teleport_scroll:particles/particle_teleport_use/run
execute as @s if score @s used_teleport_scroll_last_tick matches 0 run function teleport_scroll:teleport_scroll/cancel with storage teleport_scroll:function_arguments

scoreboard players set @s used_teleport_scroll_last_tick 0
schedule function teleport_scroll:cancel_checker/check 2t replace