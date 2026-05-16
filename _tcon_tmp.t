[T-]
import "lib/basic/std.t"
import "lib/advanced/ml_t.t"
x = [1, 0, 1]
target = [1, 0, 0]
w = [[0.5, 0.3, 0.2], [0.1, 0.8, 0.1], [0.2, 0.2, 0.6]]
b = [0, 0, 0]
lr = 0.01
[T0]
linear(x=x, weights=w, bias=b) ~> pred
mse_loss(pred=pred, target=target) ~> loss1
vec_sub(a=pred, b=target) ~> grad_out
mat_update_3(mat=w, grad=grad_out, lr=lr) ~> new_w
linear(x=x, weights=new_w, bias=b) ~> new_pred
mse_loss(pred=new_pred, target=target) ~> loss2
[T+]
show shall(loss1)
show shall(loss2)
