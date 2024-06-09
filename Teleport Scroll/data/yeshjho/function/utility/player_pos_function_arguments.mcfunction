data modify storage yeshjho:teleport_scroll_function_arguments player_pos_x set from entity @s Pos[0]
data modify storage yeshjho:teleport_scroll_function_arguments player_pos_y set from entity @s Pos[1]
data modify storage yeshjho:teleport_scroll_function_arguments player_pos_z set from entity @s Pos[2]
data modify storage yeshjho:teleport_scroll_function_arguments player_rot_yaw set from entity @s Rotation[0]
data modify storage yeshjho:teleport_scroll_function_arguments player_rot_pitch set from entity @s Rotation[1]
data modify storage yeshjho:teleport_scroll_function_arguments player_dim set from entity @s Dimension
execute store result storage yeshjho:teleport_scroll_function_arguments player_pos_x_int int 1 run data get entity @s Pos[0]
execute store result storage yeshjho:teleport_scroll_function_arguments player_pos_y_int int 1 run data get entity @s Pos[1]
execute store result storage yeshjho:teleport_scroll_function_arguments player_pos_z_int int 1 run data get entity @s Pos[2]