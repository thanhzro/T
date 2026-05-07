[T-]
import "lib/std.t"
ten = "hello world"

[T0]
upper(str=lower(str=ten)) ~> O1

[T+]
show shall(O1)
