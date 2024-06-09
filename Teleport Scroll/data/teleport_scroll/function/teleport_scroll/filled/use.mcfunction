data modify storage teleport_scroll:function_arguments tp_dest_x set from entity @s SelectedItem.components."minecraft:custom_data".dest[0]
data modify storage teleport_scroll:function_arguments tp_dest_y set from entity @s SelectedItem.components."minecraft:custom_data".dest[1]
data modify storage teleport_scroll:function_arguments tp_dest_z set from entity @s SelectedItem.components."minecraft:custom_data".dest[2]
data modify storage teleport_scroll:function_arguments tp_dest_yaw set from entity @s SelectedItem.components."minecraft:custom_data".rot[0]
data modify storage teleport_scroll:function_arguments tp_dest_pitch set from entity @s SelectedItem.components."minecraft:custom_data".rot[1]
data modify storage teleport_scroll:function_arguments tp_dim set from entity @s SelectedItem.components."minecraft:custom_data".dim
item modify entity @s weapon teleport_scroll:decrement
execute as @s run function teleport_scroll:utility/tp with storage teleport_scroll:function_arguments
execute as @s run function teleport_scroll:teleport_scroll/block_continuous_usage with storage teleport_scroll:function_arguments