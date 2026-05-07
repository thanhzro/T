[T-]
import "lib/basic/std.t"
row = "Thanh,95,A"

[T0]
split(str=row, sep=",") ~> O1

[T+]
show shall(O1)
