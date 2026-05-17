[T-]
import "lib/basic/std.t"
arr = [0.1, 0.2, 0.3, 0.4]
[T0]
join(arr=arr, sep=",") ~> result
[T+]
show shall(result)
