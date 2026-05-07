[T-]
import "lib/std.t"
data = ["a","b","c"]

[T0]
join(arr=data, sep="-") ~> O1

[T+]
show shall(O1)
