[T-]
import "lib/std.t"
data = [3,1,4,1,5,9,2,6]

[T0]
max_arr(arr=data) ~> O1
min_arr(arr=data) ~> O2

[T+]
show shall(O1)
show shall(O2)
