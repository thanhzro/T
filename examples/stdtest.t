[T-]
import "std.t"
arr scores = [80, 90, 70]

[T0]
sum(arr=scores) ~> O1
avg(arr=scores) ~> O2

[T+]
show shall(O1)
show shall(O2)
