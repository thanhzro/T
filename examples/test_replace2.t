[T-]
import "lib/basic/std.t"

[T0]
replace(str="hello world", old="world", new="T") ~> O1

[T+]
show shall(O1)
