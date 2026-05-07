[T-]
import "lib/std.t"

[T0]
log(val=1) ~> O1
log(val=2) ~> O2

[T+]
show shall(O1)
show shall(O2)
