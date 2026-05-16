[T-]
import "lib/basic/std.t"
import "lib/advanced/ml_t.t"
row0 = [0.5, 0.3, 0.2, 0.1]
row1 = [0.1, 0.5, 0.3, 0.1]
row2 = [0.2, 0.1, 0.5, 0.2]
row3 = [0.1, 0.2, 0.1, 0.5]
bv = [0, 0, 0, 0]
lr = 0.05
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
linear_rows(r0=nrow_4_3_0, r1=nrow_4_3_1, r2=nrow_4_3_2, r3=nrow_4_3_3, bv=bv, x=xa) ~> pred_5_0
vec_sub(a=pred_5_0, b=ta) ~> grad_5_0
get(arr=grad_5_0, idx=0) ~> gs_5_0_0
vec_scale(a=xa, s=gs_5_0_0) ~> rg_5_0_0
sgd_update(weights=nrow_4_3_0, grad=rg_5_0_0, lr=lr) ~> nrow_5_0_0
get(arr=grad_5_0, idx=1) ~> gs_5_0_1
vec_scale(a=xa, s=gs_5_0_1) ~> rg_5_0_1
sgd_update(weights=nrow_4_3_1, grad=rg_5_0_1, lr=lr) ~> nrow_5_0_1
get(arr=grad_5_0, idx=2) ~> gs_5_0_2
vec_scale(a=xa, s=gs_5_0_2) ~> rg_5_0_2
sgd_update(weights=nrow_4_3_2, grad=rg_5_0_2, lr=lr) ~> nrow_5_0_2
get(arr=grad_5_0, idx=3) ~> gs_5_0_3
vec_scale(a=xa, s=gs_5_0_3) ~> rg_5_0_3
sgd_update(weights=nrow_4_3_3, grad=rg_5_0_3, lr=lr) ~> nrow_5_0_3
linear_rows(r0=nrow_5_0_0, r1=nrow_5_0_1, r2=nrow_5_0_2, r3=nrow_5_0_3, bv=bv, x=xb) ~> pred_5_1
vec_sub(a=pred_5_1, b=tb) ~> grad_5_1
get(arr=grad_5_1, idx=0) ~> gs_5_1_0
vec_scale(a=xb, s=gs_5_1_0) ~> rg_5_1_0
sgd_update(weights=nrow_5_0_0, grad=rg_5_1_0, lr=lr) ~> nrow_5_1_0
get(arr=grad_5_1, idx=1) ~> gs_5_1_1
vec_scale(a=xb, s=gs_5_1_1) ~> rg_5_1_1
sgd_update(weights=nrow_5_0_1, grad=rg_5_1_1, lr=lr) ~> nrow_5_1_1
get(arr=grad_5_1, idx=2) ~> gs_5_1_2
vec_scale(a=xb, s=gs_5_1_2) ~> rg_5_1_2
sgd_update(weights=nrow_5_0_2, grad=rg_5_1_2, lr=lr) ~> nrow_5_1_2
get(arr=grad_5_1, idx=3) ~> gs_5_1_3
vec_scale(a=xb, s=gs_5_1_3) ~> rg_5_1_3
sgd_update(weights=nrow_5_0_3, grad=rg_5_1_3, lr=lr) ~> nrow_5_1_3
linear_rows(r0=nrow_5_1_0, r1=nrow_5_1_1, r2=nrow_5_1_2, r3=nrow_5_1_3, bv=bv, x=xc) ~> pred_5_2
vec_sub(a=pred_5_2, b=tc) ~> grad_5_2
get(arr=grad_5_2, idx=0) ~> gs_5_2_0
vec_scale(a=xc, s=gs_5_2_0) ~> rg_5_2_0
sgd_update(weights=nrow_5_1_0, grad=rg_5_2_0, lr=lr) ~> nrow_5_2_0
get(arr=grad_5_2, idx=1) ~> gs_5_2_1
vec_scale(a=xc, s=gs_5_2_1) ~> rg_5_2_1
sgd_update(weights=nrow_5_1_1, grad=rg_5_2_1, lr=lr) ~> nrow_5_2_1
get(arr=grad_5_2, idx=2) ~> gs_5_2_2
vec_scale(a=xc, s=gs_5_2_2) ~> rg_5_2_2
sgd_update(weights=nrow_5_1_2, grad=rg_5_2_2, lr=lr) ~> nrow_5_2_2
get(arr=grad_5_2, idx=3) ~> gs_5_2_3
vec_scale(a=xc, s=gs_5_2_3) ~> rg_5_2_3
sgd_update(weights=nrow_5_1_3, grad=rg_5_2_3, lr=lr) ~> nrow_5_2_3
linear_rows(r0=nrow_5_2_0, r1=nrow_5_2_1, r2=nrow_5_2_2, r3=nrow_5_2_3, bv=bv, x=xd) ~> pred_5_3
vec_sub(a=pred_5_3, b=td) ~> grad_5_3
get(arr=grad_5_3, idx=0) ~> gs_5_3_0
vec_scale(a=xd, s=gs_5_3_0) ~> rg_5_3_0
sgd_update(weights=nrow_5_2_0, grad=rg_5_3_0, lr=lr) ~> nrow_5_3_0
get(arr=grad_5_3, idx=1) ~> gs_5_3_1
vec_scale(a=xd, s=gs_5_3_1) ~> rg_5_3_1
sgd_update(weights=nrow_5_2_1, grad=rg_5_3_1, lr=lr) ~> nrow_5_3_1
get(arr=grad_5_3, idx=2) ~> gs_5_3_2
vec_scale(a=xd, s=gs_5_3_2) ~> rg_5_3_2
sgd_update(weights=nrow_5_2_2, grad=rg_5_3_2, lr=lr) ~> nrow_5_3_2
get(arr=grad_5_3, idx=3) ~> gs_5_3_3
vec_scale(a=xd, s=gs_5_3_3) ~> rg_5_3_3
sgd_update(weights=nrow_5_2_3, grad=rg_5_3_3, lr=lr) ~> nrow_5_3_3
linear_rows(r0=nrow_5_3_0, r1=nrow_5_3_1, r2=nrow_5_3_2, r3=nrow_5_3_3, bv=bv, x=xa) ~> pred_6_0
vec_sub(a=pred_6_0, b=ta) ~> grad_6_0
get(arr=grad_6_0, idx=0) ~> gs_6_0_0
vec_scale(a=xa, s=gs_6_0_0) ~> rg_6_0_0
sgd_update(weights=nrow_5_3_0, grad=rg_6_0_0, lr=lr) ~> nrow_6_0_0
get(arr=grad_6_0, idx=1) ~> gs_6_0_1
vec_scale(a=xa, s=gs_6_0_1) ~> rg_6_0_1
sgd_update(weights=nrow_5_3_1, grad=rg_6_0_1, lr=lr) ~> nrow_6_0_1
get(arr=grad_6_0, idx=2) ~> gs_6_0_2
vec_scale(a=xa, s=gs_6_0_2) ~> rg_6_0_2
sgd_update(weights=nrow_5_3_2, grad=rg_6_0_2, lr=lr) ~> nrow_6_0_2
get(arr=grad_6_0, idx=3) ~> gs_6_0_3
vec_scale(a=xa, s=gs_6_0_3) ~> rg_6_0_3
sgd_update(weights=nrow_5_3_3, grad=rg_6_0_3, lr=lr) ~> nrow_6_0_3
linear_rows(r0=nrow_6_0_0, r1=nrow_6_0_1, r2=nrow_6_0_2, r3=nrow_6_0_3, bv=bv, x=xb) ~> pred_6_1
vec_sub(a=pred_6_1, b=tb) ~> grad_6_1
get(arr=grad_6_1, idx=0) ~> gs_6_1_0
vec_scale(a=xb, s=gs_6_1_0) ~> rg_6_1_0
sgd_update(weights=nrow_6_0_0, grad=rg_6_1_0, lr=lr) ~> nrow_6_1_0
get(arr=grad_6_1, idx=1) ~> gs_6_1_1
vec_scale(a=xb, s=gs_6_1_1) ~> rg_6_1_1
sgd_update(weights=nrow_6_0_1, grad=rg_6_1_1, lr=lr) ~> nrow_6_1_1
get(arr=grad_6_1, idx=2) ~> gs_6_1_2
vec_scale(a=xb, s=gs_6_1_2) ~> rg_6_1_2
sgd_update(weights=nrow_6_0_2, grad=rg_6_1_2, lr=lr) ~> nrow_6_1_2
get(arr=grad_6_1, idx=3) ~> gs_6_1_3
vec_scale(a=xb, s=gs_6_1_3) ~> rg_6_1_3
sgd_update(weights=nrow_6_0_3, grad=rg_6_1_3, lr=lr) ~> nrow_6_1_3
linear_rows(r0=nrow_6_1_0, r1=nrow_6_1_1, r2=nrow_6_1_2, r3=nrow_6_1_3, bv=bv, x=xc) ~> pred_6_2
vec_sub(a=pred_6_2, b=tc) ~> grad_6_2
get(arr=grad_6_2, idx=0) ~> gs_6_2_0
vec_scale(a=xc, s=gs_6_2_0) ~> rg_6_2_0
sgd_update(weights=nrow_6_1_0, grad=rg_6_2_0, lr=lr) ~> nrow_6_2_0
get(arr=grad_6_2, idx=1) ~> gs_6_2_1
vec_scale(a=xc, s=gs_6_2_1) ~> rg_6_2_1
sgd_update(weights=nrow_6_1_1, grad=rg_6_2_1, lr=lr) ~> nrow_6_2_1
get(arr=grad_6_2, idx=2) ~> gs_6_2_2
vec_scale(a=xc, s=gs_6_2_2) ~> rg_6_2_2
sgd_update(weights=nrow_6_1_2, grad=rg_6_2_2, lr=lr) ~> nrow_6_2_2
get(arr=grad_6_2, idx=3) ~> gs_6_2_3
vec_scale(a=xc, s=gs_6_2_3) ~> rg_6_2_3
sgd_update(weights=nrow_6_1_3, grad=rg_6_2_3, lr=lr) ~> nrow_6_2_3
linear_rows(r0=nrow_6_2_0, r1=nrow_6_2_1, r2=nrow_6_2_2, r3=nrow_6_2_3, bv=bv, x=xd) ~> pred_6_3
vec_sub(a=pred_6_3, b=td) ~> grad_6_3
get(arr=grad_6_3, idx=0) ~> gs_6_3_0
vec_scale(a=xd, s=gs_6_3_0) ~> rg_6_3_0
sgd_update(weights=nrow_6_2_0, grad=rg_6_3_0, lr=lr) ~> nrow_6_3_0
get(arr=grad_6_3, idx=1) ~> gs_6_3_1
vec_scale(a=xd, s=gs_6_3_1) ~> rg_6_3_1
sgd_update(weights=nrow_6_2_1, grad=rg_6_3_1, lr=lr) ~> nrow_6_3_1
get(arr=grad_6_3, idx=2) ~> gs_6_3_2
vec_scale(a=xd, s=gs_6_3_2) ~> rg_6_3_2
sgd_update(weights=nrow_6_2_2, grad=rg_6_3_2, lr=lr) ~> nrow_6_3_2
get(arr=grad_6_3, idx=3) ~> gs_6_3_3
vec_scale(a=xd, s=gs_6_3_3) ~> rg_6_3_3
sgd_update(weights=nrow_6_2_3, grad=rg_6_3_3, lr=lr) ~> nrow_6_3_3
linear_rows(r0=nrow_6_3_0, r1=nrow_6_3_1, r2=nrow_6_3_2, r3=nrow_6_3_3, bv=bv, x=xa) ~> pred_7_0
vec_sub(a=pred_7_0, b=ta) ~> grad_7_0
get(arr=grad_7_0, idx=0) ~> gs_7_0_0
vec_scale(a=xa, s=gs_7_0_0) ~> rg_7_0_0
sgd_update(weights=nrow_6_3_0, grad=rg_7_0_0, lr=lr) ~> nrow_7_0_0
get(arr=grad_7_0, idx=1) ~> gs_7_0_1
vec_scale(a=xa, s=gs_7_0_1) ~> rg_7_0_1
sgd_update(weights=nrow_6_3_1, grad=rg_7_0_1, lr=lr) ~> nrow_7_0_1
get(arr=grad_7_0, idx=2) ~> gs_7_0_2
vec_scale(a=xa, s=gs_7_0_2) ~> rg_7_0_2
sgd_update(weights=nrow_6_3_2, grad=rg_7_0_2, lr=lr) ~> nrow_7_0_2
get(arr=grad_7_0, idx=3) ~> gs_7_0_3
vec_scale(a=xa, s=gs_7_0_3) ~> rg_7_0_3
sgd_update(weights=nrow_6_3_3, grad=rg_7_0_3, lr=lr) ~> nrow_7_0_3
linear_rows(r0=nrow_7_0_0, r1=nrow_7_0_1, r2=nrow_7_0_2, r3=nrow_7_0_3, bv=bv, x=xb) ~> pred_7_1
vec_sub(a=pred_7_1, b=tb) ~> grad_7_1
get(arr=grad_7_1, idx=0) ~> gs_7_1_0
vec_scale(a=xb, s=gs_7_1_0) ~> rg_7_1_0
sgd_update(weights=nrow_7_0_0, grad=rg_7_1_0, lr=lr) ~> nrow_7_1_0
get(arr=grad_7_1, idx=1) ~> gs_7_1_1
vec_scale(a=xb, s=gs_7_1_1) ~> rg_7_1_1
sgd_update(weights=nrow_7_0_1, grad=rg_7_1_1, lr=lr) ~> nrow_7_1_1
get(arr=grad_7_1, idx=2) ~> gs_7_1_2
vec_scale(a=xb, s=gs_7_1_2) ~> rg_7_1_2
sgd_update(weights=nrow_7_0_2, grad=rg_7_1_2, lr=lr) ~> nrow_7_1_2
get(arr=grad_7_1, idx=3) ~> gs_7_1_3
vec_scale(a=xb, s=gs_7_1_3) ~> rg_7_1_3
sgd_update(weights=nrow_7_0_3, grad=rg_7_1_3, lr=lr) ~> nrow_7_1_3
linear_rows(r0=nrow_7_1_0, r1=nrow_7_1_1, r2=nrow_7_1_2, r3=nrow_7_1_3, bv=bv, x=xc) ~> pred_7_2
vec_sub(a=pred_7_2, b=tc) ~> grad_7_2
get(arr=grad_7_2, idx=0) ~> gs_7_2_0
vec_scale(a=xc, s=gs_7_2_0) ~> rg_7_2_0
sgd_update(weights=nrow_7_1_0, grad=rg_7_2_0, lr=lr) ~> nrow_7_2_0
get(arr=grad_7_2, idx=1) ~> gs_7_2_1
vec_scale(a=xc, s=gs_7_2_1) ~> rg_7_2_1
sgd_update(weights=nrow_7_1_1, grad=rg_7_2_1, lr=lr) ~> nrow_7_2_1
get(arr=grad_7_2, idx=2) ~> gs_7_2_2
vec_scale(a=xc, s=gs_7_2_2) ~> rg_7_2_2
sgd_update(weights=nrow_7_1_2, grad=rg_7_2_2, lr=lr) ~> nrow_7_2_2
get(arr=grad_7_2, idx=3) ~> gs_7_2_3
vec_scale(a=xc, s=gs_7_2_3) ~> rg_7_2_3
sgd_update(weights=nrow_7_1_3, grad=rg_7_2_3, lr=lr) ~> nrow_7_2_3
linear_rows(r0=nrow_7_2_0, r1=nrow_7_2_1, r2=nrow_7_2_2, r3=nrow_7_2_3, bv=bv, x=xd) ~> pred_7_3
vec_sub(a=pred_7_3, b=td) ~> grad_7_3
get(arr=grad_7_3, idx=0) ~> gs_7_3_0
vec_scale(a=xd, s=gs_7_3_0) ~> rg_7_3_0
sgd_update(weights=nrow_7_2_0, grad=rg_7_3_0, lr=lr) ~> nrow_7_3_0
get(arr=grad_7_3, idx=1) ~> gs_7_3_1
vec_scale(a=xd, s=gs_7_3_1) ~> rg_7_3_1
sgd_update(weights=nrow_7_2_1, grad=rg_7_3_1, lr=lr) ~> nrow_7_3_1
get(arr=grad_7_3, idx=2) ~> gs_7_3_2
vec_scale(a=xd, s=gs_7_3_2) ~> rg_7_3_2
sgd_update(weights=nrow_7_2_2, grad=rg_7_3_2, lr=lr) ~> nrow_7_3_2
get(arr=grad_7_3, idx=3) ~> gs_7_3_3
vec_scale(a=xd, s=gs_7_3_3) ~> rg_7_3_3
sgd_update(weights=nrow_7_2_3, grad=rg_7_3_3, lr=lr) ~> nrow_7_3_3
linear_rows(r0=nrow_7_3_0, r1=nrow_7_3_1, r2=nrow_7_3_2, r3=nrow_7_3_3, bv=bv, x=xa) ~> pred_8_0
vec_sub(a=pred_8_0, b=ta) ~> grad_8_0
get(arr=grad_8_0, idx=0) ~> gs_8_0_0
vec_scale(a=xa, s=gs_8_0_0) ~> rg_8_0_0
sgd_update(weights=nrow_7_3_0, grad=rg_8_0_0, lr=lr) ~> nrow_8_0_0
get(arr=grad_8_0, idx=1) ~> gs_8_0_1
vec_scale(a=xa, s=gs_8_0_1) ~> rg_8_0_1
sgd_update(weights=nrow_7_3_1, grad=rg_8_0_1, lr=lr) ~> nrow_8_0_1
get(arr=grad_8_0, idx=2) ~> gs_8_0_2
vec_scale(a=xa, s=gs_8_0_2) ~> rg_8_0_2
sgd_update(weights=nrow_7_3_2, grad=rg_8_0_2, lr=lr) ~> nrow_8_0_2
get(arr=grad_8_0, idx=3) ~> gs_8_0_3
vec_scale(a=xa, s=gs_8_0_3) ~> rg_8_0_3
sgd_update(weights=nrow_7_3_3, grad=rg_8_0_3, lr=lr) ~> nrow_8_0_3
linear_rows(r0=nrow_8_0_0, r1=nrow_8_0_1, r2=nrow_8_0_2, r3=nrow_8_0_3, bv=bv, x=xb) ~> pred_8_1
vec_sub(a=pred_8_1, b=tb) ~> grad_8_1
get(arr=grad_8_1, idx=0) ~> gs_8_1_0
vec_scale(a=xb, s=gs_8_1_0) ~> rg_8_1_0
sgd_update(weights=nrow_8_0_0, grad=rg_8_1_0, lr=lr) ~> nrow_8_1_0
get(arr=grad_8_1, idx=1) ~> gs_8_1_1
vec_scale(a=xb, s=gs_8_1_1) ~> rg_8_1_1
sgd_update(weights=nrow_8_0_1, grad=rg_8_1_1, lr=lr) ~> nrow_8_1_1
get(arr=grad_8_1, idx=2) ~> gs_8_1_2
vec_scale(a=xb, s=gs_8_1_2) ~> rg_8_1_2
sgd_update(weights=nrow_8_0_2, grad=rg_8_1_2, lr=lr) ~> nrow_8_1_2
get(arr=grad_8_1, idx=3) ~> gs_8_1_3
vec_scale(a=xb, s=gs_8_1_3) ~> rg_8_1_3
sgd_update(weights=nrow_8_0_3, grad=rg_8_1_3, lr=lr) ~> nrow_8_1_3
linear_rows(r0=nrow_8_1_0, r1=nrow_8_1_1, r2=nrow_8_1_2, r3=nrow_8_1_3, bv=bv, x=xc) ~> pred_8_2
vec_sub(a=pred_8_2, b=tc) ~> grad_8_2
get(arr=grad_8_2, idx=0) ~> gs_8_2_0
vec_scale(a=xc, s=gs_8_2_0) ~> rg_8_2_0
sgd_update(weights=nrow_8_1_0, grad=rg_8_2_0, lr=lr) ~> nrow_8_2_0
get(arr=grad_8_2, idx=1) ~> gs_8_2_1
vec_scale(a=xc, s=gs_8_2_1) ~> rg_8_2_1
sgd_update(weights=nrow_8_1_1, grad=rg_8_2_1, lr=lr) ~> nrow_8_2_1
get(arr=grad_8_2, idx=2) ~> gs_8_2_2
vec_scale(a=xc, s=gs_8_2_2) ~> rg_8_2_2
sgd_update(weights=nrow_8_1_2, grad=rg_8_2_2, lr=lr) ~> nrow_8_2_2
get(arr=grad_8_2, idx=3) ~> gs_8_2_3
vec_scale(a=xc, s=gs_8_2_3) ~> rg_8_2_3
sgd_update(weights=nrow_8_1_3, grad=rg_8_2_3, lr=lr) ~> nrow_8_2_3
linear_rows(r0=nrow_8_2_0, r1=nrow_8_2_1, r2=nrow_8_2_2, r3=nrow_8_2_3, bv=bv, x=xd) ~> pred_8_3
vec_sub(a=pred_8_3, b=td) ~> grad_8_3
get(arr=grad_8_3, idx=0) ~> gs_8_3_0
vec_scale(a=xd, s=gs_8_3_0) ~> rg_8_3_0
sgd_update(weights=nrow_8_2_0, grad=rg_8_3_0, lr=lr) ~> nrow_8_3_0
get(arr=grad_8_3, idx=1) ~> gs_8_3_1
vec_scale(a=xd, s=gs_8_3_1) ~> rg_8_3_1
sgd_update(weights=nrow_8_2_1, grad=rg_8_3_1, lr=lr) ~> nrow_8_3_1
get(arr=grad_8_3, idx=2) ~> gs_8_3_2
vec_scale(a=xd, s=gs_8_3_2) ~> rg_8_3_2
sgd_update(weights=nrow_8_2_2, grad=rg_8_3_2, lr=lr) ~> nrow_8_3_2
get(arr=grad_8_3, idx=3) ~> gs_8_3_3
vec_scale(a=xd, s=gs_8_3_3) ~> rg_8_3_3
sgd_update(weights=nrow_8_2_3, grad=rg_8_3_3, lr=lr) ~> nrow_8_3_3
linear_rows(r0=nrow_8_3_0, r1=nrow_8_3_1, r2=nrow_8_3_2, r3=nrow_8_3_3, bv=bv, x=xa) ~> pred_9_0
vec_sub(a=pred_9_0, b=ta) ~> grad_9_0
get(arr=grad_9_0, idx=0) ~> gs_9_0_0
vec_scale(a=xa, s=gs_9_0_0) ~> rg_9_0_0
sgd_update(weights=nrow_8_3_0, grad=rg_9_0_0, lr=lr) ~> nrow_9_0_0
get(arr=grad_9_0, idx=1) ~> gs_9_0_1
vec_scale(a=xa, s=gs_9_0_1) ~> rg_9_0_1
sgd_update(weights=nrow_8_3_1, grad=rg_9_0_1, lr=lr) ~> nrow_9_0_1
get(arr=grad_9_0, idx=2) ~> gs_9_0_2
vec_scale(a=xa, s=gs_9_0_2) ~> rg_9_0_2
sgd_update(weights=nrow_8_3_2, grad=rg_9_0_2, lr=lr) ~> nrow_9_0_2
get(arr=grad_9_0, idx=3) ~> gs_9_0_3
vec_scale(a=xa, s=gs_9_0_3) ~> rg_9_0_3
sgd_update(weights=nrow_8_3_3, grad=rg_9_0_3, lr=lr) ~> nrow_9_0_3
linear_rows(r0=nrow_9_0_0, r1=nrow_9_0_1, r2=nrow_9_0_2, r3=nrow_9_0_3, bv=bv, x=xb) ~> pred_9_1
vec_sub(a=pred_9_1, b=tb) ~> grad_9_1
get(arr=grad_9_1, idx=0) ~> gs_9_1_0
vec_scale(a=xb, s=gs_9_1_0) ~> rg_9_1_0
sgd_update(weights=nrow_9_0_0, grad=rg_9_1_0, lr=lr) ~> nrow_9_1_0
get(arr=grad_9_1, idx=1) ~> gs_9_1_1
vec_scale(a=xb, s=gs_9_1_1) ~> rg_9_1_1
sgd_update(weights=nrow_9_0_1, grad=rg_9_1_1, lr=lr) ~> nrow_9_1_1
get(arr=grad_9_1, idx=2) ~> gs_9_1_2
vec_scale(a=xb, s=gs_9_1_2) ~> rg_9_1_2
sgd_update(weights=nrow_9_0_2, grad=rg_9_1_2, lr=lr) ~> nrow_9_1_2
get(arr=grad_9_1, idx=3) ~> gs_9_1_3
vec_scale(a=xb, s=gs_9_1_3) ~> rg_9_1_3
sgd_update(weights=nrow_9_0_3, grad=rg_9_1_3, lr=lr) ~> nrow_9_1_3
linear_rows(r0=nrow_9_1_0, r1=nrow_9_1_1, r2=nrow_9_1_2, r3=nrow_9_1_3, bv=bv, x=xc) ~> pred_9_2
vec_sub(a=pred_9_2, b=tc) ~> grad_9_2
get(arr=grad_9_2, idx=0) ~> gs_9_2_0
vec_scale(a=xc, s=gs_9_2_0) ~> rg_9_2_0
sgd_update(weights=nrow_9_1_0, grad=rg_9_2_0, lr=lr) ~> nrow_9_2_0
get(arr=grad_9_2, idx=1) ~> gs_9_2_1
vec_scale(a=xc, s=gs_9_2_1) ~> rg_9_2_1
sgd_update(weights=nrow_9_1_1, grad=rg_9_2_1, lr=lr) ~> nrow_9_2_1
get(arr=grad_9_2, idx=2) ~> gs_9_2_2
vec_scale(a=xc, s=gs_9_2_2) ~> rg_9_2_2
sgd_update(weights=nrow_9_1_2, grad=rg_9_2_2, lr=lr) ~> nrow_9_2_2
get(arr=grad_9_2, idx=3) ~> gs_9_2_3
vec_scale(a=xc, s=gs_9_2_3) ~> rg_9_2_3
sgd_update(weights=nrow_9_1_3, grad=rg_9_2_3, lr=lr) ~> nrow_9_2_3
linear_rows(r0=nrow_9_2_0, r1=nrow_9_2_1, r2=nrow_9_2_2, r3=nrow_9_2_3, bv=bv, x=xd) ~> pred_9_3
vec_sub(a=pred_9_3, b=td) ~> grad_9_3
get(arr=grad_9_3, idx=0) ~> gs_9_3_0
vec_scale(a=xd, s=gs_9_3_0) ~> rg_9_3_0
sgd_update(weights=nrow_9_2_0, grad=rg_9_3_0, lr=lr) ~> nrow_9_3_0
get(arr=grad_9_3, idx=1) ~> gs_9_3_1
vec_scale(a=xd, s=gs_9_3_1) ~> rg_9_3_1
sgd_update(weights=nrow_9_2_1, grad=rg_9_3_1, lr=lr) ~> nrow_9_3_1
get(arr=grad_9_3, idx=2) ~> gs_9_3_2
vec_scale(a=xd, s=gs_9_3_2) ~> rg_9_3_2
sgd_update(weights=nrow_9_2_2, grad=rg_9_3_2, lr=lr) ~> nrow_9_3_2
get(arr=grad_9_3, idx=3) ~> gs_9_3_3
vec_scale(a=xd, s=gs_9_3_3) ~> rg_9_3_3
sgd_update(weights=nrow_9_2_3, grad=rg_9_3_3, lr=lr) ~> nrow_9_3_3
linear_rows(r0=nrow_9_3_0, r1=nrow_9_3_1, r2=nrow_9_3_2, r3=nrow_9_3_3, bv=bv, x=xa) ~> pred_10_0
vec_sub(a=pred_10_0, b=ta) ~> grad_10_0
get(arr=grad_10_0, idx=0) ~> gs_10_0_0
vec_scale(a=xa, s=gs_10_0_0) ~> rg_10_0_0
sgd_update(weights=nrow_9_3_0, grad=rg_10_0_0, lr=lr) ~> nrow_10_0_0
get(arr=grad_10_0, idx=1) ~> gs_10_0_1
vec_scale(a=xa, s=gs_10_0_1) ~> rg_10_0_1
sgd_update(weights=nrow_9_3_1, grad=rg_10_0_1, lr=lr) ~> nrow_10_0_1
get(arr=grad_10_0, idx=2) ~> gs_10_0_2
vec_scale(a=xa, s=gs_10_0_2) ~> rg_10_0_2
sgd_update(weights=nrow_9_3_2, grad=rg_10_0_2, lr=lr) ~> nrow_10_0_2
get(arr=grad_10_0, idx=3) ~> gs_10_0_3
vec_scale(a=xa, s=gs_10_0_3) ~> rg_10_0_3
sgd_update(weights=nrow_9_3_3, grad=rg_10_0_3, lr=lr) ~> nrow_10_0_3
linear_rows(r0=nrow_10_0_0, r1=nrow_10_0_1, r2=nrow_10_0_2, r3=nrow_10_0_3, bv=bv, x=xb) ~> pred_10_1
vec_sub(a=pred_10_1, b=tb) ~> grad_10_1
get(arr=grad_10_1, idx=0) ~> gs_10_1_0
vec_scale(a=xb, s=gs_10_1_0) ~> rg_10_1_0
sgd_update(weights=nrow_10_0_0, grad=rg_10_1_0, lr=lr) ~> nrow_10_1_0
get(arr=grad_10_1, idx=1) ~> gs_10_1_1
vec_scale(a=xb, s=gs_10_1_1) ~> rg_10_1_1
sgd_update(weights=nrow_10_0_1, grad=rg_10_1_1, lr=lr) ~> nrow_10_1_1
get(arr=grad_10_1, idx=2) ~> gs_10_1_2
vec_scale(a=xb, s=gs_10_1_2) ~> rg_10_1_2
sgd_update(weights=nrow_10_0_2, grad=rg_10_1_2, lr=lr) ~> nrow_10_1_2
get(arr=grad_10_1, idx=3) ~> gs_10_1_3
vec_scale(a=xb, s=gs_10_1_3) ~> rg_10_1_3
sgd_update(weights=nrow_10_0_3, grad=rg_10_1_3, lr=lr) ~> nrow_10_1_3
linear_rows(r0=nrow_10_1_0, r1=nrow_10_1_1, r2=nrow_10_1_2, r3=nrow_10_1_3, bv=bv, x=xc) ~> pred_10_2
vec_sub(a=pred_10_2, b=tc) ~> grad_10_2
get(arr=grad_10_2, idx=0) ~> gs_10_2_0
vec_scale(a=xc, s=gs_10_2_0) ~> rg_10_2_0
sgd_update(weights=nrow_10_1_0, grad=rg_10_2_0, lr=lr) ~> nrow_10_2_0
get(arr=grad_10_2, idx=1) ~> gs_10_2_1
vec_scale(a=xc, s=gs_10_2_1) ~> rg_10_2_1
sgd_update(weights=nrow_10_1_1, grad=rg_10_2_1, lr=lr) ~> nrow_10_2_1
get(arr=grad_10_2, idx=2) ~> gs_10_2_2
vec_scale(a=xc, s=gs_10_2_2) ~> rg_10_2_2
sgd_update(weights=nrow_10_1_2, grad=rg_10_2_2, lr=lr) ~> nrow_10_2_2
get(arr=grad_10_2, idx=3) ~> gs_10_2_3
vec_scale(a=xc, s=gs_10_2_3) ~> rg_10_2_3
sgd_update(weights=nrow_10_1_3, grad=rg_10_2_3, lr=lr) ~> nrow_10_2_3
linear_rows(r0=nrow_10_2_0, r1=nrow_10_2_1, r2=nrow_10_2_2, r3=nrow_10_2_3, bv=bv, x=xd) ~> pred_10_3
vec_sub(a=pred_10_3, b=td) ~> grad_10_3
get(arr=grad_10_3, idx=0) ~> gs_10_3_0
vec_scale(a=xd, s=gs_10_3_0) ~> rg_10_3_0
sgd_update(weights=nrow_10_2_0, grad=rg_10_3_0, lr=lr) ~> nrow_10_3_0
get(arr=grad_10_3, idx=1) ~> gs_10_3_1
vec_scale(a=xd, s=gs_10_3_1) ~> rg_10_3_1
sgd_update(weights=nrow_10_2_1, grad=rg_10_3_1, lr=lr) ~> nrow_10_3_1
get(arr=grad_10_3, idx=2) ~> gs_10_3_2
vec_scale(a=xd, s=gs_10_3_2) ~> rg_10_3_2
sgd_update(weights=nrow_10_2_2, grad=rg_10_3_2, lr=lr) ~> nrow_10_3_2
get(arr=grad_10_3, idx=3) ~> gs_10_3_3
vec_scale(a=xd, s=gs_10_3_3) ~> rg_10_3_3
sgd_update(weights=nrow_10_2_3, grad=rg_10_3_3, lr=lr) ~> nrow_10_3_3
linear_rows(r0=nrow_10_3_0, r1=nrow_10_3_1, r2=nrow_10_3_2, r3=nrow_10_3_3, bv=bv, x=xa) ~> pred_11_0
vec_sub(a=pred_11_0, b=ta) ~> grad_11_0
get(arr=grad_11_0, idx=0) ~> gs_11_0_0
vec_scale(a=xa, s=gs_11_0_0) ~> rg_11_0_0
sgd_update(weights=nrow_10_3_0, grad=rg_11_0_0, lr=lr) ~> nrow_11_0_0
get(arr=grad_11_0, idx=1) ~> gs_11_0_1
vec_scale(a=xa, s=gs_11_0_1) ~> rg_11_0_1
sgd_update(weights=nrow_10_3_1, grad=rg_11_0_1, lr=lr) ~> nrow_11_0_1
get(arr=grad_11_0, idx=2) ~> gs_11_0_2
vec_scale(a=xa, s=gs_11_0_2) ~> rg_11_0_2
sgd_update(weights=nrow_10_3_2, grad=rg_11_0_2, lr=lr) ~> nrow_11_0_2
get(arr=grad_11_0, idx=3) ~> gs_11_0_3
vec_scale(a=xa, s=gs_11_0_3) ~> rg_11_0_3
sgd_update(weights=nrow_10_3_3, grad=rg_11_0_3, lr=lr) ~> nrow_11_0_3
linear_rows(r0=nrow_11_0_0, r1=nrow_11_0_1, r2=nrow_11_0_2, r3=nrow_11_0_3, bv=bv, x=xb) ~> pred_11_1
vec_sub(a=pred_11_1, b=tb) ~> grad_11_1
get(arr=grad_11_1, idx=0) ~> gs_11_1_0
vec_scale(a=xb, s=gs_11_1_0) ~> rg_11_1_0
sgd_update(weights=nrow_11_0_0, grad=rg_11_1_0, lr=lr) ~> nrow_11_1_0
get(arr=grad_11_1, idx=1) ~> gs_11_1_1
vec_scale(a=xb, s=gs_11_1_1) ~> rg_11_1_1
sgd_update(weights=nrow_11_0_1, grad=rg_11_1_1, lr=lr) ~> nrow_11_1_1
get(arr=grad_11_1, idx=2) ~> gs_11_1_2
vec_scale(a=xb, s=gs_11_1_2) ~> rg_11_1_2
sgd_update(weights=nrow_11_0_2, grad=rg_11_1_2, lr=lr) ~> nrow_11_1_2
get(arr=grad_11_1, idx=3) ~> gs_11_1_3
vec_scale(a=xb, s=gs_11_1_3) ~> rg_11_1_3
sgd_update(weights=nrow_11_0_3, grad=rg_11_1_3, lr=lr) ~> nrow_11_1_3
linear_rows(r0=nrow_11_1_0, r1=nrow_11_1_1, r2=nrow_11_1_2, r3=nrow_11_1_3, bv=bv, x=xc) ~> pred_11_2
vec_sub(a=pred_11_2, b=tc) ~> grad_11_2
get(arr=grad_11_2, idx=0) ~> gs_11_2_0
vec_scale(a=xc, s=gs_11_2_0) ~> rg_11_2_0
sgd_update(weights=nrow_11_1_0, grad=rg_11_2_0, lr=lr) ~> nrow_11_2_0
get(arr=grad_11_2, idx=1) ~> gs_11_2_1
vec_scale(a=xc, s=gs_11_2_1) ~> rg_11_2_1
sgd_update(weights=nrow_11_1_1, grad=rg_11_2_1, lr=lr) ~> nrow_11_2_1
get(arr=grad_11_2, idx=2) ~> gs_11_2_2
vec_scale(a=xc, s=gs_11_2_2) ~> rg_11_2_2
sgd_update(weights=nrow_11_1_2, grad=rg_11_2_2, lr=lr) ~> nrow_11_2_2
get(arr=grad_11_2, idx=3) ~> gs_11_2_3
vec_scale(a=xc, s=gs_11_2_3) ~> rg_11_2_3
sgd_update(weights=nrow_11_1_3, grad=rg_11_2_3, lr=lr) ~> nrow_11_2_3
linear_rows(r0=nrow_11_2_0, r1=nrow_11_2_1, r2=nrow_11_2_2, r3=nrow_11_2_3, bv=bv, x=xd) ~> pred_11_3
vec_sub(a=pred_11_3, b=td) ~> grad_11_3
get(arr=grad_11_3, idx=0) ~> gs_11_3_0
vec_scale(a=xd, s=gs_11_3_0) ~> rg_11_3_0
sgd_update(weights=nrow_11_2_0, grad=rg_11_3_0, lr=lr) ~> nrow_11_3_0
get(arr=grad_11_3, idx=1) ~> gs_11_3_1
vec_scale(a=xd, s=gs_11_3_1) ~> rg_11_3_1
sgd_update(weights=nrow_11_2_1, grad=rg_11_3_1, lr=lr) ~> nrow_11_3_1
get(arr=grad_11_3, idx=2) ~> gs_11_3_2
vec_scale(a=xd, s=gs_11_3_2) ~> rg_11_3_2
sgd_update(weights=nrow_11_2_2, grad=rg_11_3_2, lr=lr) ~> nrow_11_3_2
get(arr=grad_11_3, idx=3) ~> gs_11_3_3
vec_scale(a=xd, s=gs_11_3_3) ~> rg_11_3_3
sgd_update(weights=nrow_11_2_3, grad=rg_11_3_3, lr=lr) ~> nrow_11_3_3
linear_rows(r0=nrow_11_3_0, r1=nrow_11_3_1, r2=nrow_11_3_2, r3=nrow_11_3_3, bv=bv, x=xa) ~> pred_12_0
vec_sub(a=pred_12_0, b=ta) ~> grad_12_0
get(arr=grad_12_0, idx=0) ~> gs_12_0_0
vec_scale(a=xa, s=gs_12_0_0) ~> rg_12_0_0
sgd_update(weights=nrow_11_3_0, grad=rg_12_0_0, lr=lr) ~> nrow_12_0_0
get(arr=grad_12_0, idx=1) ~> gs_12_0_1
vec_scale(a=xa, s=gs_12_0_1) ~> rg_12_0_1
sgd_update(weights=nrow_11_3_1, grad=rg_12_0_1, lr=lr) ~> nrow_12_0_1
get(arr=grad_12_0, idx=2) ~> gs_12_0_2
vec_scale(a=xa, s=gs_12_0_2) ~> rg_12_0_2
sgd_update(weights=nrow_11_3_2, grad=rg_12_0_2, lr=lr) ~> nrow_12_0_2
get(arr=grad_12_0, idx=3) ~> gs_12_0_3
vec_scale(a=xa, s=gs_12_0_3) ~> rg_12_0_3
sgd_update(weights=nrow_11_3_3, grad=rg_12_0_3, lr=lr) ~> nrow_12_0_3
linear_rows(r0=nrow_12_0_0, r1=nrow_12_0_1, r2=nrow_12_0_2, r3=nrow_12_0_3, bv=bv, x=xb) ~> pred_12_1
vec_sub(a=pred_12_1, b=tb) ~> grad_12_1
get(arr=grad_12_1, idx=0) ~> gs_12_1_0
vec_scale(a=xb, s=gs_12_1_0) ~> rg_12_1_0
sgd_update(weights=nrow_12_0_0, grad=rg_12_1_0, lr=lr) ~> nrow_12_1_0
get(arr=grad_12_1, idx=1) ~> gs_12_1_1
vec_scale(a=xb, s=gs_12_1_1) ~> rg_12_1_1
sgd_update(weights=nrow_12_0_1, grad=rg_12_1_1, lr=lr) ~> nrow_12_1_1
get(arr=grad_12_1, idx=2) ~> gs_12_1_2
vec_scale(a=xb, s=gs_12_1_2) ~> rg_12_1_2
sgd_update(weights=nrow_12_0_2, grad=rg_12_1_2, lr=lr) ~> nrow_12_1_2
get(arr=grad_12_1, idx=3) ~> gs_12_1_3
vec_scale(a=xb, s=gs_12_1_3) ~> rg_12_1_3
sgd_update(weights=nrow_12_0_3, grad=rg_12_1_3, lr=lr) ~> nrow_12_1_3
linear_rows(r0=nrow_12_1_0, r1=nrow_12_1_1, r2=nrow_12_1_2, r3=nrow_12_1_3, bv=bv, x=xc) ~> pred_12_2
vec_sub(a=pred_12_2, b=tc) ~> grad_12_2
get(arr=grad_12_2, idx=0) ~> gs_12_2_0
vec_scale(a=xc, s=gs_12_2_0) ~> rg_12_2_0
sgd_update(weights=nrow_12_1_0, grad=rg_12_2_0, lr=lr) ~> nrow_12_2_0
get(arr=grad_12_2, idx=1) ~> gs_12_2_1
vec_scale(a=xc, s=gs_12_2_1) ~> rg_12_2_1
sgd_update(weights=nrow_12_1_1, grad=rg_12_2_1, lr=lr) ~> nrow_12_2_1
get(arr=grad_12_2, idx=2) ~> gs_12_2_2
vec_scale(a=xc, s=gs_12_2_2) ~> rg_12_2_2
sgd_update(weights=nrow_12_1_2, grad=rg_12_2_2, lr=lr) ~> nrow_12_2_2
get(arr=grad_12_2, idx=3) ~> gs_12_2_3
vec_scale(a=xc, s=gs_12_2_3) ~> rg_12_2_3
sgd_update(weights=nrow_12_1_3, grad=rg_12_2_3, lr=lr) ~> nrow_12_2_3
linear_rows(r0=nrow_12_2_0, r1=nrow_12_2_1, r2=nrow_12_2_2, r3=nrow_12_2_3, bv=bv, x=xd) ~> pred_12_3
vec_sub(a=pred_12_3, b=td) ~> grad_12_3
get(arr=grad_12_3, idx=0) ~> gs_12_3_0
vec_scale(a=xd, s=gs_12_3_0) ~> rg_12_3_0
sgd_update(weights=nrow_12_2_0, grad=rg_12_3_0, lr=lr) ~> nrow_12_3_0
get(arr=grad_12_3, idx=1) ~> gs_12_3_1
vec_scale(a=xd, s=gs_12_3_1) ~> rg_12_3_1
sgd_update(weights=nrow_12_2_1, grad=rg_12_3_1, lr=lr) ~> nrow_12_3_1
get(arr=grad_12_3, idx=2) ~> gs_12_3_2
vec_scale(a=xd, s=gs_12_3_2) ~> rg_12_3_2
sgd_update(weights=nrow_12_2_2, grad=rg_12_3_2, lr=lr) ~> nrow_12_3_2
get(arr=grad_12_3, idx=3) ~> gs_12_3_3
vec_scale(a=xd, s=gs_12_3_3) ~> rg_12_3_3
sgd_update(weights=nrow_12_2_3, grad=rg_12_3_3, lr=lr) ~> nrow_12_3_3
linear_rows(r0=nrow_12_3_0, r1=nrow_12_3_1, r2=nrow_12_3_2, r3=nrow_12_3_3, bv=bv, x=xa) ~> pred_13_0
vec_sub(a=pred_13_0, b=ta) ~> grad_13_0
get(arr=grad_13_0, idx=0) ~> gs_13_0_0
vec_scale(a=xa, s=gs_13_0_0) ~> rg_13_0_0
sgd_update(weights=nrow_12_3_0, grad=rg_13_0_0, lr=lr) ~> nrow_13_0_0
get(arr=grad_13_0, idx=1) ~> gs_13_0_1
vec_scale(a=xa, s=gs_13_0_1) ~> rg_13_0_1
sgd_update(weights=nrow_12_3_1, grad=rg_13_0_1, lr=lr) ~> nrow_13_0_1
get(arr=grad_13_0, idx=2) ~> gs_13_0_2
vec_scale(a=xa, s=gs_13_0_2) ~> rg_13_0_2
sgd_update(weights=nrow_12_3_2, grad=rg_13_0_2, lr=lr) ~> nrow_13_0_2
get(arr=grad_13_0, idx=3) ~> gs_13_0_3
vec_scale(a=xa, s=gs_13_0_3) ~> rg_13_0_3
sgd_update(weights=nrow_12_3_3, grad=rg_13_0_3, lr=lr) ~> nrow_13_0_3
linear_rows(r0=nrow_13_0_0, r1=nrow_13_0_1, r2=nrow_13_0_2, r3=nrow_13_0_3, bv=bv, x=xb) ~> pred_13_1
vec_sub(a=pred_13_1, b=tb) ~> grad_13_1
get(arr=grad_13_1, idx=0) ~> gs_13_1_0
vec_scale(a=xb, s=gs_13_1_0) ~> rg_13_1_0
sgd_update(weights=nrow_13_0_0, grad=rg_13_1_0, lr=lr) ~> nrow_13_1_0
get(arr=grad_13_1, idx=1) ~> gs_13_1_1
vec_scale(a=xb, s=gs_13_1_1) ~> rg_13_1_1
sgd_update(weights=nrow_13_0_1, grad=rg_13_1_1, lr=lr) ~> nrow_13_1_1
get(arr=grad_13_1, idx=2) ~> gs_13_1_2
vec_scale(a=xb, s=gs_13_1_2) ~> rg_13_1_2
sgd_update(weights=nrow_13_0_2, grad=rg_13_1_2, lr=lr) ~> nrow_13_1_2
get(arr=grad_13_1, idx=3) ~> gs_13_1_3
vec_scale(a=xb, s=gs_13_1_3) ~> rg_13_1_3
sgd_update(weights=nrow_13_0_3, grad=rg_13_1_3, lr=lr) ~> nrow_13_1_3
linear_rows(r0=nrow_13_1_0, r1=nrow_13_1_1, r2=nrow_13_1_2, r3=nrow_13_1_3, bv=bv, x=xc) ~> pred_13_2
vec_sub(a=pred_13_2, b=tc) ~> grad_13_2
get(arr=grad_13_2, idx=0) ~> gs_13_2_0
vec_scale(a=xc, s=gs_13_2_0) ~> rg_13_2_0
sgd_update(weights=nrow_13_1_0, grad=rg_13_2_0, lr=lr) ~> nrow_13_2_0
get(arr=grad_13_2, idx=1) ~> gs_13_2_1
vec_scale(a=xc, s=gs_13_2_1) ~> rg_13_2_1
sgd_update(weights=nrow_13_1_1, grad=rg_13_2_1, lr=lr) ~> nrow_13_2_1
get(arr=grad_13_2, idx=2) ~> gs_13_2_2
vec_scale(a=xc, s=gs_13_2_2) ~> rg_13_2_2
sgd_update(weights=nrow_13_1_2, grad=rg_13_2_2, lr=lr) ~> nrow_13_2_2
get(arr=grad_13_2, idx=3) ~> gs_13_2_3
vec_scale(a=xc, s=gs_13_2_3) ~> rg_13_2_3
sgd_update(weights=nrow_13_1_3, grad=rg_13_2_3, lr=lr) ~> nrow_13_2_3
linear_rows(r0=nrow_13_2_0, r1=nrow_13_2_1, r2=nrow_13_2_2, r3=nrow_13_2_3, bv=bv, x=xd) ~> pred_13_3
vec_sub(a=pred_13_3, b=td) ~> grad_13_3
get(arr=grad_13_3, idx=0) ~> gs_13_3_0
vec_scale(a=xd, s=gs_13_3_0) ~> rg_13_3_0
sgd_update(weights=nrow_13_2_0, grad=rg_13_3_0, lr=lr) ~> nrow_13_3_0
get(arr=grad_13_3, idx=1) ~> gs_13_3_1
vec_scale(a=xd, s=gs_13_3_1) ~> rg_13_3_1
sgd_update(weights=nrow_13_2_1, grad=rg_13_3_1, lr=lr) ~> nrow_13_3_1
get(arr=grad_13_3, idx=2) ~> gs_13_3_2
vec_scale(a=xd, s=gs_13_3_2) ~> rg_13_3_2
sgd_update(weights=nrow_13_2_2, grad=rg_13_3_2, lr=lr) ~> nrow_13_3_2
get(arr=grad_13_3, idx=3) ~> gs_13_3_3
vec_scale(a=xd, s=gs_13_3_3) ~> rg_13_3_3
sgd_update(weights=nrow_13_2_3, grad=rg_13_3_3, lr=lr) ~> nrow_13_3_3
linear_rows(r0=nrow_13_3_0, r1=nrow_13_3_1, r2=nrow_13_3_2, r3=nrow_13_3_3, bv=bv, x=xa) ~> pred_14_0
vec_sub(a=pred_14_0, b=ta) ~> grad_14_0
get(arr=grad_14_0, idx=0) ~> gs_14_0_0
vec_scale(a=xa, s=gs_14_0_0) ~> rg_14_0_0
sgd_update(weights=nrow_13_3_0, grad=rg_14_0_0, lr=lr) ~> nrow_14_0_0
get(arr=grad_14_0, idx=1) ~> gs_14_0_1
vec_scale(a=xa, s=gs_14_0_1) ~> rg_14_0_1
sgd_update(weights=nrow_13_3_1, grad=rg_14_0_1, lr=lr) ~> nrow_14_0_1
get(arr=grad_14_0, idx=2) ~> gs_14_0_2
vec_scale(a=xa, s=gs_14_0_2) ~> rg_14_0_2
sgd_update(weights=nrow_13_3_2, grad=rg_14_0_2, lr=lr) ~> nrow_14_0_2
get(arr=grad_14_0, idx=3) ~> gs_14_0_3
vec_scale(a=xa, s=gs_14_0_3) ~> rg_14_0_3
sgd_update(weights=nrow_13_3_3, grad=rg_14_0_3, lr=lr) ~> nrow_14_0_3
linear_rows(r0=nrow_14_0_0, r1=nrow_14_0_1, r2=nrow_14_0_2, r3=nrow_14_0_3, bv=bv, x=xb) ~> pred_14_1
vec_sub(a=pred_14_1, b=tb) ~> grad_14_1
get(arr=grad_14_1, idx=0) ~> gs_14_1_0
vec_scale(a=xb, s=gs_14_1_0) ~> rg_14_1_0
sgd_update(weights=nrow_14_0_0, grad=rg_14_1_0, lr=lr) ~> nrow_14_1_0
get(arr=grad_14_1, idx=1) ~> gs_14_1_1
vec_scale(a=xb, s=gs_14_1_1) ~> rg_14_1_1
sgd_update(weights=nrow_14_0_1, grad=rg_14_1_1, lr=lr) ~> nrow_14_1_1
get(arr=grad_14_1, idx=2) ~> gs_14_1_2
vec_scale(a=xb, s=gs_14_1_2) ~> rg_14_1_2
sgd_update(weights=nrow_14_0_2, grad=rg_14_1_2, lr=lr) ~> nrow_14_1_2
get(arr=grad_14_1, idx=3) ~> gs_14_1_3
vec_scale(a=xb, s=gs_14_1_3) ~> rg_14_1_3
sgd_update(weights=nrow_14_0_3, grad=rg_14_1_3, lr=lr) ~> nrow_14_1_3
linear_rows(r0=nrow_14_1_0, r1=nrow_14_1_1, r2=nrow_14_1_2, r3=nrow_14_1_3, bv=bv, x=xc) ~> pred_14_2
vec_sub(a=pred_14_2, b=tc) ~> grad_14_2
get(arr=grad_14_2, idx=0) ~> gs_14_2_0
vec_scale(a=xc, s=gs_14_2_0) ~> rg_14_2_0
sgd_update(weights=nrow_14_1_0, grad=rg_14_2_0, lr=lr) ~> nrow_14_2_0
get(arr=grad_14_2, idx=1) ~> gs_14_2_1
vec_scale(a=xc, s=gs_14_2_1) ~> rg_14_2_1
sgd_update(weights=nrow_14_1_1, grad=rg_14_2_1, lr=lr) ~> nrow_14_2_1
get(arr=grad_14_2, idx=2) ~> gs_14_2_2
vec_scale(a=xc, s=gs_14_2_2) ~> rg_14_2_2
sgd_update(weights=nrow_14_1_2, grad=rg_14_2_2, lr=lr) ~> nrow_14_2_2
get(arr=grad_14_2, idx=3) ~> gs_14_2_3
vec_scale(a=xc, s=gs_14_2_3) ~> rg_14_2_3
sgd_update(weights=nrow_14_1_3, grad=rg_14_2_3, lr=lr) ~> nrow_14_2_3
linear_rows(r0=nrow_14_2_0, r1=nrow_14_2_1, r2=nrow_14_2_2, r3=nrow_14_2_3, bv=bv, x=xd) ~> pred_14_3
vec_sub(a=pred_14_3, b=td) ~> grad_14_3
get(arr=grad_14_3, idx=0) ~> gs_14_3_0
vec_scale(a=xd, s=gs_14_3_0) ~> rg_14_3_0
sgd_update(weights=nrow_14_2_0, grad=rg_14_3_0, lr=lr) ~> nrow_14_3_0
get(arr=grad_14_3, idx=1) ~> gs_14_3_1
vec_scale(a=xd, s=gs_14_3_1) ~> rg_14_3_1
sgd_update(weights=nrow_14_2_1, grad=rg_14_3_1, lr=lr) ~> nrow_14_3_1
get(arr=grad_14_3, idx=2) ~> gs_14_3_2
vec_scale(a=xd, s=gs_14_3_2) ~> rg_14_3_2
sgd_update(weights=nrow_14_2_2, grad=rg_14_3_2, lr=lr) ~> nrow_14_3_2
get(arr=grad_14_3, idx=3) ~> gs_14_3_3
vec_scale(a=xd, s=gs_14_3_3) ~> rg_14_3_3
sgd_update(weights=nrow_14_2_3, grad=rg_14_3_3, lr=lr) ~> nrow_14_3_3
linear_rows(r0=nrow_14_3_0, r1=nrow_14_3_1, r2=nrow_14_3_2, r3=nrow_14_3_3, bv=bv, x=xa) ~> pred_15_0
vec_sub(a=pred_15_0, b=ta) ~> grad_15_0
get(arr=grad_15_0, idx=0) ~> gs_15_0_0
vec_scale(a=xa, s=gs_15_0_0) ~> rg_15_0_0
sgd_update(weights=nrow_14_3_0, grad=rg_15_0_0, lr=lr) ~> nrow_15_0_0
get(arr=grad_15_0, idx=1) ~> gs_15_0_1
vec_scale(a=xa, s=gs_15_0_1) ~> rg_15_0_1
sgd_update(weights=nrow_14_3_1, grad=rg_15_0_1, lr=lr) ~> nrow_15_0_1
get(arr=grad_15_0, idx=2) ~> gs_15_0_2
vec_scale(a=xa, s=gs_15_0_2) ~> rg_15_0_2
sgd_update(weights=nrow_14_3_2, grad=rg_15_0_2, lr=lr) ~> nrow_15_0_2
get(arr=grad_15_0, idx=3) ~> gs_15_0_3
vec_scale(a=xa, s=gs_15_0_3) ~> rg_15_0_3
sgd_update(weights=nrow_14_3_3, grad=rg_15_0_3, lr=lr) ~> nrow_15_0_3
linear_rows(r0=nrow_15_0_0, r1=nrow_15_0_1, r2=nrow_15_0_2, r3=nrow_15_0_3, bv=bv, x=xb) ~> pred_15_1
vec_sub(a=pred_15_1, b=tb) ~> grad_15_1
get(arr=grad_15_1, idx=0) ~> gs_15_1_0
vec_scale(a=xb, s=gs_15_1_0) ~> rg_15_1_0
sgd_update(weights=nrow_15_0_0, grad=rg_15_1_0, lr=lr) ~> nrow_15_1_0
get(arr=grad_15_1, idx=1) ~> gs_15_1_1
vec_scale(a=xb, s=gs_15_1_1) ~> rg_15_1_1
sgd_update(weights=nrow_15_0_1, grad=rg_15_1_1, lr=lr) ~> nrow_15_1_1
get(arr=grad_15_1, idx=2) ~> gs_15_1_2
vec_scale(a=xb, s=gs_15_1_2) ~> rg_15_1_2
sgd_update(weights=nrow_15_0_2, grad=rg_15_1_2, lr=lr) ~> nrow_15_1_2
get(arr=grad_15_1, idx=3) ~> gs_15_1_3
vec_scale(a=xb, s=gs_15_1_3) ~> rg_15_1_3
sgd_update(weights=nrow_15_0_3, grad=rg_15_1_3, lr=lr) ~> nrow_15_1_3
linear_rows(r0=nrow_15_1_0, r1=nrow_15_1_1, r2=nrow_15_1_2, r3=nrow_15_1_3, bv=bv, x=xc) ~> pred_15_2
vec_sub(a=pred_15_2, b=tc) ~> grad_15_2
get(arr=grad_15_2, idx=0) ~> gs_15_2_0
vec_scale(a=xc, s=gs_15_2_0) ~> rg_15_2_0
sgd_update(weights=nrow_15_1_0, grad=rg_15_2_0, lr=lr) ~> nrow_15_2_0
get(arr=grad_15_2, idx=1) ~> gs_15_2_1
vec_scale(a=xc, s=gs_15_2_1) ~> rg_15_2_1
sgd_update(weights=nrow_15_1_1, grad=rg_15_2_1, lr=lr) ~> nrow_15_2_1
get(arr=grad_15_2, idx=2) ~> gs_15_2_2
vec_scale(a=xc, s=gs_15_2_2) ~> rg_15_2_2
sgd_update(weights=nrow_15_1_2, grad=rg_15_2_2, lr=lr) ~> nrow_15_2_2
get(arr=grad_15_2, idx=3) ~> gs_15_2_3
vec_scale(a=xc, s=gs_15_2_3) ~> rg_15_2_3
sgd_update(weights=nrow_15_1_3, grad=rg_15_2_3, lr=lr) ~> nrow_15_2_3
linear_rows(r0=nrow_15_2_0, r1=nrow_15_2_1, r2=nrow_15_2_2, r3=nrow_15_2_3, bv=bv, x=xd) ~> pred_15_3
vec_sub(a=pred_15_3, b=td) ~> grad_15_3
get(arr=grad_15_3, idx=0) ~> gs_15_3_0
vec_scale(a=xd, s=gs_15_3_0) ~> rg_15_3_0
sgd_update(weights=nrow_15_2_0, grad=rg_15_3_0, lr=lr) ~> nrow_15_3_0
get(arr=grad_15_3, idx=1) ~> gs_15_3_1
vec_scale(a=xd, s=gs_15_3_1) ~> rg_15_3_1
sgd_update(weights=nrow_15_2_1, grad=rg_15_3_1, lr=lr) ~> nrow_15_3_1
get(arr=grad_15_3, idx=2) ~> gs_15_3_2
vec_scale(a=xd, s=gs_15_3_2) ~> rg_15_3_2
sgd_update(weights=nrow_15_2_2, grad=rg_15_3_2, lr=lr) ~> nrow_15_3_2
get(arr=grad_15_3, idx=3) ~> gs_15_3_3
vec_scale(a=xd, s=gs_15_3_3) ~> rg_15_3_3
sgd_update(weights=nrow_15_2_3, grad=rg_15_3_3, lr=lr) ~> nrow_15_3_3
linear_rows(r0=nrow_15_3_0, r1=nrow_15_3_1, r2=nrow_15_3_2, r3=nrow_15_3_3, bv=bv, x=xa) ~> pred_16_0
vec_sub(a=pred_16_0, b=ta) ~> grad_16_0
get(arr=grad_16_0, idx=0) ~> gs_16_0_0
vec_scale(a=xa, s=gs_16_0_0) ~> rg_16_0_0
sgd_update(weights=nrow_15_3_0, grad=rg_16_0_0, lr=lr) ~> nrow_16_0_0
get(arr=grad_16_0, idx=1) ~> gs_16_0_1
vec_scale(a=xa, s=gs_16_0_1) ~> rg_16_0_1
sgd_update(weights=nrow_15_3_1, grad=rg_16_0_1, lr=lr) ~> nrow_16_0_1
get(arr=grad_16_0, idx=2) ~> gs_16_0_2
vec_scale(a=xa, s=gs_16_0_2) ~> rg_16_0_2
sgd_update(weights=nrow_15_3_2, grad=rg_16_0_2, lr=lr) ~> nrow_16_0_2
get(arr=grad_16_0, idx=3) ~> gs_16_0_3
vec_scale(a=xa, s=gs_16_0_3) ~> rg_16_0_3
sgd_update(weights=nrow_15_3_3, grad=rg_16_0_3, lr=lr) ~> nrow_16_0_3
linear_rows(r0=nrow_16_0_0, r1=nrow_16_0_1, r2=nrow_16_0_2, r3=nrow_16_0_3, bv=bv, x=xb) ~> pred_16_1
vec_sub(a=pred_16_1, b=tb) ~> grad_16_1
get(arr=grad_16_1, idx=0) ~> gs_16_1_0
vec_scale(a=xb, s=gs_16_1_0) ~> rg_16_1_0
sgd_update(weights=nrow_16_0_0, grad=rg_16_1_0, lr=lr) ~> nrow_16_1_0
get(arr=grad_16_1, idx=1) ~> gs_16_1_1
vec_scale(a=xb, s=gs_16_1_1) ~> rg_16_1_1
sgd_update(weights=nrow_16_0_1, grad=rg_16_1_1, lr=lr) ~> nrow_16_1_1
get(arr=grad_16_1, idx=2) ~> gs_16_1_2
vec_scale(a=xb, s=gs_16_1_2) ~> rg_16_1_2
sgd_update(weights=nrow_16_0_2, grad=rg_16_1_2, lr=lr) ~> nrow_16_1_2
get(arr=grad_16_1, idx=3) ~> gs_16_1_3
vec_scale(a=xb, s=gs_16_1_3) ~> rg_16_1_3
sgd_update(weights=nrow_16_0_3, grad=rg_16_1_3, lr=lr) ~> nrow_16_1_3
linear_rows(r0=nrow_16_1_0, r1=nrow_16_1_1, r2=nrow_16_1_2, r3=nrow_16_1_3, bv=bv, x=xc) ~> pred_16_2
vec_sub(a=pred_16_2, b=tc) ~> grad_16_2
get(arr=grad_16_2, idx=0) ~> gs_16_2_0
vec_scale(a=xc, s=gs_16_2_0) ~> rg_16_2_0
sgd_update(weights=nrow_16_1_0, grad=rg_16_2_0, lr=lr) ~> nrow_16_2_0
get(arr=grad_16_2, idx=1) ~> gs_16_2_1
vec_scale(a=xc, s=gs_16_2_1) ~> rg_16_2_1
sgd_update(weights=nrow_16_1_1, grad=rg_16_2_1, lr=lr) ~> nrow_16_2_1
get(arr=grad_16_2, idx=2) ~> gs_16_2_2
vec_scale(a=xc, s=gs_16_2_2) ~> rg_16_2_2
sgd_update(weights=nrow_16_1_2, grad=rg_16_2_2, lr=lr) ~> nrow_16_2_2
get(arr=grad_16_2, idx=3) ~> gs_16_2_3
vec_scale(a=xc, s=gs_16_2_3) ~> rg_16_2_3
sgd_update(weights=nrow_16_1_3, grad=rg_16_2_3, lr=lr) ~> nrow_16_2_3
linear_rows(r0=nrow_16_2_0, r1=nrow_16_2_1, r2=nrow_16_2_2, r3=nrow_16_2_3, bv=bv, x=xd) ~> pred_16_3
vec_sub(a=pred_16_3, b=td) ~> grad_16_3
get(arr=grad_16_3, idx=0) ~> gs_16_3_0
vec_scale(a=xd, s=gs_16_3_0) ~> rg_16_3_0
sgd_update(weights=nrow_16_2_0, grad=rg_16_3_0, lr=lr) ~> nrow_16_3_0
get(arr=grad_16_3, idx=1) ~> gs_16_3_1
vec_scale(a=xd, s=gs_16_3_1) ~> rg_16_3_1
sgd_update(weights=nrow_16_2_1, grad=rg_16_3_1, lr=lr) ~> nrow_16_3_1
get(arr=grad_16_3, idx=2) ~> gs_16_3_2
vec_scale(a=xd, s=gs_16_3_2) ~> rg_16_3_2
sgd_update(weights=nrow_16_2_2, grad=rg_16_3_2, lr=lr) ~> nrow_16_3_2
get(arr=grad_16_3, idx=3) ~> gs_16_3_3
vec_scale(a=xd, s=gs_16_3_3) ~> rg_16_3_3
sgd_update(weights=nrow_16_2_3, grad=rg_16_3_3, lr=lr) ~> nrow_16_3_3
linear_rows(r0=nrow_16_3_0, r1=nrow_16_3_1, r2=nrow_16_3_2, r3=nrow_16_3_3, bv=bv, x=xa) ~> pred_17_0
vec_sub(a=pred_17_0, b=ta) ~> grad_17_0
get(arr=grad_17_0, idx=0) ~> gs_17_0_0
vec_scale(a=xa, s=gs_17_0_0) ~> rg_17_0_0
sgd_update(weights=nrow_16_3_0, grad=rg_17_0_0, lr=lr) ~> nrow_17_0_0
get(arr=grad_17_0, idx=1) ~> gs_17_0_1
vec_scale(a=xa, s=gs_17_0_1) ~> rg_17_0_1
sgd_update(weights=nrow_16_3_1, grad=rg_17_0_1, lr=lr) ~> nrow_17_0_1
get(arr=grad_17_0, idx=2) ~> gs_17_0_2
vec_scale(a=xa, s=gs_17_0_2) ~> rg_17_0_2
sgd_update(weights=nrow_16_3_2, grad=rg_17_0_2, lr=lr) ~> nrow_17_0_2
get(arr=grad_17_0, idx=3) ~> gs_17_0_3
vec_scale(a=xa, s=gs_17_0_3) ~> rg_17_0_3
sgd_update(weights=nrow_16_3_3, grad=rg_17_0_3, lr=lr) ~> nrow_17_0_3
linear_rows(r0=nrow_17_0_0, r1=nrow_17_0_1, r2=nrow_17_0_2, r3=nrow_17_0_3, bv=bv, x=xb) ~> pred_17_1
vec_sub(a=pred_17_1, b=tb) ~> grad_17_1
get(arr=grad_17_1, idx=0) ~> gs_17_1_0
vec_scale(a=xb, s=gs_17_1_0) ~> rg_17_1_0
sgd_update(weights=nrow_17_0_0, grad=rg_17_1_0, lr=lr) ~> nrow_17_1_0
get(arr=grad_17_1, idx=1) ~> gs_17_1_1
vec_scale(a=xb, s=gs_17_1_1) ~> rg_17_1_1
sgd_update(weights=nrow_17_0_1, grad=rg_17_1_1, lr=lr) ~> nrow_17_1_1
get(arr=grad_17_1, idx=2) ~> gs_17_1_2
vec_scale(a=xb, s=gs_17_1_2) ~> rg_17_1_2
sgd_update(weights=nrow_17_0_2, grad=rg_17_1_2, lr=lr) ~> nrow_17_1_2
get(arr=grad_17_1, idx=3) ~> gs_17_1_3
vec_scale(a=xb, s=gs_17_1_3) ~> rg_17_1_3
sgd_update(weights=nrow_17_0_3, grad=rg_17_1_3, lr=lr) ~> nrow_17_1_3
linear_rows(r0=nrow_17_1_0, r1=nrow_17_1_1, r2=nrow_17_1_2, r3=nrow_17_1_3, bv=bv, x=xc) ~> pred_17_2
vec_sub(a=pred_17_2, b=tc) ~> grad_17_2
get(arr=grad_17_2, idx=0) ~> gs_17_2_0
vec_scale(a=xc, s=gs_17_2_0) ~> rg_17_2_0
sgd_update(weights=nrow_17_1_0, grad=rg_17_2_0, lr=lr) ~> nrow_17_2_0
get(arr=grad_17_2, idx=1) ~> gs_17_2_1
vec_scale(a=xc, s=gs_17_2_1) ~> rg_17_2_1
sgd_update(weights=nrow_17_1_1, grad=rg_17_2_1, lr=lr) ~> nrow_17_2_1
get(arr=grad_17_2, idx=2) ~> gs_17_2_2
vec_scale(a=xc, s=gs_17_2_2) ~> rg_17_2_2
sgd_update(weights=nrow_17_1_2, grad=rg_17_2_2, lr=lr) ~> nrow_17_2_2
get(arr=grad_17_2, idx=3) ~> gs_17_2_3
vec_scale(a=xc, s=gs_17_2_3) ~> rg_17_2_3
sgd_update(weights=nrow_17_1_3, grad=rg_17_2_3, lr=lr) ~> nrow_17_2_3
linear_rows(r0=nrow_17_2_0, r1=nrow_17_2_1, r2=nrow_17_2_2, r3=nrow_17_2_3, bv=bv, x=xd) ~> pred_17_3
vec_sub(a=pred_17_3, b=td) ~> grad_17_3
get(arr=grad_17_3, idx=0) ~> gs_17_3_0
vec_scale(a=xd, s=gs_17_3_0) ~> rg_17_3_0
sgd_update(weights=nrow_17_2_0, grad=rg_17_3_0, lr=lr) ~> nrow_17_3_0
get(arr=grad_17_3, idx=1) ~> gs_17_3_1
vec_scale(a=xd, s=gs_17_3_1) ~> rg_17_3_1
sgd_update(weights=nrow_17_2_1, grad=rg_17_3_1, lr=lr) ~> nrow_17_3_1
get(arr=grad_17_3, idx=2) ~> gs_17_3_2
vec_scale(a=xd, s=gs_17_3_2) ~> rg_17_3_2
sgd_update(weights=nrow_17_2_2, grad=rg_17_3_2, lr=lr) ~> nrow_17_3_2
get(arr=grad_17_3, idx=3) ~> gs_17_3_3
vec_scale(a=xd, s=gs_17_3_3) ~> rg_17_3_3
sgd_update(weights=nrow_17_2_3, grad=rg_17_3_3, lr=lr) ~> nrow_17_3_3
linear_rows(r0=nrow_17_3_0, r1=nrow_17_3_1, r2=nrow_17_3_2, r3=nrow_17_3_3, bv=bv, x=xa) ~> pred_18_0
vec_sub(a=pred_18_0, b=ta) ~> grad_18_0
get(arr=grad_18_0, idx=0) ~> gs_18_0_0
vec_scale(a=xa, s=gs_18_0_0) ~> rg_18_0_0
sgd_update(weights=nrow_17_3_0, grad=rg_18_0_0, lr=lr) ~> nrow_18_0_0
get(arr=grad_18_0, idx=1) ~> gs_18_0_1
vec_scale(a=xa, s=gs_18_0_1) ~> rg_18_0_1
sgd_update(weights=nrow_17_3_1, grad=rg_18_0_1, lr=lr) ~> nrow_18_0_1
get(arr=grad_18_0, idx=2) ~> gs_18_0_2
vec_scale(a=xa, s=gs_18_0_2) ~> rg_18_0_2
sgd_update(weights=nrow_17_3_2, grad=rg_18_0_2, lr=lr) ~> nrow_18_0_2
get(arr=grad_18_0, idx=3) ~> gs_18_0_3
vec_scale(a=xa, s=gs_18_0_3) ~> rg_18_0_3
sgd_update(weights=nrow_17_3_3, grad=rg_18_0_3, lr=lr) ~> nrow_18_0_3
linear_rows(r0=nrow_18_0_0, r1=nrow_18_0_1, r2=nrow_18_0_2, r3=nrow_18_0_3, bv=bv, x=xb) ~> pred_18_1
vec_sub(a=pred_18_1, b=tb) ~> grad_18_1
get(arr=grad_18_1, idx=0) ~> gs_18_1_0
vec_scale(a=xb, s=gs_18_1_0) ~> rg_18_1_0
sgd_update(weights=nrow_18_0_0, grad=rg_18_1_0, lr=lr) ~> nrow_18_1_0
get(arr=grad_18_1, idx=1) ~> gs_18_1_1
vec_scale(a=xb, s=gs_18_1_1) ~> rg_18_1_1
sgd_update(weights=nrow_18_0_1, grad=rg_18_1_1, lr=lr) ~> nrow_18_1_1
get(arr=grad_18_1, idx=2) ~> gs_18_1_2
vec_scale(a=xb, s=gs_18_1_2) ~> rg_18_1_2
sgd_update(weights=nrow_18_0_2, grad=rg_18_1_2, lr=lr) ~> nrow_18_1_2
get(arr=grad_18_1, idx=3) ~> gs_18_1_3
vec_scale(a=xb, s=gs_18_1_3) ~> rg_18_1_3
sgd_update(weights=nrow_18_0_3, grad=rg_18_1_3, lr=lr) ~> nrow_18_1_3
linear_rows(r0=nrow_18_1_0, r1=nrow_18_1_1, r2=nrow_18_1_2, r3=nrow_18_1_3, bv=bv, x=xc) ~> pred_18_2
vec_sub(a=pred_18_2, b=tc) ~> grad_18_2
get(arr=grad_18_2, idx=0) ~> gs_18_2_0
vec_scale(a=xc, s=gs_18_2_0) ~> rg_18_2_0
sgd_update(weights=nrow_18_1_0, grad=rg_18_2_0, lr=lr) ~> nrow_18_2_0
get(arr=grad_18_2, idx=1) ~> gs_18_2_1
vec_scale(a=xc, s=gs_18_2_1) ~> rg_18_2_1
sgd_update(weights=nrow_18_1_1, grad=rg_18_2_1, lr=lr) ~> nrow_18_2_1
get(arr=grad_18_2, idx=2) ~> gs_18_2_2
vec_scale(a=xc, s=gs_18_2_2) ~> rg_18_2_2
sgd_update(weights=nrow_18_1_2, grad=rg_18_2_2, lr=lr) ~> nrow_18_2_2
get(arr=grad_18_2, idx=3) ~> gs_18_2_3
vec_scale(a=xc, s=gs_18_2_3) ~> rg_18_2_3
sgd_update(weights=nrow_18_1_3, grad=rg_18_2_3, lr=lr) ~> nrow_18_2_3
linear_rows(r0=nrow_18_2_0, r1=nrow_18_2_1, r2=nrow_18_2_2, r3=nrow_18_2_3, bv=bv, x=xd) ~> pred_18_3
vec_sub(a=pred_18_3, b=td) ~> grad_18_3
get(arr=grad_18_3, idx=0) ~> gs_18_3_0
vec_scale(a=xd, s=gs_18_3_0) ~> rg_18_3_0
sgd_update(weights=nrow_18_2_0, grad=rg_18_3_0, lr=lr) ~> nrow_18_3_0
get(arr=grad_18_3, idx=1) ~> gs_18_3_1
vec_scale(a=xd, s=gs_18_3_1) ~> rg_18_3_1
sgd_update(weights=nrow_18_2_1, grad=rg_18_3_1, lr=lr) ~> nrow_18_3_1
get(arr=grad_18_3, idx=2) ~> gs_18_3_2
vec_scale(a=xd, s=gs_18_3_2) ~> rg_18_3_2
sgd_update(weights=nrow_18_2_2, grad=rg_18_3_2, lr=lr) ~> nrow_18_3_2
get(arr=grad_18_3, idx=3) ~> gs_18_3_3
vec_scale(a=xd, s=gs_18_3_3) ~> rg_18_3_3
sgd_update(weights=nrow_18_2_3, grad=rg_18_3_3, lr=lr) ~> nrow_18_3_3
linear_rows(r0=nrow_18_3_0, r1=nrow_18_3_1, r2=nrow_18_3_2, r3=nrow_18_3_3, bv=bv, x=xa) ~> pred_19_0
vec_sub(a=pred_19_0, b=ta) ~> grad_19_0
get(arr=grad_19_0, idx=0) ~> gs_19_0_0
vec_scale(a=xa, s=gs_19_0_0) ~> rg_19_0_0
sgd_update(weights=nrow_18_3_0, grad=rg_19_0_0, lr=lr) ~> nrow_19_0_0
get(arr=grad_19_0, idx=1) ~> gs_19_0_1
vec_scale(a=xa, s=gs_19_0_1) ~> rg_19_0_1
sgd_update(weights=nrow_18_3_1, grad=rg_19_0_1, lr=lr) ~> nrow_19_0_1
get(arr=grad_19_0, idx=2) ~> gs_19_0_2
vec_scale(a=xa, s=gs_19_0_2) ~> rg_19_0_2
sgd_update(weights=nrow_18_3_2, grad=rg_19_0_2, lr=lr) ~> nrow_19_0_2
get(arr=grad_19_0, idx=3) ~> gs_19_0_3
vec_scale(a=xa, s=gs_19_0_3) ~> rg_19_0_3
sgd_update(weights=nrow_18_3_3, grad=rg_19_0_3, lr=lr) ~> nrow_19_0_3
linear_rows(r0=nrow_19_0_0, r1=nrow_19_0_1, r2=nrow_19_0_2, r3=nrow_19_0_3, bv=bv, x=xb) ~> pred_19_1
vec_sub(a=pred_19_1, b=tb) ~> grad_19_1
get(arr=grad_19_1, idx=0) ~> gs_19_1_0
vec_scale(a=xb, s=gs_19_1_0) ~> rg_19_1_0
sgd_update(weights=nrow_19_0_0, grad=rg_19_1_0, lr=lr) ~> nrow_19_1_0
get(arr=grad_19_1, idx=1) ~> gs_19_1_1
vec_scale(a=xb, s=gs_19_1_1) ~> rg_19_1_1
sgd_update(weights=nrow_19_0_1, grad=rg_19_1_1, lr=lr) ~> nrow_19_1_1
get(arr=grad_19_1, idx=2) ~> gs_19_1_2
vec_scale(a=xb, s=gs_19_1_2) ~> rg_19_1_2
sgd_update(weights=nrow_19_0_2, grad=rg_19_1_2, lr=lr) ~> nrow_19_1_2
get(arr=grad_19_1, idx=3) ~> gs_19_1_3
vec_scale(a=xb, s=gs_19_1_3) ~> rg_19_1_3
sgd_update(weights=nrow_19_0_3, grad=rg_19_1_3, lr=lr) ~> nrow_19_1_3
linear_rows(r0=nrow_19_1_0, r1=nrow_19_1_1, r2=nrow_19_1_2, r3=nrow_19_1_3, bv=bv, x=xc) ~> pred_19_2
vec_sub(a=pred_19_2, b=tc) ~> grad_19_2
get(arr=grad_19_2, idx=0) ~> gs_19_2_0
vec_scale(a=xc, s=gs_19_2_0) ~> rg_19_2_0
sgd_update(weights=nrow_19_1_0, grad=rg_19_2_0, lr=lr) ~> nrow_19_2_0
get(arr=grad_19_2, idx=1) ~> gs_19_2_1
vec_scale(a=xc, s=gs_19_2_1) ~> rg_19_2_1
sgd_update(weights=nrow_19_1_1, grad=rg_19_2_1, lr=lr) ~> nrow_19_2_1
get(arr=grad_19_2, idx=2) ~> gs_19_2_2
vec_scale(a=xc, s=gs_19_2_2) ~> rg_19_2_2
sgd_update(weights=nrow_19_1_2, grad=rg_19_2_2, lr=lr) ~> nrow_19_2_2
get(arr=grad_19_2, idx=3) ~> gs_19_2_3
vec_scale(a=xc, s=gs_19_2_3) ~> rg_19_2_3
sgd_update(weights=nrow_19_1_3, grad=rg_19_2_3, lr=lr) ~> nrow_19_2_3
linear_rows(r0=nrow_19_2_0, r1=nrow_19_2_1, r2=nrow_19_2_2, r3=nrow_19_2_3, bv=bv, x=xd) ~> pred_19_3
vec_sub(a=pred_19_3, b=td) ~> grad_19_3
get(arr=grad_19_3, idx=0) ~> gs_19_3_0
vec_scale(a=xd, s=gs_19_3_0) ~> rg_19_3_0
sgd_update(weights=nrow_19_2_0, grad=rg_19_3_0, lr=lr) ~> nrow_19_3_0
get(arr=grad_19_3, idx=1) ~> gs_19_3_1
vec_scale(a=xd, s=gs_19_3_1) ~> rg_19_3_1
sgd_update(weights=nrow_19_2_1, grad=rg_19_3_1, lr=lr) ~> nrow_19_3_1
get(arr=grad_19_3, idx=2) ~> gs_19_3_2
vec_scale(a=xd, s=gs_19_3_2) ~> rg_19_3_2
sgd_update(weights=nrow_19_2_2, grad=rg_19_3_2, lr=lr) ~> nrow_19_3_2
get(arr=grad_19_3, idx=3) ~> gs_19_3_3
vec_scale(a=xd, s=gs_19_3_3) ~> rg_19_3_3
sgd_update(weights=nrow_19_2_3, grad=rg_19_3_3, lr=lr) ~> nrow_19_3_3
linear_rows(r0=nrow_19_3_0, r1=nrow_19_3_1, r2=nrow_19_3_2, r3=nrow_19_3_3, bv=bv, x=xa) ~> final0
softmax(arr=final0) ~> prob0
argmax4(arr=prob0) ~> ans0
linear_rows(r0=nrow_19_3_0, r1=nrow_19_3_1, r2=nrow_19_3_2, r3=nrow_19_3_3, bv=bv, x=xb) ~> final1
softmax(arr=final1) ~> prob1
argmax4(arr=prob1) ~> ans1
linear_rows(r0=nrow_19_3_0, r1=nrow_19_3_1, r2=nrow_19_3_2, r3=nrow_19_3_3, bv=bv, x=xc) ~> final2
softmax(arr=final2) ~> prob2
argmax4(arr=prob2) ~> ans2
linear_rows(r0=nrow_19_3_0, r1=nrow_19_3_1, r2=nrow_19_3_2, r3=nrow_19_3_3, bv=bv, x=xd) ~> final3
softmax(arr=final3) ~> prob3
argmax4(arr=prob3) ~> ans3
[T+]
show shall(ans0)
show shall(ans1)
show shall(ans2)
show shall(ans3)