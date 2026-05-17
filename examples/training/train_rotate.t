[T-]
import "lib/basic/std.t"
import "lib/advanced/ml_t.t"
wr0 = [0.0279, -0.0950, -0.0450, -0.0554]
wr1 = [0.0473, 0.0353, 0.0784, -0.0826]
wr2 = [-0.0156, -0.0940, -0.0563, 0.0011]
wr3 = [-0.0947, -0.0602, 0.0300, 0.0090]
bv = [0, 0, 0, 0]
lr = 0.01
[T0]
xv = [0.6316, 0.5579, 0.1474, 0.6526]
tv = [1, 0, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv) ~> pp
vec_sub(a=pp, b=tv) ~> gg
get(arr=gg, idx=0) ~> g0
get(arr=gg, idx=1) ~> g1
get(arr=gg, idx=2) ~> g2
get(arr=gg, idx=3) ~> g3
vec_scale(a=xv, s=g0) ~> rg0
vec_scale(a=xv, s=g1) ~> rg1
vec_scale(a=xv, s=g2) ~> rg2
vec_scale(a=xv, s=g3) ~> rg3
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
sgd_update(weights=wr1, grad=rg1, lr=lr) ~> wr1
sgd_update(weights=wr2, grad=rg2, lr=lr) ~> wr2
sgd_update(weights=wr3, grad=rg3, lr=lr) ~> wr3
dot_product(a=gg, b=gg) ~> ls
xv = [0.0000, 0.7368, 0.8947, 0.8211]
tv = [0, 0, 0, 1]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv) ~> pp
vec_sub(a=pp, b=tv) ~> gg
get(arr=gg, idx=0) ~> g0
get(arr=gg, idx=1) ~> g1
get(arr=gg, idx=2) ~> g2
get(arr=gg, idx=3) ~> g3
vec_scale(a=xv, s=g0) ~> rg0
vec_scale(a=xv, s=g1) ~> rg1
vec_scale(a=xv, s=g2) ~> rg2
vec_scale(a=xv, s=g3) ~> rg3
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
sgd_update(weights=wr1, grad=rg1, lr=lr) ~> wr1
sgd_update(weights=wr2, grad=rg2, lr=lr) ~> wr2
sgd_update(weights=wr3, grad=rg3, lr=lr) ~> wr3
dot_product(a=gg, b=gg) ~> ls
xv = [0.0105, 0.7053, 0.7579, 0.8947]
tv = [0, 0, 1, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv) ~> pp
vec_sub(a=pp, b=tv) ~> gg
get(arr=gg, idx=0) ~> g0
get(arr=gg, idx=1) ~> g1
get(arr=gg, idx=2) ~> g2
get(arr=gg, idx=3) ~> g3
vec_scale(a=xv, s=g0) ~> rg0
vec_scale(a=xv, s=g1) ~> rg1
vec_scale(a=xv, s=g2) ~> rg2
vec_scale(a=xv, s=g3) ~> rg3
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
sgd_update(weights=wr1, grad=rg1, lr=lr) ~> wr1
sgd_update(weights=wr2, grad=rg2, lr=lr) ~> wr2
sgd_update(weights=wr3, grad=rg3, lr=lr) ~> wr3
dot_product(a=gg, b=gg) ~> ls
xv = [0.7895, 0.0947, 0.6842, 0.8632]
tv = [0, 0, 1, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv) ~> pp
vec_sub(a=pp, b=tv) ~> gg
get(arr=gg, idx=0) ~> g0
get(arr=gg, idx=1) ~> g1
get(arr=gg, idx=2) ~> g2
get(arr=gg, idx=3) ~> g3
vec_scale(a=xv, s=g0) ~> rg0
vec_scale(a=xv, s=g1) ~> rg1
vec_scale(a=xv, s=g2) ~> rg2
vec_scale(a=xv, s=g3) ~> rg3
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
sgd_update(weights=wr1, grad=rg1, lr=lr) ~> wr1
sgd_update(weights=wr2, grad=rg2, lr=lr) ~> wr2
sgd_update(weights=wr3, grad=rg3, lr=lr) ~> wr3
dot_product(a=gg, b=gg) ~> ls
xv = [0.1368, 0.0105, 0.8211, 0.1053]
tv = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv) ~> pp
vec_sub(a=pp, b=tv) ~> gg
get(arr=gg, idx=0) ~> g0
get(arr=gg, idx=1) ~> g1
get(arr=gg, idx=2) ~> g2
get(arr=gg, idx=3) ~> g3
vec_scale(a=xv, s=g0) ~> rg0
vec_scale(a=xv, s=g1) ~> rg1
vec_scale(a=xv, s=g2) ~> rg2
vec_scale(a=xv, s=g3) ~> rg3
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
sgd_update(weights=wr1, grad=rg1, lr=lr) ~> wr1
sgd_update(weights=wr2, grad=rg2, lr=lr) ~> wr2
sgd_update(weights=wr3, grad=rg3, lr=lr) ~> wr3
dot_product(a=gg, b=gg) ~> ls
xv = [0.9579, 0.0000, 0.0105, 0.0105]
tv = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv) ~> pp
vec_sub(a=pp, b=tv) ~> gg
get(arr=gg, idx=0) ~> g0
get(arr=gg, idx=1) ~> g1
get(arr=gg, idx=2) ~> g2
get(arr=gg, idx=3) ~> g3
vec_scale(a=xv, s=g0) ~> rg0
vec_scale(a=xv, s=g1) ~> rg1
vec_scale(a=xv, s=g2) ~> rg2
vec_scale(a=xv, s=g3) ~> rg3
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
sgd_update(weights=wr1, grad=rg1, lr=lr) ~> wr1
sgd_update(weights=wr2, grad=rg2, lr=lr) ~> wr2
sgd_update(weights=wr3, grad=rg3, lr=lr) ~> wr3
dot_product(a=gg, b=gg) ~> ls
xv = [0.0105, 0.8421, 0.6842, 0.8737]
tv = [1, 0, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv) ~> pp
vec_sub(a=pp, b=tv) ~> gg
get(arr=gg, idx=0) ~> g0
get(arr=gg, idx=1) ~> g1
get(arr=gg, idx=2) ~> g2
get(arr=gg, idx=3) ~> g3
vec_scale(a=xv, s=g0) ~> rg0
vec_scale(a=xv, s=g1) ~> rg1
vec_scale(a=xv, s=g2) ~> rg2
vec_scale(a=xv, s=g3) ~> rg3
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
sgd_update(weights=wr1, grad=rg1, lr=lr) ~> wr1
sgd_update(weights=wr2, grad=rg2, lr=lr) ~> wr2
sgd_update(weights=wr3, grad=rg3, lr=lr) ~> wr3
dot_product(a=gg, b=gg) ~> ls
xv = [0.0947, 0.6842, 0.8632, 0.8632]
tv = [0, 0, 1, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv) ~> pp
vec_sub(a=pp, b=tv) ~> gg
get(arr=gg, idx=0) ~> g0
get(arr=gg, idx=1) ~> g1
get(arr=gg, idx=2) ~> g2
get(arr=gg, idx=3) ~> g3
vec_scale(a=xv, s=g0) ~> rg0
vec_scale(a=xv, s=g1) ~> rg1
vec_scale(a=xv, s=g2) ~> rg2
vec_scale(a=xv, s=g3) ~> rg3
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
sgd_update(weights=wr1, grad=rg1, lr=lr) ~> wr1
sgd_update(weights=wr2, grad=rg2, lr=lr) ~> wr2
sgd_update(weights=wr3, grad=rg3, lr=lr) ~> wr3
dot_product(a=gg, b=gg) ~> ls
xv = [0.0105, 0.9895, 0.3263, 0.0105]
tv = [0, 0, 1, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv) ~> pp
vec_sub(a=pp, b=tv) ~> gg
get(arr=gg, idx=0) ~> g0
get(arr=gg, idx=1) ~> g1
get(arr=gg, idx=2) ~> g2
get(arr=gg, idx=3) ~> g3
vec_scale(a=xv, s=g0) ~> rg0
vec_scale(a=xv, s=g1) ~> rg1
vec_scale(a=xv, s=g2) ~> rg2
vec_scale(a=xv, s=g3) ~> rg3
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
sgd_update(weights=wr1, grad=rg1, lr=lr) ~> wr1
sgd_update(weights=wr2, grad=rg2, lr=lr) ~> wr2
sgd_update(weights=wr3, grad=rg3, lr=lr) ~> wr3
dot_product(a=gg, b=gg) ~> ls
xv = [0.1895, 0.0000, 0.0105, 0.0105]
tv = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv) ~> pp
vec_sub(a=pp, b=tv) ~> gg
get(arr=gg, idx=0) ~> g0
get(arr=gg, idx=1) ~> g1
get(arr=gg, idx=2) ~> g2
get(arr=gg, idx=3) ~> g3
vec_scale(a=xv, s=g0) ~> rg0
vec_scale(a=xv, s=g1) ~> rg1
vec_scale(a=xv, s=g2) ~> rg2
vec_scale(a=xv, s=g3) ~> rg3
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
sgd_update(weights=wr1, grad=rg1, lr=lr) ~> wr1
sgd_update(weights=wr2, grad=rg2, lr=lr) ~> wr2
sgd_update(weights=wr3, grad=rg3, lr=lr) ~> wr3
dot_product(a=gg, b=gg) ~> ls
xv = [0.0105, 0.8421, 0.6842, 0.8737]
tv = [1, 0, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv) ~> pp
vec_sub(a=pp, b=tv) ~> gg
get(arr=gg, idx=0) ~> g0
get(arr=gg, idx=1) ~> g1
get(arr=gg, idx=2) ~> g2
get(arr=gg, idx=3) ~> g3
vec_scale(a=xv, s=g0) ~> rg0
vec_scale(a=xv, s=g1) ~> rg1
vec_scale(a=xv, s=g2) ~> rg2
vec_scale(a=xv, s=g3) ~> rg3
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
sgd_update(weights=wr1, grad=rg1, lr=lr) ~> wr1
sgd_update(weights=wr2, grad=rg2, lr=lr) ~> wr2
sgd_update(weights=wr3, grad=rg3, lr=lr) ~> wr3
dot_product(a=gg, b=gg) ~> ls
xv = [0.0947, 0.8211, 0.1053, 0.0105]
tv = [0, 0, 1, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv) ~> pp
vec_sub(a=pp, b=tv) ~> gg
get(arr=gg, idx=0) ~> g0
get(arr=gg, idx=1) ~> g1
get(arr=gg, idx=2) ~> g2
get(arr=gg, idx=3) ~> g3
vec_scale(a=xv, s=g0) ~> rg0
vec_scale(a=xv, s=g1) ~> rg1
vec_scale(a=xv, s=g2) ~> rg2
vec_scale(a=xv, s=g3) ~> rg3
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
sgd_update(weights=wr1, grad=rg1, lr=lr) ~> wr1
sgd_update(weights=wr2, grad=rg2, lr=lr) ~> wr2
sgd_update(weights=wr3, grad=rg3, lr=lr) ~> wr3
dot_product(a=gg, b=gg) ~> ls
xv = [0.3263, 0.0105, 0.4947, 0.0000]
tv = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv) ~> pp
vec_sub(a=pp, b=tv) ~> gg
get(arr=gg, idx=0) ~> g0
get(arr=gg, idx=1) ~> g1
get(arr=gg, idx=2) ~> g2
get(arr=gg, idx=3) ~> g3
vec_scale(a=xv, s=g0) ~> rg0
vec_scale(a=xv, s=g1) ~> rg1
vec_scale(a=xv, s=g2) ~> rg2
vec_scale(a=xv, s=g3) ~> rg3
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
sgd_update(weights=wr1, grad=rg1, lr=lr) ~> wr1
sgd_update(weights=wr2, grad=rg2, lr=lr) ~> wr2
sgd_update(weights=wr3, grad=rg3, lr=lr) ~> wr3
dot_product(a=gg, b=gg) ~> ls
xv = [0.0105, 0.0105, 0.0105, 0.8000]
tv = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv) ~> pp
vec_sub(a=pp, b=tv) ~> gg
get(arr=gg, idx=0) ~> g0
get(arr=gg, idx=1) ~> g1
get(arr=gg, idx=2) ~> g2
get(arr=gg, idx=3) ~> g3
vec_scale(a=xv, s=g0) ~> rg0
vec_scale(a=xv, s=g1) ~> rg1
vec_scale(a=xv, s=g2) ~> rg2
vec_scale(a=xv, s=g3) ~> rg3
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
sgd_update(weights=wr1, grad=rg1, lr=lr) ~> wr1
sgd_update(weights=wr2, grad=rg2, lr=lr) ~> wr2
sgd_update(weights=wr3, grad=rg3, lr=lr) ~> wr3
dot_product(a=gg, b=gg) ~> ls
xv = [0.8211, 0.0947, 0.9053, 0.6842]
tv = [1, 0, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv) ~> pp
vec_sub(a=pp, b=tv) ~> gg
get(arr=gg, idx=0) ~> g0
get(arr=gg, idx=1) ~> g1
get(arr=gg, idx=2) ~> g2
get(arr=gg, idx=3) ~> g3
vec_scale(a=xv, s=g0) ~> rg0
vec_scale(a=xv, s=g1) ~> rg1
vec_scale(a=xv, s=g2) ~> rg2
vec_scale(a=xv, s=g3) ~> rg3
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
sgd_update(weights=wr1, grad=rg1, lr=lr) ~> wr1
sgd_update(weights=wr2, grad=rg2, lr=lr) ~> wr2
sgd_update(weights=wr3, grad=rg3, lr=lr) ~> wr3
dot_product(a=gg, b=gg) ~> ls
xv = [0.3158, 0.3579, 0.1895, 0.1053]
tv = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv) ~> pp
vec_sub(a=pp, b=tv) ~> gg
get(arr=gg, idx=0) ~> g0
get(arr=gg, idx=1) ~> g1
get(arr=gg, idx=2) ~> g2
get(arr=gg, idx=3) ~> g3
vec_scale(a=xv, s=g0) ~> rg0
vec_scale(a=xv, s=g1) ~> rg1
vec_scale(a=xv, s=g2) ~> rg2
vec_scale(a=xv, s=g3) ~> rg3
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
sgd_update(weights=wr1, grad=rg1, lr=lr) ~> wr1
sgd_update(weights=wr2, grad=rg2, lr=lr) ~> wr2
sgd_update(weights=wr3, grad=rg3, lr=lr) ~> wr3
dot_product(a=gg, b=gg) ~> ls
xv = [0.9895, 0.3263, 0.0105, 0.4737]
tv = [1, 0, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv) ~> pp
vec_sub(a=pp, b=tv) ~> gg
get(arr=gg, idx=0) ~> g0
get(arr=gg, idx=1) ~> g1
get(arr=gg, idx=2) ~> g2
get(arr=gg, idx=3) ~> g3
vec_scale(a=xv, s=g0) ~> rg0
vec_scale(a=xv, s=g1) ~> rg1
vec_scale(a=xv, s=g2) ~> rg2
vec_scale(a=xv, s=g3) ~> rg3
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
sgd_update(weights=wr1, grad=rg1, lr=lr) ~> wr1
sgd_update(weights=wr2, grad=rg2, lr=lr) ~> wr2
sgd_update(weights=wr3, grad=rg3, lr=lr) ~> wr3
dot_product(a=gg, b=gg) ~> ls
xv = [0.0105, 0.0105, 0.0105, 0.0105]
tv = [0, 0, 1, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv) ~> pp
vec_sub(a=pp, b=tv) ~> gg
get(arr=gg, idx=0) ~> g0
get(arr=gg, idx=1) ~> g1
get(arr=gg, idx=2) ~> g2
get(arr=gg, idx=3) ~> g3
vec_scale(a=xv, s=g0) ~> rg0
vec_scale(a=xv, s=g1) ~> rg1
vec_scale(a=xv, s=g2) ~> rg2
vec_scale(a=xv, s=g3) ~> rg3
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
sgd_update(weights=wr1, grad=rg1, lr=lr) ~> wr1
sgd_update(weights=wr2, grad=rg2, lr=lr) ~> wr2
sgd_update(weights=wr3, grad=rg3, lr=lr) ~> wr3
dot_product(a=gg, b=gg) ~> ls
xv = [0.6842, 0.8211, 0.7474, 0.7263]
tv = [1, 0, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv) ~> pp
vec_sub(a=pp, b=tv) ~> gg
get(arr=gg, idx=0) ~> g0
get(arr=gg, idx=1) ~> g1
get(arr=gg, idx=2) ~> g2
get(arr=gg, idx=3) ~> g3
vec_scale(a=xv, s=g0) ~> rg0
vec_scale(a=xv, s=g1) ~> rg1
vec_scale(a=xv, s=g2) ~> rg2
vec_scale(a=xv, s=g3) ~> rg3
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
sgd_update(weights=wr1, grad=rg1, lr=lr) ~> wr1
sgd_update(weights=wr2, grad=rg2, lr=lr) ~> wr2
sgd_update(weights=wr3, grad=rg3, lr=lr) ~> wr3
dot_product(a=gg, b=gg) ~> ls
xv = [0.8737, 0.8842, 0.7263, 0.8421]
tv = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv) ~> pp
vec_sub(a=pp, b=tv) ~> gg
get(arr=gg, idx=0) ~> g0
get(arr=gg, idx=1) ~> g1
get(arr=gg, idx=2) ~> g2
get(arr=gg, idx=3) ~> g3
vec_scale(a=xv, s=g0) ~> rg0
vec_scale(a=xv, s=g1) ~> rg1
vec_scale(a=xv, s=g2) ~> rg2
vec_scale(a=xv, s=g3) ~> rg3
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
sgd_update(weights=wr1, grad=rg1, lr=lr) ~> wr1
sgd_update(weights=wr2, grad=rg2, lr=lr) ~> wr2
sgd_update(weights=wr3, grad=rg3, lr=lr) ~> wr3
dot_product(a=gg, b=gg) ~> ls
xv = [0.7368, 0.8632, 0.8316, 0.8105]
tv = [0, 0, 1, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv) ~> pp
vec_sub(a=pp, b=tv) ~> gg
get(arr=gg, idx=0) ~> g0
get(arr=gg, idx=1) ~> g1
get(arr=gg, idx=2) ~> g2
get(arr=gg, idx=3) ~> g3
vec_scale(a=xv, s=g0) ~> rg0
vec_scale(a=xv, s=g1) ~> rg1
vec_scale(a=xv, s=g2) ~> rg2
vec_scale(a=xv, s=g3) ~> rg3
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
sgd_update(weights=wr1, grad=rg1, lr=lr) ~> wr1
sgd_update(weights=wr2, grad=rg2, lr=lr) ~> wr2
sgd_update(weights=wr3, grad=rg3, lr=lr) ~> wr3
dot_product(a=gg, b=gg) ~> ls
xv = [0.1789, 0.1368, 0.0105, 0.8842]
tv = [0, 0, 0, 1]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv) ~> pp
vec_sub(a=pp, b=tv) ~> gg
get(arr=gg, idx=0) ~> g0
get(arr=gg, idx=1) ~> g1
get(arr=gg, idx=2) ~> g2
get(arr=gg, idx=3) ~> g3
vec_scale(a=xv, s=g0) ~> rg0
vec_scale(a=xv, s=g1) ~> rg1
vec_scale(a=xv, s=g2) ~> rg2
vec_scale(a=xv, s=g3) ~> rg3
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
sgd_update(weights=wr1, grad=rg1, lr=lr) ~> wr1
sgd_update(weights=wr2, grad=rg2, lr=lr) ~> wr2
sgd_update(weights=wr3, grad=rg3, lr=lr) ~> wr3
dot_product(a=gg, b=gg) ~> ls
xv = [0.3158, 0.4737, 0.1368, 0.0105]
tv = [0, 0, 0, 1]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv) ~> pp
vec_sub(a=pp, b=tv) ~> gg
get(arr=gg, idx=0) ~> g0
get(arr=gg, idx=1) ~> g1
get(arr=gg, idx=2) ~> g2
get(arr=gg, idx=3) ~> g3
vec_scale(a=xv, s=g0) ~> rg0
vec_scale(a=xv, s=g1) ~> rg1
vec_scale(a=xv, s=g2) ~> rg2
vec_scale(a=xv, s=g3) ~> rg3
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
sgd_update(weights=wr1, grad=rg1, lr=lr) ~> wr1
sgd_update(weights=wr2, grad=rg2, lr=lr) ~> wr2
sgd_update(weights=wr3, grad=rg3, lr=lr) ~> wr3
dot_product(a=gg, b=gg) ~> ls
xv = [0.8842, 0.7263, 0.8421, 0.3158]
tv = [0, 0, 0, 1]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv) ~> pp
vec_sub(a=pp, b=tv) ~> gg
get(arr=gg, idx=0) ~> g0
get(arr=gg, idx=1) ~> g1
get(arr=gg, idx=2) ~> g2
get(arr=gg, idx=3) ~> g3
vec_scale(a=xv, s=g0) ~> rg0
vec_scale(a=xv, s=g1) ~> rg1
vec_scale(a=xv, s=g2) ~> rg2
vec_scale(a=xv, s=g3) ~> rg3
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
sgd_update(weights=wr1, grad=rg1, lr=lr) ~> wr1
sgd_update(weights=wr2, grad=rg2, lr=lr) ~> wr2
sgd_update(weights=wr3, grad=rg3, lr=lr) ~> wr3
dot_product(a=gg, b=gg) ~> ls
xv = [0.1053, 0.0105, 0.9895, 0.3263]
tv = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv) ~> pp
vec_sub(a=pp, b=tv) ~> gg
get(arr=gg, idx=0) ~> g0
get(arr=gg, idx=1) ~> g1
get(arr=gg, idx=2) ~> g2
get(arr=gg, idx=3) ~> g3
vec_scale(a=xv, s=g0) ~> rg0
vec_scale(a=xv, s=g1) ~> rg1
vec_scale(a=xv, s=g2) ~> rg2
vec_scale(a=xv, s=g3) ~> rg3
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
sgd_update(weights=wr1, grad=rg1, lr=lr) ~> wr1
sgd_update(weights=wr2, grad=rg2, lr=lr) ~> wr2
sgd_update(weights=wr3, grad=rg3, lr=lr) ~> wr3
dot_product(a=gg, b=gg) ~> ls
xv = [0.8737, 0.8842, 0.6842, 0.8632]
tv = [1, 0, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv) ~> pp
vec_sub(a=pp, b=tv) ~> gg
get(arr=gg, idx=0) ~> g0
get(arr=gg, idx=1) ~> g1
get(arr=gg, idx=2) ~> g2
get(arr=gg, idx=3) ~> g3
vec_scale(a=xv, s=g0) ~> rg0
vec_scale(a=xv, s=g1) ~> rg1
vec_scale(a=xv, s=g2) ~> rg2
vec_scale(a=xv, s=g3) ~> rg3
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
sgd_update(weights=wr1, grad=rg1, lr=lr) ~> wr1
sgd_update(weights=wr2, grad=rg2, lr=lr) ~> wr2
sgd_update(weights=wr3, grad=rg3, lr=lr) ~> wr3
dot_product(a=gg, b=gg) ~> ls
xv = [0.8737, 0.0000, 0.0105, 0.0105]
tv = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv) ~> pp
vec_sub(a=pp, b=tv) ~> gg
get(arr=gg, idx=0) ~> g0
get(arr=gg, idx=1) ~> g1
get(arr=gg, idx=2) ~> g2
get(arr=gg, idx=3) ~> g3
vec_scale(a=xv, s=g0) ~> rg0
vec_scale(a=xv, s=g1) ~> rg1
vec_scale(a=xv, s=g2) ~> rg2
vec_scale(a=xv, s=g3) ~> rg3
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
sgd_update(weights=wr1, grad=rg1, lr=lr) ~> wr1
sgd_update(weights=wr2, grad=rg2, lr=lr) ~> wr2
sgd_update(weights=wr3, grad=rg3, lr=lr) ~> wr3
dot_product(a=gg, b=gg) ~> ls
xv = [0.0105, 0.4105, 0.0947, 0.8737]
tv = [1, 0, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv) ~> pp
vec_sub(a=pp, b=tv) ~> gg
get(arr=gg, idx=0) ~> g0
get(arr=gg, idx=1) ~> g1
get(arr=gg, idx=2) ~> g2
get(arr=gg, idx=3) ~> g3
vec_scale(a=xv, s=g0) ~> rg0
vec_scale(a=xv, s=g1) ~> rg1
vec_scale(a=xv, s=g2) ~> rg2
vec_scale(a=xv, s=g3) ~> rg3
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
sgd_update(weights=wr1, grad=rg1, lr=lr) ~> wr1
sgd_update(weights=wr2, grad=rg2, lr=lr) ~> wr2
sgd_update(weights=wr3, grad=rg3, lr=lr) ~> wr3
dot_product(a=gg, b=gg) ~> ls
xv = [0.6842, 0.8632, 0.8842, 0.8737]
tv = [0, 0, 1, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv) ~> pp
vec_sub(a=pp, b=tv) ~> gg
get(arr=gg, idx=0) ~> g0
get(arr=gg, idx=1) ~> g1
get(arr=gg, idx=2) ~> g2
get(arr=gg, idx=3) ~> g3
vec_scale(a=xv, s=g0) ~> rg0
vec_scale(a=xv, s=g1) ~> rg1
vec_scale(a=xv, s=g2) ~> rg2
vec_scale(a=xv, s=g3) ~> rg3
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
sgd_update(weights=wr1, grad=rg1, lr=lr) ~> wr1
sgd_update(weights=wr2, grad=rg2, lr=lr) ~> wr2
sgd_update(weights=wr3, grad=rg3, lr=lr) ~> wr3
dot_product(a=gg, b=gg) ~> ls
xv = [0.0105, 0.9579, 0.0000, 0.0105]
tv = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv) ~> pp
vec_sub(a=pp, b=tv) ~> gg
get(arr=gg, idx=0) ~> g0
get(arr=gg, idx=1) ~> g1
get(arr=gg, idx=2) ~> g2
get(arr=gg, idx=3) ~> g3
vec_scale(a=xv, s=g0) ~> rg0
vec_scale(a=xv, s=g1) ~> rg1
vec_scale(a=xv, s=g2) ~> rg2
vec_scale(a=xv, s=g3) ~> rg3
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
sgd_update(weights=wr1, grad=rg1, lr=lr) ~> wr1
sgd_update(weights=wr2, grad=rg2, lr=lr) ~> wr2
sgd_update(weights=wr3, grad=rg3, lr=lr) ~> wr3
dot_product(a=gg, b=gg) ~> ls
xv = [0.0105, 0.0105, 0.0105, 0.0105]
tv = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv) ~> pp
vec_sub(a=pp, b=tv) ~> gg
get(arr=gg, idx=0) ~> g0
get(arr=gg, idx=1) ~> g1
get(arr=gg, idx=2) ~> g2
get(arr=gg, idx=3) ~> g3
vec_scale(a=xv, s=g0) ~> rg0
vec_scale(a=xv, s=g1) ~> rg1
vec_scale(a=xv, s=g2) ~> rg2
vec_scale(a=xv, s=g3) ~> rg3
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
sgd_update(weights=wr1, grad=rg1, lr=lr) ~> wr1
sgd_update(weights=wr2, grad=rg2, lr=lr) ~> wr2
sgd_update(weights=wr3, grad=rg3, lr=lr) ~> wr3
dot_product(a=gg, b=gg) ~> ls
xv = [0.0105, 0.8211, 0.8316, 0.9158]
tv = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv) ~> pp
vec_sub(a=pp, b=tv) ~> gg
get(arr=gg, idx=0) ~> g0
get(arr=gg, idx=1) ~> g1
get(arr=gg, idx=2) ~> g2
get(arr=gg, idx=3) ~> g3
vec_scale(a=xv, s=g0) ~> rg0
vec_scale(a=xv, s=g1) ~> rg1
vec_scale(a=xv, s=g2) ~> rg2
vec_scale(a=xv, s=g3) ~> rg3
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
sgd_update(weights=wr1, grad=rg1, lr=lr) ~> wr1
sgd_update(weights=wr2, grad=rg2, lr=lr) ~> wr2
sgd_update(weights=wr3, grad=rg3, lr=lr) ~> wr3
dot_product(a=gg, b=gg) ~> ls
xv = [0.3263, 0.3263, 0.0105, 0.7684]
tv = [1, 0, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv) ~> pp
vec_sub(a=pp, b=tv) ~> gg
get(arr=gg, idx=0) ~> g0
get(arr=gg, idx=1) ~> g1
get(arr=gg, idx=2) ~> g2
get(arr=gg, idx=3) ~> g3
vec_scale(a=xv, s=g0) ~> rg0
vec_scale(a=xv, s=g1) ~> rg1
vec_scale(a=xv, s=g2) ~> rg2
vec_scale(a=xv, s=g3) ~> rg3
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
sgd_update(weights=wr1, grad=rg1, lr=lr) ~> wr1
sgd_update(weights=wr2, grad=rg2, lr=lr) ~> wr2
sgd_update(weights=wr3, grad=rg3, lr=lr) ~> wr3
dot_product(a=gg, b=gg) ~> ls
xv = [0.9263, 0.0000, 0.0105, 0.0105]
tv = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv) ~> pp
vec_sub(a=pp, b=tv) ~> gg
get(arr=gg, idx=0) ~> g0
get(arr=gg, idx=1) ~> g1
get(arr=gg, idx=2) ~> g2
get(arr=gg, idx=3) ~> g3
vec_scale(a=xv, s=g0) ~> rg0
vec_scale(a=xv, s=g1) ~> rg1
vec_scale(a=xv, s=g2) ~> rg2
vec_scale(a=xv, s=g3) ~> rg3
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
sgd_update(weights=wr1, grad=rg1, lr=lr) ~> wr1
sgd_update(weights=wr2, grad=rg2, lr=lr) ~> wr2
sgd_update(weights=wr3, grad=rg3, lr=lr) ~> wr3
dot_product(a=gg, b=gg) ~> ls
xv = [0.0105, 0.0105, 0.0105, 0.0105]
tv = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv) ~> pp
vec_sub(a=pp, b=tv) ~> gg
get(arr=gg, idx=0) ~> g0
get(arr=gg, idx=1) ~> g1
get(arr=gg, idx=2) ~> g2
get(arr=gg, idx=3) ~> g3
vec_scale(a=xv, s=g0) ~> rg0
vec_scale(a=xv, s=g1) ~> rg1
vec_scale(a=xv, s=g2) ~> rg2
vec_scale(a=xv, s=g3) ~> rg3
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
sgd_update(weights=wr1, grad=rg1, lr=lr) ~> wr1
sgd_update(weights=wr2, grad=rg2, lr=lr) ~> wr2
sgd_update(weights=wr3, grad=rg3, lr=lr) ~> wr3
dot_product(a=gg, b=gg) ~> ls
xv = [0.7684, 0.7158, 0.9263, 0.0105]
tv = [1, 0, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv) ~> pp
vec_sub(a=pp, b=tv) ~> gg
get(arr=gg, idx=0) ~> g0
get(arr=gg, idx=1) ~> g1
get(arr=gg, idx=2) ~> g2
get(arr=gg, idx=3) ~> g3
vec_scale(a=xv, s=g0) ~> rg0
vec_scale(a=xv, s=g1) ~> rg1
vec_scale(a=xv, s=g2) ~> rg2
vec_scale(a=xv, s=g3) ~> rg3
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
sgd_update(weights=wr1, grad=rg1, lr=lr) ~> wr1
sgd_update(weights=wr2, grad=rg2, lr=lr) ~> wr2
sgd_update(weights=wr3, grad=rg3, lr=lr) ~> wr3
dot_product(a=gg, b=gg) ~> ls
xv = [0.0105, 0.4947, 0.0105, 0.3263]
tv = [0, 0, 0, 1]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv) ~> pp
vec_sub(a=pp, b=tv) ~> gg
get(arr=gg, idx=0) ~> g0
get(arr=gg, idx=1) ~> g1
get(arr=gg, idx=2) ~> g2
get(arr=gg, idx=3) ~> g3
vec_scale(a=xv, s=g0) ~> rg0
vec_scale(a=xv, s=g1) ~> rg1
vec_scale(a=xv, s=g2) ~> rg2
vec_scale(a=xv, s=g3) ~> rg3
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
sgd_update(weights=wr1, grad=rg1, lr=lr) ~> wr1
sgd_update(weights=wr2, grad=rg2, lr=lr) ~> wr2
sgd_update(weights=wr3, grad=rg3, lr=lr) ~> wr3
dot_product(a=gg, b=gg) ~> ls
xv = [0.0105, 0.7263, 0.8211, 0.7158]
tv = [1, 0, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv) ~> pp
vec_sub(a=pp, b=tv) ~> gg
get(arr=gg, idx=0) ~> g0
get(arr=gg, idx=1) ~> g1
get(arr=gg, idx=2) ~> g2
get(arr=gg, idx=3) ~> g3
vec_scale(a=xv, s=g0) ~> rg0
vec_scale(a=xv, s=g1) ~> rg1
vec_scale(a=xv, s=g2) ~> rg2
vec_scale(a=xv, s=g3) ~> rg3
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
sgd_update(weights=wr1, grad=rg1, lr=lr) ~> wr1
sgd_update(weights=wr2, grad=rg2, lr=lr) ~> wr2
sgd_update(weights=wr3, grad=rg3, lr=lr) ~> wr3
dot_product(a=gg, b=gg) ~> ls
xv = [0.0105, 0.0105, 0.0105, 0.0105]
tv = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv) ~> pp
vec_sub(a=pp, b=tv) ~> gg
get(arr=gg, idx=0) ~> g0
get(arr=gg, idx=1) ~> g1
get(arr=gg, idx=2) ~> g2
get(arr=gg, idx=3) ~> g3
vec_scale(a=xv, s=g0) ~> rg0
vec_scale(a=xv, s=g1) ~> rg1
vec_scale(a=xv, s=g2) ~> rg2
vec_scale(a=xv, s=g3) ~> rg3
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
sgd_update(weights=wr1, grad=rg1, lr=lr) ~> wr1
sgd_update(weights=wr2, grad=rg2, lr=lr) ~> wr2
sgd_update(weights=wr3, grad=rg3, lr=lr) ~> wr3
dot_product(a=gg, b=gg) ~> ls
xv = [0.0105, 0.0105, 0.0105, 0.8105]
tv = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv) ~> pp
vec_sub(a=pp, b=tv) ~> gg
get(arr=gg, idx=0) ~> g0
get(arr=gg, idx=1) ~> g1
get(arr=gg, idx=2) ~> g2
get(arr=gg, idx=3) ~> g3
vec_scale(a=xv, s=g0) ~> rg0
vec_scale(a=xv, s=g1) ~> rg1
vec_scale(a=xv, s=g2) ~> rg2
vec_scale(a=xv, s=g3) ~> rg3
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
sgd_update(weights=wr1, grad=rg1, lr=lr) ~> wr1
sgd_update(weights=wr2, grad=rg2, lr=lr) ~> wr2
sgd_update(weights=wr3, grad=rg3, lr=lr) ~> wr3
dot_product(a=gg, b=gg) ~> ls
[T+]
show shall(ls)
show shall(wr0)