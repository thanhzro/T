[T-]
import "lib/basic/std.t"
flatmat = [1, 0, 0, 0, 0, 2, 0, 0, 0, 0, 3, 0, 0, 0, 0, 4]
[T0]
get(arr=flatmat, idx=0) ~> v0
get(arr=flatmat, idx=4) ~> v4
get(arr=flatmat, idx=5) ~> v5
[T+]
show shall(v0)
show shall(v4)
show shall(v5)
