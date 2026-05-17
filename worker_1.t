[T-]
import "lib/basic/std.t"
import "lib/advanced/ml_t.t"
wr0 = [-0.0559, 0.0179, 0.0619, -0.0987]
wr1 = [0.0612, 0.0396, -0.0319, -0.0689]
wr2 = [0.0914, -0.0327, -0.0815, -0.0807]
wr3 = [0.0695, 0.0207, 0.0614, 0.0459]
bv = [0, 0, 0, 0]
lr = 0.01
xv0 = [0.7368, 0.8632, 0.8316, 0.8105]
tv0 = [0, 0, 1, 0]
xv1 = [0.0105, 0.8842, 0.8316, 0.3158]
tv1 = [0, 1, 0, 0]
xv2 = [0.8737, 0.8842, 0.7263, 0.8421]
tv2 = [0, 0, 1, 0]
xv3 = [0.0105, 0.9895, 0.3263, 0.0105]
tv3 = [0, 0, 0, 1]
xv4 = [0.8632, 0.8842, 0.8737, 0.0000]
tv4 = [0, 1, 0, 0]
xv5 = [0.0105, 0.4105, 0.0947, 0.8737]
tv5 = [1, 0, 0, 0]
xv6 = [0.8842, 0.8737, 0.1053, 0.0105]
tv6 = [0, 0, 0, 1]
xv7 = [0.0105, 0.0105, 0.0105, 0.0105]
tv7 = [0, 1, 0, 0]
xv8 = [0.7474, 0.7263, 0.8842, 0.0947]
tv8 = [0, 1, 0, 0]
xv9 = [0.3158, 0.7053, 0.7579, 0.1368]
tv9 = [0, 1, 0, 0]
xv10 = [0.9263, 0.3158, 0.8211, 0.8316]
tv10 = [0, 0, 0, 1]
xv11 = [0.9895, 0.3263, 0.0105, 0.7053]
tv11 = [0, 0, 1, 0]
xv12 = [0.0105, 0.0105, 0.0105, 0.0105]
tv12 = [0, 1, 0, 0]
xv13 = [0.7053, 0.7579, 0.6842, 0.8632]
tv13 = [1, 0, 0, 0]
xv14 = [0.7263, 0.0947, 0.8737, 0.8842]
tv14 = [0, 0, 1, 0]
xv15 = [0.1895, 0.1053, 0.0105, 0.9895]
tv15 = [0, 0, 0, 1]
xv16 = [0.1895, 0.0000, 0.0105, 0.0105]
tv16 = [0, 1, 0, 0]
xv17 = [0.0105, 0.0105, 0.0105, 0.8211]
tv17 = [0, 0, 0, 1]
xv18 = [0.1263, 0.0105, 0.1895, 0.0105]
tv18 = [0, 0, 0, 1]
xv19 = [0.7684, 0.2000, 0.0000, 0.0105]
tv19 = [0, 1, 0, 0]
xv20 = [0.0105, 0.0105, 0.0105, 0.0105]
tv20 = [0, 0, 1, 0]
xv21 = [0.0105, 0.1263, 0.0105, 0.2000]
tv21 = [0, 1, 0, 0]
xv22 = [0.0105, 0.7684, 0.2105, 0.0000]
tv22 = [0, 1, 0, 0]
xv23 = [0.0105, 0.0105, 0.0105, 0.0105]
tv23 = [0, 1, 0, 0]
xv24 = [0.1474, 0.0105, 0.7684, 0.2000]
tv24 = [0, 1, 0, 0]
xv25 = [0.0105, 0.7158, 0.2000, 0.0000]
tv25 = [0, 1, 0, 0]
xv26 = [0.0105, 0.0105, 0.0105, 0.0105]
tv26 = [0, 1, 0, 0]
xv27 = [0.6842, 0.8105, 0.8421, 0.0947]
tv27 = [0, 0, 1, 0]
xv28 = [0.3158, 0.7158, 0.2000, 0.1368]
tv28 = [0, 1, 0, 0]
xv29 = [0.3158, 0.1789, 0.1368, 0.0105]
tv29 = [1, 0, 0, 0]
[T0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv0) ~> pp
vec_sub(a=pp, b=tv0) ~> gg
get(arr=gg, idx=0) ~> g0
get(arr=gg, idx=1) ~> g1
get(arr=gg, idx=2) ~> g2
get(arr=gg, idx=3) ~> g3
vec_scale(a=xv0, s=g0) ~> rg0
vec_scale(a=xv0, s=g1) ~> rg1
vec_scale(a=xv0, s=g2) ~> rg2
vec_scale(a=xv0, s=g3) ~> rg3
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
sgd_update(weights=wr1, grad=rg1, lr=lr) ~> wr1
sgd_update(weights=wr2, grad=rg2, lr=lr) ~> wr2
sgd_update(weights=wr3, grad=rg3, lr=lr) ~> wr3
dot_product(a=gg, b=gg) ~> ls
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv1) ~> pp
vec_sub(a=pp, b=tv1) ~> gg
get(arr=gg, idx=0) ~> g0
get(arr=gg, idx=1) ~> g1
get(arr=gg, idx=2) ~> g2
get(arr=gg, idx=3) ~> g3
vec_scale(a=xv1, s=g0) ~> rg0
vec_scale(a=xv1, s=g1) ~> rg1
vec_scale(a=xv1, s=g2) ~> rg2
vec_scale(a=xv1, s=g3) ~> rg3
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
sgd_update(weights=wr1, grad=rg1, lr=lr) ~> wr1
sgd_update(weights=wr2, grad=rg2, lr=lr) ~> wr2
sgd_update(weights=wr3, grad=rg3, lr=lr) ~> wr3
dot_product(a=gg, b=gg) ~> ls
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv2) ~> pp
vec_sub(a=pp, b=tv2) ~> gg
get(arr=gg, idx=0) ~> g0
get(arr=gg, idx=1) ~> g1
get(arr=gg, idx=2) ~> g2
get(arr=gg, idx=3) ~> g3
vec_scale(a=xv2, s=g0) ~> rg0
vec_scale(a=xv2, s=g1) ~> rg1
vec_scale(a=xv2, s=g2) ~> rg2
vec_scale(a=xv2, s=g3) ~> rg3
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
sgd_update(weights=wr1, grad=rg1, lr=lr) ~> wr1
sgd_update(weights=wr2, grad=rg2, lr=lr) ~> wr2
sgd_update(weights=wr3, grad=rg3, lr=lr) ~> wr3
dot_product(a=gg, b=gg) ~> ls
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv3) ~> pp
vec_sub(a=pp, b=tv3) ~> gg
get(arr=gg, idx=0) ~> g0
get(arr=gg, idx=1) ~> g1
get(arr=gg, idx=2) ~> g2
get(arr=gg, idx=3) ~> g3
vec_scale(a=xv3, s=g0) ~> rg0
vec_scale(a=xv3, s=g1) ~> rg1
vec_scale(a=xv3, s=g2) ~> rg2
vec_scale(a=xv3, s=g3) ~> rg3
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
sgd_update(weights=wr1, grad=rg1, lr=lr) ~> wr1
sgd_update(weights=wr2, grad=rg2, lr=lr) ~> wr2
sgd_update(weights=wr3, grad=rg3, lr=lr) ~> wr3
dot_product(a=gg, b=gg) ~> ls
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv4) ~> pp
vec_sub(a=pp, b=tv4) ~> gg
get(arr=gg, idx=0) ~> g0
get(arr=gg, idx=1) ~> g1
get(arr=gg, idx=2) ~> g2
get(arr=gg, idx=3) ~> g3
vec_scale(a=xv4, s=g0) ~> rg0
vec_scale(a=xv4, s=g1) ~> rg1
vec_scale(a=xv4, s=g2) ~> rg2
vec_scale(a=xv4, s=g3) ~> rg3
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
sgd_update(weights=wr1, grad=rg1, lr=lr) ~> wr1
sgd_update(weights=wr2, grad=rg2, lr=lr) ~> wr2
sgd_update(weights=wr3, grad=rg3, lr=lr) ~> wr3
dot_product(a=gg, b=gg) ~> ls
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv5) ~> pp
vec_sub(a=pp, b=tv5) ~> gg
get(arr=gg, idx=0) ~> g0
get(arr=gg, idx=1) ~> g1
get(arr=gg, idx=2) ~> g2
get(arr=gg, idx=3) ~> g3
vec_scale(a=xv5, s=g0) ~> rg0
vec_scale(a=xv5, s=g1) ~> rg1
vec_scale(a=xv5, s=g2) ~> rg2
vec_scale(a=xv5, s=g3) ~> rg3
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
sgd_update(weights=wr1, grad=rg1, lr=lr) ~> wr1
sgd_update(weights=wr2, grad=rg2, lr=lr) ~> wr2
sgd_update(weights=wr3, grad=rg3, lr=lr) ~> wr3
dot_product(a=gg, b=gg) ~> ls
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv6) ~> pp
vec_sub(a=pp, b=tv6) ~> gg
get(arr=gg, idx=0) ~> g0
get(arr=gg, idx=1) ~> g1
get(arr=gg, idx=2) ~> g2
get(arr=gg, idx=3) ~> g3
vec_scale(a=xv6, s=g0) ~> rg0
vec_scale(a=xv6, s=g1) ~> rg1
vec_scale(a=xv6, s=g2) ~> rg2
vec_scale(a=xv6, s=g3) ~> rg3
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
sgd_update(weights=wr1, grad=rg1, lr=lr) ~> wr1
sgd_update(weights=wr2, grad=rg2, lr=lr) ~> wr2
sgd_update(weights=wr3, grad=rg3, lr=lr) ~> wr3
dot_product(a=gg, b=gg) ~> ls
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv7) ~> pp
vec_sub(a=pp, b=tv7) ~> gg
get(arr=gg, idx=0) ~> g0
get(arr=gg, idx=1) ~> g1
get(arr=gg, idx=2) ~> g2
get(arr=gg, idx=3) ~> g3
vec_scale(a=xv7, s=g0) ~> rg0
vec_scale(a=xv7, s=g1) ~> rg1
vec_scale(a=xv7, s=g2) ~> rg2
vec_scale(a=xv7, s=g3) ~> rg3
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
sgd_update(weights=wr1, grad=rg1, lr=lr) ~> wr1
sgd_update(weights=wr2, grad=rg2, lr=lr) ~> wr2
sgd_update(weights=wr3, grad=rg3, lr=lr) ~> wr3
dot_product(a=gg, b=gg) ~> ls
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv8) ~> pp
vec_sub(a=pp, b=tv8) ~> gg
get(arr=gg, idx=0) ~> g0
get(arr=gg, idx=1) ~> g1
get(arr=gg, idx=2) ~> g2
get(arr=gg, idx=3) ~> g3
vec_scale(a=xv8, s=g0) ~> rg0
vec_scale(a=xv8, s=g1) ~> rg1
vec_scale(a=xv8, s=g2) ~> rg2
vec_scale(a=xv8, s=g3) ~> rg3
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
sgd_update(weights=wr1, grad=rg1, lr=lr) ~> wr1
sgd_update(weights=wr2, grad=rg2, lr=lr) ~> wr2
sgd_update(weights=wr3, grad=rg3, lr=lr) ~> wr3
dot_product(a=gg, b=gg) ~> ls
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv9) ~> pp
vec_sub(a=pp, b=tv9) ~> gg
get(arr=gg, idx=0) ~> g0
get(arr=gg, idx=1) ~> g1
get(arr=gg, idx=2) ~> g2
get(arr=gg, idx=3) ~> g3
vec_scale(a=xv9, s=g0) ~> rg0
vec_scale(a=xv9, s=g1) ~> rg1
vec_scale(a=xv9, s=g2) ~> rg2
vec_scale(a=xv9, s=g3) ~> rg3
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
sgd_update(weights=wr1, grad=rg1, lr=lr) ~> wr1
sgd_update(weights=wr2, grad=rg2, lr=lr) ~> wr2
sgd_update(weights=wr3, grad=rg3, lr=lr) ~> wr3
dot_product(a=gg, b=gg) ~> ls
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv10) ~> pp
vec_sub(a=pp, b=tv10) ~> gg
get(arr=gg, idx=0) ~> g0
get(arr=gg, idx=1) ~> g1
get(arr=gg, idx=2) ~> g2
get(arr=gg, idx=3) ~> g3
vec_scale(a=xv10, s=g0) ~> rg0
vec_scale(a=xv10, s=g1) ~> rg1
vec_scale(a=xv10, s=g2) ~> rg2
vec_scale(a=xv10, s=g3) ~> rg3
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
sgd_update(weights=wr1, grad=rg1, lr=lr) ~> wr1
sgd_update(weights=wr2, grad=rg2, lr=lr) ~> wr2
sgd_update(weights=wr3, grad=rg3, lr=lr) ~> wr3
dot_product(a=gg, b=gg) ~> ls
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv11) ~> pp
vec_sub(a=pp, b=tv11) ~> gg
get(arr=gg, idx=0) ~> g0
get(arr=gg, idx=1) ~> g1
get(arr=gg, idx=2) ~> g2
get(arr=gg, idx=3) ~> g3
vec_scale(a=xv11, s=g0) ~> rg0
vec_scale(a=xv11, s=g1) ~> rg1
vec_scale(a=xv11, s=g2) ~> rg2
vec_scale(a=xv11, s=g3) ~> rg3
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
sgd_update(weights=wr1, grad=rg1, lr=lr) ~> wr1
sgd_update(weights=wr2, grad=rg2, lr=lr) ~> wr2
sgd_update(weights=wr3, grad=rg3, lr=lr) ~> wr3
dot_product(a=gg, b=gg) ~> ls
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv12) ~> pp
vec_sub(a=pp, b=tv12) ~> gg
get(arr=gg, idx=0) ~> g0
get(arr=gg, idx=1) ~> g1
get(arr=gg, idx=2) ~> g2
get(arr=gg, idx=3) ~> g3
vec_scale(a=xv12, s=g0) ~> rg0
vec_scale(a=xv12, s=g1) ~> rg1
vec_scale(a=xv12, s=g2) ~> rg2
vec_scale(a=xv12, s=g3) ~> rg3
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
sgd_update(weights=wr1, grad=rg1, lr=lr) ~> wr1
sgd_update(weights=wr2, grad=rg2, lr=lr) ~> wr2
sgd_update(weights=wr3, grad=rg3, lr=lr) ~> wr3
dot_product(a=gg, b=gg) ~> ls
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv13) ~> pp
vec_sub(a=pp, b=tv13) ~> gg
get(arr=gg, idx=0) ~> g0
get(arr=gg, idx=1) ~> g1
get(arr=gg, idx=2) ~> g2
get(arr=gg, idx=3) ~> g3
vec_scale(a=xv13, s=g0) ~> rg0
vec_scale(a=xv13, s=g1) ~> rg1
vec_scale(a=xv13, s=g2) ~> rg2
vec_scale(a=xv13, s=g3) ~> rg3
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
sgd_update(weights=wr1, grad=rg1, lr=lr) ~> wr1
sgd_update(weights=wr2, grad=rg2, lr=lr) ~> wr2
sgd_update(weights=wr3, grad=rg3, lr=lr) ~> wr3
dot_product(a=gg, b=gg) ~> ls
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv14) ~> pp
vec_sub(a=pp, b=tv14) ~> gg
get(arr=gg, idx=0) ~> g0
get(arr=gg, idx=1) ~> g1
get(arr=gg, idx=2) ~> g2
get(arr=gg, idx=3) ~> g3
vec_scale(a=xv14, s=g0) ~> rg0
vec_scale(a=xv14, s=g1) ~> rg1
vec_scale(a=xv14, s=g2) ~> rg2
vec_scale(a=xv14, s=g3) ~> rg3
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
sgd_update(weights=wr1, grad=rg1, lr=lr) ~> wr1
sgd_update(weights=wr2, grad=rg2, lr=lr) ~> wr2
sgd_update(weights=wr3, grad=rg3, lr=lr) ~> wr3
dot_product(a=gg, b=gg) ~> ls
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv15) ~> pp
vec_sub(a=pp, b=tv15) ~> gg
get(arr=gg, idx=0) ~> g0
get(arr=gg, idx=1) ~> g1
get(arr=gg, idx=2) ~> g2
get(arr=gg, idx=3) ~> g3
vec_scale(a=xv15, s=g0) ~> rg0
vec_scale(a=xv15, s=g1) ~> rg1
vec_scale(a=xv15, s=g2) ~> rg2
vec_scale(a=xv15, s=g3) ~> rg3
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
sgd_update(weights=wr1, grad=rg1, lr=lr) ~> wr1
sgd_update(weights=wr2, grad=rg2, lr=lr) ~> wr2
sgd_update(weights=wr3, grad=rg3, lr=lr) ~> wr3
dot_product(a=gg, b=gg) ~> ls
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv16) ~> pp
vec_sub(a=pp, b=tv16) ~> gg
get(arr=gg, idx=0) ~> g0
get(arr=gg, idx=1) ~> g1
get(arr=gg, idx=2) ~> g2
get(arr=gg, idx=3) ~> g3
vec_scale(a=xv16, s=g0) ~> rg0
vec_scale(a=xv16, s=g1) ~> rg1
vec_scale(a=xv16, s=g2) ~> rg2
vec_scale(a=xv16, s=g3) ~> rg3
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
sgd_update(weights=wr1, grad=rg1, lr=lr) ~> wr1
sgd_update(weights=wr2, grad=rg2, lr=lr) ~> wr2
sgd_update(weights=wr3, grad=rg3, lr=lr) ~> wr3
dot_product(a=gg, b=gg) ~> ls
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv17) ~> pp
vec_sub(a=pp, b=tv17) ~> gg
get(arr=gg, idx=0) ~> g0
get(arr=gg, idx=1) ~> g1
get(arr=gg, idx=2) ~> g2
get(arr=gg, idx=3) ~> g3
vec_scale(a=xv17, s=g0) ~> rg0
vec_scale(a=xv17, s=g1) ~> rg1
vec_scale(a=xv17, s=g2) ~> rg2
vec_scale(a=xv17, s=g3) ~> rg3
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
sgd_update(weights=wr1, grad=rg1, lr=lr) ~> wr1
sgd_update(weights=wr2, grad=rg2, lr=lr) ~> wr2
sgd_update(weights=wr3, grad=rg3, lr=lr) ~> wr3
dot_product(a=gg, b=gg) ~> ls
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv18) ~> pp
vec_sub(a=pp, b=tv18) ~> gg
get(arr=gg, idx=0) ~> g0
get(arr=gg, idx=1) ~> g1
get(arr=gg, idx=2) ~> g2
get(arr=gg, idx=3) ~> g3
vec_scale(a=xv18, s=g0) ~> rg0
vec_scale(a=xv18, s=g1) ~> rg1
vec_scale(a=xv18, s=g2) ~> rg2
vec_scale(a=xv18, s=g3) ~> rg3
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
sgd_update(weights=wr1, grad=rg1, lr=lr) ~> wr1
sgd_update(weights=wr2, grad=rg2, lr=lr) ~> wr2
sgd_update(weights=wr3, grad=rg3, lr=lr) ~> wr3
dot_product(a=gg, b=gg) ~> ls
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv19) ~> pp
vec_sub(a=pp, b=tv19) ~> gg
get(arr=gg, idx=0) ~> g0
get(arr=gg, idx=1) ~> g1
get(arr=gg, idx=2) ~> g2
get(arr=gg, idx=3) ~> g3
vec_scale(a=xv19, s=g0) ~> rg0
vec_scale(a=xv19, s=g1) ~> rg1
vec_scale(a=xv19, s=g2) ~> rg2
vec_scale(a=xv19, s=g3) ~> rg3
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
sgd_update(weights=wr1, grad=rg1, lr=lr) ~> wr1
sgd_update(weights=wr2, grad=rg2, lr=lr) ~> wr2
sgd_update(weights=wr3, grad=rg3, lr=lr) ~> wr3
dot_product(a=gg, b=gg) ~> ls
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv20) ~> pp
vec_sub(a=pp, b=tv20) ~> gg
get(arr=gg, idx=0) ~> g0
get(arr=gg, idx=1) ~> g1
get(arr=gg, idx=2) ~> g2
get(arr=gg, idx=3) ~> g3
vec_scale(a=xv20, s=g0) ~> rg0
vec_scale(a=xv20, s=g1) ~> rg1
vec_scale(a=xv20, s=g2) ~> rg2
vec_scale(a=xv20, s=g3) ~> rg3
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
sgd_update(weights=wr1, grad=rg1, lr=lr) ~> wr1
sgd_update(weights=wr2, grad=rg2, lr=lr) ~> wr2
sgd_update(weights=wr3, grad=rg3, lr=lr) ~> wr3
dot_product(a=gg, b=gg) ~> ls
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv21) ~> pp
vec_sub(a=pp, b=tv21) ~> gg
get(arr=gg, idx=0) ~> g0
get(arr=gg, idx=1) ~> g1
get(arr=gg, idx=2) ~> g2
get(arr=gg, idx=3) ~> g3
vec_scale(a=xv21, s=g0) ~> rg0
vec_scale(a=xv21, s=g1) ~> rg1
vec_scale(a=xv21, s=g2) ~> rg2
vec_scale(a=xv21, s=g3) ~> rg3
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
sgd_update(weights=wr1, grad=rg1, lr=lr) ~> wr1
sgd_update(weights=wr2, grad=rg2, lr=lr) ~> wr2
sgd_update(weights=wr3, grad=rg3, lr=lr) ~> wr3
dot_product(a=gg, b=gg) ~> ls
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv22) ~> pp
vec_sub(a=pp, b=tv22) ~> gg
get(arr=gg, idx=0) ~> g0
get(arr=gg, idx=1) ~> g1
get(arr=gg, idx=2) ~> g2
get(arr=gg, idx=3) ~> g3
vec_scale(a=xv22, s=g0) ~> rg0
vec_scale(a=xv22, s=g1) ~> rg1
vec_scale(a=xv22, s=g2) ~> rg2
vec_scale(a=xv22, s=g3) ~> rg3
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
sgd_update(weights=wr1, grad=rg1, lr=lr) ~> wr1
sgd_update(weights=wr2, grad=rg2, lr=lr) ~> wr2
sgd_update(weights=wr3, grad=rg3, lr=lr) ~> wr3
dot_product(a=gg, b=gg) ~> ls
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv23) ~> pp
vec_sub(a=pp, b=tv23) ~> gg
get(arr=gg, idx=0) ~> g0
get(arr=gg, idx=1) ~> g1
get(arr=gg, idx=2) ~> g2
get(arr=gg, idx=3) ~> g3
vec_scale(a=xv23, s=g0) ~> rg0
vec_scale(a=xv23, s=g1) ~> rg1
vec_scale(a=xv23, s=g2) ~> rg2
vec_scale(a=xv23, s=g3) ~> rg3
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
sgd_update(weights=wr1, grad=rg1, lr=lr) ~> wr1
sgd_update(weights=wr2, grad=rg2, lr=lr) ~> wr2
sgd_update(weights=wr3, grad=rg3, lr=lr) ~> wr3
dot_product(a=gg, b=gg) ~> ls
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv24) ~> pp
vec_sub(a=pp, b=tv24) ~> gg
get(arr=gg, idx=0) ~> g0
get(arr=gg, idx=1) ~> g1
get(arr=gg, idx=2) ~> g2
get(arr=gg, idx=3) ~> g3
vec_scale(a=xv24, s=g0) ~> rg0
vec_scale(a=xv24, s=g1) ~> rg1
vec_scale(a=xv24, s=g2) ~> rg2
vec_scale(a=xv24, s=g3) ~> rg3
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
sgd_update(weights=wr1, grad=rg1, lr=lr) ~> wr1
sgd_update(weights=wr2, grad=rg2, lr=lr) ~> wr2
sgd_update(weights=wr3, grad=rg3, lr=lr) ~> wr3
dot_product(a=gg, b=gg) ~> ls
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv25) ~> pp
vec_sub(a=pp, b=tv25) ~> gg
get(arr=gg, idx=0) ~> g0
get(arr=gg, idx=1) ~> g1
get(arr=gg, idx=2) ~> g2
get(arr=gg, idx=3) ~> g3
vec_scale(a=xv25, s=g0) ~> rg0
vec_scale(a=xv25, s=g1) ~> rg1
vec_scale(a=xv25, s=g2) ~> rg2
vec_scale(a=xv25, s=g3) ~> rg3
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
sgd_update(weights=wr1, grad=rg1, lr=lr) ~> wr1
sgd_update(weights=wr2, grad=rg2, lr=lr) ~> wr2
sgd_update(weights=wr3, grad=rg3, lr=lr) ~> wr3
dot_product(a=gg, b=gg) ~> ls
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv26) ~> pp
vec_sub(a=pp, b=tv26) ~> gg
get(arr=gg, idx=0) ~> g0
get(arr=gg, idx=1) ~> g1
get(arr=gg, idx=2) ~> g2
get(arr=gg, idx=3) ~> g3
vec_scale(a=xv26, s=g0) ~> rg0
vec_scale(a=xv26, s=g1) ~> rg1
vec_scale(a=xv26, s=g2) ~> rg2
vec_scale(a=xv26, s=g3) ~> rg3
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
sgd_update(weights=wr1, grad=rg1, lr=lr) ~> wr1
sgd_update(weights=wr2, grad=rg2, lr=lr) ~> wr2
sgd_update(weights=wr3, grad=rg3, lr=lr) ~> wr3
dot_product(a=gg, b=gg) ~> ls
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv27) ~> pp
vec_sub(a=pp, b=tv27) ~> gg
get(arr=gg, idx=0) ~> g0
get(arr=gg, idx=1) ~> g1
get(arr=gg, idx=2) ~> g2
get(arr=gg, idx=3) ~> g3
vec_scale(a=xv27, s=g0) ~> rg0
vec_scale(a=xv27, s=g1) ~> rg1
vec_scale(a=xv27, s=g2) ~> rg2
vec_scale(a=xv27, s=g3) ~> rg3
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
sgd_update(weights=wr1, grad=rg1, lr=lr) ~> wr1
sgd_update(weights=wr2, grad=rg2, lr=lr) ~> wr2
sgd_update(weights=wr3, grad=rg3, lr=lr) ~> wr3
dot_product(a=gg, b=gg) ~> ls
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv28) ~> pp
vec_sub(a=pp, b=tv28) ~> gg
get(arr=gg, idx=0) ~> g0
get(arr=gg, idx=1) ~> g1
get(arr=gg, idx=2) ~> g2
get(arr=gg, idx=3) ~> g3
vec_scale(a=xv28, s=g0) ~> rg0
vec_scale(a=xv28, s=g1) ~> rg1
vec_scale(a=xv28, s=g2) ~> rg2
vec_scale(a=xv28, s=g3) ~> rg3
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
sgd_update(weights=wr1, grad=rg1, lr=lr) ~> wr1
sgd_update(weights=wr2, grad=rg2, lr=lr) ~> wr2
sgd_update(weights=wr3, grad=rg3, lr=lr) ~> wr3
dot_product(a=gg, b=gg) ~> ls
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv29) ~> pp
vec_sub(a=pp, b=tv29) ~> gg
get(arr=gg, idx=0) ~> g0
get(arr=gg, idx=1) ~> g1
get(arr=gg, idx=2) ~> g2
get(arr=gg, idx=3) ~> g3
vec_scale(a=xv29, s=g0) ~> rg0
vec_scale(a=xv29, s=g1) ~> rg1
vec_scale(a=xv29, s=g2) ~> rg2
vec_scale(a=xv29, s=g3) ~> rg3
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
sgd_update(weights=wr1, grad=rg1, lr=lr) ~> wr1
sgd_update(weights=wr2, grad=rg2, lr=lr) ~> wr2
sgd_update(weights=wr3, grad=rg3, lr=lr) ~> wr3
dot_product(a=gg, b=gg) ~> ls
join(arr=wr0, sep=",") ~> wr0_str
write_file_t(path="weights_1.txt", content=wr0_str) ~> ok
[T+]
show shall(ls)
show shall(wr0)