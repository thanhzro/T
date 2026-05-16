[T-]
import "lib/basic/std.t"
import "lib/advanced/ml_t.t"
[T0]
exp(val=0) ~> e0
exp(val=1) ~> e1
sigmoid(x=0) ~> sg
[T+]
show shall(e0)
show shall(e1)
show shall(sg)
