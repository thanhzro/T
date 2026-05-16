[T-]
import "lib/basic/std.t"
import "lib/advanced/ml_t.t"
w = [[0.5, 0.3, 0.2, 0.1], [0.1, 0.5, 0.3, 0.1], [0.2, 0.1, 0.5, 0.2], [0.1, 0.2, 0.1, 0.5]]
b = [0, 0, 0, 0]
lr = 0.3
x0 = [1, 0, 0, 0]
t0 = [0, 1, 0, 0]
x1 = [0, 1, 0, 0]
t1 = [0, 0, 1, 0]
x2 = [0, 0, 1, 0]
t2 = [0, 0, 0, 1]
x3 = [0, 0, 0, 1]
t3 = [1, 0, 0, 0]
[T0]
linear(x=x0, weights=w, bias=b) ~> p0
vec_sub(a=p0, b=t0) ~> g0
mat_update_4(mat=w, grad=g0, x=x0, lr=lr) ~> w1
linear(x=x1, weights=w1, bias=b) ~> p1
vec_sub(a=p1, b=t1) ~> g1
mat_update_4(mat=w1, grad=g1, x=x1, lr=lr) ~> w2
linear(x=x2, weights=w2, bias=b) ~> p2
vec_sub(a=p2, b=t2) ~> g2
mat_update_4(mat=w2, grad=g2, x=x2, lr=lr) ~> w3
linear(x=x3, weights=w3, bias=b) ~> p3
vec_sub(a=p3, b=t3) ~> g3
mat_update_4(mat=w3, grad=g3, x=x3, lr=lr) ~> w4
linear(x=x0, weights=w4, bias=b) ~> p4
vec_sub(a=p4, b=t0) ~> g4
mat_update_4(mat=w4, grad=g4, x=x0, lr=lr) ~> w5
linear(x=x1, weights=w5, bias=b) ~> p5
vec_sub(a=p5, b=t1) ~> g5
mat_update_4(mat=w5, grad=g5, x=x1, lr=lr) ~> w6
linear(x=x2, weights=w6, bias=b) ~> p6
vec_sub(a=p6, b=t2) ~> g6
mat_update_4(mat=w6, grad=g6, x=x2, lr=lr) ~> w7
linear(x=x3, weights=w7, bias=b) ~> p7
vec_sub(a=p7, b=t3) ~> g7
mat_update_4(mat=w7, grad=g7, x=x3, lr=lr) ~> w8
linear(x=x0, weights=w8, bias=b) ~> p8
vec_sub(a=p8, b=t0) ~> g8
mat_update_4(mat=w8, grad=g8, x=x0, lr=lr) ~> w9
linear(x=x1, weights=w9, bias=b) ~> p9
vec_sub(a=p9, b=t1) ~> g9
mat_update_4(mat=w9, grad=g9, x=x1, lr=lr) ~> w10
linear(x=x2, weights=w10, bias=b) ~> p10
vec_sub(a=p10, b=t2) ~> g10
mat_update_4(mat=w10, grad=g10, x=x2, lr=lr) ~> w11
linear(x=x3, weights=w11, bias=b) ~> p11
vec_sub(a=p11, b=t3) ~> g11
mat_update_4(mat=w11, grad=g11, x=x3, lr=lr) ~> w12
linear(x=x0, weights=w12, bias=b) ~> p12
vec_sub(a=p12, b=t0) ~> g12
mat_update_4(mat=w12, grad=g12, x=x0, lr=lr) ~> w13
linear(x=x1, weights=w13, bias=b) ~> p13
vec_sub(a=p13, b=t1) ~> g13
mat_update_4(mat=w13, grad=g13, x=x1, lr=lr) ~> w14
linear(x=x2, weights=w14, bias=b) ~> p14
vec_sub(a=p14, b=t2) ~> g14
mat_update_4(mat=w14, grad=g14, x=x2, lr=lr) ~> w15
linear(x=x3, weights=w15, bias=b) ~> p15
vec_sub(a=p15, b=t3) ~> g15
mat_update_4(mat=w15, grad=g15, x=x3, lr=lr) ~> w16
linear(x=x0, weights=w16, bias=b) ~> c0
softmax(arr=c0) ~> prob0
argmax4(arr=prob0) ~> ans0
linear(x=x1, weights=w16, bias=b) ~> c1
softmax(arr=c1) ~> prob1
argmax4(arr=prob1) ~> ans1
linear(x=x2, weights=w16, bias=b) ~> c2
softmax(arr=c2) ~> prob2
argmax4(arr=prob2) ~> ans2
linear(x=x3, weights=w16, bias=b) ~> c3
softmax(arr=c3) ~> prob3
argmax4(arr=prob3) ~> ans3
[T+]
show shall(ans0)
show shall(ans1)
show shall(ans2)
show shall(ans3)