data modify storage teleport_scroll:function_arguments player_id_1 set from entity @s UUID[0]
data modify storage teleport_scroll:function_arguments player_id_2 set from entity @s UUID[1]
data modify storage teleport_scroll:function_arguments player_id_3 set from entity @s UUID[2]
function teleport_scroll:utility/player_uuid_function_arguments_inner with storage teleport_scroll:function_arguments