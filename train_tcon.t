[T-]
import "lib/basic/std.t"
import "lib/advanced/ml_t.t"
import "lib/advanced/t_lm.t"
w = [[0.5, 0.3, 0.2, 0.1], [0.1, 0.5, 0.3, 0.1], [0.2, 0.1, 0.5, 0.2], [0.1, 0.2, 0.1, 0.5]]
b = [0, 0, 0, 0]
lr = 0.1
x0 = [1, 0, 0, 0]
t0 = [0, 1, 0, 0]
x1 = [0, 1, 0, 0]
t1 = [0, 0, 1, 0]
x2 = [0, 0, 1, 0]
t2 = [0, 0, 0, 1]

[T0]
linear(x=x0, weights=w, bias=b) ~> p0
mse_loss(pred=p0, target=t0) ~> l0
vec_sub(a=p0, b=t0) ~> g0
mat_update_4(mat=w, grad=g0, x=x0, lr=lr) ~> w1
linear(x=x1, weights=w1, bias=b) ~> p1
mse_loss(pred=p1, target=t1) ~> l1
vec_sub(a=p1, b=t1) ~> g1
mat_update_4(mat=w1, grad=g1, x=x1, lr=lr) ~> w2
linear(x=x2, weights=w2, bias=b) ~> p2
softmax(arr=p2) ~> prob2
argmax4(arr=prob2) ~> ans2

linear(x=x0, weights=w1, bias=b) ~> p0_check
mse_loss(pred=p0_check, target=t0) ~> l0_check

[T+]
show shall(l0)
show shall(l0_check)
show shall(l1)
