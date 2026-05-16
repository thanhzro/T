[T-]
import "lib/basic/std.t"
import "lib/advanced/ml_t.t"
w = [0.5, 0.3, 0.2]
grad = [0.1, 0.05, 0.02]
lr = 0.01
[T0]
sgd_update(weights=w, grad=grad, lr=lr) ~> new_w
[T+]
show shall(new_w)
