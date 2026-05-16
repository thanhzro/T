[T-]
import "lib/basic/std.t"
import "lib/advanced/ml_t.t"
x = [1, 0, 1]
target = [1, 0, 0]
w = [[0.5, 0.3, 0.2], [0.1, 0.8, 0.1], [0.2, 0.2, 0.6]]
b = [0, 0, 0]
lr = 0.1
[T0]
linear(x=x, weights=w, bias=b) ~> p1
mse_loss(pred=p1, target=target) ~> l1
vec_sub(a=p1, b=target) ~> g1
mat_update_3(mat=w, grad=g1, lr=lr) ~> w2
linear(x=x, weights=w2, bias=b) ~> p2
mse_loss(pred=p2, target=target) ~> l2
vec_sub(a=p2, b=target) ~> g2
mat_update_3(mat=w2, grad=g2, lr=lr) ~> w3
linear(x=x, weights=w3, bias=b) ~> p3
mse_loss(pred=p3, target=target) ~> l3
[T+]
show shall(l1)
show shall(l2)
show shall(l3)
