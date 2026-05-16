[T-]
import "lib/basic/std.t"
import "lib/advanced/ml_t.t"
arr = [2, 4, 6, 8]
[T0]
layer_norm(arr=arr) ~> normed
vec_mean(arr=normed) ~> mean_after
[T+]
show shall(normed)
show shall(mean_after)
