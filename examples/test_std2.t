[T-]
import "lib/std.t"
data = [1,2,3,2,1,2]

[T0]
toString(val=42) ~> O1
count(arr=data, val=2) ~> O2

[T+]
show shall(O1)
show shall(O2)
