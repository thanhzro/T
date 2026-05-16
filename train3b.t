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
linear_rows(r0=row0, r1=row1, r2=row2, r3=row3, bv=bv, x=xa) ~> pred_ep0_p0
vec_sub(a=pred_ep0_p0, b=ta) ~> grad_ep0_p0
get(arr=grad_ep0_p0, idx=0) ~> gscal_ep0_p0_r0
vec_scale(a=xa, s=gscal_ep0_p0_r0) ~> rowg_ep0_p0_r0
sgd_update(weights=row0, grad=rowg_ep0_p0_r0, lr=lr) ~> nrow_ep0_p0_r0
get(arr=grad_ep0_p0, idx=1) ~> gscal_ep0_p0_r1
vec_scale(a=xa, s=gscal_ep0_p0_r1) ~> rowg_ep0_p0_r1
sgd_update(weights=row1, grad=rowg_ep0_p0_r1, lr=lr) ~> nrow_ep0_p0_r1
get(arr=grad_ep0_p0, idx=2) ~> gscal_ep0_p0_r2
vec_scale(a=xa, s=gscal_ep0_p0_r2) ~> rowg_ep0_p0_r2
sgd_update(weights=row2, grad=rowg_ep0_p0_r2, lr=lr) ~> nrow_ep0_p0_r2
get(arr=grad_ep0_p0, idx=3) ~> gscal_ep0_p0_r3
vec_scale(a=xa, s=gscal_ep0_p0_r3) ~> rowg_ep0_p0_r3
sgd_update(weights=row3, grad=rowg_ep0_p0_r3, lr=lr) ~> nrow_ep0_p0_r3
linear_rows(r0=nrow_ep0_p0_r0, r1=nrow_ep0_p0_r1, r2=nrow_ep0_p0_r2, r3=nrow_ep0_p0_r3, bv=bv, x=xb) ~> pred_ep0_p1
vec_sub(a=pred_ep0_p1, b=tb) ~> grad_ep0_p1
get(arr=grad_ep0_p1, idx=0) ~> gscal_ep0_p1_r0
vec_scale(a=xb, s=gscal_ep0_p1_r0) ~> rowg_ep0_p1_r0
sgd_update(weights=nrow_ep0_p0_r0, grad=rowg_ep0_p1_r0, lr=lr) ~> nrow_ep0_p1_r0
get(arr=grad_ep0_p1, idx=1) ~> gscal_ep0_p1_r1
vec_scale(a=xb, s=gscal_ep0_p1_r1) ~> rowg_ep0_p1_r1
sgd_update(weights=nrow_ep0_p0_r1, grad=rowg_ep0_p1_r1, lr=lr) ~> nrow_ep0_p1_r1
get(arr=grad_ep0_p1, idx=2) ~> gscal_ep0_p1_r2
vec_scale(a=xb, s=gscal_ep0_p1_r2) ~> rowg_ep0_p1_r2
sgd_update(weights=nrow_ep0_p0_r2, grad=rowg_ep0_p1_r2, lr=lr) ~> nrow_ep0_p1_r2
get(arr=grad_ep0_p1, idx=3) ~> gscal_ep0_p1_r3
vec_scale(a=xb, s=gscal_ep0_p1_r3) ~> rowg_ep0_p1_r3
sgd_update(weights=nrow_ep0_p0_r3, grad=rowg_ep0_p1_r3, lr=lr) ~> nrow_ep0_p1_r3
linear_rows(r0=nrow_ep0_p1_r0, r1=nrow_ep0_p1_r1, r2=nrow_ep0_p1_r2, r3=nrow_ep0_p1_r3, bv=bv, x=xc) ~> pred_ep0_p2
vec_sub(a=pred_ep0_p2, b=tc) ~> grad_ep0_p2
get(arr=grad_ep0_p2, idx=0) ~> gscal_ep0_p2_r0
vec_scale(a=xc, s=gscal_ep0_p2_r0) ~> rowg_ep0_p2_r0
sgd_update(weights=nrow_ep0_p1_r0, grad=rowg_ep0_p2_r0, lr=lr) ~> nrow_ep0_p2_r0
get(arr=grad_ep0_p2, idx=1) ~> gscal_ep0_p2_r1
vec_scale(a=xc, s=gscal_ep0_p2_r1) ~> rowg_ep0_p2_r1
sgd_update(weights=nrow_ep0_p1_r1, grad=rowg_ep0_p2_r1, lr=lr) ~> nrow_ep0_p2_r1
get(arr=grad_ep0_p2, idx=2) ~> gscal_ep0_p2_r2
vec_scale(a=xc, s=gscal_ep0_p2_r2) ~> rowg_ep0_p2_r2
sgd_update(weights=nrow_ep0_p1_r2, grad=rowg_ep0_p2_r2, lr=lr) ~> nrow_ep0_p2_r2
get(arr=grad_ep0_p2, idx=3) ~> gscal_ep0_p2_r3
vec_scale(a=xc, s=gscal_ep0_p2_r3) ~> rowg_ep0_p2_r3
sgd_update(weights=nrow_ep0_p1_r3, grad=rowg_ep0_p2_r3, lr=lr) ~> nrow_ep0_p2_r3
linear_rows(r0=nrow_ep0_p2_r0, r1=nrow_ep0_p2_r1, r2=nrow_ep0_p2_r2, r3=nrow_ep0_p2_r3, bv=bv, x=xd) ~> pred_ep0_p3
vec_sub(a=pred_ep0_p3, b=td) ~> grad_ep0_p3
get(arr=grad_ep0_p3, idx=0) ~> gscal_ep0_p3_r0
vec_scale(a=xd, s=gscal_ep0_p3_r0) ~> rowg_ep0_p3_r0
sgd_update(weights=nrow_ep0_p2_r0, grad=rowg_ep0_p3_r0, lr=lr) ~> nrow_ep0_p3_r0
get(arr=grad_ep0_p3, idx=1) ~> gscal_ep0_p3_r1
vec_scale(a=xd, s=gscal_ep0_p3_r1) ~> rowg_ep0_p3_r1
sgd_update(weights=nrow_ep0_p2_r1, grad=rowg_ep0_p3_r1, lr=lr) ~> nrow_ep0_p3_r1
get(arr=grad_ep0_p3, idx=2) ~> gscal_ep0_p3_r2
vec_scale(a=xd, s=gscal_ep0_p3_r2) ~> rowg_ep0_p3_r2
sgd_update(weights=nrow_ep0_p2_r2, grad=rowg_ep0_p3_r2, lr=lr) ~> nrow_ep0_p3_r2
get(arr=grad_ep0_p3, idx=3) ~> gscal_ep0_p3_r3
vec_scale(a=xd, s=gscal_ep0_p3_r3) ~> rowg_ep0_p3_r3
sgd_update(weights=nrow_ep0_p2_r3, grad=rowg_ep0_p3_r3, lr=lr) ~> nrow_ep0_p3_r3
linear_rows(r0=nrow_ep0_p3_r0, r1=nrow_ep0_p3_r1, r2=nrow_ep0_p3_r2, r3=nrow_ep0_p3_r3, bv=bv, x=xa) ~> pred_ep1_p0
vec_sub(a=pred_ep1_p0, b=ta) ~> grad_ep1_p0
get(arr=grad_ep1_p0, idx=0) ~> gscal_ep1_p0_r0
vec_scale(a=xa, s=gscal_ep1_p0_r0) ~> rowg_ep1_p0_r0
sgd_update(weights=nrow_ep0_p3_r0, grad=rowg_ep1_p0_r0, lr=lr) ~> nrow_ep1_p0_r0
get(arr=grad_ep1_p0, idx=1) ~> gscal_ep1_p0_r1
vec_scale(a=xa, s=gscal_ep1_p0_r1) ~> rowg_ep1_p0_r1
sgd_update(weights=nrow_ep0_p3_r1, grad=rowg_ep1_p0_r1, lr=lr) ~> nrow_ep1_p0_r1
get(arr=grad_ep1_p0, idx=2) ~> gscal_ep1_p0_r2
vec_scale(a=xa, s=gscal_ep1_p0_r2) ~> rowg_ep1_p0_r2
sgd_update(weights=nrow_ep0_p3_r2, grad=rowg_ep1_p0_r2, lr=lr) ~> nrow_ep1_p0_r2
get(arr=grad_ep1_p0, idx=3) ~> gscal_ep1_p0_r3
vec_scale(a=xa, s=gscal_ep1_p0_r3) ~> rowg_ep1_p0_r3
sgd_update(weights=nrow_ep0_p3_r3, grad=rowg_ep1_p0_r3, lr=lr) ~> nrow_ep1_p0_r3
linear_rows(r0=nrow_ep1_p0_r0, r1=nrow_ep1_p0_r1, r2=nrow_ep1_p0_r2, r3=nrow_ep1_p0_r3, bv=bv, x=xb) ~> pred_ep1_p1
vec_sub(a=pred_ep1_p1, b=tb) ~> grad_ep1_p1
get(arr=grad_ep1_p1, idx=0) ~> gscal_ep1_p1_r0
vec_scale(a=xb, s=gscal_ep1_p1_r0) ~> rowg_ep1_p1_r0
sgd_update(weights=nrow_ep1_p0_r0, grad=rowg_ep1_p1_r0, lr=lr) ~> nrow_ep1_p1_r0
get(arr=grad_ep1_p1, idx=1) ~> gscal_ep1_p1_r1
vec_scale(a=xb, s=gscal_ep1_p1_r1) ~> rowg_ep1_p1_r1
sgd_update(weights=nrow_ep1_p0_r1, grad=rowg_ep1_p1_r1, lr=lr) ~> nrow_ep1_p1_r1
get(arr=grad_ep1_p1, idx=2) ~> gscal_ep1_p1_r2
vec_scale(a=xb, s=gscal_ep1_p1_r2) ~> rowg_ep1_p1_r2
sgd_update(weights=nrow_ep1_p0_r2, grad=rowg_ep1_p1_r2, lr=lr) ~> nrow_ep1_p1_r2
get(arr=grad_ep1_p1, idx=3) ~> gscal_ep1_p1_r3
vec_scale(a=xb, s=gscal_ep1_p1_r3) ~> rowg_ep1_p1_r3
sgd_update(weights=nrow_ep1_p0_r3, grad=rowg_ep1_p1_r3, lr=lr) ~> nrow_ep1_p1_r3
linear_rows(r0=nrow_ep1_p1_r0, r1=nrow_ep1_p1_r1, r2=nrow_ep1_p1_r2, r3=nrow_ep1_p1_r3, bv=bv, x=xc) ~> pred_ep1_p2
vec_sub(a=pred_ep1_p2, b=tc) ~> grad_ep1_p2
get(arr=grad_ep1_p2, idx=0) ~> gscal_ep1_p2_r0
vec_scale(a=xc, s=gscal_ep1_p2_r0) ~> rowg_ep1_p2_r0
sgd_update(weights=nrow_ep1_p1_r0, grad=rowg_ep1_p2_r0, lr=lr) ~> nrow_ep1_p2_r0
get(arr=grad_ep1_p2, idx=1) ~> gscal_ep1_p2_r1
vec_scale(a=xc, s=gscal_ep1_p2_r1) ~> rowg_ep1_p2_r1
sgd_update(weights=nrow_ep1_p1_r1, grad=rowg_ep1_p2_r1, lr=lr) ~> nrow_ep1_p2_r1
get(arr=grad_ep1_p2, idx=2) ~> gscal_ep1_p2_r2
vec_scale(a=xc, s=gscal_ep1_p2_r2) ~> rowg_ep1_p2_r2
sgd_update(weights=nrow_ep1_p1_r2, grad=rowg_ep1_p2_r2, lr=lr) ~> nrow_ep1_p2_r2
get(arr=grad_ep1_p2, idx=3) ~> gscal_ep1_p2_r3
vec_scale(a=xc, s=gscal_ep1_p2_r3) ~> rowg_ep1_p2_r3
sgd_update(weights=nrow_ep1_p1_r3, grad=rowg_ep1_p2_r3, lr=lr) ~> nrow_ep1_p2_r3
linear_rows(r0=nrow_ep1_p2_r0, r1=nrow_ep1_p2_r1, r2=nrow_ep1_p2_r2, r3=nrow_ep1_p2_r3, bv=bv, x=xd) ~> pred_ep1_p3
vec_sub(a=pred_ep1_p3, b=td) ~> grad_ep1_p3
get(arr=grad_ep1_p3, idx=0) ~> gscal_ep1_p3_r0
vec_scale(a=xd, s=gscal_ep1_p3_r0) ~> rowg_ep1_p3_r0
sgd_update(weights=nrow_ep1_p2_r0, grad=rowg_ep1_p3_r0, lr=lr) ~> nrow_ep1_p3_r0
get(arr=grad_ep1_p3, idx=1) ~> gscal_ep1_p3_r1
vec_scale(a=xd, s=gscal_ep1_p3_r1) ~> rowg_ep1_p3_r1
sgd_update(weights=nrow_ep1_p2_r1, grad=rowg_ep1_p3_r1, lr=lr) ~> nrow_ep1_p3_r1
get(arr=grad_ep1_p3, idx=2) ~> gscal_ep1_p3_r2
vec_scale(a=xd, s=gscal_ep1_p3_r2) ~> rowg_ep1_p3_r2
sgd_update(weights=nrow_ep1_p2_r2, grad=rowg_ep1_p3_r2, lr=lr) ~> nrow_ep1_p3_r2
get(arr=grad_ep1_p3, idx=3) ~> gscal_ep1_p3_r3
vec_scale(a=xd, s=gscal_ep1_p3_r3) ~> rowg_ep1_p3_r3
sgd_update(weights=nrow_ep1_p2_r3, grad=rowg_ep1_p3_r3, lr=lr) ~> nrow_ep1_p3_r3
linear_rows(r0=nrow_ep1_p3_r0, r1=nrow_ep1_p3_r1, r2=nrow_ep1_p3_r2, r3=nrow_ep1_p3_r3, bv=bv, x=xa) ~> pred_ep2_p0
vec_sub(a=pred_ep2_p0, b=ta) ~> grad_ep2_p0
get(arr=grad_ep2_p0, idx=0) ~> gscal_ep2_p0_r0
vec_scale(a=xa, s=gscal_ep2_p0_r0) ~> rowg_ep2_p0_r0
sgd_update(weights=nrow_ep1_p3_r0, grad=rowg_ep2_p0_r0, lr=lr) ~> nrow_ep2_p0_r0
get(arr=grad_ep2_p0, idx=1) ~> gscal_ep2_p0_r1
vec_scale(a=xa, s=gscal_ep2_p0_r1) ~> rowg_ep2_p0_r1
sgd_update(weights=nrow_ep1_p3_r1, grad=rowg_ep2_p0_r1, lr=lr) ~> nrow_ep2_p0_r1
get(arr=grad_ep2_p0, idx=2) ~> gscal_ep2_p0_r2
vec_scale(a=xa, s=gscal_ep2_p0_r2) ~> rowg_ep2_p0_r2
sgd_update(weights=nrow_ep1_p3_r2, grad=rowg_ep2_p0_r2, lr=lr) ~> nrow_ep2_p0_r2
get(arr=grad_ep2_p0, idx=3) ~> gscal_ep2_p0_r3
vec_scale(a=xa, s=gscal_ep2_p0_r3) ~> rowg_ep2_p0_r3
sgd_update(weights=nrow_ep1_p3_r3, grad=rowg_ep2_p0_r3, lr=lr) ~> nrow_ep2_p0_r3
linear_rows(r0=nrow_ep2_p0_r0, r1=nrow_ep2_p0_r1, r2=nrow_ep2_p0_r2, r3=nrow_ep2_p0_r3, bv=bv, x=xb) ~> pred_ep2_p1
vec_sub(a=pred_ep2_p1, b=tb) ~> grad_ep2_p1
get(arr=grad_ep2_p1, idx=0) ~> gscal_ep2_p1_r0
vec_scale(a=xb, s=gscal_ep2_p1_r0) ~> rowg_ep2_p1_r0
sgd_update(weights=nrow_ep2_p0_r0, grad=rowg_ep2_p1_r0, lr=lr) ~> nrow_ep2_p1_r0
get(arr=grad_ep2_p1, idx=1) ~> gscal_ep2_p1_r1
vec_scale(a=xb, s=gscal_ep2_p1_r1) ~> rowg_ep2_p1_r1
sgd_update(weights=nrow_ep2_p0_r1, grad=rowg_ep2_p1_r1, lr=lr) ~> nrow_ep2_p1_r1
get(arr=grad_ep2_p1, idx=2) ~> gscal_ep2_p1_r2
vec_scale(a=xb, s=gscal_ep2_p1_r2) ~> rowg_ep2_p1_r2
sgd_update(weights=nrow_ep2_p0_r2, grad=rowg_ep2_p1_r2, lr=lr) ~> nrow_ep2_p1_r2
get(arr=grad_ep2_p1, idx=3) ~> gscal_ep2_p1_r3
vec_scale(a=xb, s=gscal_ep2_p1_r3) ~> rowg_ep2_p1_r3
sgd_update(weights=nrow_ep2_p0_r3, grad=rowg_ep2_p1_r3, lr=lr) ~> nrow_ep2_p1_r3
linear_rows(r0=nrow_ep2_p1_r0, r1=nrow_ep2_p1_r1, r2=nrow_ep2_p1_r2, r3=nrow_ep2_p1_r3, bv=bv, x=xc) ~> pred_ep2_p2
vec_sub(a=pred_ep2_p2, b=tc) ~> grad_ep2_p2
get(arr=grad_ep2_p2, idx=0) ~> gscal_ep2_p2_r0
vec_scale(a=xc, s=gscal_ep2_p2_r0) ~> rowg_ep2_p2_r0
sgd_update(weights=nrow_ep2_p1_r0, grad=rowg_ep2_p2_r0, lr=lr) ~> nrow_ep2_p2_r0
get(arr=grad_ep2_p2, idx=1) ~> gscal_ep2_p2_r1
vec_scale(a=xc, s=gscal_ep2_p2_r1) ~> rowg_ep2_p2_r1
sgd_update(weights=nrow_ep2_p1_r1, grad=rowg_ep2_p2_r1, lr=lr) ~> nrow_ep2_p2_r1
get(arr=grad_ep2_p2, idx=2) ~> gscal_ep2_p2_r2
vec_scale(a=xc, s=gscal_ep2_p2_r2) ~> rowg_ep2_p2_r2
sgd_update(weights=nrow_ep2_p1_r2, grad=rowg_ep2_p2_r2, lr=lr) ~> nrow_ep2_p2_r2
get(arr=grad_ep2_p2, idx=3) ~> gscal_ep2_p2_r3
vec_scale(a=xc, s=gscal_ep2_p2_r3) ~> rowg_ep2_p2_r3
sgd_update(weights=nrow_ep2_p1_r3, grad=rowg_ep2_p2_r3, lr=lr) ~> nrow_ep2_p2_r3
linear_rows(r0=nrow_ep2_p2_r0, r1=nrow_ep2_p2_r1, r2=nrow_ep2_p2_r2, r3=nrow_ep2_p2_r3, bv=bv, x=xd) ~> pred_ep2_p3
vec_sub(a=pred_ep2_p3, b=td) ~> grad_ep2_p3
get(arr=grad_ep2_p3, idx=0) ~> gscal_ep2_p3_r0
vec_scale(a=xd, s=gscal_ep2_p3_r0) ~> rowg_ep2_p3_r0
sgd_update(weights=nrow_ep2_p2_r0, grad=rowg_ep2_p3_r0, lr=lr) ~> nrow_ep2_p3_r0
get(arr=grad_ep2_p3, idx=1) ~> gscal_ep2_p3_r1
vec_scale(a=xd, s=gscal_ep2_p3_r1) ~> rowg_ep2_p3_r1
sgd_update(weights=nrow_ep2_p2_r1, grad=rowg_ep2_p3_r1, lr=lr) ~> nrow_ep2_p3_r1
get(arr=grad_ep2_p3, idx=2) ~> gscal_ep2_p3_r2
vec_scale(a=xd, s=gscal_ep2_p3_r2) ~> rowg_ep2_p3_r2
sgd_update(weights=nrow_ep2_p2_r2, grad=rowg_ep2_p3_r2, lr=lr) ~> nrow_ep2_p3_r2
get(arr=grad_ep2_p3, idx=3) ~> gscal_ep2_p3_r3
vec_scale(a=xd, s=gscal_ep2_p3_r3) ~> rowg_ep2_p3_r3
sgd_update(weights=nrow_ep2_p2_r3, grad=rowg_ep2_p3_r3, lr=lr) ~> nrow_ep2_p3_r3
linear_rows(r0=nrow_ep2_p3_r0, r1=nrow_ep2_p3_r1, r2=nrow_ep2_p3_r2, r3=nrow_ep2_p3_r3, bv=bv, x=xa) ~> final0
softmax(arr=final0) ~> prob0
argmax4(arr=prob0) ~> ans0
linear_rows(r0=nrow_ep2_p3_r0, r1=nrow_ep2_p3_r1, r2=nrow_ep2_p3_r2, r3=nrow_ep2_p3_r3, bv=bv, x=xb) ~> final1
softmax(arr=final1) ~> prob1
argmax4(arr=prob1) ~> ans1
linear_rows(r0=nrow_ep2_p3_r0, r1=nrow_ep2_p3_r1, r2=nrow_ep2_p3_r2, r3=nrow_ep2_p3_r3, bv=bv, x=xc) ~> final2
softmax(arr=final2) ~> prob2
argmax4(arr=prob2) ~> ans2
linear_rows(r0=nrow_ep2_p3_r0, r1=nrow_ep2_p3_r1, r2=nrow_ep2_p3_r2, r3=nrow_ep2_p3_r3, bv=bv, x=xd) ~> final3
softmax(arr=final3) ~> prob3
argmax4(arr=prob3) ~> ans3
[T+]
show shall(ans0)
show shall(ans1)
show shall(ans2)
show shall(ans3)