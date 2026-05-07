[T-]
import "lib/std.t"

[T0]
startsWith(str="hello world", prefix="bye") ~> O1
endsWith(str="hello world", suffix="bye") ~> O2

[T+]
show shall(O1)
show shall(O2)
