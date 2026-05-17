[T-]
import "lib/basic/std.t"
import "lib/advanced/t_parser.t"
line1 = "x + 1 >> r"
line2 = "foo(a=x, b=y) ~> result"
line3 = "Gate val (> 0) >> flag"
[T0]
classify_t0_line(line=line1) ~> t1
classify_t0_line(line=line2) ~> t2
classify_t0_line(line=line3) ~> t3
[T+]
show shall(t1)
show shall(t2)
show shall(t3)
