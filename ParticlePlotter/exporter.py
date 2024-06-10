from copy import deepcopy
from os import makedirs

from user_input import get_context, get_functions


context = get_context()
functions = get_functions()

is_dust = context.particle_name in ("dust", "minecraft:dust")
n = '^' if context.use_caret else '~'


output_dir = f'./output/particle_{context.id}/'
frames_dir = f'{output_dir}frames/'
makedirs(frames_dir, exist_ok=True)

frame_commands = [
    f'scoreboard objectives add particle_{context.id} dummy',
    f'scoreboard players add @s particle_{context.id} 1'
]

for tick in range(1, context.total_tick + 1):
    frame_context = deepcopy(context)
    frame_context.a = tick / context.total_tick
    points = sum([f.get_graph_points(frame_context) for f in functions], [])

    frame_commands.append(f'execute as @s if score @s particle_{context.id} matches {tick} '
                          f'run function {context.function_folder_prefix}particle_{context.id}/frames/frame{tick}')
    commands = []
    for point in points:
        color_str: str = point['marker']["color"]
        color = ', '.join([f'{(int(c) / 255):.6f}'
                           for c in color_str[color_str.find('(') + 1: color_str.find(')')].split(',')])
        option = f'color: [{color}], scale:{point["marker"]["size"] / context.scale_base:.6f}' if is_dust else ''
        command = (f'particle {context.particle_name}{{{option}}} '
                   f'{n}{point["x"][0]:.6f} {n}{point["z"][0]:.6f} {n}{point["y"][0]:.6f} '  # should flip y and z
                   f'0 0 0 1 1 force {context.viewers}')
        commands.append(command)

    with open(f'{frames_dir}frame{tick}.mcfunction', mode='w') as f:
        f.write('\n'.join(commands))

with open(f'{output_dir}/run.mcfunction', mode='w') as f:
    f.write('\n'.join(frame_commands))
