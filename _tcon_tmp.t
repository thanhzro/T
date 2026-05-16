[T-]
import "lib/basic/std.t"
import "lib/advanced/ml_t.t"
wpath = "test_weights.txt"
[T0]
load_weights(path=wpath) ~> weights
[T+]
show shall(weights)
