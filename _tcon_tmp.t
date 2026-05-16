[T-]
import "lib/basic/std.t"
import "lib/advanced/t_parser.t"
[T0]
classify_t0_line(line="x + 1 >> r") ~> t1
classify_t0_line(line="split(str=x) ~> r") ~> t2
classify_t0_line(line="Gate x (> 0) >> r") ~> t3
classify_t0_line(line="F(arr) { now >> r }") ~> t4
[T+]
show shall(t1)
show shall(t2)
show shall(t3)
show shall(t4)
