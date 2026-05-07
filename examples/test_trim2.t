[T-]
import "lib/basic/std.t"

[T0]
trim(str="  hello world  ") ~> O1
len(val=O1) ~> O2

[T+]
show shall(O1)
show shall(O2)
