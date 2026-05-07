[T-]
import "lib/std.t"
a = [1, 2, 3]
b = [4, 5, 6]

[T0]
zip(a=a, b=b) ~> O1

[T+]
show shall(O1)
