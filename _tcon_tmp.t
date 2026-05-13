[T-]
import "lib/basic/std.t"
[T0]
replace(str="hello world", old=" ", new="_") ~> r
[T+]
show shall(r)
