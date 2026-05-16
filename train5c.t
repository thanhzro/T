[T-]
import "lib/basic/std.t"
import "lib/advanced/ml_t.t"
row0 = [0.5, 0.3, 0.2, 0.1]
row1 = [0.1, 0.5, 0.3, 0.1]
row2 = [0.2, 0.1, 0.5, 0.2]
row3 = [0.1, 0.2, 0.1, 0.5]
bv = [0, 0, 0, 0]
lr = 0.01
xa = [1, 0, 0, 0]
ta = [0, 1, 0, 0]
xb = [0, 1, 0, 0]
tb = [0, 0, 1, 0]
xc = [0, 0, 1, 0]
tc = [0, 0, 0, 1]
xd = [0, 0, 0, 1]
td = [1, 0, 0, 0]
[T0]
linear_rows(r0=row0, r1=row1, r2=row2, r3=row3, bv=bv, x=xa) ~> pred_0_0
vec_sub(a=pred_0_0, b=ta) ~> grad_0_0
get(arr=grad_0_0, idx=0) ~> gs_0_0_0
vec_scale(a=xa, s=gs_0_0_0) ~> rg_0_0_0
sgd_update(weights=row0, grad=rg_0_0_0, lr=lr) ~> nrow_0_0_0
get(arr=grad_0_0, idx=1) ~> gs_0_0_1
vec_scale(a=xa, s=gs_0_0_1) ~> rg_0_0_1
sgd_update(weights=row1, grad=rg_0_0_1, lr=lr) ~> nrow_0_0_1
get(arr=grad_0_0, idx=2) ~> gs_0_0_2
vec_scale(a=xa, s=gs_0_0_2) ~> rg_0_0_2
sgd_update(weights=row2, grad=rg_0_0_2, lr=lr) ~> nrow_0_0_2
get(arr=grad_0_0, idx=3) ~> gs_0_0_3
vec_scale(a=xa, s=gs_0_0_3) ~> rg_0_0_3
sgd_update(weights=row3, grad=rg_0_0_3, lr=lr) ~> nrow_0_0_3
linear_rows(r0=nrow_0_0_0, r1=nrow_0_0_1, r2=nrow_0_0_2, r3=nrow_0_0_3, bv=bv, x=xb) ~> pred_0_1
vec_sub(a=pred_0_1, b=tb) ~> grad_0_1
get(arr=grad_0_1, idx=0) ~> gs_0_1_0
vec_scale(a=xb, s=gs_0_1_0) ~> rg_0_1_0
sgd_update(weights=nrow_0_0_0, grad=rg_0_1_0, lr=lr) ~> nrow_0_1_0
get(arr=grad_0_1, idx=1) ~> gs_0_1_1
vec_scale(a=xb, s=gs_0_1_1) ~> rg_0_1_1
sgd_update(weights=nrow_0_0_1, grad=rg_0_1_1, lr=lr) ~> nrow_0_1_1
get(arr=grad_0_1, idx=2) ~> gs_0_1_2
vec_scale(a=xb, s=gs_0_1_2) ~> rg_0_1_2
sgd_update(weights=nrow_0_0_2, grad=rg_0_1_2, lr=lr) ~> nrow_0_1_2
get(arr=grad_0_1, idx=3) ~> gs_0_1_3
vec_scale(a=xb, s=gs_0_1_3) ~> rg_0_1_3
sgd_update(weights=nrow_0_0_3, grad=rg_0_1_3, lr=lr) ~> nrow_0_1_3
linear_rows(r0=nrow_0_1_0, r1=nrow_0_1_1, r2=nrow_0_1_2, r3=nrow_0_1_3, bv=bv, x=xc) ~> pred_0_2
vec_sub(a=pred_0_2, b=tc) ~> grad_0_2
get(arr=grad_0_2, idx=0) ~> gs_0_2_0
vec_scale(a=xc, s=gs_0_2_0) ~> rg_0_2_0
sgd_update(weights=nrow_0_1_0, grad=rg_0_2_0, lr=lr) ~> nrow_0_2_0
get(arr=grad_0_2, idx=1) ~> gs_0_2_1
vec_scale(a=xc, s=gs_0_2_1) ~> rg_0_2_1
sgd_update(weights=nrow_0_1_1, grad=rg_0_2_1, lr=lr) ~> nrow_0_2_1
get(arr=grad_0_2, idx=2) ~> gs_0_2_2
vec_scale(a=xc, s=gs_0_2_2) ~> rg_0_2_2
sgd_update(weights=nrow_0_1_2, grad=rg_0_2_2, lr=lr) ~> nrow_0_2_2
get(arr=grad_0_2, idx=3) ~> gs_0_2_3
vec_scale(a=xc, s=gs_0_2_3) ~> rg_0_2_3
sgd_update(weights=nrow_0_1_3, grad=rg_0_2_3, lr=lr) ~> nrow_0_2_3
linear_rows(r0=nrow_0_2_0, r1=nrow_0_2_1, r2=nrow_0_2_2, r3=nrow_0_2_3, bv=bv, x=xd) ~> pred_0_3
vec_sub(a=pred_0_3, b=td) ~> grad_0_3
get(arr=grad_0_3, idx=0) ~> gs_0_3_0
vec_scale(a=xd, s=gs_0_3_0) ~> rg_0_3_0
sgd_update(weights=nrow_0_2_0, grad=rg_0_3_0, lr=lr) ~> nrow_0_3_0
get(arr=grad_0_3, idx=1) ~> gs_0_3_1
vec_scale(a=xd, s=gs_0_3_1) ~> rg_0_3_1
sgd_update(weights=nrow_0_2_1, grad=rg_0_3_1, lr=lr) ~> nrow_0_3_1
get(arr=grad_0_3, idx=2) ~> gs_0_3_2
vec_scale(a=xd, s=gs_0_3_2) ~> rg_0_3_2
sgd_update(weights=nrow_0_2_2, grad=rg_0_3_2, lr=lr) ~> nrow_0_3_2
get(arr=grad_0_3, idx=3) ~> gs_0_3_3
vec_scale(a=xd, s=gs_0_3_3) ~> rg_0_3_3
sgd_update(weights=nrow_0_2_3, grad=rg_0_3_3, lr=lr) ~> nrow_0_3_3
linear_rows(r0=nrow_0_3_0, r1=nrow_0_3_1, r2=nrow_0_3_2, r3=nrow_0_3_3, bv=bv, x=xa) ~> pred_1_0
vec_sub(a=pred_1_0, b=ta) ~> grad_1_0
get(arr=grad_1_0, idx=0) ~> gs_1_0_0
vec_scale(a=xa, s=gs_1_0_0) ~> rg_1_0_0
sgd_update(weights=nrow_0_3_0, grad=rg_1_0_0, lr=lr) ~> nrow_1_0_0
get(arr=grad_1_0, idx=1) ~> gs_1_0_1
vec_scale(a=xa, s=gs_1_0_1) ~> rg_1_0_1
sgd_update(weights=nrow_0_3_1, grad=rg_1_0_1, lr=lr) ~> nrow_1_0_1
get(arr=grad_1_0, idx=2) ~> gs_1_0_2
vec_scale(a=xa, s=gs_1_0_2) ~> rg_1_0_2
sgd_update(weights=nrow_0_3_2, grad=rg_1_0_2, lr=lr) ~> nrow_1_0_2
get(arr=grad_1_0, idx=3) ~> gs_1_0_3
vec_scale(a=xa, s=gs_1_0_3) ~> rg_1_0_3
sgd_update(weights=nrow_0_3_3, grad=rg_1_0_3, lr=lr) ~> nrow_1_0_3
linear_rows(r0=nrow_1_0_0, r1=nrow_1_0_1, r2=nrow_1_0_2, r3=nrow_1_0_3, bv=bv, x=xb) ~> pred_1_1
vec_sub(a=pred_1_1, b=tb) ~> grad_1_1
get(arr=grad_1_1, idx=0) ~> gs_1_1_0
vec_scale(a=xb, s=gs_1_1_0) ~> rg_1_1_0
sgd_update(weights=nrow_1_0_0, grad=rg_1_1_0, lr=lr) ~> nrow_1_1_0
get(arr=grad_1_1, idx=1) ~> gs_1_1_1
vec_scale(a=xb, s=gs_1_1_1) ~> rg_1_1_1
sgd_update(weights=nrow_1_0_1, grad=rg_1_1_1, lr=lr) ~> nrow_1_1_1
get(arr=grad_1_1, idx=2) ~> gs_1_1_2
vec_scale(a=xb, s=gs_1_1_2) ~> rg_1_1_2
sgd_update(weights=nrow_1_0_2, grad=rg_1_1_2, lr=lr) ~> nrow_1_1_2
get(arr=grad_1_1, idx=3) ~> gs_1_1_3
vec_scale(a=xb, s=gs_1_1_3) ~> rg_1_1_3
sgd_update(weights=nrow_1_0_3, grad=rg_1_1_3, lr=lr) ~> nrow_1_1_3
linear_rows(r0=nrow_1_1_0, r1=nrow_1_1_1, r2=nrow_1_1_2, r3=nrow_1_1_3, bv=bv, x=xc) ~> pred_1_2
vec_sub(a=pred_1_2, b=tc) ~> grad_1_2
get(arr=grad_1_2, idx=0) ~> gs_1_2_0
vec_scale(a=xc, s=gs_1_2_0) ~> rg_1_2_0
sgd_update(weights=nrow_1_1_0, grad=rg_1_2_0, lr=lr) ~> nrow_1_2_0
get(arr=grad_1_2, idx=1) ~> gs_1_2_1
vec_scale(a=xc, s=gs_1_2_1) ~> rg_1_2_1
sgd_update(weights=nrow_1_1_1, grad=rg_1_2_1, lr=lr) ~> nrow_1_2_1
get(arr=grad_1_2, idx=2) ~> gs_1_2_2
vec_scale(a=xc, s=gs_1_2_2) ~> rg_1_2_2
sgd_update(weights=nrow_1_1_2, grad=rg_1_2_2, lr=lr) ~> nrow_1_2_2
get(arr=grad_1_2, idx=3) ~> gs_1_2_3
vec_scale(a=xc, s=gs_1_2_3) ~> rg_1_2_3
sgd_update(weights=nrow_1_1_3, grad=rg_1_2_3, lr=lr) ~> nrow_1_2_3
linear_rows(r0=nrow_1_2_0, r1=nrow_1_2_1, r2=nrow_1_2_2, r3=nrow_1_2_3, bv=bv, x=xd) ~> pred_1_3
vec_sub(a=pred_1_3, b=td) ~> grad_1_3
get(arr=grad_1_3, idx=0) ~> gs_1_3_0
vec_scale(a=xd, s=gs_1_3_0) ~> rg_1_3_0
sgd_update(weights=nrow_1_2_0, grad=rg_1_3_0, lr=lr) ~> nrow_1_3_0
get(arr=grad_1_3, idx=1) ~> gs_1_3_1
vec_scale(a=xd, s=gs_1_3_1) ~> rg_1_3_1
sgd_update(weights=nrow_1_2_1, grad=rg_1_3_1, lr=lr) ~> nrow_1_3_1
get(arr=grad_1_3, idx=2) ~> gs_1_3_2
vec_scale(a=xd, s=gs_1_3_2) ~> rg_1_3_2
sgd_update(weights=nrow_1_2_2, grad=rg_1_3_2, lr=lr) ~> nrow_1_3_2
get(arr=grad_1_3, idx=3) ~> gs_1_3_3
vec_scale(a=xd, s=gs_1_3_3) ~> rg_1_3_3
sgd_update(weights=nrow_1_2_3, grad=rg_1_3_3, lr=lr) ~> nrow_1_3_3
linear_rows(r0=nrow_1_3_0, r1=nrow_1_3_1, r2=nrow_1_3_2, r3=nrow_1_3_3, bv=bv, x=xa) ~> pred_2_0
vec_sub(a=pred_2_0, b=ta) ~> grad_2_0
get(arr=grad_2_0, idx=0) ~> gs_2_0_0
vec_scale(a=xa, s=gs_2_0_0) ~> rg_2_0_0
sgd_update(weights=nrow_1_3_0, grad=rg_2_0_0, lr=lr) ~> nrow_2_0_0
get(arr=grad_2_0, idx=1) ~> gs_2_0_1
vec_scale(a=xa, s=gs_2_0_1) ~> rg_2_0_1
sgd_update(weights=nrow_1_3_1, grad=rg_2_0_1, lr=lr) ~> nrow_2_0_1
get(arr=grad_2_0, idx=2) ~> gs_2_0_2
vec_scale(a=xa, s=gs_2_0_2) ~> rg_2_0_2
sgd_update(weights=nrow_1_3_2, grad=rg_2_0_2, lr=lr) ~> nrow_2_0_2
get(arr=grad_2_0, idx=3) ~> gs_2_0_3
vec_scale(a=xa, s=gs_2_0_3) ~> rg_2_0_3
sgd_update(weights=nrow_1_3_3, grad=rg_2_0_3, lr=lr) ~> nrow_2_0_3
linear_rows(r0=nrow_2_0_0, r1=nrow_2_0_1, r2=nrow_2_0_2, r3=nrow_2_0_3, bv=bv, x=xb) ~> pred_2_1
vec_sub(a=pred_2_1, b=tb) ~> grad_2_1
get(arr=grad_2_1, idx=0) ~> gs_2_1_0
vec_scale(a=xb, s=gs_2_1_0) ~> rg_2_1_0
sgd_update(weights=nrow_2_0_0, grad=rg_2_1_0, lr=lr) ~> nrow_2_1_0
get(arr=grad_2_1, idx=1) ~> gs_2_1_1
vec_scale(a=xb, s=gs_2_1_1) ~> rg_2_1_1
sgd_update(weights=nrow_2_0_1, grad=rg_2_1_1, lr=lr) ~> nrow_2_1_1
get(arr=grad_2_1, idx=2) ~> gs_2_1_2
vec_scale(a=xb, s=gs_2_1_2) ~> rg_2_1_2
sgd_update(weights=nrow_2_0_2, grad=rg_2_1_2, lr=lr) ~> nrow_2_1_2
get(arr=grad_2_1, idx=3) ~> gs_2_1_3
vec_scale(a=xb, s=gs_2_1_3) ~> rg_2_1_3
sgd_update(weights=nrow_2_0_3, grad=rg_2_1_3, lr=lr) ~> nrow_2_1_3
linear_rows(r0=nrow_2_1_0, r1=nrow_2_1_1, r2=nrow_2_1_2, r3=nrow_2_1_3, bv=bv, x=xc) ~> pred_2_2
vec_sub(a=pred_2_2, b=tc) ~> grad_2_2
get(arr=grad_2_2, idx=0) ~> gs_2_2_0
vec_scale(a=xc, s=gs_2_2_0) ~> rg_2_2_0
sgd_update(weights=nrow_2_1_0, grad=rg_2_2_0, lr=lr) ~> nrow_2_2_0
get(arr=grad_2_2, idx=1) ~> gs_2_2_1
vec_scale(a=xc, s=gs_2_2_1) ~> rg_2_2_1
sgd_update(weights=nrow_2_1_1, grad=rg_2_2_1, lr=lr) ~> nrow_2_2_1
get(arr=grad_2_2, idx=2) ~> gs_2_2_2
vec_scale(a=xc, s=gs_2_2_2) ~> rg_2_2_2
sgd_update(weights=nrow_2_1_2, grad=rg_2_2_2, lr=lr) ~> nrow_2_2_2
get(arr=grad_2_2, idx=3) ~> gs_2_2_3
vec_scale(a=xc, s=gs_2_2_3) ~> rg_2_2_3
sgd_update(weights=nrow_2_1_3, grad=rg_2_2_3, lr=lr) ~> nrow_2_2_3
linear_rows(r0=nrow_2_2_0, r1=nrow_2_2_1, r2=nrow_2_2_2, r3=nrow_2_2_3, bv=bv, x=xd) ~> pred_2_3
vec_sub(a=pred_2_3, b=td) ~> grad_2_3
get(arr=grad_2_3, idx=0) ~> gs_2_3_0
vec_scale(a=xd, s=gs_2_3_0) ~> rg_2_3_0
sgd_update(weights=nrow_2_2_0, grad=rg_2_3_0, lr=lr) ~> nrow_2_3_0
get(arr=grad_2_3, idx=1) ~> gs_2_3_1
vec_scale(a=xd, s=gs_2_3_1) ~> rg_2_3_1
sgd_update(weights=nrow_2_2_1, grad=rg_2_3_1, lr=lr) ~> nrow_2_3_1
get(arr=grad_2_3, idx=2) ~> gs_2_3_2
vec_scale(a=xd, s=gs_2_3_2) ~> rg_2_3_2
sgd_update(weights=nrow_2_2_2, grad=rg_2_3_2, lr=lr) ~> nrow_2_3_2
get(arr=grad_2_3, idx=3) ~> gs_2_3_3
vec_scale(a=xd, s=gs_2_3_3) ~> rg_2_3_3
sgd_update(weights=nrow_2_2_3, grad=rg_2_3_3, lr=lr) ~> nrow_2_3_3
linear_rows(r0=nrow_2_3_0, r1=nrow_2_3_1, r2=nrow_2_3_2, r3=nrow_2_3_3, bv=bv, x=xa) ~> pred_3_0
vec_sub(a=pred_3_0, b=ta) ~> grad_3_0
get(arr=grad_3_0, idx=0) ~> gs_3_0_0
vec_scale(a=xa, s=gs_3_0_0) ~> rg_3_0_0
sgd_update(weights=nrow_2_3_0, grad=rg_3_0_0, lr=lr) ~> nrow_3_0_0
get(arr=grad_3_0, idx=1) ~> gs_3_0_1
vec_scale(a=xa, s=gs_3_0_1) ~> rg_3_0_1
sgd_update(weights=nrow_2_3_1, grad=rg_3_0_1, lr=lr) ~> nrow_3_0_1
get(arr=grad_3_0, idx=2) ~> gs_3_0_2
vec_scale(a=xa, s=gs_3_0_2) ~> rg_3_0_2
sgd_update(weights=nrow_2_3_2, grad=rg_3_0_2, lr=lr) ~> nrow_3_0_2
get(arr=grad_3_0, idx=3) ~> gs_3_0_3
vec_scale(a=xa, s=gs_3_0_3) ~> rg_3_0_3
sgd_update(weights=nrow_2_3_3, grad=rg_3_0_3, lr=lr) ~> nrow_3_0_3
linear_rows(r0=nrow_3_0_0, r1=nrow_3_0_1, r2=nrow_3_0_2, r3=nrow_3_0_3, bv=bv, x=xb) ~> pred_3_1
vec_sub(a=pred_3_1, b=tb) ~> grad_3_1
get(arr=grad_3_1, idx=0) ~> gs_3_1_0
vec_scale(a=xb, s=gs_3_1_0) ~> rg_3_1_0
sgd_update(weights=nrow_3_0_0, grad=rg_3_1_0, lr=lr) ~> nrow_3_1_0
get(arr=grad_3_1, idx=1) ~> gs_3_1_1
vec_scale(a=xb, s=gs_3_1_1) ~> rg_3_1_1
sgd_update(weights=nrow_3_0_1, grad=rg_3_1_1, lr=lr) ~> nrow_3_1_1
get(arr=grad_3_1, idx=2) ~> gs_3_1_2
vec_scale(a=xb, s=gs_3_1_2) ~> rg_3_1_2
sgd_update(weights=nrow_3_0_2, grad=rg_3_1_2, lr=lr) ~> nrow_3_1_2
get(arr=grad_3_1, idx=3) ~> gs_3_1_3
vec_scale(a=xb, s=gs_3_1_3) ~> rg_3_1_3
sgd_update(weights=nrow_3_0_3, grad=rg_3_1_3, lr=lr) ~> nrow_3_1_3
linear_rows(r0=nrow_3_1_0, r1=nrow_3_1_1, r2=nrow_3_1_2, r3=nrow_3_1_3, bv=bv, x=xc) ~> pred_3_2
vec_sub(a=pred_3_2, b=tc) ~> grad_3_2
get(arr=grad_3_2, idx=0) ~> gs_3_2_0
vec_scale(a=xc, s=gs_3_2_0) ~> rg_3_2_0
sgd_update(weights=nrow_3_1_0, grad=rg_3_2_0, lr=lr) ~> nrow_3_2_0
get(arr=grad_3_2, idx=1) ~> gs_3_2_1
vec_scale(a=xc, s=gs_3_2_1) ~> rg_3_2_1
sgd_update(weights=nrow_3_1_1, grad=rg_3_2_1, lr=lr) ~> nrow_3_2_1
get(arr=grad_3_2, idx=2) ~> gs_3_2_2
vec_scale(a=xc, s=gs_3_2_2) ~> rg_3_2_2
sgd_update(weights=nrow_3_1_2, grad=rg_3_2_2, lr=lr) ~> nrow_3_2_2
get(arr=grad_3_2, idx=3) ~> gs_3_2_3
vec_scale(a=xc, s=gs_3_2_3) ~> rg_3_2_3
sgd_update(weights=nrow_3_1_3, grad=rg_3_2_3, lr=lr) ~> nrow_3_2_3
linear_rows(r0=nrow_3_2_0, r1=nrow_3_2_1, r2=nrow_3_2_2, r3=nrow_3_2_3, bv=bv, x=xd) ~> pred_3_3
vec_sub(a=pred_3_3, b=td) ~> grad_3_3
get(arr=grad_3_3, idx=0) ~> gs_3_3_0
vec_scale(a=xd, s=gs_3_3_0) ~> rg_3_3_0
sgd_update(weights=nrow_3_2_0, grad=rg_3_3_0, lr=lr) ~> nrow_3_3_0
get(arr=grad_3_3, idx=1) ~> gs_3_3_1
vec_scale(a=xd, s=gs_3_3_1) ~> rg_3_3_1
sgd_update(weights=nrow_3_2_1, grad=rg_3_3_1, lr=lr) ~> nrow_3_3_1
get(arr=grad_3_3, idx=2) ~> gs_3_3_2
vec_scale(a=xd, s=gs_3_3_2) ~> rg_3_3_2
sgd_update(weights=nrow_3_2_2, grad=rg_3_3_2, lr=lr) ~> nrow_3_3_2
get(arr=grad_3_3, idx=3) ~> gs_3_3_3
vec_scale(a=xd, s=gs_3_3_3) ~> rg_3_3_3
sgd_update(weights=nrow_3_2_3, grad=rg_3_3_3, lr=lr) ~> nrow_3_3_3
linear_rows(r0=nrow_3_3_0, r1=nrow_3_3_1, r2=nrow_3_3_2, r3=nrow_3_3_3, bv=bv, x=xa) ~> pred_4_0
vec_sub(a=pred_4_0, b=ta) ~> grad_4_0
get(arr=grad_4_0, idx=0) ~> gs_4_0_0
vec_scale(a=xa, s=gs_4_0_0) ~> rg_4_0_0
sgd_update(weights=nrow_3_3_0, grad=rg_4_0_0, lr=lr) ~> nrow_4_0_0
get(arr=grad_4_0, idx=1) ~> gs_4_0_1
vec_scale(a=xa, s=gs_4_0_1) ~> rg_4_0_1
sgd_update(weights=nrow_3_3_1, grad=rg_4_0_1, lr=lr) ~> nrow_4_0_1
get(arr=grad_4_0, idx=2) ~> gs_4_0_2
vec_scale(a=xa, s=gs_4_0_2) ~> rg_4_0_2
sgd_update(weights=nrow_3_3_2, grad=rg_4_0_2, lr=lr) ~> nrow_4_0_2
get(arr=grad_4_0, idx=3) ~> gs_4_0_3
vec_scale(a=xa, s=gs_4_0_3) ~> rg_4_0_3
sgd_update(weights=nrow_3_3_3, grad=rg_4_0_3, lr=lr) ~> nrow_4_0_3
linear_rows(r0=nrow_4_0_0, r1=nrow_4_0_1, r2=nrow_4_0_2, r3=nrow_4_0_3, bv=bv, x=xb) ~> pred_4_1
vec_sub(a=pred_4_1, b=tb) ~> grad_4_1
get(arr=grad_4_1, idx=0) ~> gs_4_1_0
vec_scale(a=xb, s=gs_4_1_0) ~> rg_4_1_0
sgd_update(weights=nrow_4_0_0, grad=rg_4_1_0, lr=lr) ~> nrow_4_1_0
get(arr=grad_4_1, idx=1) ~> gs_4_1_1
vec_scale(a=xb, s=gs_4_1_1) ~> rg_4_1_1
sgd_update(weights=nrow_4_0_1, grad=rg_4_1_1, lr=lr) ~> nrow_4_1_1
get(arr=grad_4_1, idx=2) ~> gs_4_1_2
vec_scale(a=xb, s=gs_4_1_2) ~> rg_4_1_2
sgd_update(weights=nrow_4_0_2, grad=rg_4_1_2, lr=lr) ~> nrow_4_1_2
get(arr=grad_4_1, idx=3) ~> gs_4_1_3
vec_scale(a=xb, s=gs_4_1_3) ~> rg_4_1_3
sgd_update(weights=nrow_4_0_3, grad=rg_4_1_3, lr=lr) ~> nrow_4_1_3
linear_rows(r0=nrow_4_1_0, r1=nrow_4_1_1, r2=nrow_4_1_2, r3=nrow_4_1_3, bv=bv, x=xc) ~> pred_4_2
vec_sub(a=pred_4_2, b=tc) ~> grad_4_2
get(arr=grad_4_2, idx=0) ~> gs_4_2_0
vec_scale(a=xc, s=gs_4_2_0) ~> rg_4_2_0
sgd_update(weights=nrow_4_1_0, grad=rg_4_2_0, lr=lr) ~> nrow_4_2_0
get(arr=grad_4_2, idx=1) ~> gs_4_2_1
vec_scale(a=xc, s=gs_4_2_1) ~> rg_4_2_1
sgd_update(weights=nrow_4_1_1, grad=rg_4_2_1, lr=lr) ~> nrow_4_2_1
get(arr=grad_4_2, idx=2) ~> gs_4_2_2
vec_scale(a=xc, s=gs_4_2_2) ~> rg_4_2_2
sgd_update(weights=nrow_4_1_2, grad=rg_4_2_2, lr=lr) ~> nrow_4_2_2
get(arr=grad_4_2, idx=3) ~> gs_4_2_3
vec_scale(a=xc, s=gs_4_2_3) ~> rg_4_2_3
sgd_update(weights=nrow_4_1_3, grad=rg_4_2_3, lr=lr) ~> nrow_4_2_3
linear_rows(r0=nrow_4_2_0, r1=nrow_4_2_1, r2=nrow_4_2_2, r3=nrow_4_2_3, bv=bv, x=xd) ~> pred_4_3
vec_sub(a=pred_4_3, b=td) ~> grad_4_3
get(arr=grad_4_3, idx=0) ~> gs_4_3_0
vec_scale(a=xd, s=gs_4_3_0) ~> rg_4_3_0
sgd_update(weights=nrow_4_2_0, grad=rg_4_3_0, lr=lr) ~> nrow_4_3_0
get(arr=grad_4_3, idx=1) ~> gs_4_3_1
vec_scale(a=xd, s=gs_4_3_1) ~> rg_4_3_1
sgd_update(weights=nrow_4_2_1, grad=rg_4_3_1, lr=lr) ~> nrow_4_3_1
get(arr=grad_4_3, idx=2) ~> gs_4_3_2
vec_scale(a=xd, s=gs_4_3_2) ~> rg_4_3_2
sgd_update(weights=nrow_4_2_2, grad=rg_4_3_2, lr=lr) ~> nrow_4_3_2
get(arr=grad_4_3, idx=3) ~> gs_4_3_3
vec_scale(a=xd, s=gs_4_3_3) ~> rg_4_3_3
sgd_update(weights=nrow_4_2_3, grad=rg_4_3_3, lr=lr) ~> nrow_4_3_3
linear_rows(r0=nrow_4_3_0, r1=nrow_4_3_1, r2=nrow_4_3_2, r3=nrow_4_3_3, bv=bv, x=xa) ~> final0
softmax(arr=final0) ~> prob0
argmax4(arr=prob0) ~> ans0
linear_rows(r0=nrow_4_3_0, r1=nrow_4_3_1, r2=nrow_4_3_2, r3=nrow_4_3_3, bv=bv, x=xb) ~> final1
softmax(arr=final1) ~> prob1
argmax4(arr=prob1) ~> ans1
linear_rows(r0=nrow_4_3_0, r1=nrow_4_3_1, r2=nrow_4_3_2, r3=nrow_4_3_3, bv=bv, x=xc) ~> final2
softmax(arr=final2) ~> prob2
argmax4(arr=prob2) ~> ans2
linear_rows(r0=nrow_4_3_0, r1=nrow_4_3_1, r2=nrow_4_3_2, r3=nrow_4_3_3, bv=bv, x=xd) ~> final3
softmax(arr=final3) ~> prob3
argmax4(arr=prob3) ~> ans3
[T+]
show shall(ans0)
show shall(ans1)
show shall(ans2)
show shall(ans3)