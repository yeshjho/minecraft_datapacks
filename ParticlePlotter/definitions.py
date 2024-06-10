from copy import deepcopy
from point3d import Point3d as Point


class ValueOrFunction:
    def __init__(self, v):
        self.value = v
        self.is_pure_value = type(v) is float or type(v) is int

    def __call__(self, *args):
        return self.value if self.is_pure_value else self.value(*args)


class Context:
    def __init__(self, **kwargs):
        for key, value in kwargs.items():
            setattr(self, key, value)

    def get(self, key, default=None):
        return getattr(self, key, default)

    # opacity: float. only for graph visualization.
    # scale_base: float. only for graph visualization.
    # animate: bool. only for graph visualization.

    # id: str. will be used for the scoreboard objective name and folder/file names.
    # total_tick: int.
    # particle_name: str. color and scale are obsolete unless it's "dust" or "minecraft:dust".
    # use_caret: bool. use ^ instead of ~?
    # viewers: str.
    # function_folder_prefix: str. functions will be in f'{prefix}particle_{id}'

    # t: float. the parameter used for x/y/z parametric equations. [start_t, end_t]
    # a: float. current passed time out of the total animation time. [0|start_a, 1|end_a]
    # anim01: float. a value remapped from [start_a, end_a] to [0, 1].
    # kill01: float. a value remapped from [kill_start_a, kill_end_a] to [0, 1].


class Function:
    def __init__(self, **kwargs):
        self.x = ValueOrFunction(kwargs.get('x', 0))
        self.y = ValueOrFunction(kwargs.get('y', 0))
        self.z = ValueOrFunction(kwargs.get('z', 0))
        self.start_t = ValueOrFunction(kwargs.get('start_t', 0))
        self.end_t = ValueOrFunction(kwargs.get('end_t', 1))
        self.step = ValueOrFunction(kwargs.get('step', 10))

        '''
               (animating)       (froze at the last frame)         (disappears from the front)        (completely gone)
           |-----------------|-------------------------------|-------------------------------------|
        start_a            end_a                        kill_start_a                           kill_end_a
        '''
        self.start_a = kwargs.get('start_a', 0)
        self.end_a = kwargs.get('end_a', 1)
        self.kill_start_a = kwargs.get('kill_start_a', 1)
        self.kill_end_a = kwargs.get('kill_end_a', 1)

        self.scale = ValueOrFunction(kwargs.get('scale', 1))
        self.r = ValueOrFunction(kwargs.get('r', 255))
        self.g = ValueOrFunction(kwargs.get('g', 255))
        self.b = ValueOrFunction(kwargs.get('b', 255))

    def get_graph_points(self, c_param: Context) -> list:
        c = deepcopy(c_param)
        to_return = []

        c.anim01 = min(1, max(0, (c.a - self.start_a) / (self.end_a - self.start_a))) \
            if self.end_a != self.start_a else int(c.a >= self.start_a)
        c.kill01 = min(1, max(0, (c.a - self.kill_start_a) / (self.kill_end_a - self.kill_start_a))) \
            if self.kill_end_a != self.kill_start_a else int(c.a > self.kill_start_a)
        step = self.step(c)

        for i in range(step)[int(step * c.kill01):int(step * c.anim01)]:
            c.t = self.start_t(c) + (self.end_t(c) - self.start_t(c)) * i / self.step(c)
            to_return.append(
                {
                    'x': [self.x(c)],
                    'y': [self.y(c)],
                    'z': [self.z(c)],
                    'mode': 'markers',
                    'marker': {
                        'size': c.scale_base * self.scale(c),
                        'opacity': c.get('opacity', 0.8),
                        'color': f'rgb({self.r(c)}, {self.g(c)}, {self.b(c)})'
                    },
                }
            )
        return to_return

    def get_point(self, c: Context) -> Point:
        return Point(self.x(c), self.y(c), self.z(c))


def get_parametric_equations_with_two_points(start: Point, end: Point):
    direction = end - start
    return {
        'x': lambda c: start.x + direction.x * c.t,
        'y': lambda c: start.y + direction.y * c.t,
        'z': lambda c: start.z + direction.z * c.t,
    }


def get_remap_function(from_min: float, from_max: float, to_min: float, to_max: float, key: str):
    return lambda c: to_min + (c.get(key) - from_min) / (from_max - from_min) * (to_max - to_min)
