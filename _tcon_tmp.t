[T-]
import "lib/basic/std.t"
import "lib/advanced/t_lm.t"
[T0]
one_hot_4(idx=2) ~> v
encode_char(c="F") ~> code
[T+]
show shall(v)
show shall(code)
