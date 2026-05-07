[T-]
import "lib/basic/std.t"

[T0]
pi() ~> P
sin(val=0) ~> O1
cos(val=0) ~> O2

[T+]
show shall(P)
show shall(O1)
show shall(O2)
