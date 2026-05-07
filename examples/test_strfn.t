[T-]
import "lib/std.t"

[T0]
startsWith(str="hello world", prefix="hello") ~> O1
endsWith(str="hello world", suffix="world") ~> O2

[T+]
show shall(O1)
show shall(O2)
