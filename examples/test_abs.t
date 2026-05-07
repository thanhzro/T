[T-]
import "lib/std.t"

[T0]
abs(val=-42) ~> O1
abs(val=15) ~> O2

[T+]
show shall(O1)
show shall(O2)
