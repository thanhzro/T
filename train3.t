[T-]
import "lib/basic/std.t"
import "lib/advanced/ml_t.t"
row0 = [0.5, 0.3, 0.2, 0.1]
row1 = [0.1, 0.5, 0.3, 0.1]
row2 = [0.2, 0.1, 0.5, 0.2]
row3 = [0.1, 0.2, 0.1, 0.5]
bv = [0, 0, 0, 0]
lr = 0.5
xa = [1, 0, 0, 0]
ta = [0, 1, 0, 0]
xb = [0, 1, 0, 0]
tb = [0, 0, 1, 0]
xc = [0, 0, 1, 0]
tc = [0, 0, 0, 1]
xd = [0, 0, 0, 1]
td = [1, 0, 0, 0]
[T0]
linear_rows(r0=row0, r1=row1, r2=row2, r3=row3, bv=bv, x=xa) ~> _p_ep0_p0
vec_sub(a=_p_ep0_p0, b=ta) ~> _g_ep0_p0
get(arr=_g_ep0_p0, idx=0) ~> _gs_ep0_p0_r0
vec_scale(a=xa, s=_gs_ep0_p0_r0) ~> _rg_ep0_p0_r0
sgd_update(weights=row0, grad=_rg_ep0_p0_r0, lr=lr) ~> _nr_ep0_p0_r0
get(arr=_g_ep0_p0, idx=1) ~> _gs_ep0_p0_r1
vec_scale(a=xa, s=_gs_ep0_p0_r1) ~> _rg_ep0_p0_r1
sgd_update(weights=row1, grad=_rg_ep0_p0_r1, lr=lr) ~> _nr_ep0_p0_r1
get(arr=_g_ep0_p0, idx=2) ~> _gs_ep0_p0_r2
vec_scale(a=xa, s=_gs_ep0_p0_r2) ~> _rg_ep0_p0_r2
sgd_update(weights=row2, grad=_rg_ep0_p0_r2, lr=lr) ~> _nr_ep0_p0_r2
get(arr=_g_ep0_p0, idx=3) ~> _gs_ep0_p0_r3
vec_scale(a=xa, s=_gs_ep0_p0_r3) ~> _rg_ep0_p0_r3
sgd_update(weights=row3, grad=_rg_ep0_p0_r3, lr=lr) ~> _nr_ep0_p0_r3
linear_rows(r0=_nr_ep0_p0_r0, r1=_nr_ep0_p0_r1, r2=_nr_ep0_p0_r2, r3=_nr_ep0_p0_r3, bv=bv, x=xb) ~> _p_ep0_p1
vec_sub(a=_p_ep0_p1, b=tb) ~> _g_ep0_p1
get(arr=_g_ep0_p1, idx=0) ~> _gs_ep0_p1_r0
vec_scale(a=xb, s=_gs_ep0_p1_r0) ~> _rg_ep0_p1_r0
sgd_update(weights=_nr_ep0_p0_r0, grad=_rg_ep0_p1_r0, lr=lr) ~> _nr_ep0_p1_r0
get(arr=_g_ep0_p1, idx=1) ~> _gs_ep0_p1_r1
vec_scale(a=xb, s=_gs_ep0_p1_r1) ~> _rg_ep0_p1_r1
sgd_update(weights=_nr_ep0_p0_r1, grad=_rg_ep0_p1_r1, lr=lr) ~> _nr_ep0_p1_r1
get(arr=_g_ep0_p1, idx=2) ~> _gs_ep0_p1_r2
vec_scale(a=xb, s=_gs_ep0_p1_r2) ~> _rg_ep0_p1_r2
sgd_update(weights=_nr_ep0_p0_r2, grad=_rg_ep0_p1_r2, lr=lr) ~> _nr_ep0_p1_r2
get(arr=_g_ep0_p1, idx=3) ~> _gs_ep0_p1_r3
vec_scale(a=xb, s=_gs_ep0_p1_r3) ~> _rg_ep0_p1_r3
sgd_update(weights=_nr_ep0_p0_r3, grad=_rg_ep0_p1_r3, lr=lr) ~> _nr_ep0_p1_r3
linear_rows(r0=_nr_ep0_p1_r0, r1=_nr_ep0_p1_r1, r2=_nr_ep0_p1_r2, r3=_nr_ep0_p1_r3, bv=bv, x=xc) ~> _p_ep0_p2
vec_sub(a=_p_ep0_p2, b=tc) ~> _g_ep0_p2
get(arr=_g_ep0_p2, idx=0) ~> _gs_ep0_p2_r0
vec_scale(a=xc, s=_gs_ep0_p2_r0) ~> _rg_ep0_p2_r0
sgd_update(weights=_nr_ep0_p1_r0, grad=_rg_ep0_p2_r0, lr=lr) ~> _nr_ep0_p2_r0
get(arr=_g_ep0_p2, idx=1) ~> _gs_ep0_p2_r1
vec_scale(a=xc, s=_gs_ep0_p2_r1) ~> _rg_ep0_p2_r1
sgd_update(weights=_nr_ep0_p1_r1, grad=_rg_ep0_p2_r1, lr=lr) ~> _nr_ep0_p2_r1
get(arr=_g_ep0_p2, idx=2) ~> _gs_ep0_p2_r2
vec_scale(a=xc, s=_gs_ep0_p2_r2) ~> _rg_ep0_p2_r2
sgd_update(weights=_nr_ep0_p1_r2, grad=_rg_ep0_p2_r2, lr=lr) ~> _nr_ep0_p2_r2
get(arr=_g_ep0_p2, idx=3) ~> _gs_ep0_p2_r3
vec_scale(a=xc, s=_gs_ep0_p2_r3) ~> _rg_ep0_p2_r3
sgd_update(weights=_nr_ep0_p1_r3, grad=_rg_ep0_p2_r3, lr=lr) ~> _nr_ep0_p2_r3
linear_rows(r0=_nr_ep0_p2_r0, r1=_nr_ep0_p2_r1, r2=_nr_ep0_p2_r2, r3=_nr_ep0_p2_r3, bv=bv, x=xd) ~> _p_ep0_p3
vec_sub(a=_p_ep0_p3, b=td) ~> _g_ep0_p3
get(arr=_g_ep0_p3, idx=0) ~> _gs_ep0_p3_r0
vec_scale(a=xd, s=_gs_ep0_p3_r0) ~> _rg_ep0_p3_r0
sgd_update(weights=_nr_ep0_p2_r0, grad=_rg_ep0_p3_r0, lr=lr) ~> _nr_ep0_p3_r0
get(arr=_g_ep0_p3, idx=1) ~> _gs_ep0_p3_r1
vec_scale(a=xd, s=_gs_ep0_p3_r1) ~> _rg_ep0_p3_r1
sgd_update(weights=_nr_ep0_p2_r1, grad=_rg_ep0_p3_r1, lr=lr) ~> _nr_ep0_p3_r1
get(arr=_g_ep0_p3, idx=2) ~> _gs_ep0_p3_r2
vec_scale(a=xd, s=_gs_ep0_p3_r2) ~> _rg_ep0_p3_r2
sgd_update(weights=_nr_ep0_p2_r2, grad=_rg_ep0_p3_r2, lr=lr) ~> _nr_ep0_p3_r2
get(arr=_g_ep0_p3, idx=3) ~> _gs_ep0_p3_r3
vec_scale(a=xd, s=_gs_ep0_p3_r3) ~> _rg_ep0_p3_r3
sgd_update(weights=_nr_ep0_p2_r3, grad=_rg_ep0_p3_r3, lr=lr) ~> _nr_ep0_p3_r3
linear_rows(r0=_nr_ep0_p3_r0, r1=_nr_ep0_p3_r1, r2=_nr_ep0_p3_r2, r3=_nr_ep0_p3_r3, bv=bv, x=xa) ~> _p_ep1_p0
vec_sub(a=_p_ep1_p0, b=ta) ~> _g_ep1_p0
get(arr=_g_ep1_p0, idx=0) ~> _gs_ep1_p0_r0
vec_scale(a=xa, s=_gs_ep1_p0_r0) ~> _rg_ep1_p0_r0
sgd_update(weights=_nr_ep0_p3_r0, grad=_rg_ep1_p0_r0, lr=lr) ~> _nr_ep1_p0_r0
get(arr=_g_ep1_p0, idx=1) ~> _gs_ep1_p0_r1
vec_scale(a=xa, s=_gs_ep1_p0_r1) ~> _rg_ep1_p0_r1
sgd_update(weights=_nr_ep0_p3_r1, grad=_rg_ep1_p0_r1, lr=lr) ~> _nr_ep1_p0_r1
get(arr=_g_ep1_p0, idx=2) ~> _gs_ep1_p0_r2
vec_scale(a=xa, s=_gs_ep1_p0_r2) ~> _rg_ep1_p0_r2
sgd_update(weights=_nr_ep0_p3_r2, grad=_rg_ep1_p0_r2, lr=lr) ~> _nr_ep1_p0_r2
get(arr=_g_ep1_p0, idx=3) ~> _gs_ep1_p0_r3
vec_scale(a=xa, s=_gs_ep1_p0_r3) ~> _rg_ep1_p0_r3
sgd_update(weights=_nr_ep0_p3_r3, grad=_rg_ep1_p0_r3, lr=lr) ~> _nr_ep1_p0_r3
linear_rows(r0=_nr_ep1_p0_r0, r1=_nr_ep1_p0_r1, r2=_nr_ep1_p0_r2, r3=_nr_ep1_p0_r3, bv=bv, x=xb) ~> _p_ep1_p1
vec_sub(a=_p_ep1_p1, b=tb) ~> _g_ep1_p1
get(arr=_g_ep1_p1, idx=0) ~> _gs_ep1_p1_r0
vec_scale(a=xb, s=_gs_ep1_p1_r0) ~> _rg_ep1_p1_r0
sgd_update(weights=_nr_ep1_p0_r0, grad=_rg_ep1_p1_r0, lr=lr) ~> _nr_ep1_p1_r0
get(arr=_g_ep1_p1, idx=1) ~> _gs_ep1_p1_r1
vec_scale(a=xb, s=_gs_ep1_p1_r1) ~> _rg_ep1_p1_r1
sgd_update(weights=_nr_ep1_p0_r1, grad=_rg_ep1_p1_r1, lr=lr) ~> _nr_ep1_p1_r1
get(arr=_g_ep1_p1, idx=2) ~> _gs_ep1_p1_r2
vec_scale(a=xb, s=_gs_ep1_p1_r2) ~> _rg_ep1_p1_r2
sgd_update(weights=_nr_ep1_p0_r2, grad=_rg_ep1_p1_r2, lr=lr) ~> _nr_ep1_p1_r2
get(arr=_g_ep1_p1, idx=3) ~> _gs_ep1_p1_r3
vec_scale(a=xb, s=_gs_ep1_p1_r3) ~> _rg_ep1_p1_r3
sgd_update(weights=_nr_ep1_p0_r3, grad=_rg_ep1_p1_r3, lr=lr) ~> _nr_ep1_p1_r3
linear_rows(r0=_nr_ep1_p1_r0, r1=_nr_ep1_p1_r1, r2=_nr_ep1_p1_r2, r3=_nr_ep1_p1_r3, bv=bv, x=xc) ~> _p_ep1_p2
vec_sub(a=_p_ep1_p2, b=tc) ~> _g_ep1_p2
get(arr=_g_ep1_p2, idx=0) ~> _gs_ep1_p2_r0
vec_scale(a=xc, s=_gs_ep1_p2_r0) ~> _rg_ep1_p2_r0
sgd_update(weights=_nr_ep1_p1_r0, grad=_rg_ep1_p2_r0, lr=lr) ~> _nr_ep1_p2_r0
get(arr=_g_ep1_p2, idx=1) ~> _gs_ep1_p2_r1
vec_scale(a=xc, s=_gs_ep1_p2_r1) ~> _rg_ep1_p2_r1
sgd_update(weights=_nr_ep1_p1_r1, grad=_rg_ep1_p2_r1, lr=lr) ~> _nr_ep1_p2_r1
get(arr=_g_ep1_p2, idx=2) ~> _gs_ep1_p2_r2
vec_scale(a=xc, s=_gs_ep1_p2_r2) ~> _rg_ep1_p2_r2
sgd_update(weights=_nr_ep1_p1_r2, grad=_rg_ep1_p2_r2, lr=lr) ~> _nr_ep1_p2_r2
get(arr=_g_ep1_p2, idx=3) ~> _gs_ep1_p2_r3
vec_scale(a=xc, s=_gs_ep1_p2_r3) ~> _rg_ep1_p2_r3
sgd_update(weights=_nr_ep1_p1_r3, grad=_rg_ep1_p2_r3, lr=lr) ~> _nr_ep1_p2_r3
linear_rows(r0=_nr_ep1_p2_r0, r1=_nr_ep1_p2_r1, r2=_nr_ep1_p2_r2, r3=_nr_ep1_p2_r3, bv=bv, x=xd) ~> _p_ep1_p3
vec_sub(a=_p_ep1_p3, b=td) ~> _g_ep1_p3
get(arr=_g_ep1_p3, idx=0) ~> _gs_ep1_p3_r0
vec_scale(a=xd, s=_gs_ep1_p3_r0) ~> _rg_ep1_p3_r0
sgd_update(weights=_nr_ep1_p2_r0, grad=_rg_ep1_p3_r0, lr=lr) ~> _nr_ep1_p3_r0
get(arr=_g_ep1_p3, idx=1) ~> _gs_ep1_p3_r1
vec_scale(a=xd, s=_gs_ep1_p3_r1) ~> _rg_ep1_p3_r1
sgd_update(weights=_nr_ep1_p2_r1, grad=_rg_ep1_p3_r1, lr=lr) ~> _nr_ep1_p3_r1
get(arr=_g_ep1_p3, idx=2) ~> _gs_ep1_p3_r2
vec_scale(a=xd, s=_gs_ep1_p3_r2) ~> _rg_ep1_p3_r2
sgd_update(weights=_nr_ep1_p2_r2, grad=_rg_ep1_p3_r2, lr=lr) ~> _nr_ep1_p3_r2
get(arr=_g_ep1_p3, idx=3) ~> _gs_ep1_p3_r3
vec_scale(a=xd, s=_gs_ep1_p3_r3) ~> _rg_ep1_p3_r3
sgd_update(weights=_nr_ep1_p2_r3, grad=_rg_ep1_p3_r3, lr=lr) ~> _nr_ep1_p3_r3
linear_rows(r0=_nr_ep1_p3_r0, r1=_nr_ep1_p3_r1, r2=_nr_ep1_p3_r2, r3=_nr_ep1_p3_r3, bv=bv, x=xa) ~> _p_ep2_p0
vec_sub(a=_p_ep2_p0, b=ta) ~> _g_ep2_p0
get(arr=_g_ep2_p0, idx=0) ~> _gs_ep2_p0_r0
vec_scale(a=xa, s=_gs_ep2_p0_r0) ~> _rg_ep2_p0_r0
sgd_update(weights=_nr_ep1_p3_r0, grad=_rg_ep2_p0_r0, lr=lr) ~> _nr_ep2_p0_r0
get(arr=_g_ep2_p0, idx=1) ~> _gs_ep2_p0_r1
vec_scale(a=xa, s=_gs_ep2_p0_r1) ~> _rg_ep2_p0_r1
sgd_update(weights=_nr_ep1_p3_r1, grad=_rg_ep2_p0_r1, lr=lr) ~> _nr_ep2_p0_r1
get(arr=_g_ep2_p0, idx=2) ~> _gs_ep2_p0_r2
vec_scale(a=xa, s=_gs_ep2_p0_r2) ~> _rg_ep2_p0_r2
sgd_update(weights=_nr_ep1_p3_r2, grad=_rg_ep2_p0_r2, lr=lr) ~> _nr_ep2_p0_r2
get(arr=_g_ep2_p0, idx=3) ~> _gs_ep2_p0_r3
vec_scale(a=xa, s=_gs_ep2_p0_r3) ~> _rg_ep2_p0_r3
sgd_update(weights=_nr_ep1_p3_r3, grad=_rg_ep2_p0_r3, lr=lr) ~> _nr_ep2_p0_r3
linear_rows(r0=_nr_ep2_p0_r0, r1=_nr_ep2_p0_r1, r2=_nr_ep2_p0_r2, r3=_nr_ep2_p0_r3, bv=bv, x=xb) ~> _p_ep2_p1
vec_sub(a=_p_ep2_p1, b=tb) ~> _g_ep2_p1
get(arr=_g_ep2_p1, idx=0) ~> _gs_ep2_p1_r0
vec_scale(a=xb, s=_gs_ep2_p1_r0) ~> _rg_ep2_p1_r0
sgd_update(weights=_nr_ep2_p0_r0, grad=_rg_ep2_p1_r0, lr=lr) ~> _nr_ep2_p1_r0
get(arr=_g_ep2_p1, idx=1) ~> _gs_ep2_p1_r1
vec_scale(a=xb, s=_gs_ep2_p1_r1) ~> _rg_ep2_p1_r1
sgd_update(weights=_nr_ep2_p0_r1, grad=_rg_ep2_p1_r1, lr=lr) ~> _nr_ep2_p1_r1
get(arr=_g_ep2_p1, idx=2) ~> _gs_ep2_p1_r2
vec_scale(a=xb, s=_gs_ep2_p1_r2) ~> _rg_ep2_p1_r2
sgd_update(weights=_nr_ep2_p0_r2, grad=_rg_ep2_p1_r2, lr=lr) ~> _nr_ep2_p1_r2
get(arr=_g_ep2_p1, idx=3) ~> _gs_ep2_p1_r3
vec_scale(a=xb, s=_gs_ep2_p1_r3) ~> _rg_ep2_p1_r3
sgd_update(weights=_nr_ep2_p0_r3, grad=_rg_ep2_p1_r3, lr=lr) ~> _nr_ep2_p1_r3
linear_rows(r0=_nr_ep2_p1_r0, r1=_nr_ep2_p1_r1, r2=_nr_ep2_p1_r2, r3=_nr_ep2_p1_r3, bv=bv, x=xc) ~> _p_ep2_p2
vec_sub(a=_p_ep2_p2, b=tc) ~> _g_ep2_p2
get(arr=_g_ep2_p2, idx=0) ~> _gs_ep2_p2_r0
vec_scale(a=xc, s=_gs_ep2_p2_r0) ~> _rg_ep2_p2_r0
sgd_update(weights=_nr_ep2_p1_r0, grad=_rg_ep2_p2_r0, lr=lr) ~> _nr_ep2_p2_r0
get(arr=_g_ep2_p2, idx=1) ~> _gs_ep2_p2_r1
vec_scale(a=xc, s=_gs_ep2_p2_r1) ~> _rg_ep2_p2_r1
sgd_update(weights=_nr_ep2_p1_r1, grad=_rg_ep2_p2_r1, lr=lr) ~> _nr_ep2_p2_r1
get(arr=_g_ep2_p2, idx=2) ~> _gs_ep2_p2_r2
vec_scale(a=xc, s=_gs_ep2_p2_r2) ~> _rg_ep2_p2_r2
sgd_update(weights=_nr_ep2_p1_r2, grad=_rg_ep2_p2_r2, lr=lr) ~> _nr_ep2_p2_r2
get(arr=_g_ep2_p2, idx=3) ~> _gs_ep2_p2_r3
vec_scale(a=xc, s=_gs_ep2_p2_r3) ~> _rg_ep2_p2_r3
sgd_update(weights=_nr_ep2_p1_r3, grad=_rg_ep2_p2_r3, lr=lr) ~> _nr_ep2_p2_r3
linear_rows(r0=_nr_ep2_p2_r0, r1=_nr_ep2_p2_r1, r2=_nr_ep2_p2_r2, r3=_nr_ep2_p2_r3, bv=bv, x=xd) ~> _p_ep2_p3
vec_sub(a=_p_ep2_p3, b=td) ~> _g_ep2_p3
get(arr=_g_ep2_p3, idx=0) ~> _gs_ep2_p3_r0
vec_scale(a=xd, s=_gs_ep2_p3_r0) ~> _rg_ep2_p3_r0
sgd_update(weights=_nr_ep2_p2_r0, grad=_rg_ep2_p3_r0, lr=lr) ~> _nr_ep2_p3_r0
get(arr=_g_ep2_p3, idx=1) ~> _gs_ep2_p3_r1
vec_scale(a=xd, s=_gs_ep2_p3_r1) ~> _rg_ep2_p3_r1
sgd_update(weights=_nr_ep2_p2_r1, grad=_rg_ep2_p3_r1, lr=lr) ~> _nr_ep2_p3_r1
get(arr=_g_ep2_p3, idx=2) ~> _gs_ep2_p3_r2
vec_scale(a=xd, s=_gs_ep2_p3_r2) ~> _rg_ep2_p3_r2
sgd_update(weights=_nr_ep2_p2_r2, grad=_rg_ep2_p3_r2, lr=lr) ~> _nr_ep2_p3_r2
get(arr=_g_ep2_p3, idx=3) ~> _gs_ep2_p3_r3
vec_scale(a=xd, s=_gs_ep2_p3_r3) ~> _rg_ep2_p3_r3
sgd_update(weights=_nr_ep2_p2_r3, grad=_rg_ep2_p3_r3, lr=lr) ~> _nr_ep2_p3_r3
linear_rows(r0=_nr_ep2_p3_r0, r1=_nr_ep2_p3_r1, r2=_nr_ep2_p3_r2, r3=_nr_ep2_p3_r3, bv=bv, x=xa) ~> _c_f0
softmax(arr=_c_f0) ~> _pr_f0
argmax4(arr=_pr_f0) ~> _an_f0
linear_rows(r0=_nr_ep2_p3_r0, r1=_nr_ep2_p3_r1, r2=_nr_ep2_p3_r2, r3=_nr_ep2_p3_r3, bv=bv, x=xb) ~> _c_f1
softmax(arr=_c_f1) ~> _pr_f1
argmax4(arr=_pr_f1) ~> _an_f1
linear_rows(r0=_nr_ep2_p3_r0, r1=_nr_ep2_p3_r1, r2=_nr_ep2_p3_r2, r3=_nr_ep2_p3_r3, bv=bv, x=xc) ~> _c_f2
softmax(arr=_c_f2) ~> _pr_f2
argmax4(arr=_pr_f2) ~> _an_f2
linear_rows(r0=_nr_ep2_p3_r0, r1=_nr_ep2_p3_r1, r2=_nr_ep2_p3_r2, r3=_nr_ep2_p3_r3, bv=bv, x=xd) ~> _c_f3
softmax(arr=_c_f3) ~> _pr_f3
argmax4(arr=_pr_f3) ~> _an_f3
[T+]
show shall(_an_f0)
show shall(_an_f1)
show shall(_an_f2)
show shall(_an_f3)