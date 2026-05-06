[T-]
import "lib/std.t"
scores = [80, 90, 70, 60]

[T0]
sum(arr=scores) ~> O1
avg(arr=scores) ~> O2

[T+]
show shall(O1)
show shall(O2)
