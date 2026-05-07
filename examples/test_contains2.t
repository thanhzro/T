[T-]
import "lib/basic/std.t"

[T0]
contains(str="hello world", sub="world") ~> O1
contains(str="hello world", sub="xyz") ~> O2

[T+]
show shall(O1)
show shall(O2)
