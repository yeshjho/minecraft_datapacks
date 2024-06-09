data modify storage yeshjho:teleport_scroll_function_arguments tp_dest_x set from entity @s SelectedItem.components."minecraft:custom_data".dest[0]
data modify storage yeshjho:teleport_scroll_function_arguments tp_dest_y set from entity @s SelectedItem.components."minecraft:custom_data".dest[1]
data modify storage yeshjho:teleport_scroll_function_arguments tp_dest_z set from entity @s SelectedItem.components."minecraft:custom_data".dest[2]
data modify storage yeshjho:teleport_scroll_function_arguments tp_dest_yaw set from entity @s SelectedItem.components."minecraft:custom_data".rot[0]
data modify storage yeshjho:teleport_scroll_function_arguments tp_dest_pitch set from entity @s SelectedItem.components."minecraft:custom_data".rot[1]
data modify storage yeshjho:teleport_scroll_function_arguments tp_dim set from entity @s SelectedItem.components."minecraft:custom_data".dim
item modify entity @s weapon yeshjho:decrement
execute as @s run function yeshjho:utility/tp with storage yeshjho:teleport_scroll_function_arguments