execute as @s store result score #current teleport_scroll_use_start_x run data get entity @s Pos[0] 1000
scoreboard players operation #current teleport_scroll_use_start_x -= @s teleport_scroll_use_start_x
execute as @s store result score #current teleport_scroll_use_start_y run data get entity @s Pos[1] 1000
scoreboard players operation #current teleport_scroll_use_start_y -= @s teleport_scroll_use_start_y
execute as @s store result score #current teleport_scroll_use_start_z run data get entity @s Pos[2] 1000
scoreboard players operation #current teleport_scroll_use_start_z -= @s teleport_scroll_use_start_z
execute as @s unless score #current teleport_scroll_use_start_x matches -300..300 run function teleport_scroll:teleport_scroll/block_continuous_usage with storage teleport_scroll:function_arguments
execute as @s unless score #current teleport_scroll_use_start_y matches -300..300 run function teleport_scroll:teleport_scroll/block_continuous_usage with storage teleport_scroll:function_arguments
execute as @s unless score #current teleport_scroll_use_start_z matches -300..300 run function teleport_scroll:teleport_scroll/block_continuous_usage with storage teleport_scroll:function_arguments