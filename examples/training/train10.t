[T-]
import "lib/basic/std.t"
import "lib/advanced/ml_t.t"
r0 = [0.5, 0.3, 0.2, 0.1]
r1 = [0.1, 0.5, 0.3, 0.1]
r2 = [0.2, 0.1, 0.5, 0.2]
r3 = [0.1, 0.2, 0.1, 0.5]
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
linear_rows(r0=r0, r1=r1, r2=r2, r3=r3, bv=bv, x=x0) ~> _p_e0_i0
vec_sub(a=_p_e0_i0, b=t0) ~> _g_e0_i0
get(arr=_g_e0_i0, idx=0) ~> _gs_e0_i0_r0
vec_scale(a=x0, s=_gs_e0_i0_r0) ~> _rg_e0_i0_r0
sgd_update(weights=r0, grad=_rg_e0_i0_r0, lr=lr) ~> _nr_e0_i0_r0
get(arr=_g_e0_i0, idx=1) ~> _gs_e0_i0_r1
vec_scale(a=x0, s=_gs_e0_i0_r1) ~> _rg_e0_i0_r1
sgd_update(weights=r1, grad=_rg_e0_i0_r1, lr=lr) ~> _nr_e0_i0_r1
get(arr=_g_e0_i0, idx=2) ~> _gs_e0_i0_r2
vec_scale(a=x0, s=_gs_e0_i0_r2) ~> _rg_e0_i0_r2
sgd_update(weights=r2, grad=_rg_e0_i0_r2, lr=lr) ~> _nr_e0_i0_r2
get(arr=_g_e0_i0, idx=3) ~> _gs_e0_i0_r3
vec_scale(a=x0, s=_gs_e0_i0_r3) ~> _rg_e0_i0_r3
sgd_update(weights=r3, grad=_rg_e0_i0_r3, lr=lr) ~> _nr_e0_i0_r3
linear_rows(r0=_nr_e0_i0_r0, r1=_nr_e0_i0_r1, r2=_nr_e0_i0_r2, r3=_nr_e0_i0_r3, bv=bv, x=x1) ~> _p_e0_i1
vec_sub(a=_p_e0_i1, b=t1) ~> _g_e0_i1
get(arr=_g_e0_i1, idx=0) ~> _gs_e0_i1_r0
vec_scale(a=x1, s=_gs_e0_i1_r0) ~> _rg_e0_i1_r0
sgd_update(weights=_nr_e0_i0_r0, grad=_rg_e0_i1_r0, lr=lr) ~> _nr_e0_i1_r0
get(arr=_g_e0_i1, idx=1) ~> _gs_e0_i1_r1
vec_scale(a=x1, s=_gs_e0_i1_r1) ~> _rg_e0_i1_r1
sgd_update(weights=_nr_e0_i0_r1, grad=_rg_e0_i1_r1, lr=lr) ~> _nr_e0_i1_r1
get(arr=_g_e0_i1, idx=2) ~> _gs_e0_i1_r2
vec_scale(a=x1, s=_gs_e0_i1_r2) ~> _rg_e0_i1_r2
sgd_update(weights=_nr_e0_i0_r2, grad=_rg_e0_i1_r2, lr=lr) ~> _nr_e0_i1_r2
get(arr=_g_e0_i1, idx=3) ~> _gs_e0_i1_r3
vec_scale(a=x1, s=_gs_e0_i1_r3) ~> _rg_e0_i1_r3
sgd_update(weights=_nr_e0_i0_r3, grad=_rg_e0_i1_r3, lr=lr) ~> _nr_e0_i1_r3
linear_rows(r0=_nr_e0_i1_r0, r1=_nr_e0_i1_r1, r2=_nr_e0_i1_r2, r3=_nr_e0_i1_r3, bv=bv, x=x2) ~> _p_e0_i2
vec_sub(a=_p_e0_i2, b=t2) ~> _g_e0_i2
get(arr=_g_e0_i2, idx=0) ~> _gs_e0_i2_r0
vec_scale(a=x2, s=_gs_e0_i2_r0) ~> _rg_e0_i2_r0
sgd_update(weights=_nr_e0_i1_r0, grad=_rg_e0_i2_r0, lr=lr) ~> _nr_e0_i2_r0
get(arr=_g_e0_i2, idx=1) ~> _gs_e0_i2_r1
vec_scale(a=x2, s=_gs_e0_i2_r1) ~> _rg_e0_i2_r1
sgd_update(weights=_nr_e0_i1_r1, grad=_rg_e0_i2_r1, lr=lr) ~> _nr_e0_i2_r1
get(arr=_g_e0_i2, idx=2) ~> _gs_e0_i2_r2
vec_scale(a=x2, s=_gs_e0_i2_r2) ~> _rg_e0_i2_r2
sgd_update(weights=_nr_e0_i1_r2, grad=_rg_e0_i2_r2, lr=lr) ~> _nr_e0_i2_r2
get(arr=_g_e0_i2, idx=3) ~> _gs_e0_i2_r3
vec_scale(a=x2, s=_gs_e0_i2_r3) ~> _rg_e0_i2_r3
sgd_update(weights=_nr_e0_i1_r3, grad=_rg_e0_i2_r3, lr=lr) ~> _nr_e0_i2_r3
linear_rows(r0=_nr_e0_i2_r0, r1=_nr_e0_i2_r1, r2=_nr_e0_i2_r2, r3=_nr_e0_i2_r3, bv=bv, x=x3) ~> _p_e0_i3
vec_sub(a=_p_e0_i3, b=t3) ~> _g_e0_i3
get(arr=_g_e0_i3, idx=0) ~> _gs_e0_i3_r0
vec_scale(a=x3, s=_gs_e0_i3_r0) ~> _rg_e0_i3_r0
sgd_update(weights=_nr_e0_i2_r0, grad=_rg_e0_i3_r0, lr=lr) ~> _nr_e0_i3_r0
get(arr=_g_e0_i3, idx=1) ~> _gs_e0_i3_r1
vec_scale(a=x3, s=_gs_e0_i3_r1) ~> _rg_e0_i3_r1
sgd_update(weights=_nr_e0_i2_r1, grad=_rg_e0_i3_r1, lr=lr) ~> _nr_e0_i3_r1
get(arr=_g_e0_i3, idx=2) ~> _gs_e0_i3_r2
vec_scale(a=x3, s=_gs_e0_i3_r2) ~> _rg_e0_i3_r2
sgd_update(weights=_nr_e0_i2_r2, grad=_rg_e0_i3_r2, lr=lr) ~> _nr_e0_i3_r2
get(arr=_g_e0_i3, idx=3) ~> _gs_e0_i3_r3
vec_scale(a=x3, s=_gs_e0_i3_r3) ~> _rg_e0_i3_r3
sgd_update(weights=_nr_e0_i2_r3, grad=_rg_e0_i3_r3, lr=lr) ~> _nr_e0_i3_r3
linear_rows(r0=_nr_e0_i3_r0, r1=_nr_e0_i3_r1, r2=_nr_e0_i3_r2, r3=_nr_e0_i3_r3, bv=bv, x=x0) ~> _p_e1_i0
vec_sub(a=_p_e1_i0, b=t0) ~> _g_e1_i0
get(arr=_g_e1_i0, idx=0) ~> _gs_e1_i0_r0
vec_scale(a=x0, s=_gs_e1_i0_r0) ~> _rg_e1_i0_r0
sgd_update(weights=_nr_e0_i3_r0, grad=_rg_e1_i0_r0, lr=lr) ~> _nr_e1_i0_r0
get(arr=_g_e1_i0, idx=1) ~> _gs_e1_i0_r1
vec_scale(a=x0, s=_gs_e1_i0_r1) ~> _rg_e1_i0_r1
sgd_update(weights=_nr_e0_i3_r1, grad=_rg_e1_i0_r1, lr=lr) ~> _nr_e1_i0_r1
get(arr=_g_e1_i0, idx=2) ~> _gs_e1_i0_r2
vec_scale(a=x0, s=_gs_e1_i0_r2) ~> _rg_e1_i0_r2
sgd_update(weights=_nr_e0_i3_r2, grad=_rg_e1_i0_r2, lr=lr) ~> _nr_e1_i0_r2
get(arr=_g_e1_i0, idx=3) ~> _gs_e1_i0_r3
vec_scale(a=x0, s=_gs_e1_i0_r3) ~> _rg_e1_i0_r3
sgd_update(weights=_nr_e0_i3_r3, grad=_rg_e1_i0_r3, lr=lr) ~> _nr_e1_i0_r3
linear_rows(r0=_nr_e1_i0_r0, r1=_nr_e1_i0_r1, r2=_nr_e1_i0_r2, r3=_nr_e1_i0_r3, bv=bv, x=x1) ~> _p_e1_i1
vec_sub(a=_p_e1_i1, b=t1) ~> _g_e1_i1
get(arr=_g_e1_i1, idx=0) ~> _gs_e1_i1_r0
vec_scale(a=x1, s=_gs_e1_i1_r0) ~> _rg_e1_i1_r0
sgd_update(weights=_nr_e1_i0_r0, grad=_rg_e1_i1_r0, lr=lr) ~> _nr_e1_i1_r0
get(arr=_g_e1_i1, idx=1) ~> _gs_e1_i1_r1
vec_scale(a=x1, s=_gs_e1_i1_r1) ~> _rg_e1_i1_r1
sgd_update(weights=_nr_e1_i0_r1, grad=_rg_e1_i1_r1, lr=lr) ~> _nr_e1_i1_r1
get(arr=_g_e1_i1, idx=2) ~> _gs_e1_i1_r2
vec_scale(a=x1, s=_gs_e1_i1_r2) ~> _rg_e1_i1_r2
sgd_update(weights=_nr_e1_i0_r2, grad=_rg_e1_i1_r2, lr=lr) ~> _nr_e1_i1_r2
get(arr=_g_e1_i1, idx=3) ~> _gs_e1_i1_r3
vec_scale(a=x1, s=_gs_e1_i1_r3) ~> _rg_e1_i1_r3
sgd_update(weights=_nr_e1_i0_r3, grad=_rg_e1_i1_r3, lr=lr) ~> _nr_e1_i1_r3
linear_rows(r0=_nr_e1_i1_r0, r1=_nr_e1_i1_r1, r2=_nr_e1_i1_r2, r3=_nr_e1_i1_r3, bv=bv, x=x2) ~> _p_e1_i2
vec_sub(a=_p_e1_i2, b=t2) ~> _g_e1_i2
get(arr=_g_e1_i2, idx=0) ~> _gs_e1_i2_r0
vec_scale(a=x2, s=_gs_e1_i2_r0) ~> _rg_e1_i2_r0
sgd_update(weights=_nr_e1_i1_r0, grad=_rg_e1_i2_r0, lr=lr) ~> _nr_e1_i2_r0
get(arr=_g_e1_i2, idx=1) ~> _gs_e1_i2_r1
vec_scale(a=x2, s=_gs_e1_i2_r1) ~> _rg_e1_i2_r1
sgd_update(weights=_nr_e1_i1_r1, grad=_rg_e1_i2_r1, lr=lr) ~> _nr_e1_i2_r1
get(arr=_g_e1_i2, idx=2) ~> _gs_e1_i2_r2
vec_scale(a=x2, s=_gs_e1_i2_r2) ~> _rg_e1_i2_r2
sgd_update(weights=_nr_e1_i1_r2, grad=_rg_e1_i2_r2, lr=lr) ~> _nr_e1_i2_r2
get(arr=_g_e1_i2, idx=3) ~> _gs_e1_i2_r3
vec_scale(a=x2, s=_gs_e1_i2_r3) ~> _rg_e1_i2_r3
sgd_update(weights=_nr_e1_i1_r3, grad=_rg_e1_i2_r3, lr=lr) ~> _nr_e1_i2_r3
linear_rows(r0=_nr_e1_i2_r0, r1=_nr_e1_i2_r1, r2=_nr_e1_i2_r2, r3=_nr_e1_i2_r3, bv=bv, x=x3) ~> _p_e1_i3
vec_sub(a=_p_e1_i3, b=t3) ~> _g_e1_i3
get(arr=_g_e1_i3, idx=0) ~> _gs_e1_i3_r0
vec_scale(a=x3, s=_gs_e1_i3_r0) ~> _rg_e1_i3_r0
sgd_update(weights=_nr_e1_i2_r0, grad=_rg_e1_i3_r0, lr=lr) ~> _nr_e1_i3_r0
get(arr=_g_e1_i3, idx=1) ~> _gs_e1_i3_r1
vec_scale(a=x3, s=_gs_e1_i3_r1) ~> _rg_e1_i3_r1
sgd_update(weights=_nr_e1_i2_r1, grad=_rg_e1_i3_r1, lr=lr) ~> _nr_e1_i3_r1
get(arr=_g_e1_i3, idx=2) ~> _gs_e1_i3_r2
vec_scale(a=x3, s=_gs_e1_i3_r2) ~> _rg_e1_i3_r2
sgd_update(weights=_nr_e1_i2_r2, grad=_rg_e1_i3_r2, lr=lr) ~> _nr_e1_i3_r2
get(arr=_g_e1_i3, idx=3) ~> _gs_e1_i3_r3
vec_scale(a=x3, s=_gs_e1_i3_r3) ~> _rg_e1_i3_r3
sgd_update(weights=_nr_e1_i2_r3, grad=_rg_e1_i3_r3, lr=lr) ~> _nr_e1_i3_r3
linear_rows(r0=_nr_e1_i3_r0, r1=_nr_e1_i3_r1, r2=_nr_e1_i3_r2, r3=_nr_e1_i3_r3, bv=bv, x=x0) ~> _p_e2_i0
vec_sub(a=_p_e2_i0, b=t0) ~> _g_e2_i0
get(arr=_g_e2_i0, idx=0) ~> _gs_e2_i0_r0
vec_scale(a=x0, s=_gs_e2_i0_r0) ~> _rg_e2_i0_r0
sgd_update(weights=_nr_e1_i3_r0, grad=_rg_e2_i0_r0, lr=lr) ~> _nr_e2_i0_r0
get(arr=_g_e2_i0, idx=1) ~> _gs_e2_i0_r1
vec_scale(a=x0, s=_gs_e2_i0_r1) ~> _rg_e2_i0_r1
sgd_update(weights=_nr_e1_i3_r1, grad=_rg_e2_i0_r1, lr=lr) ~> _nr_e2_i0_r1
get(arr=_g_e2_i0, idx=2) ~> _gs_e2_i0_r2
vec_scale(a=x0, s=_gs_e2_i0_r2) ~> _rg_e2_i0_r2
sgd_update(weights=_nr_e1_i3_r2, grad=_rg_e2_i0_r2, lr=lr) ~> _nr_e2_i0_r2
get(arr=_g_e2_i0, idx=3) ~> _gs_e2_i0_r3
vec_scale(a=x0, s=_gs_e2_i0_r3) ~> _rg_e2_i0_r3
sgd_update(weights=_nr_e1_i3_r3, grad=_rg_e2_i0_r3, lr=lr) ~> _nr_e2_i0_r3
linear_rows(r0=_nr_e2_i0_r0, r1=_nr_e2_i0_r1, r2=_nr_e2_i0_r2, r3=_nr_e2_i0_r3, bv=bv, x=x1) ~> _p_e2_i1
vec_sub(a=_p_e2_i1, b=t1) ~> _g_e2_i1
get(arr=_g_e2_i1, idx=0) ~> _gs_e2_i1_r0
vec_scale(a=x1, s=_gs_e2_i1_r0) ~> _rg_e2_i1_r0
sgd_update(weights=_nr_e2_i0_r0, grad=_rg_e2_i1_r0, lr=lr) ~> _nr_e2_i1_r0
get(arr=_g_e2_i1, idx=1) ~> _gs_e2_i1_r1
vec_scale(a=x1, s=_gs_e2_i1_r1) ~> _rg_e2_i1_r1
sgd_update(weights=_nr_e2_i0_r1, grad=_rg_e2_i1_r1, lr=lr) ~> _nr_e2_i1_r1
get(arr=_g_e2_i1, idx=2) ~> _gs_e2_i1_r2
vec_scale(a=x1, s=_gs_e2_i1_r2) ~> _rg_e2_i1_r2
sgd_update(weights=_nr_e2_i0_r2, grad=_rg_e2_i1_r2, lr=lr) ~> _nr_e2_i1_r2
get(arr=_g_e2_i1, idx=3) ~> _gs_e2_i1_r3
vec_scale(a=x1, s=_gs_e2_i1_r3) ~> _rg_e2_i1_r3
sgd_update(weights=_nr_e2_i0_r3, grad=_rg_e2_i1_r3, lr=lr) ~> _nr_e2_i1_r3
linear_rows(r0=_nr_e2_i1_r0, r1=_nr_e2_i1_r1, r2=_nr_e2_i1_r2, r3=_nr_e2_i1_r3, bv=bv, x=x2) ~> _p_e2_i2
vec_sub(a=_p_e2_i2, b=t2) ~> _g_e2_i2
get(arr=_g_e2_i2, idx=0) ~> _gs_e2_i2_r0
vec_scale(a=x2, s=_gs_e2_i2_r0) ~> _rg_e2_i2_r0
sgd_update(weights=_nr_e2_i1_r0, grad=_rg_e2_i2_r0, lr=lr) ~> _nr_e2_i2_r0
get(arr=_g_e2_i2, idx=1) ~> _gs_e2_i2_r1
vec_scale(a=x2, s=_gs_e2_i2_r1) ~> _rg_e2_i2_r1
sgd_update(weights=_nr_e2_i1_r1, grad=_rg_e2_i2_r1, lr=lr) ~> _nr_e2_i2_r1
get(arr=_g_e2_i2, idx=2) ~> _gs_e2_i2_r2
vec_scale(a=x2, s=_gs_e2_i2_r2) ~> _rg_e2_i2_r2
sgd_update(weights=_nr_e2_i1_r2, grad=_rg_e2_i2_r2, lr=lr) ~> _nr_e2_i2_r2
get(arr=_g_e2_i2, idx=3) ~> _gs_e2_i2_r3
vec_scale(a=x2, s=_gs_e2_i2_r3) ~> _rg_e2_i2_r3
sgd_update(weights=_nr_e2_i1_r3, grad=_rg_e2_i2_r3, lr=lr) ~> _nr_e2_i2_r3
linear_rows(r0=_nr_e2_i2_r0, r1=_nr_e2_i2_r1, r2=_nr_e2_i2_r2, r3=_nr_e2_i2_r3, bv=bv, x=x3) ~> _p_e2_i3
vec_sub(a=_p_e2_i3, b=t3) ~> _g_e2_i3
get(arr=_g_e2_i3, idx=0) ~> _gs_e2_i3_r0
vec_scale(a=x3, s=_gs_e2_i3_r0) ~> _rg_e2_i3_r0
sgd_update(weights=_nr_e2_i2_r0, grad=_rg_e2_i3_r0, lr=lr) ~> _nr_e2_i3_r0
get(arr=_g_e2_i3, idx=1) ~> _gs_e2_i3_r1
vec_scale(a=x3, s=_gs_e2_i3_r1) ~> _rg_e2_i3_r1
sgd_update(weights=_nr_e2_i2_r1, grad=_rg_e2_i3_r1, lr=lr) ~> _nr_e2_i3_r1
get(arr=_g_e2_i3, idx=2) ~> _gs_e2_i3_r2
vec_scale(a=x3, s=_gs_e2_i3_r2) ~> _rg_e2_i3_r2
sgd_update(weights=_nr_e2_i2_r2, grad=_rg_e2_i3_r2, lr=lr) ~> _nr_e2_i3_r2
get(arr=_g_e2_i3, idx=3) ~> _gs_e2_i3_r3
vec_scale(a=x3, s=_gs_e2_i3_r3) ~> _rg_e2_i3_r3
sgd_update(weights=_nr_e2_i2_r3, grad=_rg_e2_i3_r3, lr=lr) ~> _nr_e2_i3_r3
linear_rows(r0=_nr_e2_i3_r0, r1=_nr_e2_i3_r1, r2=_nr_e2_i3_r2, r3=_nr_e2_i3_r3, bv=bv, x=x0) ~> _p_e3_i0
vec_sub(a=_p_e3_i0, b=t0) ~> _g_e3_i0
get(arr=_g_e3_i0, idx=0) ~> _gs_e3_i0_r0
vec_scale(a=x0, s=_gs_e3_i0_r0) ~> _rg_e3_i0_r0
sgd_update(weights=_nr_e2_i3_r0, grad=_rg_e3_i0_r0, lr=lr) ~> _nr_e3_i0_r0
get(arr=_g_e3_i0, idx=1) ~> _gs_e3_i0_r1
vec_scale(a=x0, s=_gs_e3_i0_r1) ~> _rg_e3_i0_r1
sgd_update(weights=_nr_e2_i3_r1, grad=_rg_e3_i0_r1, lr=lr) ~> _nr_e3_i0_r1
get(arr=_g_e3_i0, idx=2) ~> _gs_e3_i0_r2
vec_scale(a=x0, s=_gs_e3_i0_r2) ~> _rg_e3_i0_r2
sgd_update(weights=_nr_e2_i3_r2, grad=_rg_e3_i0_r2, lr=lr) ~> _nr_e3_i0_r2
get(arr=_g_e3_i0, idx=3) ~> _gs_e3_i0_r3
vec_scale(a=x0, s=_gs_e3_i0_r3) ~> _rg_e3_i0_r3
sgd_update(weights=_nr_e2_i3_r3, grad=_rg_e3_i0_r3, lr=lr) ~> _nr_e3_i0_r3
linear_rows(r0=_nr_e3_i0_r0, r1=_nr_e3_i0_r1, r2=_nr_e3_i0_r2, r3=_nr_e3_i0_r3, bv=bv, x=x1) ~> _p_e3_i1
vec_sub(a=_p_e3_i1, b=t1) ~> _g_e3_i1
get(arr=_g_e3_i1, idx=0) ~> _gs_e3_i1_r0
vec_scale(a=x1, s=_gs_e3_i1_r0) ~> _rg_e3_i1_r0
sgd_update(weights=_nr_e3_i0_r0, grad=_rg_e3_i1_r0, lr=lr) ~> _nr_e3_i1_r0
get(arr=_g_e3_i1, idx=1) ~> _gs_e3_i1_r1
vec_scale(a=x1, s=_gs_e3_i1_r1) ~> _rg_e3_i1_r1
sgd_update(weights=_nr_e3_i0_r1, grad=_rg_e3_i1_r1, lr=lr) ~> _nr_e3_i1_r1
get(arr=_g_e3_i1, idx=2) ~> _gs_e3_i1_r2
vec_scale(a=x1, s=_gs_e3_i1_r2) ~> _rg_e3_i1_r2
sgd_update(weights=_nr_e3_i0_r2, grad=_rg_e3_i1_r2, lr=lr) ~> _nr_e3_i1_r2
get(arr=_g_e3_i1, idx=3) ~> _gs_e3_i1_r3
vec_scale(a=x1, s=_gs_e3_i1_r3) ~> _rg_e3_i1_r3
sgd_update(weights=_nr_e3_i0_r3, grad=_rg_e3_i1_r3, lr=lr) ~> _nr_e3_i1_r3
linear_rows(r0=_nr_e3_i1_r0, r1=_nr_e3_i1_r1, r2=_nr_e3_i1_r2, r3=_nr_e3_i1_r3, bv=bv, x=x2) ~> _p_e3_i2
vec_sub(a=_p_e3_i2, b=t2) ~> _g_e3_i2
get(arr=_g_e3_i2, idx=0) ~> _gs_e3_i2_r0
vec_scale(a=x2, s=_gs_e3_i2_r0) ~> _rg_e3_i2_r0
sgd_update(weights=_nr_e3_i1_r0, grad=_rg_e3_i2_r0, lr=lr) ~> _nr_e3_i2_r0
get(arr=_g_e3_i2, idx=1) ~> _gs_e3_i2_r1
vec_scale(a=x2, s=_gs_e3_i2_r1) ~> _rg_e3_i2_r1
sgd_update(weights=_nr_e3_i1_r1, grad=_rg_e3_i2_r1, lr=lr) ~> _nr_e3_i2_r1
get(arr=_g_e3_i2, idx=2) ~> _gs_e3_i2_r2
vec_scale(a=x2, s=_gs_e3_i2_r2) ~> _rg_e3_i2_r2
sgd_update(weights=_nr_e3_i1_r2, grad=_rg_e3_i2_r2, lr=lr) ~> _nr_e3_i2_r2
get(arr=_g_e3_i2, idx=3) ~> _gs_e3_i2_r3
vec_scale(a=x2, s=_gs_e3_i2_r3) ~> _rg_e3_i2_r3
sgd_update(weights=_nr_e3_i1_r3, grad=_rg_e3_i2_r3, lr=lr) ~> _nr_e3_i2_r3
linear_rows(r0=_nr_e3_i2_r0, r1=_nr_e3_i2_r1, r2=_nr_e3_i2_r2, r3=_nr_e3_i2_r3, bv=bv, x=x3) ~> _p_e3_i3
vec_sub(a=_p_e3_i3, b=t3) ~> _g_e3_i3
get(arr=_g_e3_i3, idx=0) ~> _gs_e3_i3_r0
vec_scale(a=x3, s=_gs_e3_i3_r0) ~> _rg_e3_i3_r0
sgd_update(weights=_nr_e3_i2_r0, grad=_rg_e3_i3_r0, lr=lr) ~> _nr_e3_i3_r0
get(arr=_g_e3_i3, idx=1) ~> _gs_e3_i3_r1
vec_scale(a=x3, s=_gs_e3_i3_r1) ~> _rg_e3_i3_r1
sgd_update(weights=_nr_e3_i2_r1, grad=_rg_e3_i3_r1, lr=lr) ~> _nr_e3_i3_r1
get(arr=_g_e3_i3, idx=2) ~> _gs_e3_i3_r2
vec_scale(a=x3, s=_gs_e3_i3_r2) ~> _rg_e3_i3_r2
sgd_update(weights=_nr_e3_i2_r2, grad=_rg_e3_i3_r2, lr=lr) ~> _nr_e3_i3_r2
get(arr=_g_e3_i3, idx=3) ~> _gs_e3_i3_r3
vec_scale(a=x3, s=_gs_e3_i3_r3) ~> _rg_e3_i3_r3
sgd_update(weights=_nr_e3_i2_r3, grad=_rg_e3_i3_r3, lr=lr) ~> _nr_e3_i3_r3
linear_rows(r0=_nr_e3_i3_r0, r1=_nr_e3_i3_r1, r2=_nr_e3_i3_r2, r3=_nr_e3_i3_r3, bv=bv, x=x0) ~> _p_e4_i0
vec_sub(a=_p_e4_i0, b=t0) ~> _g_e4_i0
get(arr=_g_e4_i0, idx=0) ~> _gs_e4_i0_r0
vec_scale(a=x0, s=_gs_e4_i0_r0) ~> _rg_e4_i0_r0
sgd_update(weights=_nr_e3_i3_r0, grad=_rg_e4_i0_r0, lr=lr) ~> _nr_e4_i0_r0
get(arr=_g_e4_i0, idx=1) ~> _gs_e4_i0_r1
vec_scale(a=x0, s=_gs_e4_i0_r1) ~> _rg_e4_i0_r1
sgd_update(weights=_nr_e3_i3_r1, grad=_rg_e4_i0_r1, lr=lr) ~> _nr_e4_i0_r1
get(arr=_g_e4_i0, idx=2) ~> _gs_e4_i0_r2
vec_scale(a=x0, s=_gs_e4_i0_r2) ~> _rg_e4_i0_r2
sgd_update(weights=_nr_e3_i3_r2, grad=_rg_e4_i0_r2, lr=lr) ~> _nr_e4_i0_r2
get(arr=_g_e4_i0, idx=3) ~> _gs_e4_i0_r3
vec_scale(a=x0, s=_gs_e4_i0_r3) ~> _rg_e4_i0_r3
sgd_update(weights=_nr_e3_i3_r3, grad=_rg_e4_i0_r3, lr=lr) ~> _nr_e4_i0_r3
linear_rows(r0=_nr_e4_i0_r0, r1=_nr_e4_i0_r1, r2=_nr_e4_i0_r2, r3=_nr_e4_i0_r3, bv=bv, x=x1) ~> _p_e4_i1
vec_sub(a=_p_e4_i1, b=t1) ~> _g_e4_i1
get(arr=_g_e4_i1, idx=0) ~> _gs_e4_i1_r0
vec_scale(a=x1, s=_gs_e4_i1_r0) ~> _rg_e4_i1_r0
sgd_update(weights=_nr_e4_i0_r0, grad=_rg_e4_i1_r0, lr=lr) ~> _nr_e4_i1_r0
get(arr=_g_e4_i1, idx=1) ~> _gs_e4_i1_r1
vec_scale(a=x1, s=_gs_e4_i1_r1) ~> _rg_e4_i1_r1
sgd_update(weights=_nr_e4_i0_r1, grad=_rg_e4_i1_r1, lr=lr) ~> _nr_e4_i1_r1
get(arr=_g_e4_i1, idx=2) ~> _gs_e4_i1_r2
vec_scale(a=x1, s=_gs_e4_i1_r2) ~> _rg_e4_i1_r2
sgd_update(weights=_nr_e4_i0_r2, grad=_rg_e4_i1_r2, lr=lr) ~> _nr_e4_i1_r2
get(arr=_g_e4_i1, idx=3) ~> _gs_e4_i1_r3
vec_scale(a=x1, s=_gs_e4_i1_r3) ~> _rg_e4_i1_r3
sgd_update(weights=_nr_e4_i0_r3, grad=_rg_e4_i1_r3, lr=lr) ~> _nr_e4_i1_r3
linear_rows(r0=_nr_e4_i1_r0, r1=_nr_e4_i1_r1, r2=_nr_e4_i1_r2, r3=_nr_e4_i1_r3, bv=bv, x=x2) ~> _p_e4_i2
vec_sub(a=_p_e4_i2, b=t2) ~> _g_e4_i2
get(arr=_g_e4_i2, idx=0) ~> _gs_e4_i2_r0
vec_scale(a=x2, s=_gs_e4_i2_r0) ~> _rg_e4_i2_r0
sgd_update(weights=_nr_e4_i1_r0, grad=_rg_e4_i2_r0, lr=lr) ~> _nr_e4_i2_r0
get(arr=_g_e4_i2, idx=1) ~> _gs_e4_i2_r1
vec_scale(a=x2, s=_gs_e4_i2_r1) ~> _rg_e4_i2_r1
sgd_update(weights=_nr_e4_i1_r1, grad=_rg_e4_i2_r1, lr=lr) ~> _nr_e4_i2_r1
get(arr=_g_e4_i2, idx=2) ~> _gs_e4_i2_r2
vec_scale(a=x2, s=_gs_e4_i2_r2) ~> _rg_e4_i2_r2
sgd_update(weights=_nr_e4_i1_r2, grad=_rg_e4_i2_r2, lr=lr) ~> _nr_e4_i2_r2
get(arr=_g_e4_i2, idx=3) ~> _gs_e4_i2_r3
vec_scale(a=x2, s=_gs_e4_i2_r3) ~> _rg_e4_i2_r3
sgd_update(weights=_nr_e4_i1_r3, grad=_rg_e4_i2_r3, lr=lr) ~> _nr_e4_i2_r3
linear_rows(r0=_nr_e4_i2_r0, r1=_nr_e4_i2_r1, r2=_nr_e4_i2_r2, r3=_nr_e4_i2_r3, bv=bv, x=x3) ~> _p_e4_i3
vec_sub(a=_p_e4_i3, b=t3) ~> _g_e4_i3
get(arr=_g_e4_i3, idx=0) ~> _gs_e4_i3_r0
vec_scale(a=x3, s=_gs_e4_i3_r0) ~> _rg_e4_i3_r0
sgd_update(weights=_nr_e4_i2_r0, grad=_rg_e4_i3_r0, lr=lr) ~> _nr_e4_i3_r0
get(arr=_g_e4_i3, idx=1) ~> _gs_e4_i3_r1
vec_scale(a=x3, s=_gs_e4_i3_r1) ~> _rg_e4_i3_r1
sgd_update(weights=_nr_e4_i2_r1, grad=_rg_e4_i3_r1, lr=lr) ~> _nr_e4_i3_r1
get(arr=_g_e4_i3, idx=2) ~> _gs_e4_i3_r2
vec_scale(a=x3, s=_gs_e4_i3_r2) ~> _rg_e4_i3_r2
sgd_update(weights=_nr_e4_i2_r2, grad=_rg_e4_i3_r2, lr=lr) ~> _nr_e4_i3_r2
get(arr=_g_e4_i3, idx=3) ~> _gs_e4_i3_r3
vec_scale(a=x3, s=_gs_e4_i3_r3) ~> _rg_e4_i3_r3
sgd_update(weights=_nr_e4_i2_r3, grad=_rg_e4_i3_r3, lr=lr) ~> _nr_e4_i3_r3
linear_rows(r0=_nr_e4_i3_r0, r1=_nr_e4_i3_r1, r2=_nr_e4_i3_r2, r3=_nr_e4_i3_r3, bv=bv, x=x0) ~> _p_e5_i0
vec_sub(a=_p_e5_i0, b=t0) ~> _g_e5_i0
get(arr=_g_e5_i0, idx=0) ~> _gs_e5_i0_r0
vec_scale(a=x0, s=_gs_e5_i0_r0) ~> _rg_e5_i0_r0
sgd_update(weights=_nr_e4_i3_r0, grad=_rg_e5_i0_r0, lr=lr) ~> _nr_e5_i0_r0
get(arr=_g_e5_i0, idx=1) ~> _gs_e5_i0_r1
vec_scale(a=x0, s=_gs_e5_i0_r1) ~> _rg_e5_i0_r1
sgd_update(weights=_nr_e4_i3_r1, grad=_rg_e5_i0_r1, lr=lr) ~> _nr_e5_i0_r1
get(arr=_g_e5_i0, idx=2) ~> _gs_e5_i0_r2
vec_scale(a=x0, s=_gs_e5_i0_r2) ~> _rg_e5_i0_r2
sgd_update(weights=_nr_e4_i3_r2, grad=_rg_e5_i0_r2, lr=lr) ~> _nr_e5_i0_r2
get(arr=_g_e5_i0, idx=3) ~> _gs_e5_i0_r3
vec_scale(a=x0, s=_gs_e5_i0_r3) ~> _rg_e5_i0_r3
sgd_update(weights=_nr_e4_i3_r3, grad=_rg_e5_i0_r3, lr=lr) ~> _nr_e5_i0_r3
linear_rows(r0=_nr_e5_i0_r0, r1=_nr_e5_i0_r1, r2=_nr_e5_i0_r2, r3=_nr_e5_i0_r3, bv=bv, x=x1) ~> _p_e5_i1
vec_sub(a=_p_e5_i1, b=t1) ~> _g_e5_i1
get(arr=_g_e5_i1, idx=0) ~> _gs_e5_i1_r0
vec_scale(a=x1, s=_gs_e5_i1_r0) ~> _rg_e5_i1_r0
sgd_update(weights=_nr_e5_i0_r0, grad=_rg_e5_i1_r0, lr=lr) ~> _nr_e5_i1_r0
get(arr=_g_e5_i1, idx=1) ~> _gs_e5_i1_r1
vec_scale(a=x1, s=_gs_e5_i1_r1) ~> _rg_e5_i1_r1
sgd_update(weights=_nr_e5_i0_r1, grad=_rg_e5_i1_r1, lr=lr) ~> _nr_e5_i1_r1
get(arr=_g_e5_i1, idx=2) ~> _gs_e5_i1_r2
vec_scale(a=x1, s=_gs_e5_i1_r2) ~> _rg_e5_i1_r2
sgd_update(weights=_nr_e5_i0_r2, grad=_rg_e5_i1_r2, lr=lr) ~> _nr_e5_i1_r2
get(arr=_g_e5_i1, idx=3) ~> _gs_e5_i1_r3
vec_scale(a=x1, s=_gs_e5_i1_r3) ~> _rg_e5_i1_r3
sgd_update(weights=_nr_e5_i0_r3, grad=_rg_e5_i1_r3, lr=lr) ~> _nr_e5_i1_r3
linear_rows(r0=_nr_e5_i1_r0, r1=_nr_e5_i1_r1, r2=_nr_e5_i1_r2, r3=_nr_e5_i1_r3, bv=bv, x=x2) ~> _p_e5_i2
vec_sub(a=_p_e5_i2, b=t2) ~> _g_e5_i2
get(arr=_g_e5_i2, idx=0) ~> _gs_e5_i2_r0
vec_scale(a=x2, s=_gs_e5_i2_r0) ~> _rg_e5_i2_r0
sgd_update(weights=_nr_e5_i1_r0, grad=_rg_e5_i2_r0, lr=lr) ~> _nr_e5_i2_r0
get(arr=_g_e5_i2, idx=1) ~> _gs_e5_i2_r1
vec_scale(a=x2, s=_gs_e5_i2_r1) ~> _rg_e5_i2_r1
sgd_update(weights=_nr_e5_i1_r1, grad=_rg_e5_i2_r1, lr=lr) ~> _nr_e5_i2_r1
get(arr=_g_e5_i2, idx=2) ~> _gs_e5_i2_r2
vec_scale(a=x2, s=_gs_e5_i2_r2) ~> _rg_e5_i2_r2
sgd_update(weights=_nr_e5_i1_r2, grad=_rg_e5_i2_r2, lr=lr) ~> _nr_e5_i2_r2
get(arr=_g_e5_i2, idx=3) ~> _gs_e5_i2_r3
vec_scale(a=x2, s=_gs_e5_i2_r3) ~> _rg_e5_i2_r3
sgd_update(weights=_nr_e5_i1_r3, grad=_rg_e5_i2_r3, lr=lr) ~> _nr_e5_i2_r3
linear_rows(r0=_nr_e5_i2_r0, r1=_nr_e5_i2_r1, r2=_nr_e5_i2_r2, r3=_nr_e5_i2_r3, bv=bv, x=x3) ~> _p_e5_i3
vec_sub(a=_p_e5_i3, b=t3) ~> _g_e5_i3
get(arr=_g_e5_i3, idx=0) ~> _gs_e5_i3_r0
vec_scale(a=x3, s=_gs_e5_i3_r0) ~> _rg_e5_i3_r0
sgd_update(weights=_nr_e5_i2_r0, grad=_rg_e5_i3_r0, lr=lr) ~> _nr_e5_i3_r0
get(arr=_g_e5_i3, idx=1) ~> _gs_e5_i3_r1
vec_scale(a=x3, s=_gs_e5_i3_r1) ~> _rg_e5_i3_r1
sgd_update(weights=_nr_e5_i2_r1, grad=_rg_e5_i3_r1, lr=lr) ~> _nr_e5_i3_r1
get(arr=_g_e5_i3, idx=2) ~> _gs_e5_i3_r2
vec_scale(a=x3, s=_gs_e5_i3_r2) ~> _rg_e5_i3_r2
sgd_update(weights=_nr_e5_i2_r2, grad=_rg_e5_i3_r2, lr=lr) ~> _nr_e5_i3_r2
get(arr=_g_e5_i3, idx=3) ~> _gs_e5_i3_r3
vec_scale(a=x3, s=_gs_e5_i3_r3) ~> _rg_e5_i3_r3
sgd_update(weights=_nr_e5_i2_r3, grad=_rg_e5_i3_r3, lr=lr) ~> _nr_e5_i3_r3
linear_rows(r0=_nr_e5_i3_r0, r1=_nr_e5_i3_r1, r2=_nr_e5_i3_r2, r3=_nr_e5_i3_r3, bv=bv, x=x0) ~> _p_e6_i0
vec_sub(a=_p_e6_i0, b=t0) ~> _g_e6_i0
get(arr=_g_e6_i0, idx=0) ~> _gs_e6_i0_r0
vec_scale(a=x0, s=_gs_e6_i0_r0) ~> _rg_e6_i0_r0
sgd_update(weights=_nr_e5_i3_r0, grad=_rg_e6_i0_r0, lr=lr) ~> _nr_e6_i0_r0
get(arr=_g_e6_i0, idx=1) ~> _gs_e6_i0_r1
vec_scale(a=x0, s=_gs_e6_i0_r1) ~> _rg_e6_i0_r1
sgd_update(weights=_nr_e5_i3_r1, grad=_rg_e6_i0_r1, lr=lr) ~> _nr_e6_i0_r1
get(arr=_g_e6_i0, idx=2) ~> _gs_e6_i0_r2
vec_scale(a=x0, s=_gs_e6_i0_r2) ~> _rg_e6_i0_r2
sgd_update(weights=_nr_e5_i3_r2, grad=_rg_e6_i0_r2, lr=lr) ~> _nr_e6_i0_r2
get(arr=_g_e6_i0, idx=3) ~> _gs_e6_i0_r3
vec_scale(a=x0, s=_gs_e6_i0_r3) ~> _rg_e6_i0_r3
sgd_update(weights=_nr_e5_i3_r3, grad=_rg_e6_i0_r3, lr=lr) ~> _nr_e6_i0_r3
linear_rows(r0=_nr_e6_i0_r0, r1=_nr_e6_i0_r1, r2=_nr_e6_i0_r2, r3=_nr_e6_i0_r3, bv=bv, x=x1) ~> _p_e6_i1
vec_sub(a=_p_e6_i1, b=t1) ~> _g_e6_i1
get(arr=_g_e6_i1, idx=0) ~> _gs_e6_i1_r0
vec_scale(a=x1, s=_gs_e6_i1_r0) ~> _rg_e6_i1_r0
sgd_update(weights=_nr_e6_i0_r0, grad=_rg_e6_i1_r0, lr=lr) ~> _nr_e6_i1_r0
get(arr=_g_e6_i1, idx=1) ~> _gs_e6_i1_r1
vec_scale(a=x1, s=_gs_e6_i1_r1) ~> _rg_e6_i1_r1
sgd_update(weights=_nr_e6_i0_r1, grad=_rg_e6_i1_r1, lr=lr) ~> _nr_e6_i1_r1
get(arr=_g_e6_i1, idx=2) ~> _gs_e6_i1_r2
vec_scale(a=x1, s=_gs_e6_i1_r2) ~> _rg_e6_i1_r2
sgd_update(weights=_nr_e6_i0_r2, grad=_rg_e6_i1_r2, lr=lr) ~> _nr_e6_i1_r2
get(arr=_g_e6_i1, idx=3) ~> _gs_e6_i1_r3
vec_scale(a=x1, s=_gs_e6_i1_r3) ~> _rg_e6_i1_r3
sgd_update(weights=_nr_e6_i0_r3, grad=_rg_e6_i1_r3, lr=lr) ~> _nr_e6_i1_r3
linear_rows(r0=_nr_e6_i1_r0, r1=_nr_e6_i1_r1, r2=_nr_e6_i1_r2, r3=_nr_e6_i1_r3, bv=bv, x=x2) ~> _p_e6_i2
vec_sub(a=_p_e6_i2, b=t2) ~> _g_e6_i2
get(arr=_g_e6_i2, idx=0) ~> _gs_e6_i2_r0
vec_scale(a=x2, s=_gs_e6_i2_r0) ~> _rg_e6_i2_r0
sgd_update(weights=_nr_e6_i1_r0, grad=_rg_e6_i2_r0, lr=lr) ~> _nr_e6_i2_r0
get(arr=_g_e6_i2, idx=1) ~> _gs_e6_i2_r1
vec_scale(a=x2, s=_gs_e6_i2_r1) ~> _rg_e6_i2_r1
sgd_update(weights=_nr_e6_i1_r1, grad=_rg_e6_i2_r1, lr=lr) ~> _nr_e6_i2_r1
get(arr=_g_e6_i2, idx=2) ~> _gs_e6_i2_r2
vec_scale(a=x2, s=_gs_e6_i2_r2) ~> _rg_e6_i2_r2
sgd_update(weights=_nr_e6_i1_r2, grad=_rg_e6_i2_r2, lr=lr) ~> _nr_e6_i2_r2
get(arr=_g_e6_i2, idx=3) ~> _gs_e6_i2_r3
vec_scale(a=x2, s=_gs_e6_i2_r3) ~> _rg_e6_i2_r3
sgd_update(weights=_nr_e6_i1_r3, grad=_rg_e6_i2_r3, lr=lr) ~> _nr_e6_i2_r3
linear_rows(r0=_nr_e6_i2_r0, r1=_nr_e6_i2_r1, r2=_nr_e6_i2_r2, r3=_nr_e6_i2_r3, bv=bv, x=x3) ~> _p_e6_i3
vec_sub(a=_p_e6_i3, b=t3) ~> _g_e6_i3
get(arr=_g_e6_i3, idx=0) ~> _gs_e6_i3_r0
vec_scale(a=x3, s=_gs_e6_i3_r0) ~> _rg_e6_i3_r0
sgd_update(weights=_nr_e6_i2_r0, grad=_rg_e6_i3_r0, lr=lr) ~> _nr_e6_i3_r0
get(arr=_g_e6_i3, idx=1) ~> _gs_e6_i3_r1
vec_scale(a=x3, s=_gs_e6_i3_r1) ~> _rg_e6_i3_r1
sgd_update(weights=_nr_e6_i2_r1, grad=_rg_e6_i3_r1, lr=lr) ~> _nr_e6_i3_r1
get(arr=_g_e6_i3, idx=2) ~> _gs_e6_i3_r2
vec_scale(a=x3, s=_gs_e6_i3_r2) ~> _rg_e6_i3_r2
sgd_update(weights=_nr_e6_i2_r2, grad=_rg_e6_i3_r2, lr=lr) ~> _nr_e6_i3_r2
get(arr=_g_e6_i3, idx=3) ~> _gs_e6_i3_r3
vec_scale(a=x3, s=_gs_e6_i3_r3) ~> _rg_e6_i3_r3
sgd_update(weights=_nr_e6_i2_r3, grad=_rg_e6_i3_r3, lr=lr) ~> _nr_e6_i3_r3
linear_rows(r0=_nr_e6_i3_r0, r1=_nr_e6_i3_r1, r2=_nr_e6_i3_r2, r3=_nr_e6_i3_r3, bv=bv, x=x0) ~> _p_e7_i0
vec_sub(a=_p_e7_i0, b=t0) ~> _g_e7_i0
get(arr=_g_e7_i0, idx=0) ~> _gs_e7_i0_r0
vec_scale(a=x0, s=_gs_e7_i0_r0) ~> _rg_e7_i0_r0
sgd_update(weights=_nr_e6_i3_r0, grad=_rg_e7_i0_r0, lr=lr) ~> _nr_e7_i0_r0
get(arr=_g_e7_i0, idx=1) ~> _gs_e7_i0_r1
vec_scale(a=x0, s=_gs_e7_i0_r1) ~> _rg_e7_i0_r1
sgd_update(weights=_nr_e6_i3_r1, grad=_rg_e7_i0_r1, lr=lr) ~> _nr_e7_i0_r1
get(arr=_g_e7_i0, idx=2) ~> _gs_e7_i0_r2
vec_scale(a=x0, s=_gs_e7_i0_r2) ~> _rg_e7_i0_r2
sgd_update(weights=_nr_e6_i3_r2, grad=_rg_e7_i0_r2, lr=lr) ~> _nr_e7_i0_r2
get(arr=_g_e7_i0, idx=3) ~> _gs_e7_i0_r3
vec_scale(a=x0, s=_gs_e7_i0_r3) ~> _rg_e7_i0_r3
sgd_update(weights=_nr_e6_i3_r3, grad=_rg_e7_i0_r3, lr=lr) ~> _nr_e7_i0_r3
linear_rows(r0=_nr_e7_i0_r0, r1=_nr_e7_i0_r1, r2=_nr_e7_i0_r2, r3=_nr_e7_i0_r3, bv=bv, x=x1) ~> _p_e7_i1
vec_sub(a=_p_e7_i1, b=t1) ~> _g_e7_i1
get(arr=_g_e7_i1, idx=0) ~> _gs_e7_i1_r0
vec_scale(a=x1, s=_gs_e7_i1_r0) ~> _rg_e7_i1_r0
sgd_update(weights=_nr_e7_i0_r0, grad=_rg_e7_i1_r0, lr=lr) ~> _nr_e7_i1_r0
get(arr=_g_e7_i1, idx=1) ~> _gs_e7_i1_r1
vec_scale(a=x1, s=_gs_e7_i1_r1) ~> _rg_e7_i1_r1
sgd_update(weights=_nr_e7_i0_r1, grad=_rg_e7_i1_r1, lr=lr) ~> _nr_e7_i1_r1
get(arr=_g_e7_i1, idx=2) ~> _gs_e7_i1_r2
vec_scale(a=x1, s=_gs_e7_i1_r2) ~> _rg_e7_i1_r2
sgd_update(weights=_nr_e7_i0_r2, grad=_rg_e7_i1_r2, lr=lr) ~> _nr_e7_i1_r2
get(arr=_g_e7_i1, idx=3) ~> _gs_e7_i1_r3
vec_scale(a=x1, s=_gs_e7_i1_r3) ~> _rg_e7_i1_r3
sgd_update(weights=_nr_e7_i0_r3, grad=_rg_e7_i1_r3, lr=lr) ~> _nr_e7_i1_r3
linear_rows(r0=_nr_e7_i1_r0, r1=_nr_e7_i1_r1, r2=_nr_e7_i1_r2, r3=_nr_e7_i1_r3, bv=bv, x=x2) ~> _p_e7_i2
vec_sub(a=_p_e7_i2, b=t2) ~> _g_e7_i2
get(arr=_g_e7_i2, idx=0) ~> _gs_e7_i2_r0
vec_scale(a=x2, s=_gs_e7_i2_r0) ~> _rg_e7_i2_r0
sgd_update(weights=_nr_e7_i1_r0, grad=_rg_e7_i2_r0, lr=lr) ~> _nr_e7_i2_r0
get(arr=_g_e7_i2, idx=1) ~> _gs_e7_i2_r1
vec_scale(a=x2, s=_gs_e7_i2_r1) ~> _rg_e7_i2_r1
sgd_update(weights=_nr_e7_i1_r1, grad=_rg_e7_i2_r1, lr=lr) ~> _nr_e7_i2_r1
get(arr=_g_e7_i2, idx=2) ~> _gs_e7_i2_r2
vec_scale(a=x2, s=_gs_e7_i2_r2) ~> _rg_e7_i2_r2
sgd_update(weights=_nr_e7_i1_r2, grad=_rg_e7_i2_r2, lr=lr) ~> _nr_e7_i2_r2
get(arr=_g_e7_i2, idx=3) ~> _gs_e7_i2_r3
vec_scale(a=x2, s=_gs_e7_i2_r3) ~> _rg_e7_i2_r3
sgd_update(weights=_nr_e7_i1_r3, grad=_rg_e7_i2_r3, lr=lr) ~> _nr_e7_i2_r3
linear_rows(r0=_nr_e7_i2_r0, r1=_nr_e7_i2_r1, r2=_nr_e7_i2_r2, r3=_nr_e7_i2_r3, bv=bv, x=x3) ~> _p_e7_i3
vec_sub(a=_p_e7_i3, b=t3) ~> _g_e7_i3
get(arr=_g_e7_i3, idx=0) ~> _gs_e7_i3_r0
vec_scale(a=x3, s=_gs_e7_i3_r0) ~> _rg_e7_i3_r0
sgd_update(weights=_nr_e7_i2_r0, grad=_rg_e7_i3_r0, lr=lr) ~> _nr_e7_i3_r0
get(arr=_g_e7_i3, idx=1) ~> _gs_e7_i3_r1
vec_scale(a=x3, s=_gs_e7_i3_r1) ~> _rg_e7_i3_r1
sgd_update(weights=_nr_e7_i2_r1, grad=_rg_e7_i3_r1, lr=lr) ~> _nr_e7_i3_r1
get(arr=_g_e7_i3, idx=2) ~> _gs_e7_i3_r2
vec_scale(a=x3, s=_gs_e7_i3_r2) ~> _rg_e7_i3_r2
sgd_update(weights=_nr_e7_i2_r2, grad=_rg_e7_i3_r2, lr=lr) ~> _nr_e7_i3_r2
get(arr=_g_e7_i3, idx=3) ~> _gs_e7_i3_r3
vec_scale(a=x3, s=_gs_e7_i3_r3) ~> _rg_e7_i3_r3
sgd_update(weights=_nr_e7_i2_r3, grad=_rg_e7_i3_r3, lr=lr) ~> _nr_e7_i3_r3
linear_rows(r0=_nr_e7_i3_r0, r1=_nr_e7_i3_r1, r2=_nr_e7_i3_r2, r3=_nr_e7_i3_r3, bv=bv, x=x0) ~> _p_e8_i0
vec_sub(a=_p_e8_i0, b=t0) ~> _g_e8_i0
get(arr=_g_e8_i0, idx=0) ~> _gs_e8_i0_r0
vec_scale(a=x0, s=_gs_e8_i0_r0) ~> _rg_e8_i0_r0
sgd_update(weights=_nr_e7_i3_r0, grad=_rg_e8_i0_r0, lr=lr) ~> _nr_e8_i0_r0
get(arr=_g_e8_i0, idx=1) ~> _gs_e8_i0_r1
vec_scale(a=x0, s=_gs_e8_i0_r1) ~> _rg_e8_i0_r1
sgd_update(weights=_nr_e7_i3_r1, grad=_rg_e8_i0_r1, lr=lr) ~> _nr_e8_i0_r1
get(arr=_g_e8_i0, idx=2) ~> _gs_e8_i0_r2
vec_scale(a=x0, s=_gs_e8_i0_r2) ~> _rg_e8_i0_r2
sgd_update(weights=_nr_e7_i3_r2, grad=_rg_e8_i0_r2, lr=lr) ~> _nr_e8_i0_r2
get(arr=_g_e8_i0, idx=3) ~> _gs_e8_i0_r3
vec_scale(a=x0, s=_gs_e8_i0_r3) ~> _rg_e8_i0_r3
sgd_update(weights=_nr_e7_i3_r3, grad=_rg_e8_i0_r3, lr=lr) ~> _nr_e8_i0_r3
linear_rows(r0=_nr_e8_i0_r0, r1=_nr_e8_i0_r1, r2=_nr_e8_i0_r2, r3=_nr_e8_i0_r3, bv=bv, x=x1) ~> _p_e8_i1
vec_sub(a=_p_e8_i1, b=t1) ~> _g_e8_i1
get(arr=_g_e8_i1, idx=0) ~> _gs_e8_i1_r0
vec_scale(a=x1, s=_gs_e8_i1_r0) ~> _rg_e8_i1_r0
sgd_update(weights=_nr_e8_i0_r0, grad=_rg_e8_i1_r0, lr=lr) ~> _nr_e8_i1_r0
get(arr=_g_e8_i1, idx=1) ~> _gs_e8_i1_r1
vec_scale(a=x1, s=_gs_e8_i1_r1) ~> _rg_e8_i1_r1
sgd_update(weights=_nr_e8_i0_r1, grad=_rg_e8_i1_r1, lr=lr) ~> _nr_e8_i1_r1
get(arr=_g_e8_i1, idx=2) ~> _gs_e8_i1_r2
vec_scale(a=x1, s=_gs_e8_i1_r2) ~> _rg_e8_i1_r2
sgd_update(weights=_nr_e8_i0_r2, grad=_rg_e8_i1_r2, lr=lr) ~> _nr_e8_i1_r2
get(arr=_g_e8_i1, idx=3) ~> _gs_e8_i1_r3
vec_scale(a=x1, s=_gs_e8_i1_r3) ~> _rg_e8_i1_r3
sgd_update(weights=_nr_e8_i0_r3, grad=_rg_e8_i1_r3, lr=lr) ~> _nr_e8_i1_r3
linear_rows(r0=_nr_e8_i1_r0, r1=_nr_e8_i1_r1, r2=_nr_e8_i1_r2, r3=_nr_e8_i1_r3, bv=bv, x=x2) ~> _p_e8_i2
vec_sub(a=_p_e8_i2, b=t2) ~> _g_e8_i2
get(arr=_g_e8_i2, idx=0) ~> _gs_e8_i2_r0
vec_scale(a=x2, s=_gs_e8_i2_r0) ~> _rg_e8_i2_r0
sgd_update(weights=_nr_e8_i1_r0, grad=_rg_e8_i2_r0, lr=lr) ~> _nr_e8_i2_r0
get(arr=_g_e8_i2, idx=1) ~> _gs_e8_i2_r1
vec_scale(a=x2, s=_gs_e8_i2_r1) ~> _rg_e8_i2_r1
sgd_update(weights=_nr_e8_i1_r1, grad=_rg_e8_i2_r1, lr=lr) ~> _nr_e8_i2_r1
get(arr=_g_e8_i2, idx=2) ~> _gs_e8_i2_r2
vec_scale(a=x2, s=_gs_e8_i2_r2) ~> _rg_e8_i2_r2
sgd_update(weights=_nr_e8_i1_r2, grad=_rg_e8_i2_r2, lr=lr) ~> _nr_e8_i2_r2
get(arr=_g_e8_i2, idx=3) ~> _gs_e8_i2_r3
vec_scale(a=x2, s=_gs_e8_i2_r3) ~> _rg_e8_i2_r3
sgd_update(weights=_nr_e8_i1_r3, grad=_rg_e8_i2_r3, lr=lr) ~> _nr_e8_i2_r3
linear_rows(r0=_nr_e8_i2_r0, r1=_nr_e8_i2_r1, r2=_nr_e8_i2_r2, r3=_nr_e8_i2_r3, bv=bv, x=x3) ~> _p_e8_i3
vec_sub(a=_p_e8_i3, b=t3) ~> _g_e8_i3
get(arr=_g_e8_i3, idx=0) ~> _gs_e8_i3_r0
vec_scale(a=x3, s=_gs_e8_i3_r0) ~> _rg_e8_i3_r0
sgd_update(weights=_nr_e8_i2_r0, grad=_rg_e8_i3_r0, lr=lr) ~> _nr_e8_i3_r0
get(arr=_g_e8_i3, idx=1) ~> _gs_e8_i3_r1
vec_scale(a=x3, s=_gs_e8_i3_r1) ~> _rg_e8_i3_r1
sgd_update(weights=_nr_e8_i2_r1, grad=_rg_e8_i3_r1, lr=lr) ~> _nr_e8_i3_r1
get(arr=_g_e8_i3, idx=2) ~> _gs_e8_i3_r2
vec_scale(a=x3, s=_gs_e8_i3_r2) ~> _rg_e8_i3_r2
sgd_update(weights=_nr_e8_i2_r2, grad=_rg_e8_i3_r2, lr=lr) ~> _nr_e8_i3_r2
get(arr=_g_e8_i3, idx=3) ~> _gs_e8_i3_r3
vec_scale(a=x3, s=_gs_e8_i3_r3) ~> _rg_e8_i3_r3
sgd_update(weights=_nr_e8_i2_r3, grad=_rg_e8_i3_r3, lr=lr) ~> _nr_e8_i3_r3
linear_rows(r0=_nr_e8_i3_r0, r1=_nr_e8_i3_r1, r2=_nr_e8_i3_r2, r3=_nr_e8_i3_r3, bv=bv, x=x0) ~> _p_e9_i0
vec_sub(a=_p_e9_i0, b=t0) ~> _g_e9_i0
get(arr=_g_e9_i0, idx=0) ~> _gs_e9_i0_r0
vec_scale(a=x0, s=_gs_e9_i0_r0) ~> _rg_e9_i0_r0
sgd_update(weights=_nr_e8_i3_r0, grad=_rg_e9_i0_r0, lr=lr) ~> _nr_e9_i0_r0
get(arr=_g_e9_i0, idx=1) ~> _gs_e9_i0_r1
vec_scale(a=x0, s=_gs_e9_i0_r1) ~> _rg_e9_i0_r1
sgd_update(weights=_nr_e8_i3_r1, grad=_rg_e9_i0_r1, lr=lr) ~> _nr_e9_i0_r1
get(arr=_g_e9_i0, idx=2) ~> _gs_e9_i0_r2
vec_scale(a=x0, s=_gs_e9_i0_r2) ~> _rg_e9_i0_r2
sgd_update(weights=_nr_e8_i3_r2, grad=_rg_e9_i0_r2, lr=lr) ~> _nr_e9_i0_r2
get(arr=_g_e9_i0, idx=3) ~> _gs_e9_i0_r3
vec_scale(a=x0, s=_gs_e9_i0_r3) ~> _rg_e9_i0_r3
sgd_update(weights=_nr_e8_i3_r3, grad=_rg_e9_i0_r3, lr=lr) ~> _nr_e9_i0_r3
linear_rows(r0=_nr_e9_i0_r0, r1=_nr_e9_i0_r1, r2=_nr_e9_i0_r2, r3=_nr_e9_i0_r3, bv=bv, x=x1) ~> _p_e9_i1
vec_sub(a=_p_e9_i1, b=t1) ~> _g_e9_i1
get(arr=_g_e9_i1, idx=0) ~> _gs_e9_i1_r0
vec_scale(a=x1, s=_gs_e9_i1_r0) ~> _rg_e9_i1_r0
sgd_update(weights=_nr_e9_i0_r0, grad=_rg_e9_i1_r0, lr=lr) ~> _nr_e9_i1_r0
get(arr=_g_e9_i1, idx=1) ~> _gs_e9_i1_r1
vec_scale(a=x1, s=_gs_e9_i1_r1) ~> _rg_e9_i1_r1
sgd_update(weights=_nr_e9_i0_r1, grad=_rg_e9_i1_r1, lr=lr) ~> _nr_e9_i1_r1
get(arr=_g_e9_i1, idx=2) ~> _gs_e9_i1_r2
vec_scale(a=x1, s=_gs_e9_i1_r2) ~> _rg_e9_i1_r2
sgd_update(weights=_nr_e9_i0_r2, grad=_rg_e9_i1_r2, lr=lr) ~> _nr_e9_i1_r2
get(arr=_g_e9_i1, idx=3) ~> _gs_e9_i1_r3
vec_scale(a=x1, s=_gs_e9_i1_r3) ~> _rg_e9_i1_r3
sgd_update(weights=_nr_e9_i0_r3, grad=_rg_e9_i1_r3, lr=lr) ~> _nr_e9_i1_r3
linear_rows(r0=_nr_e9_i1_r0, r1=_nr_e9_i1_r1, r2=_nr_e9_i1_r2, r3=_nr_e9_i1_r3, bv=bv, x=x2) ~> _p_e9_i2
vec_sub(a=_p_e9_i2, b=t2) ~> _g_e9_i2
get(arr=_g_e9_i2, idx=0) ~> _gs_e9_i2_r0
vec_scale(a=x2, s=_gs_e9_i2_r0) ~> _rg_e9_i2_r0
sgd_update(weights=_nr_e9_i1_r0, grad=_rg_e9_i2_r0, lr=lr) ~> _nr_e9_i2_r0
get(arr=_g_e9_i2, idx=1) ~> _gs_e9_i2_r1
vec_scale(a=x2, s=_gs_e9_i2_r1) ~> _rg_e9_i2_r1
sgd_update(weights=_nr_e9_i1_r1, grad=_rg_e9_i2_r1, lr=lr) ~> _nr_e9_i2_r1
get(arr=_g_e9_i2, idx=2) ~> _gs_e9_i2_r2
vec_scale(a=x2, s=_gs_e9_i2_r2) ~> _rg_e9_i2_r2
sgd_update(weights=_nr_e9_i1_r2, grad=_rg_e9_i2_r2, lr=lr) ~> _nr_e9_i2_r2
get(arr=_g_e9_i2, idx=3) ~> _gs_e9_i2_r3
vec_scale(a=x2, s=_gs_e9_i2_r3) ~> _rg_e9_i2_r3
sgd_update(weights=_nr_e9_i1_r3, grad=_rg_e9_i2_r3, lr=lr) ~> _nr_e9_i2_r3
linear_rows(r0=_nr_e9_i2_r0, r1=_nr_e9_i2_r1, r2=_nr_e9_i2_r2, r3=_nr_e9_i2_r3, bv=bv, x=x3) ~> _p_e9_i3
vec_sub(a=_p_e9_i3, b=t3) ~> _g_e9_i3
get(arr=_g_e9_i3, idx=0) ~> _gs_e9_i3_r0
vec_scale(a=x3, s=_gs_e9_i3_r0) ~> _rg_e9_i3_r0
sgd_update(weights=_nr_e9_i2_r0, grad=_rg_e9_i3_r0, lr=lr) ~> _nr_e9_i3_r0
get(arr=_g_e9_i3, idx=1) ~> _gs_e9_i3_r1
vec_scale(a=x3, s=_gs_e9_i3_r1) ~> _rg_e9_i3_r1
sgd_update(weights=_nr_e9_i2_r1, grad=_rg_e9_i3_r1, lr=lr) ~> _nr_e9_i3_r1
get(arr=_g_e9_i3, idx=2) ~> _gs_e9_i3_r2
vec_scale(a=x3, s=_gs_e9_i3_r2) ~> _rg_e9_i3_r2
sgd_update(weights=_nr_e9_i2_r2, grad=_rg_e9_i3_r2, lr=lr) ~> _nr_e9_i3_r2
get(arr=_g_e9_i3, idx=3) ~> _gs_e9_i3_r3
vec_scale(a=x3, s=_gs_e9_i3_r3) ~> _rg_e9_i3_r3
sgd_update(weights=_nr_e9_i2_r3, grad=_rg_e9_i3_r3, lr=lr) ~> _nr_e9_i3_r3
linear_rows(r0=_nr_e9_i3_r0, r1=_nr_e9_i3_r1, r2=_nr_e9_i3_r2, r3=_nr_e9_i3_r3, bv=bv, x=x0) ~> _c0
softmax(arr=_c0) ~> _prob0
argmax4(arr=_prob0) ~> _ans0
linear_rows(r0=_nr_e9_i3_r0, r1=_nr_e9_i3_r1, r2=_nr_e9_i3_r2, r3=_nr_e9_i3_r3, bv=bv, x=x1) ~> _c1
softmax(arr=_c1) ~> _prob1
argmax4(arr=_prob1) ~> _ans1
linear_rows(r0=_nr_e9_i3_r0, r1=_nr_e9_i3_r1, r2=_nr_e9_i3_r2, r3=_nr_e9_i3_r3, bv=bv, x=x2) ~> _c2
softmax(arr=_c2) ~> _prob2
argmax4(arr=_prob2) ~> _ans2
linear_rows(r0=_nr_e9_i3_r0, r1=_nr_e9_i3_r1, r2=_nr_e9_i3_r2, r3=_nr_e9_i3_r3, bv=bv, x=x3) ~> _c3
softmax(arr=_c3) ~> _prob3
argmax4(arr=_prob3) ~> _ans3
[T+]
show shall(_ans0)
show shall(_ans1)
show shall(_ans2)
show shall(_ans3)