[T-]
import "lib/std.t"
data = [3,1,4,1,5,9,2,6]

[T0]
first(arr=data) ~> O1

[T+]
show shall(O1)
