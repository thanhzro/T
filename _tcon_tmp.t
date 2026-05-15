[T-]
import "lib/basic/std.t"
import "lib/advanced/t_parser.t"
src = "[T-]\nx = 10\n[T0]\nx + 1 >> r\n[T+]\nshow shall(r)"
[T0]
get_tminus(src=src) ~> tm
get_tzero(src=src) ~> t0
get_tplus(src=src) ~> tp
[T+]
show shall(tm)
show shall(t0)
show shall(tp)
