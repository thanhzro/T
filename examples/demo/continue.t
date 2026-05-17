[T-]
import "lib/basic/std.t"
import "lib/advanced/ml_t.t"
row0 = [4.14908e-05, 2.25393e-06, 2.25393e-06, 0.999952]
row1 = [0.999834, 4.82526e-05, 2.25393e-06, 0.000200608]
row2 = [-9.85873e-06, 0.999908, 6.79663e-05, 0.000143133]
row3 = [-7.20977e-05, -1.15457e-05, 0.999811, 0.000334715]
bv = [0, 0, 0, 0]
lr = 0.1
xa = [1, 0, 0, 0]
ta = [0, 1, 0, 0]
xb = [0, 1, 0, 0]
tb = [0, 0, 1, 0]
xc = [0, 0, 1, 0]
tc = [0, 0, 0, 1]
xd = [0, 0, 0, 1]
td = [1, 0, 0, 0]
[T0]
linear_rows(r0=row0, r1=row1, r2=row2, r3=row3, bv=bv, x=xa) ~> pp
vec_sub(a=pp, b=ta) ~> gg
get(arr=gg, idx=0) ~> gs0
vec_scale(a=xa, s=gs0) ~> rg0
sgd_update(weights=row0, grad=rg0, lr=lr) ~> nr0
get(arr=gg, idx=1) ~> gs1
vec_scale(a=xa, s=gs1) ~> rg1
sgd_update(weights=row1, grad=rg1, lr=lr) ~> nr1
get(arr=gg, idx=2) ~> gs2
vec_scale(a=xa, s=gs2) ~> rg2
sgd_update(weights=row2, grad=rg2, lr=lr) ~> nr2
get(arr=gg, idx=3) ~> gs3
vec_scale(a=xa, s=gs3) ~> rg3
sgd_update(weights=row3, grad=rg3, lr=lr) ~> nr3
linear_rows(r0=nr0, r1=nr1, r2=nr2, r3=nr3, bv=bv, x=xb) ~> pp
vec_sub(a=pp, b=tb) ~> gg
get(arr=gg, idx=0) ~> gs0
vec_scale(a=xb, s=gs0) ~> rg0
sgd_update(weights=nr0, grad=rg0, lr=lr) ~> nr0
get(arr=gg, idx=1) ~> gs1
vec_scale(a=xb, s=gs1) ~> rg1
sgd_update(weights=nr1, grad=rg1, lr=lr) ~> nr1
get(arr=gg, idx=2) ~> gs2
vec_scale(a=xb, s=gs2) ~> rg2
sgd_update(weights=nr2, grad=rg2, lr=lr) ~> nr2
get(arr=gg, idx=3) ~> gs3
vec_scale(a=xb, s=gs3) ~> rg3
sgd_update(weights=nr3, grad=rg3, lr=lr) ~> nr3
linear_rows(r0=nr0, r1=nr1, r2=nr2, r3=nr3, bv=bv, x=xc) ~> pp
vec_sub(a=pp, b=tc) ~> gg
get(arr=gg, idx=0) ~> gs0
vec_scale(a=xc, s=gs0) ~> rg0
sgd_update(weights=nr0, grad=rg0, lr=lr) ~> nr0
get(arr=gg, idx=1) ~> gs1
vec_scale(a=xc, s=gs1) ~> rg1
sgd_update(weights=nr1, grad=rg1, lr=lr) ~> nr1
get(arr=gg, idx=2) ~> gs2
vec_scale(a=xc, s=gs2) ~> rg2
sgd_update(weights=nr2, grad=rg2, lr=lr) ~> nr2
get(arr=gg, idx=3) ~> gs3
vec_scale(a=xc, s=gs3) ~> rg3
sgd_update(weights=nr3, grad=rg3, lr=lr) ~> nr3
linear_rows(r0=nr0, r1=nr1, r2=nr2, r3=nr3, bv=bv, x=xd) ~> pp
vec_sub(a=pp, b=td) ~> gg
get(arr=gg, idx=0) ~> gs0
vec_scale(a=xd, s=gs0) ~> rg0
sgd_update(weights=nr0, grad=rg0, lr=lr) ~> nr0
get(arr=gg, idx=1) ~> gs1
vec_scale(a=xd, s=gs1) ~> rg1
sgd_update(weights=nr1, grad=rg1, lr=lr) ~> nr1
get(arr=gg, idx=2) ~> gs2
vec_scale(a=xd, s=gs2) ~> rg2
sgd_update(weights=nr2, grad=rg2, lr=lr) ~> nr2
get(arr=gg, idx=3) ~> gs3
vec_scale(a=xd, s=gs3) ~> rg3
sgd_update(weights=nr3, grad=rg3, lr=lr) ~> nr3
linear_rows(r0=nr0, r1=nr1, r2=nr2, r3=nr3, bv=bv, x=xa) ~> pp
vec_sub(a=pp, b=ta) ~> gg
get(arr=gg, idx=0) ~> gs0
vec_scale(a=xa, s=gs0) ~> rg0
sgd_update(weights=nr0, grad=rg0, lr=lr) ~> nr0
get(arr=gg, idx=1) ~> gs1
vec_scale(a=xa, s=gs1) ~> rg1
sgd_update(weights=nr1, grad=rg1, lr=lr) ~> nr1
get(arr=gg, idx=2) ~> gs2
vec_scale(a=xa, s=gs2) ~> rg2
sgd_update(weights=nr2, grad=rg2, lr=lr) ~> nr2
get(arr=gg, idx=3) ~> gs3
vec_scale(a=xa, s=gs3) ~> rg3
sgd_update(weights=nr3, grad=rg3, lr=lr) ~> nr3
linear_rows(r0=nr0, r1=nr1, r2=nr2, r3=nr3, bv=bv, x=xb) ~> pp
vec_sub(a=pp, b=tb) ~> gg
get(arr=gg, idx=0) ~> gs0
vec_scale(a=xb, s=gs0) ~> rg0
sgd_update(weights=nr0, grad=rg0, lr=lr) ~> nr0
get(arr=gg, idx=1) ~> gs1
vec_scale(a=xb, s=gs1) ~> rg1
sgd_update(weights=nr1, grad=rg1, lr=lr) ~> nr1
get(arr=gg, idx=2) ~> gs2
vec_scale(a=xb, s=gs2) ~> rg2
sgd_update(weights=nr2, grad=rg2, lr=lr) ~> nr2
get(arr=gg, idx=3) ~> gs3
vec_scale(a=xb, s=gs3) ~> rg3
sgd_update(weights=nr3, grad=rg3, lr=lr) ~> nr3
linear_rows(r0=nr0, r1=nr1, r2=nr2, r3=nr3, bv=bv, x=xc) ~> pp
vec_sub(a=pp, b=tc) ~> gg
get(arr=gg, idx=0) ~> gs0
vec_scale(a=xc, s=gs0) ~> rg0
sgd_update(weights=nr0, grad=rg0, lr=lr) ~> nr0
get(arr=gg, idx=1) ~> gs1
vec_scale(a=xc, s=gs1) ~> rg1
sgd_update(weights=nr1, grad=rg1, lr=lr) ~> nr1
get(arr=gg, idx=2) ~> gs2
vec_scale(a=xc, s=gs2) ~> rg2
sgd_update(weights=nr2, grad=rg2, lr=lr) ~> nr2
get(arr=gg, idx=3) ~> gs3
vec_scale(a=xc, s=gs3) ~> rg3
sgd_update(weights=nr3, grad=rg3, lr=lr) ~> nr3
linear_rows(r0=nr0, r1=nr1, r2=nr2, r3=nr3, bv=bv, x=xd) ~> pp
vec_sub(a=pp, b=td) ~> gg
get(arr=gg, idx=0) ~> gs0
vec_scale(a=xd, s=gs0) ~> rg0
sgd_update(weights=nr0, grad=rg0, lr=lr) ~> nr0
get(arr=gg, idx=1) ~> gs1
vec_scale(a=xd, s=gs1) ~> rg1
sgd_update(weights=nr1, grad=rg1, lr=lr) ~> nr1
get(arr=gg, idx=2) ~> gs2
vec_scale(a=xd, s=gs2) ~> rg2
sgd_update(weights=nr2, grad=rg2, lr=lr) ~> nr2
get(arr=gg, idx=3) ~> gs3
vec_scale(a=xd, s=gs3) ~> rg3
sgd_update(weights=nr3, grad=rg3, lr=lr) ~> nr3
linear_rows(r0=nr0, r1=nr1, r2=nr2, r3=nr3, bv=bv, x=xa) ~> pp
vec_sub(a=pp, b=ta) ~> gg
get(arr=gg, idx=0) ~> gs0
vec_scale(a=xa, s=gs0) ~> rg0
sgd_update(weights=nr0, grad=rg0, lr=lr) ~> nr0
get(arr=gg, idx=1) ~> gs1
vec_scale(a=xa, s=gs1) ~> rg1
sgd_update(weights=nr1, grad=rg1, lr=lr) ~> nr1
get(arr=gg, idx=2) ~> gs2
vec_scale(a=xa, s=gs2) ~> rg2
sgd_update(weights=nr2, grad=rg2, lr=lr) ~> nr2
get(arr=gg, idx=3) ~> gs3
vec_scale(a=xa, s=gs3) ~> rg3
sgd_update(weights=nr3, grad=rg3, lr=lr) ~> nr3
linear_rows(r0=nr0, r1=nr1, r2=nr2, r3=nr3, bv=bv, x=xb) ~> pp
vec_sub(a=pp, b=tb) ~> gg
get(arr=gg, idx=0) ~> gs0
vec_scale(a=xb, s=gs0) ~> rg0
sgd_update(weights=nr0, grad=rg0, lr=lr) ~> nr0
get(arr=gg, idx=1) ~> gs1
vec_scale(a=xb, s=gs1) ~> rg1
sgd_update(weights=nr1, grad=rg1, lr=lr) ~> nr1
get(arr=gg, idx=2) ~> gs2
vec_scale(a=xb, s=gs2) ~> rg2
sgd_update(weights=nr2, grad=rg2, lr=lr) ~> nr2
get(arr=gg, idx=3) ~> gs3
vec_scale(a=xb, s=gs3) ~> rg3
sgd_update(weights=nr3, grad=rg3, lr=lr) ~> nr3
linear_rows(r0=nr0, r1=nr1, r2=nr2, r3=nr3, bv=bv, x=xc) ~> pp
vec_sub(a=pp, b=tc) ~> gg
get(arr=gg, idx=0) ~> gs0
vec_scale(a=xc, s=gs0) ~> rg0
sgd_update(weights=nr0, grad=rg0, lr=lr) ~> nr0
get(arr=gg, idx=1) ~> gs1
vec_scale(a=xc, s=gs1) ~> rg1
sgd_update(weights=nr1, grad=rg1, lr=lr) ~> nr1
get(arr=gg, idx=2) ~> gs2
vec_scale(a=xc, s=gs2) ~> rg2
sgd_update(weights=nr2, grad=rg2, lr=lr) ~> nr2
get(arr=gg, idx=3) ~> gs3
vec_scale(a=xc, s=gs3) ~> rg3
sgd_update(weights=nr3, grad=rg3, lr=lr) ~> nr3
linear_rows(r0=nr0, r1=nr1, r2=nr2, r3=nr3, bv=bv, x=xd) ~> pp
vec_sub(a=pp, b=td) ~> gg
get(arr=gg, idx=0) ~> gs0
vec_scale(a=xd, s=gs0) ~> rg0
sgd_update(weights=nr0, grad=rg0, lr=lr) ~> nr0
get(arr=gg, idx=1) ~> gs1
vec_scale(a=xd, s=gs1) ~> rg1
sgd_update(weights=nr1, grad=rg1, lr=lr) ~> nr1
get(arr=gg, idx=2) ~> gs2
vec_scale(a=xd, s=gs2) ~> rg2
sgd_update(weights=nr2, grad=rg2, lr=lr) ~> nr2
get(arr=gg, idx=3) ~> gs3
vec_scale(a=xd, s=gs3) ~> rg3
sgd_update(weights=nr3, grad=rg3, lr=lr) ~> nr3
linear_rows(r0=nr0, r1=nr1, r2=nr2, r3=nr3, bv=bv, x=xa) ~> pp
vec_sub(a=pp, b=ta) ~> gg
get(arr=gg, idx=0) ~> gs0
vec_scale(a=xa, s=gs0) ~> rg0
sgd_update(weights=nr0, grad=rg0, lr=lr) ~> nr0
get(arr=gg, idx=1) ~> gs1
vec_scale(a=xa, s=gs1) ~> rg1
sgd_update(weights=nr1, grad=rg1, lr=lr) ~> nr1
get(arr=gg, idx=2) ~> gs2
vec_scale(a=xa, s=gs2) ~> rg2
sgd_update(weights=nr2, grad=rg2, lr=lr) ~> nr2
get(arr=gg, idx=3) ~> gs3
vec_scale(a=xa, s=gs3) ~> rg3
sgd_update(weights=nr3, grad=rg3, lr=lr) ~> nr3
linear_rows(r0=nr0, r1=nr1, r2=nr2, r3=nr3, bv=bv, x=xb) ~> pp
vec_sub(a=pp, b=tb) ~> gg
get(arr=gg, idx=0) ~> gs0
vec_scale(a=xb, s=gs0) ~> rg0
sgd_update(weights=nr0, grad=rg0, lr=lr) ~> nr0
get(arr=gg, idx=1) ~> gs1
vec_scale(a=xb, s=gs1) ~> rg1
sgd_update(weights=nr1, grad=rg1, lr=lr) ~> nr1
get(arr=gg, idx=2) ~> gs2
vec_scale(a=xb, s=gs2) ~> rg2
sgd_update(weights=nr2, grad=rg2, lr=lr) ~> nr2
get(arr=gg, idx=3) ~> gs3
vec_scale(a=xb, s=gs3) ~> rg3
sgd_update(weights=nr3, grad=rg3, lr=lr) ~> nr3
linear_rows(r0=nr0, r1=nr1, r2=nr2, r3=nr3, bv=bv, x=xc) ~> pp
vec_sub(a=pp, b=tc) ~> gg
get(arr=gg, idx=0) ~> gs0
vec_scale(a=xc, s=gs0) ~> rg0
sgd_update(weights=nr0, grad=rg0, lr=lr) ~> nr0
get(arr=gg, idx=1) ~> gs1
vec_scale(a=xc, s=gs1) ~> rg1
sgd_update(weights=nr1, grad=rg1, lr=lr) ~> nr1
get(arr=gg, idx=2) ~> gs2
vec_scale(a=xc, s=gs2) ~> rg2
sgd_update(weights=nr2, grad=rg2, lr=lr) ~> nr2
get(arr=gg, idx=3) ~> gs3
vec_scale(a=xc, s=gs3) ~> rg3
sgd_update(weights=nr3, grad=rg3, lr=lr) ~> nr3
linear_rows(r0=nr0, r1=nr1, r2=nr2, r3=nr3, bv=bv, x=xd) ~> pp
vec_sub(a=pp, b=td) ~> gg
get(arr=gg, idx=0) ~> gs0
vec_scale(a=xd, s=gs0) ~> rg0
sgd_update(weights=nr0, grad=rg0, lr=lr) ~> nr0
get(arr=gg, idx=1) ~> gs1
vec_scale(a=xd, s=gs1) ~> rg1
sgd_update(weights=nr1, grad=rg1, lr=lr) ~> nr1
get(arr=gg, idx=2) ~> gs2
vec_scale(a=xd, s=gs2) ~> rg2
sgd_update(weights=nr2, grad=rg2, lr=lr) ~> nr2
get(arr=gg, idx=3) ~> gs3
vec_scale(a=xd, s=gs3) ~> rg3
sgd_update(weights=nr3, grad=rg3, lr=lr) ~> nr3
linear_rows(r0=nr0, r1=nr1, r2=nr2, r3=nr3, bv=bv, x=xa) ~> pp
vec_sub(a=pp, b=ta) ~> gg
get(arr=gg, idx=0) ~> gs0
vec_scale(a=xa, s=gs0) ~> rg0
sgd_update(weights=nr0, grad=rg0, lr=lr) ~> nr0
get(arr=gg, idx=1) ~> gs1
vec_scale(a=xa, s=gs1) ~> rg1
sgd_update(weights=nr1, grad=rg1, lr=lr) ~> nr1
get(arr=gg, idx=2) ~> gs2
vec_scale(a=xa, s=gs2) ~> rg2
sgd_update(weights=nr2, grad=rg2, lr=lr) ~> nr2
get(arr=gg, idx=3) ~> gs3
vec_scale(a=xa, s=gs3) ~> rg3
sgd_update(weights=nr3, grad=rg3, lr=lr) ~> nr3
linear_rows(r0=nr0, r1=nr1, r2=nr2, r3=nr3, bv=bv, x=xb) ~> pp
vec_sub(a=pp, b=tb) ~> gg
get(arr=gg, idx=0) ~> gs0
vec_scale(a=xb, s=gs0) ~> rg0
sgd_update(weights=nr0, grad=rg0, lr=lr) ~> nr0
get(arr=gg, idx=1) ~> gs1
vec_scale(a=xb, s=gs1) ~> rg1
sgd_update(weights=nr1, grad=rg1, lr=lr) ~> nr1
get(arr=gg, idx=2) ~> gs2
vec_scale(a=xb, s=gs2) ~> rg2
sgd_update(weights=nr2, grad=rg2, lr=lr) ~> nr2
get(arr=gg, idx=3) ~> gs3
vec_scale(a=xb, s=gs3) ~> rg3
sgd_update(weights=nr3, grad=rg3, lr=lr) ~> nr3
linear_rows(r0=nr0, r1=nr1, r2=nr2, r3=nr3, bv=bv, x=xc) ~> pp
vec_sub(a=pp, b=tc) ~> gg
get(arr=gg, idx=0) ~> gs0
vec_scale(a=xc, s=gs0) ~> rg0
sgd_update(weights=nr0, grad=rg0, lr=lr) ~> nr0
get(arr=gg, idx=1) ~> gs1
vec_scale(a=xc, s=gs1) ~> rg1
sgd_update(weights=nr1, grad=rg1, lr=lr) ~> nr1
get(arr=gg, idx=2) ~> gs2
vec_scale(a=xc, s=gs2) ~> rg2
sgd_update(weights=nr2, grad=rg2, lr=lr) ~> nr2
get(arr=gg, idx=3) ~> gs3
vec_scale(a=xc, s=gs3) ~> rg3
sgd_update(weights=nr3, grad=rg3, lr=lr) ~> nr3
linear_rows(r0=nr0, r1=nr1, r2=nr2, r3=nr3, bv=bv, x=xd) ~> pp
vec_sub(a=pp, b=td) ~> gg
get(arr=gg, idx=0) ~> gs0
vec_scale(a=xd, s=gs0) ~> rg0
sgd_update(weights=nr0, grad=rg0, lr=lr) ~> nr0
get(arr=gg, idx=1) ~> gs1
vec_scale(a=xd, s=gs1) ~> rg1
sgd_update(weights=nr1, grad=rg1, lr=lr) ~> nr1
get(arr=gg, idx=2) ~> gs2
vec_scale(a=xd, s=gs2) ~> rg2
sgd_update(weights=nr2, grad=rg2, lr=lr) ~> nr2
get(arr=gg, idx=3) ~> gs3
vec_scale(a=xd, s=gs3) ~> rg3
sgd_update(weights=nr3, grad=rg3, lr=lr) ~> nr3
linear_rows(r0=nr0, r1=nr1, r2=nr2, r3=nr3, bv=bv, x=xa) ~> pp
vec_sub(a=pp, b=ta) ~> gg
get(arr=gg, idx=0) ~> gs0
vec_scale(a=xa, s=gs0) ~> rg0
sgd_update(weights=nr0, grad=rg0, lr=lr) ~> nr0
get(arr=gg, idx=1) ~> gs1
vec_scale(a=xa, s=gs1) ~> rg1
sgd_update(weights=nr1, grad=rg1, lr=lr) ~> nr1
get(arr=gg, idx=2) ~> gs2
vec_scale(a=xa, s=gs2) ~> rg2
sgd_update(weights=nr2, grad=rg2, lr=lr) ~> nr2
get(arr=gg, idx=3) ~> gs3
vec_scale(a=xa, s=gs3) ~> rg3
sgd_update(weights=nr3, grad=rg3, lr=lr) ~> nr3
linear_rows(r0=nr0, r1=nr1, r2=nr2, r3=nr3, bv=bv, x=xb) ~> pp
vec_sub(a=pp, b=tb) ~> gg
get(arr=gg, idx=0) ~> gs0
vec_scale(a=xb, s=gs0) ~> rg0
sgd_update(weights=nr0, grad=rg0, lr=lr) ~> nr0
get(arr=gg, idx=1) ~> gs1
vec_scale(a=xb, s=gs1) ~> rg1
sgd_update(weights=nr1, grad=rg1, lr=lr) ~> nr1
get(arr=gg, idx=2) ~> gs2
vec_scale(a=xb, s=gs2) ~> rg2
sgd_update(weights=nr2, grad=rg2, lr=lr) ~> nr2
get(arr=gg, idx=3) ~> gs3
vec_scale(a=xb, s=gs3) ~> rg3
sgd_update(weights=nr3, grad=rg3, lr=lr) ~> nr3
linear_rows(r0=nr0, r1=nr1, r2=nr2, r3=nr3, bv=bv, x=xc) ~> pp
vec_sub(a=pp, b=tc) ~> gg
get(arr=gg, idx=0) ~> gs0
vec_scale(a=xc, s=gs0) ~> rg0
sgd_update(weights=nr0, grad=rg0, lr=lr) ~> nr0
get(arr=gg, idx=1) ~> gs1
vec_scale(a=xc, s=gs1) ~> rg1
sgd_update(weights=nr1, grad=rg1, lr=lr) ~> nr1
get(arr=gg, idx=2) ~> gs2
vec_scale(a=xc, s=gs2) ~> rg2
sgd_update(weights=nr2, grad=rg2, lr=lr) ~> nr2
get(arr=gg, idx=3) ~> gs3
vec_scale(a=xc, s=gs3) ~> rg3
sgd_update(weights=nr3, grad=rg3, lr=lr) ~> nr3
linear_rows(r0=nr0, r1=nr1, r2=nr2, r3=nr3, bv=bv, x=xd) ~> pp
vec_sub(a=pp, b=td) ~> gg
get(arr=gg, idx=0) ~> gs0
vec_scale(a=xd, s=gs0) ~> rg0
sgd_update(weights=nr0, grad=rg0, lr=lr) ~> nr0
get(arr=gg, idx=1) ~> gs1
vec_scale(a=xd, s=gs1) ~> rg1
sgd_update(weights=nr1, grad=rg1, lr=lr) ~> nr1
get(arr=gg, idx=2) ~> gs2
vec_scale(a=xd, s=gs2) ~> rg2
sgd_update(weights=nr2, grad=rg2, lr=lr) ~> nr2
get(arr=gg, idx=3) ~> gs3
vec_scale(a=xd, s=gs3) ~> rg3
sgd_update(weights=nr3, grad=rg3, lr=lr) ~> nr3
linear_rows(r0=nr0, r1=nr1, r2=nr2, r3=nr3, bv=bv, x=xa) ~> pp
vec_sub(a=pp, b=ta) ~> gg
get(arr=gg, idx=0) ~> gs0
vec_scale(a=xa, s=gs0) ~> rg0
sgd_update(weights=nr0, grad=rg0, lr=lr) ~> nr0
get(arr=gg, idx=1) ~> gs1
vec_scale(a=xa, s=gs1) ~> rg1
sgd_update(weights=nr1, grad=rg1, lr=lr) ~> nr1
get(arr=gg, idx=2) ~> gs2
vec_scale(a=xa, s=gs2) ~> rg2
sgd_update(weights=nr2, grad=rg2, lr=lr) ~> nr2
get(arr=gg, idx=3) ~> gs3
vec_scale(a=xa, s=gs3) ~> rg3
sgd_update(weights=nr3, grad=rg3, lr=lr) ~> nr3
linear_rows(r0=nr0, r1=nr1, r2=nr2, r3=nr3, bv=bv, x=xb) ~> pp
vec_sub(a=pp, b=tb) ~> gg
get(arr=gg, idx=0) ~> gs0
vec_scale(a=xb, s=gs0) ~> rg0
sgd_update(weights=nr0, grad=rg0, lr=lr) ~> nr0
get(arr=gg, idx=1) ~> gs1
vec_scale(a=xb, s=gs1) ~> rg1
sgd_update(weights=nr1, grad=rg1, lr=lr) ~> nr1
get(arr=gg, idx=2) ~> gs2
vec_scale(a=xb, s=gs2) ~> rg2
sgd_update(weights=nr2, grad=rg2, lr=lr) ~> nr2
get(arr=gg, idx=3) ~> gs3
vec_scale(a=xb, s=gs3) ~> rg3
sgd_update(weights=nr3, grad=rg3, lr=lr) ~> nr3
linear_rows(r0=nr0, r1=nr1, r2=nr2, r3=nr3, bv=bv, x=xc) ~> pp
vec_sub(a=pp, b=tc) ~> gg
get(arr=gg, idx=0) ~> gs0
vec_scale(a=xc, s=gs0) ~> rg0
sgd_update(weights=nr0, grad=rg0, lr=lr) ~> nr0
get(arr=gg, idx=1) ~> gs1
vec_scale(a=xc, s=gs1) ~> rg1
sgd_update(weights=nr1, grad=rg1, lr=lr) ~> nr1
get(arr=gg, idx=2) ~> gs2
vec_scale(a=xc, s=gs2) ~> rg2
sgd_update(weights=nr2, grad=rg2, lr=lr) ~> nr2
get(arr=gg, idx=3) ~> gs3
vec_scale(a=xc, s=gs3) ~> rg3
sgd_update(weights=nr3, grad=rg3, lr=lr) ~> nr3
linear_rows(r0=nr0, r1=nr1, r2=nr2, r3=nr3, bv=bv, x=xd) ~> pp
vec_sub(a=pp, b=td) ~> gg
get(arr=gg, idx=0) ~> gs0
vec_scale(a=xd, s=gs0) ~> rg0
sgd_update(weights=nr0, grad=rg0, lr=lr) ~> nr0
get(arr=gg, idx=1) ~> gs1
vec_scale(a=xd, s=gs1) ~> rg1
sgd_update(weights=nr1, grad=rg1, lr=lr) ~> nr1
get(arr=gg, idx=2) ~> gs2
vec_scale(a=xd, s=gs2) ~> rg2
sgd_update(weights=nr2, grad=rg2, lr=lr) ~> nr2
get(arr=gg, idx=3) ~> gs3
vec_scale(a=xd, s=gs3) ~> rg3
sgd_update(weights=nr3, grad=rg3, lr=lr) ~> nr3
linear_rows(r0=nr0, r1=nr1, r2=nr2, r3=nr3, bv=bv, x=xa) ~> pp
vec_sub(a=pp, b=ta) ~> gg
get(arr=gg, idx=0) ~> gs0
vec_scale(a=xa, s=gs0) ~> rg0
sgd_update(weights=nr0, grad=rg0, lr=lr) ~> nr0
get(arr=gg, idx=1) ~> gs1
vec_scale(a=xa, s=gs1) ~> rg1
sgd_update(weights=nr1, grad=rg1, lr=lr) ~> nr1
get(arr=gg, idx=2) ~> gs2
vec_scale(a=xa, s=gs2) ~> rg2
sgd_update(weights=nr2, grad=rg2, lr=lr) ~> nr2
get(arr=gg, idx=3) ~> gs3
vec_scale(a=xa, s=gs3) ~> rg3
sgd_update(weights=nr3, grad=rg3, lr=lr) ~> nr3
linear_rows(r0=nr0, r1=nr1, r2=nr2, r3=nr3, bv=bv, x=xb) ~> pp
vec_sub(a=pp, b=tb) ~> gg
get(arr=gg, idx=0) ~> gs0
vec_scale(a=xb, s=gs0) ~> rg0
sgd_update(weights=nr0, grad=rg0, lr=lr) ~> nr0
get(arr=gg, idx=1) ~> gs1
vec_scale(a=xb, s=gs1) ~> rg1
sgd_update(weights=nr1, grad=rg1, lr=lr) ~> nr1
get(arr=gg, idx=2) ~> gs2
vec_scale(a=xb, s=gs2) ~> rg2
sgd_update(weights=nr2, grad=rg2, lr=lr) ~> nr2
get(arr=gg, idx=3) ~> gs3
vec_scale(a=xb, s=gs3) ~> rg3
sgd_update(weights=nr3, grad=rg3, lr=lr) ~> nr3
linear_rows(r0=nr0, r1=nr1, r2=nr2, r3=nr3, bv=bv, x=xc) ~> pp
vec_sub(a=pp, b=tc) ~> gg
get(arr=gg, idx=0) ~> gs0
vec_scale(a=xc, s=gs0) ~> rg0
sgd_update(weights=nr0, grad=rg0, lr=lr) ~> nr0
get(arr=gg, idx=1) ~> gs1
vec_scale(a=xc, s=gs1) ~> rg1
sgd_update(weights=nr1, grad=rg1, lr=lr) ~> nr1
get(arr=gg, idx=2) ~> gs2
vec_scale(a=xc, s=gs2) ~> rg2
sgd_update(weights=nr2, grad=rg2, lr=lr) ~> nr2
get(arr=gg, idx=3) ~> gs3
vec_scale(a=xc, s=gs3) ~> rg3
sgd_update(weights=nr3, grad=rg3, lr=lr) ~> nr3
linear_rows(r0=nr0, r1=nr1, r2=nr2, r3=nr3, bv=bv, x=xd) ~> pp
vec_sub(a=pp, b=td) ~> gg
get(arr=gg, idx=0) ~> gs0
vec_scale(a=xd, s=gs0) ~> rg0
sgd_update(weights=nr0, grad=rg0, lr=lr) ~> nr0
get(arr=gg, idx=1) ~> gs1
vec_scale(a=xd, s=gs1) ~> rg1
sgd_update(weights=nr1, grad=rg1, lr=lr) ~> nr1
get(arr=gg, idx=2) ~> gs2
vec_scale(a=xd, s=gs2) ~> rg2
sgd_update(weights=nr2, grad=rg2, lr=lr) ~> nr2
get(arr=gg, idx=3) ~> gs3
vec_scale(a=xd, s=gs3) ~> rg3
sgd_update(weights=nr3, grad=rg3, lr=lr) ~> nr3
linear_rows(r0=nr0, r1=nr1, r2=nr2, r3=nr3, bv=bv, x=xa) ~> pp
vec_sub(a=pp, b=ta) ~> gg
get(arr=gg, idx=0) ~> gs0
vec_scale(a=xa, s=gs0) ~> rg0
sgd_update(weights=nr0, grad=rg0, lr=lr) ~> nr0
get(arr=gg, idx=1) ~> gs1
vec_scale(a=xa, s=gs1) ~> rg1
sgd_update(weights=nr1, grad=rg1, lr=lr) ~> nr1
get(arr=gg, idx=2) ~> gs2
vec_scale(a=xa, s=gs2) ~> rg2
sgd_update(weights=nr2, grad=rg2, lr=lr) ~> nr2
get(arr=gg, idx=3) ~> gs3
vec_scale(a=xa, s=gs3) ~> rg3
sgd_update(weights=nr3, grad=rg3, lr=lr) ~> nr3
linear_rows(r0=nr0, r1=nr1, r2=nr2, r3=nr3, bv=bv, x=xb) ~> pp
vec_sub(a=pp, b=tb) ~> gg
get(arr=gg, idx=0) ~> gs0
vec_scale(a=xb, s=gs0) ~> rg0
sgd_update(weights=nr0, grad=rg0, lr=lr) ~> nr0
get(arr=gg, idx=1) ~> gs1
vec_scale(a=xb, s=gs1) ~> rg1
sgd_update(weights=nr1, grad=rg1, lr=lr) ~> nr1
get(arr=gg, idx=2) ~> gs2
vec_scale(a=xb, s=gs2) ~> rg2
sgd_update(weights=nr2, grad=rg2, lr=lr) ~> nr2
get(arr=gg, idx=3) ~> gs3
vec_scale(a=xb, s=gs3) ~> rg3
sgd_update(weights=nr3, grad=rg3, lr=lr) ~> nr3
linear_rows(r0=nr0, r1=nr1, r2=nr2, r3=nr3, bv=bv, x=xc) ~> pp
vec_sub(a=pp, b=tc) ~> gg
get(arr=gg, idx=0) ~> gs0
vec_scale(a=xc, s=gs0) ~> rg0
sgd_update(weights=nr0, grad=rg0, lr=lr) ~> nr0
get(arr=gg, idx=1) ~> gs1
vec_scale(a=xc, s=gs1) ~> rg1
sgd_update(weights=nr1, grad=rg1, lr=lr) ~> nr1
get(arr=gg, idx=2) ~> gs2
vec_scale(a=xc, s=gs2) ~> rg2
sgd_update(weights=nr2, grad=rg2, lr=lr) ~> nr2
get(arr=gg, idx=3) ~> gs3
vec_scale(a=xc, s=gs3) ~> rg3
sgd_update(weights=nr3, grad=rg3, lr=lr) ~> nr3
linear_rows(r0=nr0, r1=nr1, r2=nr2, r3=nr3, bv=bv, x=xd) ~> pp
vec_sub(a=pp, b=td) ~> gg
get(arr=gg, idx=0) ~> gs0
vec_scale(a=xd, s=gs0) ~> rg0
sgd_update(weights=nr0, grad=rg0, lr=lr) ~> nr0
get(arr=gg, idx=1) ~> gs1
vec_scale(a=xd, s=gs1) ~> rg1
sgd_update(weights=nr1, grad=rg1, lr=lr) ~> nr1
get(arr=gg, idx=2) ~> gs2
vec_scale(a=xd, s=gs2) ~> rg2
sgd_update(weights=nr2, grad=rg2, lr=lr) ~> nr2
get(arr=gg, idx=3) ~> gs3
vec_scale(a=xd, s=gs3) ~> rg3
sgd_update(weights=nr3, grad=rg3, lr=lr) ~> nr3
linear_rows(r0=nr0, r1=nr1, r2=nr2, r3=nr3, bv=bv, x=xa) ~> pp
vec_sub(a=pp, b=ta) ~> gg
get(arr=gg, idx=0) ~> gs0
vec_scale(a=xa, s=gs0) ~> rg0
sgd_update(weights=nr0, grad=rg0, lr=lr) ~> nr0
get(arr=gg, idx=1) ~> gs1
vec_scale(a=xa, s=gs1) ~> rg1
sgd_update(weights=nr1, grad=rg1, lr=lr) ~> nr1
get(arr=gg, idx=2) ~> gs2
vec_scale(a=xa, s=gs2) ~> rg2
sgd_update(weights=nr2, grad=rg2, lr=lr) ~> nr2
get(arr=gg, idx=3) ~> gs3
vec_scale(a=xa, s=gs3) ~> rg3
sgd_update(weights=nr3, grad=rg3, lr=lr) ~> nr3
linear_rows(r0=nr0, r1=nr1, r2=nr2, r3=nr3, bv=bv, x=xb) ~> pp
vec_sub(a=pp, b=tb) ~> gg
get(arr=gg, idx=0) ~> gs0
vec_scale(a=xb, s=gs0) ~> rg0
sgd_update(weights=nr0, grad=rg0, lr=lr) ~> nr0
get(arr=gg, idx=1) ~> gs1
vec_scale(a=xb, s=gs1) ~> rg1
sgd_update(weights=nr1, grad=rg1, lr=lr) ~> nr1
get(arr=gg, idx=2) ~> gs2
vec_scale(a=xb, s=gs2) ~> rg2
sgd_update(weights=nr2, grad=rg2, lr=lr) ~> nr2
get(arr=gg, idx=3) ~> gs3
vec_scale(a=xb, s=gs3) ~> rg3
sgd_update(weights=nr3, grad=rg3, lr=lr) ~> nr3
linear_rows(r0=nr0, r1=nr1, r2=nr2, r3=nr3, bv=bv, x=xc) ~> pp
vec_sub(a=pp, b=tc) ~> gg
get(arr=gg, idx=0) ~> gs0
vec_scale(a=xc, s=gs0) ~> rg0
sgd_update(weights=nr0, grad=rg0, lr=lr) ~> nr0
get(arr=gg, idx=1) ~> gs1
vec_scale(a=xc, s=gs1) ~> rg1
sgd_update(weights=nr1, grad=rg1, lr=lr) ~> nr1
get(arr=gg, idx=2) ~> gs2
vec_scale(a=xc, s=gs2) ~> rg2
sgd_update(weights=nr2, grad=rg2, lr=lr) ~> nr2
get(arr=gg, idx=3) ~> gs3
vec_scale(a=xc, s=gs3) ~> rg3
sgd_update(weights=nr3, grad=rg3, lr=lr) ~> nr3
linear_rows(r0=nr0, r1=nr1, r2=nr2, r3=nr3, bv=bv, x=xd) ~> pp
vec_sub(a=pp, b=td) ~> gg
get(arr=gg, idx=0) ~> gs0
vec_scale(a=xd, s=gs0) ~> rg0
sgd_update(weights=nr0, grad=rg0, lr=lr) ~> nr0
get(arr=gg, idx=1) ~> gs1
vec_scale(a=xd, s=gs1) ~> rg1
sgd_update(weights=nr1, grad=rg1, lr=lr) ~> nr1
get(arr=gg, idx=2) ~> gs2
vec_scale(a=xd, s=gs2) ~> rg2
sgd_update(weights=nr2, grad=rg2, lr=lr) ~> nr2
get(arr=gg, idx=3) ~> gs3
vec_scale(a=xd, s=gs3) ~> rg3
sgd_update(weights=nr3, grad=rg3, lr=lr) ~> nr3
linear_rows(r0=nr0, r1=nr1, r2=nr2, r3=nr3, bv=bv, x=xa) ~> pp
vec_sub(a=pp, b=ta) ~> gg
get(arr=gg, idx=0) ~> gs0
vec_scale(a=xa, s=gs0) ~> rg0
sgd_update(weights=nr0, grad=rg0, lr=lr) ~> nr0
get(arr=gg, idx=1) ~> gs1
vec_scale(a=xa, s=gs1) ~> rg1
sgd_update(weights=nr1, grad=rg1, lr=lr) ~> nr1
get(arr=gg, idx=2) ~> gs2
vec_scale(a=xa, s=gs2) ~> rg2
sgd_update(weights=nr2, grad=rg2, lr=lr) ~> nr2
get(arr=gg, idx=3) ~> gs3
vec_scale(a=xa, s=gs3) ~> rg3
sgd_update(weights=nr3, grad=rg3, lr=lr) ~> nr3
linear_rows(r0=nr0, r1=nr1, r2=nr2, r3=nr3, bv=bv, x=xb) ~> pp
vec_sub(a=pp, b=tb) ~> gg
get(arr=gg, idx=0) ~> gs0
vec_scale(a=xb, s=gs0) ~> rg0
sgd_update(weights=nr0, grad=rg0, lr=lr) ~> nr0
get(arr=gg, idx=1) ~> gs1
vec_scale(a=xb, s=gs1) ~> rg1
sgd_update(weights=nr1, grad=rg1, lr=lr) ~> nr1
get(arr=gg, idx=2) ~> gs2
vec_scale(a=xb, s=gs2) ~> rg2
sgd_update(weights=nr2, grad=rg2, lr=lr) ~> nr2
get(arr=gg, idx=3) ~> gs3
vec_scale(a=xb, s=gs3) ~> rg3
sgd_update(weights=nr3, grad=rg3, lr=lr) ~> nr3
linear_rows(r0=nr0, r1=nr1, r2=nr2, r3=nr3, bv=bv, x=xc) ~> pp
vec_sub(a=pp, b=tc) ~> gg
get(arr=gg, idx=0) ~> gs0
vec_scale(a=xc, s=gs0) ~> rg0
sgd_update(weights=nr0, grad=rg0, lr=lr) ~> nr0
get(arr=gg, idx=1) ~> gs1
vec_scale(a=xc, s=gs1) ~> rg1
sgd_update(weights=nr1, grad=rg1, lr=lr) ~> nr1
get(arr=gg, idx=2) ~> gs2
vec_scale(a=xc, s=gs2) ~> rg2
sgd_update(weights=nr2, grad=rg2, lr=lr) ~> nr2
get(arr=gg, idx=3) ~> gs3
vec_scale(a=xc, s=gs3) ~> rg3
sgd_update(weights=nr3, grad=rg3, lr=lr) ~> nr3
linear_rows(r0=nr0, r1=nr1, r2=nr2, r3=nr3, bv=bv, x=xd) ~> pp
vec_sub(a=pp, b=td) ~> gg
get(arr=gg, idx=0) ~> gs0
vec_scale(a=xd, s=gs0) ~> rg0
sgd_update(weights=nr0, grad=rg0, lr=lr) ~> nr0
get(arr=gg, idx=1) ~> gs1
vec_scale(a=xd, s=gs1) ~> rg1
sgd_update(weights=nr1, grad=rg1, lr=lr) ~> nr1
get(arr=gg, idx=2) ~> gs2
vec_scale(a=xd, s=gs2) ~> rg2
sgd_update(weights=nr2, grad=rg2, lr=lr) ~> nr2
get(arr=gg, idx=3) ~> gs3
vec_scale(a=xd, s=gs3) ~> rg3
sgd_update(weights=nr3, grad=rg3, lr=lr) ~> nr3
linear_rows(r0=nr0, r1=nr1, r2=nr2, r3=nr3, bv=bv, x=xa) ~> pp
vec_sub(a=pp, b=ta) ~> gg
get(arr=gg, idx=0) ~> gs0
vec_scale(a=xa, s=gs0) ~> rg0
sgd_update(weights=nr0, grad=rg0, lr=lr) ~> nr0
get(arr=gg, idx=1) ~> gs1
vec_scale(a=xa, s=gs1) ~> rg1
sgd_update(weights=nr1, grad=rg1, lr=lr) ~> nr1
get(arr=gg, idx=2) ~> gs2
vec_scale(a=xa, s=gs2) ~> rg2
sgd_update(weights=nr2, grad=rg2, lr=lr) ~> nr2
get(arr=gg, idx=3) ~> gs3
vec_scale(a=xa, s=gs3) ~> rg3
sgd_update(weights=nr3, grad=rg3, lr=lr) ~> nr3
linear_rows(r0=nr0, r1=nr1, r2=nr2, r3=nr3, bv=bv, x=xb) ~> pp
vec_sub(a=pp, b=tb) ~> gg
get(arr=gg, idx=0) ~> gs0
vec_scale(a=xb, s=gs0) ~> rg0
sgd_update(weights=nr0, grad=rg0, lr=lr) ~> nr0
get(arr=gg, idx=1) ~> gs1
vec_scale(a=xb, s=gs1) ~> rg1
sgd_update(weights=nr1, grad=rg1, lr=lr) ~> nr1
get(arr=gg, idx=2) ~> gs2
vec_scale(a=xb, s=gs2) ~> rg2
sgd_update(weights=nr2, grad=rg2, lr=lr) ~> nr2
get(arr=gg, idx=3) ~> gs3
vec_scale(a=xb, s=gs3) ~> rg3
sgd_update(weights=nr3, grad=rg3, lr=lr) ~> nr3
linear_rows(r0=nr0, r1=nr1, r2=nr2, r3=nr3, bv=bv, x=xc) ~> pp
vec_sub(a=pp, b=tc) ~> gg
get(arr=gg, idx=0) ~> gs0
vec_scale(a=xc, s=gs0) ~> rg0
sgd_update(weights=nr0, grad=rg0, lr=lr) ~> nr0
get(arr=gg, idx=1) ~> gs1
vec_scale(a=xc, s=gs1) ~> rg1
sgd_update(weights=nr1, grad=rg1, lr=lr) ~> nr1
get(arr=gg, idx=2) ~> gs2
vec_scale(a=xc, s=gs2) ~> rg2
sgd_update(weights=nr2, grad=rg2, lr=lr) ~> nr2
get(arr=gg, idx=3) ~> gs3
vec_scale(a=xc, s=gs3) ~> rg3
sgd_update(weights=nr3, grad=rg3, lr=lr) ~> nr3
linear_rows(r0=nr0, r1=nr1, r2=nr2, r3=nr3, bv=bv, x=xd) ~> pp
vec_sub(a=pp, b=td) ~> gg
get(arr=gg, idx=0) ~> gs0
vec_scale(a=xd, s=gs0) ~> rg0
sgd_update(weights=nr0, grad=rg0, lr=lr) ~> nr0
get(arr=gg, idx=1) ~> gs1
vec_scale(a=xd, s=gs1) ~> rg1
sgd_update(weights=nr1, grad=rg1, lr=lr) ~> nr1
get(arr=gg, idx=2) ~> gs2
vec_scale(a=xd, s=gs2) ~> rg2
sgd_update(weights=nr2, grad=rg2, lr=lr) ~> nr2
get(arr=gg, idx=3) ~> gs3
vec_scale(a=xd, s=gs3) ~> rg3
sgd_update(weights=nr3, grad=rg3, lr=lr) ~> nr3
linear_rows(r0=nr0, r1=nr1, r2=nr2, r3=nr3, bv=bv, x=xa) ~> pp
vec_sub(a=pp, b=ta) ~> gg
get(arr=gg, idx=0) ~> gs0
vec_scale(a=xa, s=gs0) ~> rg0
sgd_update(weights=nr0, grad=rg0, lr=lr) ~> nr0
get(arr=gg, idx=1) ~> gs1
vec_scale(a=xa, s=gs1) ~> rg1
sgd_update(weights=nr1, grad=rg1, lr=lr) ~> nr1
get(arr=gg, idx=2) ~> gs2
vec_scale(a=xa, s=gs2) ~> rg2
sgd_update(weights=nr2, grad=rg2, lr=lr) ~> nr2
get(arr=gg, idx=3) ~> gs3
vec_scale(a=xa, s=gs3) ~> rg3
sgd_update(weights=nr3, grad=rg3, lr=lr) ~> nr3
linear_rows(r0=nr0, r1=nr1, r2=nr2, r3=nr3, bv=bv, x=xb) ~> pp
vec_sub(a=pp, b=tb) ~> gg
get(arr=gg, idx=0) ~> gs0
vec_scale(a=xb, s=gs0) ~> rg0
sgd_update(weights=nr0, grad=rg0, lr=lr) ~> nr0
get(arr=gg, idx=1) ~> gs1
vec_scale(a=xb, s=gs1) ~> rg1
sgd_update(weights=nr1, grad=rg1, lr=lr) ~> nr1
get(arr=gg, idx=2) ~> gs2
vec_scale(a=xb, s=gs2) ~> rg2
sgd_update(weights=nr2, grad=rg2, lr=lr) ~> nr2
get(arr=gg, idx=3) ~> gs3
vec_scale(a=xb, s=gs3) ~> rg3
sgd_update(weights=nr3, grad=rg3, lr=lr) ~> nr3
linear_rows(r0=nr0, r1=nr1, r2=nr2, r3=nr3, bv=bv, x=xc) ~> pp
vec_sub(a=pp, b=tc) ~> gg
get(arr=gg, idx=0) ~> gs0
vec_scale(a=xc, s=gs0) ~> rg0
sgd_update(weights=nr0, grad=rg0, lr=lr) ~> nr0
get(arr=gg, idx=1) ~> gs1
vec_scale(a=xc, s=gs1) ~> rg1
sgd_update(weights=nr1, grad=rg1, lr=lr) ~> nr1
get(arr=gg, idx=2) ~> gs2
vec_scale(a=xc, s=gs2) ~> rg2
sgd_update(weights=nr2, grad=rg2, lr=lr) ~> nr2
get(arr=gg, idx=3) ~> gs3
vec_scale(a=xc, s=gs3) ~> rg3
sgd_update(weights=nr3, grad=rg3, lr=lr) ~> nr3
linear_rows(r0=nr0, r1=nr1, r2=nr2, r3=nr3, bv=bv, x=xd) ~> pp
vec_sub(a=pp, b=td) ~> gg
get(arr=gg, idx=0) ~> gs0
vec_scale(a=xd, s=gs0) ~> rg0
sgd_update(weights=nr0, grad=rg0, lr=lr) ~> nr0
get(arr=gg, idx=1) ~> gs1
vec_scale(a=xd, s=gs1) ~> rg1
sgd_update(weights=nr1, grad=rg1, lr=lr) ~> nr1
get(arr=gg, idx=2) ~> gs2
vec_scale(a=xd, s=gs2) ~> rg2
sgd_update(weights=nr2, grad=rg2, lr=lr) ~> nr2
get(arr=gg, idx=3) ~> gs3
vec_scale(a=xd, s=gs3) ~> rg3
sgd_update(weights=nr3, grad=rg3, lr=lr) ~> nr3
linear_rows(r0=nr0, r1=nr1, r2=nr2, r3=nr3, bv=bv, x=xa) ~> pp
vec_sub(a=pp, b=ta) ~> gg
get(arr=gg, idx=0) ~> gs0
vec_scale(a=xa, s=gs0) ~> rg0
sgd_update(weights=nr0, grad=rg0, lr=lr) ~> nr0
get(arr=gg, idx=1) ~> gs1
vec_scale(a=xa, s=gs1) ~> rg1
sgd_update(weights=nr1, grad=rg1, lr=lr) ~> nr1
get(arr=gg, idx=2) ~> gs2
vec_scale(a=xa, s=gs2) ~> rg2
sgd_update(weights=nr2, grad=rg2, lr=lr) ~> nr2
get(arr=gg, idx=3) ~> gs3
vec_scale(a=xa, s=gs3) ~> rg3
sgd_update(weights=nr3, grad=rg3, lr=lr) ~> nr3
linear_rows(r0=nr0, r1=nr1, r2=nr2, r3=nr3, bv=bv, x=xb) ~> pp
vec_sub(a=pp, b=tb) ~> gg
get(arr=gg, idx=0) ~> gs0
vec_scale(a=xb, s=gs0) ~> rg0
sgd_update(weights=nr0, grad=rg0, lr=lr) ~> nr0
get(arr=gg, idx=1) ~> gs1
vec_scale(a=xb, s=gs1) ~> rg1
sgd_update(weights=nr1, grad=rg1, lr=lr) ~> nr1
get(arr=gg, idx=2) ~> gs2
vec_scale(a=xb, s=gs2) ~> rg2
sgd_update(weights=nr2, grad=rg2, lr=lr) ~> nr2
get(arr=gg, idx=3) ~> gs3
vec_scale(a=xb, s=gs3) ~> rg3
sgd_update(weights=nr3, grad=rg3, lr=lr) ~> nr3
linear_rows(r0=nr0, r1=nr1, r2=nr2, r3=nr3, bv=bv, x=xc) ~> pp
vec_sub(a=pp, b=tc) ~> gg
get(arr=gg, idx=0) ~> gs0
vec_scale(a=xc, s=gs0) ~> rg0
sgd_update(weights=nr0, grad=rg0, lr=lr) ~> nr0
get(arr=gg, idx=1) ~> gs1
vec_scale(a=xc, s=gs1) ~> rg1
sgd_update(weights=nr1, grad=rg1, lr=lr) ~> nr1
get(arr=gg, idx=2) ~> gs2
vec_scale(a=xc, s=gs2) ~> rg2
sgd_update(weights=nr2, grad=rg2, lr=lr) ~> nr2
get(arr=gg, idx=3) ~> gs3
vec_scale(a=xc, s=gs3) ~> rg3
sgd_update(weights=nr3, grad=rg3, lr=lr) ~> nr3
linear_rows(r0=nr0, r1=nr1, r2=nr2, r3=nr3, bv=bv, x=xd) ~> pp
vec_sub(a=pp, b=td) ~> gg
get(arr=gg, idx=0) ~> gs0
vec_scale(a=xd, s=gs0) ~> rg0
sgd_update(weights=nr0, grad=rg0, lr=lr) ~> nr0
get(arr=gg, idx=1) ~> gs1
vec_scale(a=xd, s=gs1) ~> rg1
sgd_update(weights=nr1, grad=rg1, lr=lr) ~> nr1
get(arr=gg, idx=2) ~> gs2
vec_scale(a=xd, s=gs2) ~> rg2
sgd_update(weights=nr2, grad=rg2, lr=lr) ~> nr2
get(arr=gg, idx=3) ~> gs3
vec_scale(a=xd, s=gs3) ~> rg3
sgd_update(weights=nr3, grad=rg3, lr=lr) ~> nr3
linear_rows(r0=nr0, r1=nr1, r2=nr2, r3=nr3, bv=bv, x=xa) ~> pp
vec_sub(a=pp, b=ta) ~> gg
get(arr=gg, idx=0) ~> gs0
vec_scale(a=xa, s=gs0) ~> rg0
sgd_update(weights=nr0, grad=rg0, lr=lr) ~> nr0
get(arr=gg, idx=1) ~> gs1
vec_scale(a=xa, s=gs1) ~> rg1
sgd_update(weights=nr1, grad=rg1, lr=lr) ~> nr1
get(arr=gg, idx=2) ~> gs2
vec_scale(a=xa, s=gs2) ~> rg2
sgd_update(weights=nr2, grad=rg2, lr=lr) ~> nr2
get(arr=gg, idx=3) ~> gs3
vec_scale(a=xa, s=gs3) ~> rg3
sgd_update(weights=nr3, grad=rg3, lr=lr) ~> nr3
linear_rows(r0=nr0, r1=nr1, r2=nr2, r3=nr3, bv=bv, x=xb) ~> pp
vec_sub(a=pp, b=tb) ~> gg
get(arr=gg, idx=0) ~> gs0
vec_scale(a=xb, s=gs0) ~> rg0
sgd_update(weights=nr0, grad=rg0, lr=lr) ~> nr0
get(arr=gg, idx=1) ~> gs1
vec_scale(a=xb, s=gs1) ~> rg1
sgd_update(weights=nr1, grad=rg1, lr=lr) ~> nr1
get(arr=gg, idx=2) ~> gs2
vec_scale(a=xb, s=gs2) ~> rg2
sgd_update(weights=nr2, grad=rg2, lr=lr) ~> nr2
get(arr=gg, idx=3) ~> gs3
vec_scale(a=xb, s=gs3) ~> rg3
sgd_update(weights=nr3, grad=rg3, lr=lr) ~> nr3
linear_rows(r0=nr0, r1=nr1, r2=nr2, r3=nr3, bv=bv, x=xc) ~> pp
vec_sub(a=pp, b=tc) ~> gg
get(arr=gg, idx=0) ~> gs0
vec_scale(a=xc, s=gs0) ~> rg0
sgd_update(weights=nr0, grad=rg0, lr=lr) ~> nr0
get(arr=gg, idx=1) ~> gs1
vec_scale(a=xc, s=gs1) ~> rg1
sgd_update(weights=nr1, grad=rg1, lr=lr) ~> nr1
get(arr=gg, idx=2) ~> gs2
vec_scale(a=xc, s=gs2) ~> rg2
sgd_update(weights=nr2, grad=rg2, lr=lr) ~> nr2
get(arr=gg, idx=3) ~> gs3
vec_scale(a=xc, s=gs3) ~> rg3
sgd_update(weights=nr3, grad=rg3, lr=lr) ~> nr3
linear_rows(r0=nr0, r1=nr1, r2=nr2, r3=nr3, bv=bv, x=xd) ~> pp
vec_sub(a=pp, b=td) ~> gg
get(arr=gg, idx=0) ~> gs0
vec_scale(a=xd, s=gs0) ~> rg0
sgd_update(weights=nr0, grad=rg0, lr=lr) ~> nr0
get(arr=gg, idx=1) ~> gs1
vec_scale(a=xd, s=gs1) ~> rg1
sgd_update(weights=nr1, grad=rg1, lr=lr) ~> nr1
get(arr=gg, idx=2) ~> gs2
vec_scale(a=xd, s=gs2) ~> rg2
sgd_update(weights=nr2, grad=rg2, lr=lr) ~> nr2
get(arr=gg, idx=3) ~> gs3
vec_scale(a=xd, s=gs3) ~> rg3
sgd_update(weights=nr3, grad=rg3, lr=lr) ~> nr3
linear_rows(r0=nr0, r1=nr1, r2=nr2, r3=nr3, bv=bv, x=xa) ~> pp
vec_sub(a=pp, b=ta) ~> gg
get(arr=gg, idx=0) ~> gs0
vec_scale(a=xa, s=gs0) ~> rg0
sgd_update(weights=nr0, grad=rg0, lr=lr) ~> nr0
get(arr=gg, idx=1) ~> gs1
vec_scale(a=xa, s=gs1) ~> rg1
sgd_update(weights=nr1, grad=rg1, lr=lr) ~> nr1
get(arr=gg, idx=2) ~> gs2
vec_scale(a=xa, s=gs2) ~> rg2
sgd_update(weights=nr2, grad=rg2, lr=lr) ~> nr2
get(arr=gg, idx=3) ~> gs3
vec_scale(a=xa, s=gs3) ~> rg3
sgd_update(weights=nr3, grad=rg3, lr=lr) ~> nr3
linear_rows(r0=nr0, r1=nr1, r2=nr2, r3=nr3, bv=bv, x=xb) ~> pp
vec_sub(a=pp, b=tb) ~> gg
get(arr=gg, idx=0) ~> gs0
vec_scale(a=xb, s=gs0) ~> rg0
sgd_update(weights=nr0, grad=rg0, lr=lr) ~> nr0
get(arr=gg, idx=1) ~> gs1
vec_scale(a=xb, s=gs1) ~> rg1
sgd_update(weights=nr1, grad=rg1, lr=lr) ~> nr1
get(arr=gg, idx=2) ~> gs2
vec_scale(a=xb, s=gs2) ~> rg2
sgd_update(weights=nr2, grad=rg2, lr=lr) ~> nr2
get(arr=gg, idx=3) ~> gs3
vec_scale(a=xb, s=gs3) ~> rg3
sgd_update(weights=nr3, grad=rg3, lr=lr) ~> nr3
linear_rows(r0=nr0, r1=nr1, r2=nr2, r3=nr3, bv=bv, x=xc) ~> pp
vec_sub(a=pp, b=tc) ~> gg
get(arr=gg, idx=0) ~> gs0
vec_scale(a=xc, s=gs0) ~> rg0
sgd_update(weights=nr0, grad=rg0, lr=lr) ~> nr0
get(arr=gg, idx=1) ~> gs1
vec_scale(a=xc, s=gs1) ~> rg1
sgd_update(weights=nr1, grad=rg1, lr=lr) ~> nr1
get(arr=gg, idx=2) ~> gs2
vec_scale(a=xc, s=gs2) ~> rg2
sgd_update(weights=nr2, grad=rg2, lr=lr) ~> nr2
get(arr=gg, idx=3) ~> gs3
vec_scale(a=xc, s=gs3) ~> rg3
sgd_update(weights=nr3, grad=rg3, lr=lr) ~> nr3
linear_rows(r0=nr0, r1=nr1, r2=nr2, r3=nr3, bv=bv, x=xd) ~> pp
vec_sub(a=pp, b=td) ~> gg
get(arr=gg, idx=0) ~> gs0
vec_scale(a=xd, s=gs0) ~> rg0
sgd_update(weights=nr0, grad=rg0, lr=lr) ~> nr0
get(arr=gg, idx=1) ~> gs1
vec_scale(a=xd, s=gs1) ~> rg1
sgd_update(weights=nr1, grad=rg1, lr=lr) ~> nr1
get(arr=gg, idx=2) ~> gs2
vec_scale(a=xd, s=gs2) ~> rg2
sgd_update(weights=nr2, grad=rg2, lr=lr) ~> nr2
get(arr=gg, idx=3) ~> gs3
vec_scale(a=xd, s=gs3) ~> rg3
sgd_update(weights=nr3, grad=rg3, lr=lr) ~> nr3
linear_rows(r0=nr0, r1=nr1, r2=nr2, r3=nr3, bv=bv, x=xa) ~> pp
vec_sub(a=pp, b=ta) ~> gg
get(arr=gg, idx=0) ~> gs0
vec_scale(a=xa, s=gs0) ~> rg0
sgd_update(weights=nr0, grad=rg0, lr=lr) ~> nr0
get(arr=gg, idx=1) ~> gs1
vec_scale(a=xa, s=gs1) ~> rg1
sgd_update(weights=nr1, grad=rg1, lr=lr) ~> nr1
get(arr=gg, idx=2) ~> gs2
vec_scale(a=xa, s=gs2) ~> rg2
sgd_update(weights=nr2, grad=rg2, lr=lr) ~> nr2
get(arr=gg, idx=3) ~> gs3
vec_scale(a=xa, s=gs3) ~> rg3
sgd_update(weights=nr3, grad=rg3, lr=lr) ~> nr3
linear_rows(r0=nr0, r1=nr1, r2=nr2, r3=nr3, bv=bv, x=xb) ~> pp
vec_sub(a=pp, b=tb) ~> gg
get(arr=gg, idx=0) ~> gs0
vec_scale(a=xb, s=gs0) ~> rg0
sgd_update(weights=nr0, grad=rg0, lr=lr) ~> nr0
get(arr=gg, idx=1) ~> gs1
vec_scale(a=xb, s=gs1) ~> rg1
sgd_update(weights=nr1, grad=rg1, lr=lr) ~> nr1
get(arr=gg, idx=2) ~> gs2
vec_scale(a=xb, s=gs2) ~> rg2
sgd_update(weights=nr2, grad=rg2, lr=lr) ~> nr2
get(arr=gg, idx=3) ~> gs3
vec_scale(a=xb, s=gs3) ~> rg3
sgd_update(weights=nr3, grad=rg3, lr=lr) ~> nr3
linear_rows(r0=nr0, r1=nr1, r2=nr2, r3=nr3, bv=bv, x=xc) ~> pp
vec_sub(a=pp, b=tc) ~> gg
get(arr=gg, idx=0) ~> gs0
vec_scale(a=xc, s=gs0) ~> rg0
sgd_update(weights=nr0, grad=rg0, lr=lr) ~> nr0
get(arr=gg, idx=1) ~> gs1
vec_scale(a=xc, s=gs1) ~> rg1
sgd_update(weights=nr1, grad=rg1, lr=lr) ~> nr1
get(arr=gg, idx=2) ~> gs2
vec_scale(a=xc, s=gs2) ~> rg2
sgd_update(weights=nr2, grad=rg2, lr=lr) ~> nr2
get(arr=gg, idx=3) ~> gs3
vec_scale(a=xc, s=gs3) ~> rg3
sgd_update(weights=nr3, grad=rg3, lr=lr) ~> nr3
linear_rows(r0=nr0, r1=nr1, r2=nr2, r3=nr3, bv=bv, x=xd) ~> pp
vec_sub(a=pp, b=td) ~> gg
get(arr=gg, idx=0) ~> gs0
vec_scale(a=xd, s=gs0) ~> rg0
sgd_update(weights=nr0, grad=rg0, lr=lr) ~> nr0
get(arr=gg, idx=1) ~> gs1
vec_scale(a=xd, s=gs1) ~> rg1
sgd_update(weights=nr1, grad=rg1, lr=lr) ~> nr1
get(arr=gg, idx=2) ~> gs2
vec_scale(a=xd, s=gs2) ~> rg2
sgd_update(weights=nr2, grad=rg2, lr=lr) ~> nr2
get(arr=gg, idx=3) ~> gs3
vec_scale(a=xd, s=gs3) ~> rg3
sgd_update(weights=nr3, grad=rg3, lr=lr) ~> nr3
linear_rows(r0=nr0, r1=nr1, r2=nr2, r3=nr3, bv=bv, x=xa) ~> pp
vec_sub(a=pp, b=ta) ~> gg
get(arr=gg, idx=0) ~> gs0
vec_scale(a=xa, s=gs0) ~> rg0
sgd_update(weights=nr0, grad=rg0, lr=lr) ~> nr0
get(arr=gg, idx=1) ~> gs1
vec_scale(a=xa, s=gs1) ~> rg1
sgd_update(weights=nr1, grad=rg1, lr=lr) ~> nr1
get(arr=gg, idx=2) ~> gs2
vec_scale(a=xa, s=gs2) ~> rg2
sgd_update(weights=nr2, grad=rg2, lr=lr) ~> nr2
get(arr=gg, idx=3) ~> gs3
vec_scale(a=xa, s=gs3) ~> rg3
sgd_update(weights=nr3, grad=rg3, lr=lr) ~> nr3
linear_rows(r0=nr0, r1=nr1, r2=nr2, r3=nr3, bv=bv, x=xb) ~> pp
vec_sub(a=pp, b=tb) ~> gg
get(arr=gg, idx=0) ~> gs0
vec_scale(a=xb, s=gs0) ~> rg0
sgd_update(weights=nr0, grad=rg0, lr=lr) ~> nr0
get(arr=gg, idx=1) ~> gs1
vec_scale(a=xb, s=gs1) ~> rg1
sgd_update(weights=nr1, grad=rg1, lr=lr) ~> nr1
get(arr=gg, idx=2) ~> gs2
vec_scale(a=xb, s=gs2) ~> rg2
sgd_update(weights=nr2, grad=rg2, lr=lr) ~> nr2
get(arr=gg, idx=3) ~> gs3
vec_scale(a=xb, s=gs3) ~> rg3
sgd_update(weights=nr3, grad=rg3, lr=lr) ~> nr3
linear_rows(r0=nr0, r1=nr1, r2=nr2, r3=nr3, bv=bv, x=xc) ~> pp
vec_sub(a=pp, b=tc) ~> gg
get(arr=gg, idx=0) ~> gs0
vec_scale(a=xc, s=gs0) ~> rg0
sgd_update(weights=nr0, grad=rg0, lr=lr) ~> nr0
get(arr=gg, idx=1) ~> gs1
vec_scale(a=xc, s=gs1) ~> rg1
sgd_update(weights=nr1, grad=rg1, lr=lr) ~> nr1
get(arr=gg, idx=2) ~> gs2
vec_scale(a=xc, s=gs2) ~> rg2
sgd_update(weights=nr2, grad=rg2, lr=lr) ~> nr2
get(arr=gg, idx=3) ~> gs3
vec_scale(a=xc, s=gs3) ~> rg3
sgd_update(weights=nr3, grad=rg3, lr=lr) ~> nr3
linear_rows(r0=nr0, r1=nr1, r2=nr2, r3=nr3, bv=bv, x=xd) ~> pp
vec_sub(a=pp, b=td) ~> gg
get(arr=gg, idx=0) ~> gs0
vec_scale(a=xd, s=gs0) ~> rg0
sgd_update(weights=nr0, grad=rg0, lr=lr) ~> nr0
get(arr=gg, idx=1) ~> gs1
vec_scale(a=xd, s=gs1) ~> rg1
sgd_update(weights=nr1, grad=rg1, lr=lr) ~> nr1
get(arr=gg, idx=2) ~> gs2
vec_scale(a=xd, s=gs2) ~> rg2
sgd_update(weights=nr2, grad=rg2, lr=lr) ~> nr2
get(arr=gg, idx=3) ~> gs3
vec_scale(a=xd, s=gs3) ~> rg3
sgd_update(weights=nr3, grad=rg3, lr=lr) ~> nr3
linear_rows(r0=nr0, r1=nr1, r2=nr2, r3=nr3, bv=bv, x=xa) ~> pp
vec_sub(a=pp, b=ta) ~> gg
get(arr=gg, idx=0) ~> gs0
vec_scale(a=xa, s=gs0) ~> rg0
sgd_update(weights=nr0, grad=rg0, lr=lr) ~> nr0
get(arr=gg, idx=1) ~> gs1
vec_scale(a=xa, s=gs1) ~> rg1
sgd_update(weights=nr1, grad=rg1, lr=lr) ~> nr1
get(arr=gg, idx=2) ~> gs2
vec_scale(a=xa, s=gs2) ~> rg2
sgd_update(weights=nr2, grad=rg2, lr=lr) ~> nr2
get(arr=gg, idx=3) ~> gs3
vec_scale(a=xa, s=gs3) ~> rg3
sgd_update(weights=nr3, grad=rg3, lr=lr) ~> nr3
linear_rows(r0=nr0, r1=nr1, r2=nr2, r3=nr3, bv=bv, x=xb) ~> pp
vec_sub(a=pp, b=tb) ~> gg
get(arr=gg, idx=0) ~> gs0
vec_scale(a=xb, s=gs0) ~> rg0
sgd_update(weights=nr0, grad=rg0, lr=lr) ~> nr0
get(arr=gg, idx=1) ~> gs1
vec_scale(a=xb, s=gs1) ~> rg1
sgd_update(weights=nr1, grad=rg1, lr=lr) ~> nr1
get(arr=gg, idx=2) ~> gs2
vec_scale(a=xb, s=gs2) ~> rg2
sgd_update(weights=nr2, grad=rg2, lr=lr) ~> nr2
get(arr=gg, idx=3) ~> gs3
vec_scale(a=xb, s=gs3) ~> rg3
sgd_update(weights=nr3, grad=rg3, lr=lr) ~> nr3
linear_rows(r0=nr0, r1=nr1, r2=nr2, r3=nr3, bv=bv, x=xc) ~> pp
vec_sub(a=pp, b=tc) ~> gg
get(arr=gg, idx=0) ~> gs0
vec_scale(a=xc, s=gs0) ~> rg0
sgd_update(weights=nr0, grad=rg0, lr=lr) ~> nr0
get(arr=gg, idx=1) ~> gs1
vec_scale(a=xc, s=gs1) ~> rg1
sgd_update(weights=nr1, grad=rg1, lr=lr) ~> nr1
get(arr=gg, idx=2) ~> gs2
vec_scale(a=xc, s=gs2) ~> rg2
sgd_update(weights=nr2, grad=rg2, lr=lr) ~> nr2
get(arr=gg, idx=3) ~> gs3
vec_scale(a=xc, s=gs3) ~> rg3
sgd_update(weights=nr3, grad=rg3, lr=lr) ~> nr3
linear_rows(r0=nr0, r1=nr1, r2=nr2, r3=nr3, bv=bv, x=xd) ~> pp
vec_sub(a=pp, b=td) ~> gg
get(arr=gg, idx=0) ~> gs0
vec_scale(a=xd, s=gs0) ~> rg0
sgd_update(weights=nr0, grad=rg0, lr=lr) ~> nr0
get(arr=gg, idx=1) ~> gs1
vec_scale(a=xd, s=gs1) ~> rg1
sgd_update(weights=nr1, grad=rg1, lr=lr) ~> nr1
get(arr=gg, idx=2) ~> gs2
vec_scale(a=xd, s=gs2) ~> rg2
sgd_update(weights=nr2, grad=rg2, lr=lr) ~> nr2
get(arr=gg, idx=3) ~> gs3
vec_scale(a=xd, s=gs3) ~> rg3
sgd_update(weights=nr3, grad=rg3, lr=lr) ~> nr3
linear_rows(r0=nr0, r1=nr1, r2=nr2, r3=nr3, bv=bv, x=xa) ~> pp
vec_sub(a=pp, b=ta) ~> gg
get(arr=gg, idx=0) ~> gs0
vec_scale(a=xa, s=gs0) ~> rg0
sgd_update(weights=nr0, grad=rg0, lr=lr) ~> nr0
get(arr=gg, idx=1) ~> gs1
vec_scale(a=xa, s=gs1) ~> rg1
sgd_update(weights=nr1, grad=rg1, lr=lr) ~> nr1
get(arr=gg, idx=2) ~> gs2
vec_scale(a=xa, s=gs2) ~> rg2
sgd_update(weights=nr2, grad=rg2, lr=lr) ~> nr2
get(arr=gg, idx=3) ~> gs3
vec_scale(a=xa, s=gs3) ~> rg3
sgd_update(weights=nr3, grad=rg3, lr=lr) ~> nr3
linear_rows(r0=nr0, r1=nr1, r2=nr2, r3=nr3, bv=bv, x=xb) ~> pp
vec_sub(a=pp, b=tb) ~> gg
get(arr=gg, idx=0) ~> gs0
vec_scale(a=xb, s=gs0) ~> rg0
sgd_update(weights=nr0, grad=rg0, lr=lr) ~> nr0
get(arr=gg, idx=1) ~> gs1
vec_scale(a=xb, s=gs1) ~> rg1
sgd_update(weights=nr1, grad=rg1, lr=lr) ~> nr1
get(arr=gg, idx=2) ~> gs2
vec_scale(a=xb, s=gs2) ~> rg2
sgd_update(weights=nr2, grad=rg2, lr=lr) ~> nr2
get(arr=gg, idx=3) ~> gs3
vec_scale(a=xb, s=gs3) ~> rg3
sgd_update(weights=nr3, grad=rg3, lr=lr) ~> nr3
linear_rows(r0=nr0, r1=nr1, r2=nr2, r3=nr3, bv=bv, x=xc) ~> pp
vec_sub(a=pp, b=tc) ~> gg
get(arr=gg, idx=0) ~> gs0
vec_scale(a=xc, s=gs0) ~> rg0
sgd_update(weights=nr0, grad=rg0, lr=lr) ~> nr0
get(arr=gg, idx=1) ~> gs1
vec_scale(a=xc, s=gs1) ~> rg1
sgd_update(weights=nr1, grad=rg1, lr=lr) ~> nr1
get(arr=gg, idx=2) ~> gs2
vec_scale(a=xc, s=gs2) ~> rg2
sgd_update(weights=nr2, grad=rg2, lr=lr) ~> nr2
get(arr=gg, idx=3) ~> gs3
vec_scale(a=xc, s=gs3) ~> rg3
sgd_update(weights=nr3, grad=rg3, lr=lr) ~> nr3
linear_rows(r0=nr0, r1=nr1, r2=nr2, r3=nr3, bv=bv, x=xd) ~> pp
vec_sub(a=pp, b=td) ~> gg
get(arr=gg, idx=0) ~> gs0
vec_scale(a=xd, s=gs0) ~> rg0
sgd_update(weights=nr0, grad=rg0, lr=lr) ~> nr0
get(arr=gg, idx=1) ~> gs1
vec_scale(a=xd, s=gs1) ~> rg1
sgd_update(weights=nr1, grad=rg1, lr=lr) ~> nr1
get(arr=gg, idx=2) ~> gs2
vec_scale(a=xd, s=gs2) ~> rg2
sgd_update(weights=nr2, grad=rg2, lr=lr) ~> nr2
get(arr=gg, idx=3) ~> gs3
vec_scale(a=xd, s=gs3) ~> rg3
sgd_update(weights=nr3, grad=rg3, lr=lr) ~> nr3
linear_rows(r0=nr0, r1=nr1, r2=nr2, r3=nr3, bv=bv, x=xa) ~> pp
vec_sub(a=pp, b=ta) ~> gg
get(arr=gg, idx=0) ~> gs0
vec_scale(a=xa, s=gs0) ~> rg0
sgd_update(weights=nr0, grad=rg0, lr=lr) ~> nr0
get(arr=gg, idx=1) ~> gs1
vec_scale(a=xa, s=gs1) ~> rg1
sgd_update(weights=nr1, grad=rg1, lr=lr) ~> nr1
get(arr=gg, idx=2) ~> gs2
vec_scale(a=xa, s=gs2) ~> rg2
sgd_update(weights=nr2, grad=rg2, lr=lr) ~> nr2
get(arr=gg, idx=3) ~> gs3
vec_scale(a=xa, s=gs3) ~> rg3
sgd_update(weights=nr3, grad=rg3, lr=lr) ~> nr3
linear_rows(r0=nr0, r1=nr1, r2=nr2, r3=nr3, bv=bv, x=xb) ~> pp
vec_sub(a=pp, b=tb) ~> gg
get(arr=gg, idx=0) ~> gs0
vec_scale(a=xb, s=gs0) ~> rg0
sgd_update(weights=nr0, grad=rg0, lr=lr) ~> nr0
get(arr=gg, idx=1) ~> gs1
vec_scale(a=xb, s=gs1) ~> rg1
sgd_update(weights=nr1, grad=rg1, lr=lr) ~> nr1
get(arr=gg, idx=2) ~> gs2
vec_scale(a=xb, s=gs2) ~> rg2
sgd_update(weights=nr2, grad=rg2, lr=lr) ~> nr2
get(arr=gg, idx=3) ~> gs3
vec_scale(a=xb, s=gs3) ~> rg3
sgd_update(weights=nr3, grad=rg3, lr=lr) ~> nr3
linear_rows(r0=nr0, r1=nr1, r2=nr2, r3=nr3, bv=bv, x=xc) ~> pp
vec_sub(a=pp, b=tc) ~> gg
get(arr=gg, idx=0) ~> gs0
vec_scale(a=xc, s=gs0) ~> rg0
sgd_update(weights=nr0, grad=rg0, lr=lr) ~> nr0
get(arr=gg, idx=1) ~> gs1
vec_scale(a=xc, s=gs1) ~> rg1
sgd_update(weights=nr1, grad=rg1, lr=lr) ~> nr1
get(arr=gg, idx=2) ~> gs2
vec_scale(a=xc, s=gs2) ~> rg2
sgd_update(weights=nr2, grad=rg2, lr=lr) ~> nr2
get(arr=gg, idx=3) ~> gs3
vec_scale(a=xc, s=gs3) ~> rg3
sgd_update(weights=nr3, grad=rg3, lr=lr) ~> nr3
linear_rows(r0=nr0, r1=nr1, r2=nr2, r3=nr3, bv=bv, x=xd) ~> pp
vec_sub(a=pp, b=td) ~> gg
get(arr=gg, idx=0) ~> gs0
vec_scale(a=xd, s=gs0) ~> rg0
sgd_update(weights=nr0, grad=rg0, lr=lr) ~> nr0
get(arr=gg, idx=1) ~> gs1
vec_scale(a=xd, s=gs1) ~> rg1
sgd_update(weights=nr1, grad=rg1, lr=lr) ~> nr1
get(arr=gg, idx=2) ~> gs2
vec_scale(a=xd, s=gs2) ~> rg2
sgd_update(weights=nr2, grad=rg2, lr=lr) ~> nr2
get(arr=gg, idx=3) ~> gs3
vec_scale(a=xd, s=gs3) ~> rg3
sgd_update(weights=nr3, grad=rg3, lr=lr) ~> nr3
linear_rows(r0=nr0, r1=nr1, r2=nr2, r3=nr3, bv=bv, x=xa) ~> pp
vec_sub(a=pp, b=ta) ~> gg
get(arr=gg, idx=0) ~> gs0
vec_scale(a=xa, s=gs0) ~> rg0
sgd_update(weights=nr0, grad=rg0, lr=lr) ~> nr0
get(arr=gg, idx=1) ~> gs1
vec_scale(a=xa, s=gs1) ~> rg1
sgd_update(weights=nr1, grad=rg1, lr=lr) ~> nr1
get(arr=gg, idx=2) ~> gs2
vec_scale(a=xa, s=gs2) ~> rg2
sgd_update(weights=nr2, grad=rg2, lr=lr) ~> nr2
get(arr=gg, idx=3) ~> gs3
vec_scale(a=xa, s=gs3) ~> rg3
sgd_update(weights=nr3, grad=rg3, lr=lr) ~> nr3
linear_rows(r0=nr0, r1=nr1, r2=nr2, r3=nr3, bv=bv, x=xb) ~> pp
vec_sub(a=pp, b=tb) ~> gg
get(arr=gg, idx=0) ~> gs0
vec_scale(a=xb, s=gs0) ~> rg0
sgd_update(weights=nr0, grad=rg0, lr=lr) ~> nr0
get(arr=gg, idx=1) ~> gs1
vec_scale(a=xb, s=gs1) ~> rg1
sgd_update(weights=nr1, grad=rg1, lr=lr) ~> nr1
get(arr=gg, idx=2) ~> gs2
vec_scale(a=xb, s=gs2) ~> rg2
sgd_update(weights=nr2, grad=rg2, lr=lr) ~> nr2
get(arr=gg, idx=3) ~> gs3
vec_scale(a=xb, s=gs3) ~> rg3
sgd_update(weights=nr3, grad=rg3, lr=lr) ~> nr3
linear_rows(r0=nr0, r1=nr1, r2=nr2, r3=nr3, bv=bv, x=xc) ~> pp
vec_sub(a=pp, b=tc) ~> gg
get(arr=gg, idx=0) ~> gs0
vec_scale(a=xc, s=gs0) ~> rg0
sgd_update(weights=nr0, grad=rg0, lr=lr) ~> nr0
get(arr=gg, idx=1) ~> gs1
vec_scale(a=xc, s=gs1) ~> rg1
sgd_update(weights=nr1, grad=rg1, lr=lr) ~> nr1
get(arr=gg, idx=2) ~> gs2
vec_scale(a=xc, s=gs2) ~> rg2
sgd_update(weights=nr2, grad=rg2, lr=lr) ~> nr2
get(arr=gg, idx=3) ~> gs3
vec_scale(a=xc, s=gs3) ~> rg3
sgd_update(weights=nr3, grad=rg3, lr=lr) ~> nr3
linear_rows(r0=nr0, r1=nr1, r2=nr2, r3=nr3, bv=bv, x=xd) ~> pp
vec_sub(a=pp, b=td) ~> gg
get(arr=gg, idx=0) ~> gs0
vec_scale(a=xd, s=gs0) ~> rg0
sgd_update(weights=nr0, grad=rg0, lr=lr) ~> nr0
get(arr=gg, idx=1) ~> gs1
vec_scale(a=xd, s=gs1) ~> rg1
sgd_update(weights=nr1, grad=rg1, lr=lr) ~> nr1
get(arr=gg, idx=2) ~> gs2
vec_scale(a=xd, s=gs2) ~> rg2
sgd_update(weights=nr2, grad=rg2, lr=lr) ~> nr2
get(arr=gg, idx=3) ~> gs3
vec_scale(a=xd, s=gs3) ~> rg3
sgd_update(weights=nr3, grad=rg3, lr=lr) ~> nr3
linear_rows(r0=nr0, r1=nr1, r2=nr2, r3=nr3, bv=bv, x=xa) ~> pp
vec_sub(a=pp, b=ta) ~> gg
get(arr=gg, idx=0) ~> gs0
vec_scale(a=xa, s=gs0) ~> rg0
sgd_update(weights=nr0, grad=rg0, lr=lr) ~> nr0
get(arr=gg, idx=1) ~> gs1
vec_scale(a=xa, s=gs1) ~> rg1
sgd_update(weights=nr1, grad=rg1, lr=lr) ~> nr1
get(arr=gg, idx=2) ~> gs2
vec_scale(a=xa, s=gs2) ~> rg2
sgd_update(weights=nr2, grad=rg2, lr=lr) ~> nr2
get(arr=gg, idx=3) ~> gs3
vec_scale(a=xa, s=gs3) ~> rg3
sgd_update(weights=nr3, grad=rg3, lr=lr) ~> nr3
linear_rows(r0=nr0, r1=nr1, r2=nr2, r3=nr3, bv=bv, x=xb) ~> pp
vec_sub(a=pp, b=tb) ~> gg
get(arr=gg, idx=0) ~> gs0
vec_scale(a=xb, s=gs0) ~> rg0
sgd_update(weights=nr0, grad=rg0, lr=lr) ~> nr0
get(arr=gg, idx=1) ~> gs1
vec_scale(a=xb, s=gs1) ~> rg1
sgd_update(weights=nr1, grad=rg1, lr=lr) ~> nr1
get(arr=gg, idx=2) ~> gs2
vec_scale(a=xb, s=gs2) ~> rg2
sgd_update(weights=nr2, grad=rg2, lr=lr) ~> nr2
get(arr=gg, idx=3) ~> gs3
vec_scale(a=xb, s=gs3) ~> rg3
sgd_update(weights=nr3, grad=rg3, lr=lr) ~> nr3
linear_rows(r0=nr0, r1=nr1, r2=nr2, r3=nr3, bv=bv, x=xc) ~> pp
vec_sub(a=pp, b=tc) ~> gg
get(arr=gg, idx=0) ~> gs0
vec_scale(a=xc, s=gs0) ~> rg0
sgd_update(weights=nr0, grad=rg0, lr=lr) ~> nr0
get(arr=gg, idx=1) ~> gs1
vec_scale(a=xc, s=gs1) ~> rg1
sgd_update(weights=nr1, grad=rg1, lr=lr) ~> nr1
get(arr=gg, idx=2) ~> gs2
vec_scale(a=xc, s=gs2) ~> rg2
sgd_update(weights=nr2, grad=rg2, lr=lr) ~> nr2
get(arr=gg, idx=3) ~> gs3
vec_scale(a=xc, s=gs3) ~> rg3
sgd_update(weights=nr3, grad=rg3, lr=lr) ~> nr3
linear_rows(r0=nr0, r1=nr1, r2=nr2, r3=nr3, bv=bv, x=xd) ~> pp
vec_sub(a=pp, b=td) ~> gg
get(arr=gg, idx=0) ~> gs0
vec_scale(a=xd, s=gs0) ~> rg0
sgd_update(weights=nr0, grad=rg0, lr=lr) ~> nr0
get(arr=gg, idx=1) ~> gs1
vec_scale(a=xd, s=gs1) ~> rg1
sgd_update(weights=nr1, grad=rg1, lr=lr) ~> nr1
get(arr=gg, idx=2) ~> gs2
vec_scale(a=xd, s=gs2) ~> rg2
sgd_update(weights=nr2, grad=rg2, lr=lr) ~> nr2
get(arr=gg, idx=3) ~> gs3
vec_scale(a=xd, s=gs3) ~> rg3
sgd_update(weights=nr3, grad=rg3, lr=lr) ~> nr3
linear_rows(r0=nr0, r1=nr1, r2=nr2, r3=nr3, bv=bv, x=xa) ~> pp
vec_sub(a=pp, b=ta) ~> gg
get(arr=gg, idx=0) ~> gs0
vec_scale(a=xa, s=gs0) ~> rg0
sgd_update(weights=nr0, grad=rg0, lr=lr) ~> nr0
get(arr=gg, idx=1) ~> gs1
vec_scale(a=xa, s=gs1) ~> rg1
sgd_update(weights=nr1, grad=rg1, lr=lr) ~> nr1
get(arr=gg, idx=2) ~> gs2
vec_scale(a=xa, s=gs2) ~> rg2
sgd_update(weights=nr2, grad=rg2, lr=lr) ~> nr2
get(arr=gg, idx=3) ~> gs3
vec_scale(a=xa, s=gs3) ~> rg3
sgd_update(weights=nr3, grad=rg3, lr=lr) ~> nr3
linear_rows(r0=nr0, r1=nr1, r2=nr2, r3=nr3, bv=bv, x=xb) ~> pp
vec_sub(a=pp, b=tb) ~> gg
get(arr=gg, idx=0) ~> gs0
vec_scale(a=xb, s=gs0) ~> rg0
sgd_update(weights=nr0, grad=rg0, lr=lr) ~> nr0
get(arr=gg, idx=1) ~> gs1
vec_scale(a=xb, s=gs1) ~> rg1
sgd_update(weights=nr1, grad=rg1, lr=lr) ~> nr1
get(arr=gg, idx=2) ~> gs2
vec_scale(a=xb, s=gs2) ~> rg2
sgd_update(weights=nr2, grad=rg2, lr=lr) ~> nr2
get(arr=gg, idx=3) ~> gs3
vec_scale(a=xb, s=gs3) ~> rg3
sgd_update(weights=nr3, grad=rg3, lr=lr) ~> nr3
linear_rows(r0=nr0, r1=nr1, r2=nr2, r3=nr3, bv=bv, x=xc) ~> pp
vec_sub(a=pp, b=tc) ~> gg
get(arr=gg, idx=0) ~> gs0
vec_scale(a=xc, s=gs0) ~> rg0
sgd_update(weights=nr0, grad=rg0, lr=lr) ~> nr0
get(arr=gg, idx=1) ~> gs1
vec_scale(a=xc, s=gs1) ~> rg1
sgd_update(weights=nr1, grad=rg1, lr=lr) ~> nr1
get(arr=gg, idx=2) ~> gs2
vec_scale(a=xc, s=gs2) ~> rg2
sgd_update(weights=nr2, grad=rg2, lr=lr) ~> nr2
get(arr=gg, idx=3) ~> gs3
vec_scale(a=xc, s=gs3) ~> rg3
sgd_update(weights=nr3, grad=rg3, lr=lr) ~> nr3
linear_rows(r0=nr0, r1=nr1, r2=nr2, r3=nr3, bv=bv, x=xd) ~> pp
vec_sub(a=pp, b=td) ~> gg
get(arr=gg, idx=0) ~> gs0
vec_scale(a=xd, s=gs0) ~> rg0
sgd_update(weights=nr0, grad=rg0, lr=lr) ~> nr0
get(arr=gg, idx=1) ~> gs1
vec_scale(a=xd, s=gs1) ~> rg1
sgd_update(weights=nr1, grad=rg1, lr=lr) ~> nr1
get(arr=gg, idx=2) ~> gs2
vec_scale(a=xd, s=gs2) ~> rg2
sgd_update(weights=nr2, grad=rg2, lr=lr) ~> nr2
get(arr=gg, idx=3) ~> gs3
vec_scale(a=xd, s=gs3) ~> rg3
sgd_update(weights=nr3, grad=rg3, lr=lr) ~> nr3
linear_rows(r0=nr0, r1=nr1, r2=nr2, r3=nr3, bv=bv, x=xa) ~> pp
vec_sub(a=pp, b=ta) ~> gg
get(arr=gg, idx=0) ~> gs0
vec_scale(a=xa, s=gs0) ~> rg0
sgd_update(weights=nr0, grad=rg0, lr=lr) ~> nr0
get(arr=gg, idx=1) ~> gs1
vec_scale(a=xa, s=gs1) ~> rg1
sgd_update(weights=nr1, grad=rg1, lr=lr) ~> nr1
get(arr=gg, idx=2) ~> gs2
vec_scale(a=xa, s=gs2) ~> rg2
sgd_update(weights=nr2, grad=rg2, lr=lr) ~> nr2
get(arr=gg, idx=3) ~> gs3
vec_scale(a=xa, s=gs3) ~> rg3
sgd_update(weights=nr3, grad=rg3, lr=lr) ~> nr3
linear_rows(r0=nr0, r1=nr1, r2=nr2, r3=nr3, bv=bv, x=xb) ~> pp
vec_sub(a=pp, b=tb) ~> gg
get(arr=gg, idx=0) ~> gs0
vec_scale(a=xb, s=gs0) ~> rg0
sgd_update(weights=nr0, grad=rg0, lr=lr) ~> nr0
get(arr=gg, idx=1) ~> gs1
vec_scale(a=xb, s=gs1) ~> rg1
sgd_update(weights=nr1, grad=rg1, lr=lr) ~> nr1
get(arr=gg, idx=2) ~> gs2
vec_scale(a=xb, s=gs2) ~> rg2
sgd_update(weights=nr2, grad=rg2, lr=lr) ~> nr2
get(arr=gg, idx=3) ~> gs3
vec_scale(a=xb, s=gs3) ~> rg3
sgd_update(weights=nr3, grad=rg3, lr=lr) ~> nr3
linear_rows(r0=nr0, r1=nr1, r2=nr2, r3=nr3, bv=bv, x=xc) ~> pp
vec_sub(a=pp, b=tc) ~> gg
get(arr=gg, idx=0) ~> gs0
vec_scale(a=xc, s=gs0) ~> rg0
sgd_update(weights=nr0, grad=rg0, lr=lr) ~> nr0
get(arr=gg, idx=1) ~> gs1
vec_scale(a=xc, s=gs1) ~> rg1
sgd_update(weights=nr1, grad=rg1, lr=lr) ~> nr1
get(arr=gg, idx=2) ~> gs2
vec_scale(a=xc, s=gs2) ~> rg2
sgd_update(weights=nr2, grad=rg2, lr=lr) ~> nr2
get(arr=gg, idx=3) ~> gs3
vec_scale(a=xc, s=gs3) ~> rg3
sgd_update(weights=nr3, grad=rg3, lr=lr) ~> nr3
linear_rows(r0=nr0, r1=nr1, r2=nr2, r3=nr3, bv=bv, x=xd) ~> pp
vec_sub(a=pp, b=td) ~> gg
get(arr=gg, idx=0) ~> gs0
vec_scale(a=xd, s=gs0) ~> rg0
sgd_update(weights=nr0, grad=rg0, lr=lr) ~> nr0
get(arr=gg, idx=1) ~> gs1
vec_scale(a=xd, s=gs1) ~> rg1
sgd_update(weights=nr1, grad=rg1, lr=lr) ~> nr1
get(arr=gg, idx=2) ~> gs2
vec_scale(a=xd, s=gs2) ~> rg2
sgd_update(weights=nr2, grad=rg2, lr=lr) ~> nr2
get(arr=gg, idx=3) ~> gs3
vec_scale(a=xd, s=gs3) ~> rg3
sgd_update(weights=nr3, grad=rg3, lr=lr) ~> nr3
linear_rows(r0=nr0, r1=nr1, r2=nr2, r3=nr3, bv=bv, x=xa) ~> pp
vec_sub(a=pp, b=ta) ~> gg
get(arr=gg, idx=0) ~> gs0
vec_scale(a=xa, s=gs0) ~> rg0
sgd_update(weights=nr0, grad=rg0, lr=lr) ~> nr0
get(arr=gg, idx=1) ~> gs1
vec_scale(a=xa, s=gs1) ~> rg1
sgd_update(weights=nr1, grad=rg1, lr=lr) ~> nr1
get(arr=gg, idx=2) ~> gs2
vec_scale(a=xa, s=gs2) ~> rg2
sgd_update(weights=nr2, grad=rg2, lr=lr) ~> nr2
get(arr=gg, idx=3) ~> gs3
vec_scale(a=xa, s=gs3) ~> rg3
sgd_update(weights=nr3, grad=rg3, lr=lr) ~> nr3
linear_rows(r0=nr0, r1=nr1, r2=nr2, r3=nr3, bv=bv, x=xb) ~> pp
vec_sub(a=pp, b=tb) ~> gg
get(arr=gg, idx=0) ~> gs0
vec_scale(a=xb, s=gs0) ~> rg0
sgd_update(weights=nr0, grad=rg0, lr=lr) ~> nr0
get(arr=gg, idx=1) ~> gs1
vec_scale(a=xb, s=gs1) ~> rg1
sgd_update(weights=nr1, grad=rg1, lr=lr) ~> nr1
get(arr=gg, idx=2) ~> gs2
vec_scale(a=xb, s=gs2) ~> rg2
sgd_update(weights=nr2, grad=rg2, lr=lr) ~> nr2
get(arr=gg, idx=3) ~> gs3
vec_scale(a=xb, s=gs3) ~> rg3
sgd_update(weights=nr3, grad=rg3, lr=lr) ~> nr3
linear_rows(r0=nr0, r1=nr1, r2=nr2, r3=nr3, bv=bv, x=xc) ~> pp
vec_sub(a=pp, b=tc) ~> gg
get(arr=gg, idx=0) ~> gs0
vec_scale(a=xc, s=gs0) ~> rg0
sgd_update(weights=nr0, grad=rg0, lr=lr) ~> nr0
get(arr=gg, idx=1) ~> gs1
vec_scale(a=xc, s=gs1) ~> rg1
sgd_update(weights=nr1, grad=rg1, lr=lr) ~> nr1
get(arr=gg, idx=2) ~> gs2
vec_scale(a=xc, s=gs2) ~> rg2
sgd_update(weights=nr2, grad=rg2, lr=lr) ~> nr2
get(arr=gg, idx=3) ~> gs3
vec_scale(a=xc, s=gs3) ~> rg3
sgd_update(weights=nr3, grad=rg3, lr=lr) ~> nr3
linear_rows(r0=nr0, r1=nr1, r2=nr2, r3=nr3, bv=bv, x=xd) ~> pp
vec_sub(a=pp, b=td) ~> gg
get(arr=gg, idx=0) ~> gs0
vec_scale(a=xd, s=gs0) ~> rg0
sgd_update(weights=nr0, grad=rg0, lr=lr) ~> nr0
get(arr=gg, idx=1) ~> gs1
vec_scale(a=xd, s=gs1) ~> rg1
sgd_update(weights=nr1, grad=rg1, lr=lr) ~> nr1
get(arr=gg, idx=2) ~> gs2
vec_scale(a=xd, s=gs2) ~> rg2
sgd_update(weights=nr2, grad=rg2, lr=lr) ~> nr2
get(arr=gg, idx=3) ~> gs3
vec_scale(a=xd, s=gs3) ~> rg3
sgd_update(weights=nr3, grad=rg3, lr=lr) ~> nr3
linear_rows(r0=nr0, r1=nr1, r2=nr2, r3=nr3, bv=bv, x=xa) ~> pp
vec_sub(a=pp, b=ta) ~> gg
get(arr=gg, idx=0) ~> gs0
vec_scale(a=xa, s=gs0) ~> rg0
sgd_update(weights=nr0, grad=rg0, lr=lr) ~> nr0
get(arr=gg, idx=1) ~> gs1
vec_scale(a=xa, s=gs1) ~> rg1
sgd_update(weights=nr1, grad=rg1, lr=lr) ~> nr1
get(arr=gg, idx=2) ~> gs2
vec_scale(a=xa, s=gs2) ~> rg2
sgd_update(weights=nr2, grad=rg2, lr=lr) ~> nr2
get(arr=gg, idx=3) ~> gs3
vec_scale(a=xa, s=gs3) ~> rg3
sgd_update(weights=nr3, grad=rg3, lr=lr) ~> nr3
linear_rows(r0=nr0, r1=nr1, r2=nr2, r3=nr3, bv=bv, x=xb) ~> pp
vec_sub(a=pp, b=tb) ~> gg
get(arr=gg, idx=0) ~> gs0
vec_scale(a=xb, s=gs0) ~> rg0
sgd_update(weights=nr0, grad=rg0, lr=lr) ~> nr0
get(arr=gg, idx=1) ~> gs1
vec_scale(a=xb, s=gs1) ~> rg1
sgd_update(weights=nr1, grad=rg1, lr=lr) ~> nr1
get(arr=gg, idx=2) ~> gs2
vec_scale(a=xb, s=gs2) ~> rg2
sgd_update(weights=nr2, grad=rg2, lr=lr) ~> nr2
get(arr=gg, idx=3) ~> gs3
vec_scale(a=xb, s=gs3) ~> rg3
sgd_update(weights=nr3, grad=rg3, lr=lr) ~> nr3
linear_rows(r0=nr0, r1=nr1, r2=nr2, r3=nr3, bv=bv, x=xc) ~> pp
vec_sub(a=pp, b=tc) ~> gg
get(arr=gg, idx=0) ~> gs0
vec_scale(a=xc, s=gs0) ~> rg0
sgd_update(weights=nr0, grad=rg0, lr=lr) ~> nr0
get(arr=gg, idx=1) ~> gs1
vec_scale(a=xc, s=gs1) ~> rg1
sgd_update(weights=nr1, grad=rg1, lr=lr) ~> nr1
get(arr=gg, idx=2) ~> gs2
vec_scale(a=xc, s=gs2) ~> rg2
sgd_update(weights=nr2, grad=rg2, lr=lr) ~> nr2
get(arr=gg, idx=3) ~> gs3
vec_scale(a=xc, s=gs3) ~> rg3
sgd_update(weights=nr3, grad=rg3, lr=lr) ~> nr3
linear_rows(r0=nr0, r1=nr1, r2=nr2, r3=nr3, bv=bv, x=xd) ~> pp
vec_sub(a=pp, b=td) ~> gg
get(arr=gg, idx=0) ~> gs0
vec_scale(a=xd, s=gs0) ~> rg0
sgd_update(weights=nr0, grad=rg0, lr=lr) ~> nr0
get(arr=gg, idx=1) ~> gs1
vec_scale(a=xd, s=gs1) ~> rg1
sgd_update(weights=nr1, grad=rg1, lr=lr) ~> nr1
get(arr=gg, idx=2) ~> gs2
vec_scale(a=xd, s=gs2) ~> rg2
sgd_update(weights=nr2, grad=rg2, lr=lr) ~> nr2
get(arr=gg, idx=3) ~> gs3
vec_scale(a=xd, s=gs3) ~> rg3
sgd_update(weights=nr3, grad=rg3, lr=lr) ~> nr3
linear_rows(r0=nr0, r1=nr1, r2=nr2, r3=nr3, bv=bv, x=xa) ~> pp
vec_sub(a=pp, b=ta) ~> gg
get(arr=gg, idx=0) ~> gs0
vec_scale(a=xa, s=gs0) ~> rg0
sgd_update(weights=nr0, grad=rg0, lr=lr) ~> nr0
get(arr=gg, idx=1) ~> gs1
vec_scale(a=xa, s=gs1) ~> rg1
sgd_update(weights=nr1, grad=rg1, lr=lr) ~> nr1
get(arr=gg, idx=2) ~> gs2
vec_scale(a=xa, s=gs2) ~> rg2
sgd_update(weights=nr2, grad=rg2, lr=lr) ~> nr2
get(arr=gg, idx=3) ~> gs3
vec_scale(a=xa, s=gs3) ~> rg3
sgd_update(weights=nr3, grad=rg3, lr=lr) ~> nr3
linear_rows(r0=nr0, r1=nr1, r2=nr2, r3=nr3, bv=bv, x=xb) ~> pp
vec_sub(a=pp, b=tb) ~> gg
get(arr=gg, idx=0) ~> gs0
vec_scale(a=xb, s=gs0) ~> rg0
sgd_update(weights=nr0, grad=rg0, lr=lr) ~> nr0
get(arr=gg, idx=1) ~> gs1
vec_scale(a=xb, s=gs1) ~> rg1
sgd_update(weights=nr1, grad=rg1, lr=lr) ~> nr1
get(arr=gg, idx=2) ~> gs2
vec_scale(a=xb, s=gs2) ~> rg2
sgd_update(weights=nr2, grad=rg2, lr=lr) ~> nr2
get(arr=gg, idx=3) ~> gs3
vec_scale(a=xb, s=gs3) ~> rg3
sgd_update(weights=nr3, grad=rg3, lr=lr) ~> nr3
linear_rows(r0=nr0, r1=nr1, r2=nr2, r3=nr3, bv=bv, x=xc) ~> pp
vec_sub(a=pp, b=tc) ~> gg
get(arr=gg, idx=0) ~> gs0
vec_scale(a=xc, s=gs0) ~> rg0
sgd_update(weights=nr0, grad=rg0, lr=lr) ~> nr0
get(arr=gg, idx=1) ~> gs1
vec_scale(a=xc, s=gs1) ~> rg1
sgd_update(weights=nr1, grad=rg1, lr=lr) ~> nr1
get(arr=gg, idx=2) ~> gs2
vec_scale(a=xc, s=gs2) ~> rg2
sgd_update(weights=nr2, grad=rg2, lr=lr) ~> nr2
get(arr=gg, idx=3) ~> gs3
vec_scale(a=xc, s=gs3) ~> rg3
sgd_update(weights=nr3, grad=rg3, lr=lr) ~> nr3
linear_rows(r0=nr0, r1=nr1, r2=nr2, r3=nr3, bv=bv, x=xd) ~> pp
vec_sub(a=pp, b=td) ~> gg
get(arr=gg, idx=0) ~> gs0
vec_scale(a=xd, s=gs0) ~> rg0
sgd_update(weights=nr0, grad=rg0, lr=lr) ~> nr0
get(arr=gg, idx=1) ~> gs1
vec_scale(a=xd, s=gs1) ~> rg1
sgd_update(weights=nr1, grad=rg1, lr=lr) ~> nr1
get(arr=gg, idx=2) ~> gs2
vec_scale(a=xd, s=gs2) ~> rg2
sgd_update(weights=nr2, grad=rg2, lr=lr) ~> nr2
get(arr=gg, idx=3) ~> gs3
vec_scale(a=xd, s=gs3) ~> rg3
sgd_update(weights=nr3, grad=rg3, lr=lr) ~> nr3
linear_rows(r0=nr0, r1=nr1, r2=nr2, r3=nr3, bv=bv, x=xa) ~> pp
vec_sub(a=pp, b=ta) ~> gg
get(arr=gg, idx=0) ~> gs0
vec_scale(a=xa, s=gs0) ~> rg0
sgd_update(weights=nr0, grad=rg0, lr=lr) ~> nr0
get(arr=gg, idx=1) ~> gs1
vec_scale(a=xa, s=gs1) ~> rg1
sgd_update(weights=nr1, grad=rg1, lr=lr) ~> nr1
get(arr=gg, idx=2) ~> gs2
vec_scale(a=xa, s=gs2) ~> rg2
sgd_update(weights=nr2, grad=rg2, lr=lr) ~> nr2
get(arr=gg, idx=3) ~> gs3
vec_scale(a=xa, s=gs3) ~> rg3
sgd_update(weights=nr3, grad=rg3, lr=lr) ~> nr3
linear_rows(r0=nr0, r1=nr1, r2=nr2, r3=nr3, bv=bv, x=xb) ~> pp
vec_sub(a=pp, b=tb) ~> gg
get(arr=gg, idx=0) ~> gs0
vec_scale(a=xb, s=gs0) ~> rg0
sgd_update(weights=nr0, grad=rg0, lr=lr) ~> nr0
get(arr=gg, idx=1) ~> gs1
vec_scale(a=xb, s=gs1) ~> rg1
sgd_update(weights=nr1, grad=rg1, lr=lr) ~> nr1
get(arr=gg, idx=2) ~> gs2
vec_scale(a=xb, s=gs2) ~> rg2
sgd_update(weights=nr2, grad=rg2, lr=lr) ~> nr2
get(arr=gg, idx=3) ~> gs3
vec_scale(a=xb, s=gs3) ~> rg3
sgd_update(weights=nr3, grad=rg3, lr=lr) ~> nr3
linear_rows(r0=nr0, r1=nr1, r2=nr2, r3=nr3, bv=bv, x=xc) ~> pp
vec_sub(a=pp, b=tc) ~> gg
get(arr=gg, idx=0) ~> gs0
vec_scale(a=xc, s=gs0) ~> rg0
sgd_update(weights=nr0, grad=rg0, lr=lr) ~> nr0
get(arr=gg, idx=1) ~> gs1
vec_scale(a=xc, s=gs1) ~> rg1
sgd_update(weights=nr1, grad=rg1, lr=lr) ~> nr1
get(arr=gg, idx=2) ~> gs2
vec_scale(a=xc, s=gs2) ~> rg2
sgd_update(weights=nr2, grad=rg2, lr=lr) ~> nr2
get(arr=gg, idx=3) ~> gs3
vec_scale(a=xc, s=gs3) ~> rg3
sgd_update(weights=nr3, grad=rg3, lr=lr) ~> nr3
linear_rows(r0=nr0, r1=nr1, r2=nr2, r3=nr3, bv=bv, x=xd) ~> pp
vec_sub(a=pp, b=td) ~> gg
get(arr=gg, idx=0) ~> gs0
vec_scale(a=xd, s=gs0) ~> rg0
sgd_update(weights=nr0, grad=rg0, lr=lr) ~> nr0
get(arr=gg, idx=1) ~> gs1
vec_scale(a=xd, s=gs1) ~> rg1
sgd_update(weights=nr1, grad=rg1, lr=lr) ~> nr1
get(arr=gg, idx=2) ~> gs2
vec_scale(a=xd, s=gs2) ~> rg2
sgd_update(weights=nr2, grad=rg2, lr=lr) ~> nr2
get(arr=gg, idx=3) ~> gs3
vec_scale(a=xd, s=gs3) ~> rg3
sgd_update(weights=nr3, grad=rg3, lr=lr) ~> nr3
linear_rows(r0=nr0, r1=nr1, r2=nr2, r3=nr3, bv=bv, x=xa) ~> pp
vec_sub(a=pp, b=ta) ~> gg
get(arr=gg, idx=0) ~> gs0
vec_scale(a=xa, s=gs0) ~> rg0
sgd_update(weights=nr0, grad=rg0, lr=lr) ~> nr0
get(arr=gg, idx=1) ~> gs1
vec_scale(a=xa, s=gs1) ~> rg1
sgd_update(weights=nr1, grad=rg1, lr=lr) ~> nr1
get(arr=gg, idx=2) ~> gs2
vec_scale(a=xa, s=gs2) ~> rg2
sgd_update(weights=nr2, grad=rg2, lr=lr) ~> nr2
get(arr=gg, idx=3) ~> gs3
vec_scale(a=xa, s=gs3) ~> rg3
sgd_update(weights=nr3, grad=rg3, lr=lr) ~> nr3
linear_rows(r0=nr0, r1=nr1, r2=nr2, r3=nr3, bv=bv, x=xb) ~> pp
vec_sub(a=pp, b=tb) ~> gg
get(arr=gg, idx=0) ~> gs0
vec_scale(a=xb, s=gs0) ~> rg0
sgd_update(weights=nr0, grad=rg0, lr=lr) ~> nr0
get(arr=gg, idx=1) ~> gs1
vec_scale(a=xb, s=gs1) ~> rg1
sgd_update(weights=nr1, grad=rg1, lr=lr) ~> nr1
get(arr=gg, idx=2) ~> gs2
vec_scale(a=xb, s=gs2) ~> rg2
sgd_update(weights=nr2, grad=rg2, lr=lr) ~> nr2
get(arr=gg, idx=3) ~> gs3
vec_scale(a=xb, s=gs3) ~> rg3
sgd_update(weights=nr3, grad=rg3, lr=lr) ~> nr3
linear_rows(r0=nr0, r1=nr1, r2=nr2, r3=nr3, bv=bv, x=xc) ~> pp
vec_sub(a=pp, b=tc) ~> gg
get(arr=gg, idx=0) ~> gs0
vec_scale(a=xc, s=gs0) ~> rg0
sgd_update(weights=nr0, grad=rg0, lr=lr) ~> nr0
get(arr=gg, idx=1) ~> gs1
vec_scale(a=xc, s=gs1) ~> rg1
sgd_update(weights=nr1, grad=rg1, lr=lr) ~> nr1
get(arr=gg, idx=2) ~> gs2
vec_scale(a=xc, s=gs2) ~> rg2
sgd_update(weights=nr2, grad=rg2, lr=lr) ~> nr2
get(arr=gg, idx=3) ~> gs3
vec_scale(a=xc, s=gs3) ~> rg3
sgd_update(weights=nr3, grad=rg3, lr=lr) ~> nr3
linear_rows(r0=nr0, r1=nr1, r2=nr2, r3=nr3, bv=bv, x=xd) ~> pp
vec_sub(a=pp, b=td) ~> gg
get(arr=gg, idx=0) ~> gs0
vec_scale(a=xd, s=gs0) ~> rg0
sgd_update(weights=nr0, grad=rg0, lr=lr) ~> nr0
get(arr=gg, idx=1) ~> gs1
vec_scale(a=xd, s=gs1) ~> rg1
sgd_update(weights=nr1, grad=rg1, lr=lr) ~> nr1
get(arr=gg, idx=2) ~> gs2
vec_scale(a=xd, s=gs2) ~> rg2
sgd_update(weights=nr2, grad=rg2, lr=lr) ~> nr2
get(arr=gg, idx=3) ~> gs3
vec_scale(a=xd, s=gs3) ~> rg3
sgd_update(weights=nr3, grad=rg3, lr=lr) ~> nr3
[T+]
show shall(nr0)
show shall(nr1)
show shall(nr2)
show shall(nr3)