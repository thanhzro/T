[T-]
import "lib/basic/std.t"

[T0]
padLeft(str="42", n=5, ch="0") ~> O1
padRight(str="hi", n=5, ch=".") ~> O2

[T+]
show shall(O1)
show shall(O2)
