[T-]
import "lib/basic/std.t"
data = [3,1,2,1,3,2,4]

[T0]
unique(arr=data) ~> O1

[T+]
show shall(O1)
