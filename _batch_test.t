[T-]
import "lib/basic/std.t"
[T0]
abs(val=-5) ~> O1
pow(base=2, exp=8) ~> O2
ceil(val=3.2) ~> O3
[T+]
show shall(O1, O2, O3)
