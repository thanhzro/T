[T-]
import "lib/basic/std.t"
import "lib/advanced/ml_t.t"
w0 = [[0.5, 0.3, 0.2, 0.1], [0.1, 0.5, 0.3, 0.1], [0.2, 0.1, 0.5, 0.2], [0.1, 0.2, 0.1, 0.5]]
bv = [0, 0, 0, 0]
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
linear(x=x0, weights=w0, bias=bv) ~> pe00
vec_sub(a=pe00, b=t0) ~> ge00
mat_update_4(mat=w0, grad=ge00, x=x0, lr=lr) ~> we00
linear(x=x1, weights=we00, bias=bv) ~> pe01
vec_sub(a=pe01, b=t1) ~> ge01
mat_update_4(mat=we00, grad=ge01, x=x1, lr=lr) ~> we01
linear(x=x2, weights=we01, bias=bv) ~> pe02
vec_sub(a=pe02, b=t2) ~> ge02
mat_update_4(mat=we01, grad=ge02, x=x2, lr=lr) ~> we02
linear(x=x3, weights=we02, bias=bv) ~> pe03
vec_sub(a=pe03, b=t3) ~> ge03
mat_update_4(mat=we02, grad=ge03, x=x3, lr=lr) ~> we03
linear(x=x0, weights=we03, bias=bv) ~> pe10
vec_sub(a=pe10, b=t0) ~> ge10
mat_update_4(mat=we03, grad=ge10, x=x0, lr=lr) ~> we10
linear(x=x1, weights=we10, bias=bv) ~> pe11
vec_sub(a=pe11, b=t1) ~> ge11
mat_update_4(mat=we10, grad=ge11, x=x1, lr=lr) ~> we11
linear(x=x2, weights=we11, bias=bv) ~> pe12
vec_sub(a=pe12, b=t2) ~> ge12
mat_update_4(mat=we11, grad=ge12, x=x2, lr=lr) ~> we12
linear(x=x3, weights=we12, bias=bv) ~> pe13
vec_sub(a=pe13, b=t3) ~> ge13
mat_update_4(mat=we12, grad=ge13, x=x3, lr=lr) ~> we13
linear(x=x0, weights=we13, bias=bv) ~> pe20
vec_sub(a=pe20, b=t0) ~> ge20
mat_update_4(mat=we13, grad=ge20, x=x0, lr=lr) ~> we20
linear(x=x1, weights=we20, bias=bv) ~> pe21
vec_sub(a=pe21, b=t1) ~> ge21
mat_update_4(mat=we20, grad=ge21, x=x1, lr=lr) ~> we21
linear(x=x2, weights=we21, bias=bv) ~> pe22
vec_sub(a=pe22, b=t2) ~> ge22
mat_update_4(mat=we21, grad=ge22, x=x2, lr=lr) ~> we22
linear(x=x3, weights=we22, bias=bv) ~> pe23
vec_sub(a=pe23, b=t3) ~> ge23
mat_update_4(mat=we22, grad=ge23, x=x3, lr=lr) ~> we23
linear(x=x0, weights=we23, bias=bv) ~> pe30
vec_sub(a=pe30, b=t0) ~> ge30
mat_update_4(mat=we23, grad=ge30, x=x0, lr=lr) ~> we30
linear(x=x1, weights=we30, bias=bv) ~> pe31
vec_sub(a=pe31, b=t1) ~> ge31
mat_update_4(mat=we30, grad=ge31, x=x1, lr=lr) ~> we31
linear(x=x2, weights=we31, bias=bv) ~> pe32
vec_sub(a=pe32, b=t2) ~> ge32
mat_update_4(mat=we31, grad=ge32, x=x2, lr=lr) ~> we32
linear(x=x3, weights=we32, bias=bv) ~> pe33
vec_sub(a=pe33, b=t3) ~> ge33
mat_update_4(mat=we32, grad=ge33, x=x3, lr=lr) ~> we33
linear(x=x0, weights=we33, bias=bv) ~> pe40
vec_sub(a=pe40, b=t0) ~> ge40
mat_update_4(mat=we33, grad=ge40, x=x0, lr=lr) ~> we40
linear(x=x1, weights=we40, bias=bv) ~> pe41
vec_sub(a=pe41, b=t1) ~> ge41
mat_update_4(mat=we40, grad=ge41, x=x1, lr=lr) ~> we41
linear(x=x2, weights=we41, bias=bv) ~> pe42
vec_sub(a=pe42, b=t2) ~> ge42
mat_update_4(mat=we41, grad=ge42, x=x2, lr=lr) ~> we42
linear(x=x3, weights=we42, bias=bv) ~> pe43
vec_sub(a=pe43, b=t3) ~> ge43
mat_update_4(mat=we42, grad=ge43, x=x3, lr=lr) ~> we43
linear(x=x0, weights=we43, bias=bv) ~> pe50
vec_sub(a=pe50, b=t0) ~> ge50
mat_update_4(mat=we43, grad=ge50, x=x0, lr=lr) ~> we50
linear(x=x1, weights=we50, bias=bv) ~> pe51
vec_sub(a=pe51, b=t1) ~> ge51
mat_update_4(mat=we50, grad=ge51, x=x1, lr=lr) ~> we51
linear(x=x2, weights=we51, bias=bv) ~> pe52
vec_sub(a=pe52, b=t2) ~> ge52
mat_update_4(mat=we51, grad=ge52, x=x2, lr=lr) ~> we52
linear(x=x3, weights=we52, bias=bv) ~> pe53
vec_sub(a=pe53, b=t3) ~> ge53
mat_update_4(mat=we52, grad=ge53, x=x3, lr=lr) ~> we53
linear(x=x0, weights=we53, bias=bv) ~> c0
softmax(arr=c0) ~> prob0
argmax4(arr=prob0) ~> ans0
linear(x=x1, weights=we53, bias=bv) ~> c1
softmax(arr=c1) ~> prob1
argmax4(arr=prob1) ~> ans1
linear(x=x2, weights=we53, bias=bv) ~> c2
softmax(arr=c2) ~> prob2
argmax4(arr=prob2) ~> ans2
linear(x=x3, weights=we53, bias=bv) ~> c3
softmax(arr=c3) ~> prob3
argmax4(arr=prob3) ~> ans3
[T+]
show shall(ans0)
show shall(ans1)
show shall(ans2)
show shall(ans3)