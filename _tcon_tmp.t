[T-]
import "lib/basic/std.t"
logits = [0.1, 0.05, 0.8, 0.02, 0.03]
[T0]
argmax_n(arr=logits) ~> best
[T+]
show shall(best)
