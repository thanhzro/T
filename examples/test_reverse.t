[T-]
import "lib/std.t"
data = [10,20,30,40,50]

[T0]
reverse(arr=data) ~> O1

[T+]
show shall(O1)
