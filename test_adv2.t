[T-]
import "lib/basic/std.t"
import "lib/advanced/math3.t"
import "lib/advanced/string3.t"

[T0]
round(val=3.7) ~> O1
starts_with(str="hello", sub="he") ~> O2

[T+]
show shall(O1, O2)
