[T-]
import "lib/basic/std.t"
import "lib/advanced/t_parser.t"
line = "func add(a, b) {"
[T0]
is_func_def(line=line) ~> is_func
get_func_name(line=line) ~> fname
get_func_params(line=line) ~> params
[T+]
show shall(is_func)
show shall(fname)
show shall(params)
