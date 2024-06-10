from math import *
from definitions import *


def get_context():
    return Context(
        opacity=0.7,
        scale_base=10,
        animate=False,

        id='teleport_use',
        total_tick=5 * 20,
        particle_name='minecraft:dust',
        use_caret=False,
        viewers='@a',
        function_folder_prefix='teleport_scroll:particles/'
    )


circle_func = Function(
    x=lambda c: 1.5 * cos(c.t),
    y=lambda c: 1.5 * sin(c.t),
    end_t=2 * pi,
    step=100,
    end_a=0.2,
    r=153,
    g=51,
    b=255
)

star_points = [
    circle_func.get_point(Context(t=13 / 10 * pi)),
    circle_func.get_point(Context(t=5 / 10 * pi)),
    circle_func.get_point(Context(t=17 / 10 * pi)),
    circle_func.get_point(Context(t=9 / 10 * pi)),
    circle_func.get_point(Context(t=1 / 10 * pi))
]


def get_functions():
    return [
        circle_func,
        # star lines 1~5
        Function(**get_parametric_equations_with_two_points(star_points[0], star_points[1]),
                 step=30, start_a=0.2 + 0.08 * 0, end_a=0.2 + 0.08 * 1, scale=0.7,
                 r=153, g=51, b=255,
                 ),
        Function(**get_parametric_equations_with_two_points(star_points[1], star_points[2]),
                 step=30, start_a=0.2 + 0.08 * 1, end_a=0.2 + 0.08 * 2, scale=0.7,
                 r=153, g=51, b=255,
                 ),
        Function(**get_parametric_equations_with_two_points(star_points[2], star_points[3]),
                 step=30, start_a=0.2 + 0.08 * 2, end_a=0.2 + 0.08 * 3, scale=0.7,
                 r=153, g=51, b=255,
                 ),
        Function(**get_parametric_equations_with_two_points(star_points[3], star_points[4]),
                 step=30, start_a=0.2 + 0.08 * 3, end_a=0.2 + 0.08 * 4, scale=0.7,
                 r=153, g=51, b=255,
                 ),
        Function(**get_parametric_equations_with_two_points(star_points[4], star_points[0]),
                 step=30, start_a=0.2 + 0.08 * 4, end_a=0.2 + 0.08 * 5, scale=0.7,
                 r=153, g=51, b=255,
                 ),
        # spiral 1
        Function(x=lambda c: get_remap_function(0, 6 * pi, 1, 0.5, 't')(c) * 1.5 * cos(c.t),
                 y=lambda c: get_remap_function(0, 6 * pi, 1, 0.5, 't')(c) * 1.5 * sin(c.t),
                 z=lambda c: c.t / (3 * pi),
                 end_t=6 * pi, step=200, start_a=0.7, end_a=0.95, scale=0.7,
                 r=lambda c: int(get_remap_function(0, 1, 255, 153, 'anim01')(c)),
                 g=lambda c: int(get_remap_function(0, 1, 255, 51, 'anim01')(c)),
                 b=255,
                 ),
        # spiral 2
        Function(x=lambda c: get_remap_function(0, 6 * pi, 1, 0.5, 't')(c) * 1.5 * cos(c.t + pi),
                 y=lambda c: get_remap_function(0, 6 * pi, 1, 0.5, 't')(c) * 1.5 * sin(c.t + pi),
                 z=lambda c: c.t / (3 * pi),
                 end_t=6 * pi, step=200, start_a=0.7, end_a=0.95, scale=0.7,
                 r=lambda c: int(get_remap_function(0, 1, 255, 153, 'anim01')(c)),
                 g=lambda c: int(get_remap_function(0, 1, 255, 51, 'anim01')(c)),
                 b=255,
                 ),
    ]


if __name__ == '__main__':
    raise Exception("Don't run this file")
