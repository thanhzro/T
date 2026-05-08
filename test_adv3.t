[T-]
import "lib/basic/std.t"
import "lib/advanced/math3.t"
import "lib/advanced/string3.t"
import "lib/advanced/validate.t"

[T0]
round(val=3.7) ~> O1
is_email(str="test@gmail.com") ~> O2

[T+]
show shall(O1, O2)
