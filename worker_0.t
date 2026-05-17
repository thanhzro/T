[T-]
import "lib/basic/std.t"
import "lib/advanced/ml_t.t"
wr0 = [0.0279, -0.0950, -0.0450, -0.0554]
wr1 = [0.0473, 0.0353, 0.0784, -0.0826]
wr2 = [-0.0156, -0.0940, -0.0563, 0.0011]
wr3 = [-0.0947, -0.0602, 0.0300, 0.0090]
bv = [0, 0, 0, 0]
lr = 0.01
xv0 = [0.6316, 0.5579, 0.1474, 0.6526]
tv0 = [1, 0, 0, 0]
xv1 = [0.8947, 0.8211, 0.7053, 0.0105]
tv1 = [0, 0, 0, 1]
xv2 = [0.8211, 0.7895, 0.0947, 0.6842]
tv2 = [0, 0, 1, 0]
xv3 = [0.0105, 0.8211, 0.1053, 0.0105]
tv3 = [0, 0, 0, 1]
xv4 = [0.0105, 0.0105, 0.0105, 0.8421]
tv4 = [0, 1, 0, 0]
xv5 = [0.0947, 0.6842, 0.8632, 0.8632]
tv5 = [0, 0, 1, 0]
xv6 = [0.3263, 0.0105, 0.3579, 0.1895]
tv6 = [1, 0, 0, 0]
xv7 = [0.0105, 0.0105, 0.8421, 0.6842]
tv7 = [0, 0, 0, 1]
xv8 = [0.8211, 0.1053, 0.0105, 0.9895]
tv8 = [0, 0, 0, 1]
xv9 = [0.0000, 0.0105, 0.0105, 0.0105]
tv9 = [0, 1, 0, 0]
xv10 = [0.8211, 0.0947, 0.9053, 0.6842]
tv10 = [1, 0, 0, 0]
xv11 = [0.1895, 0.1053, 0.0105, 0.9895]
tv11 = [0, 0, 0, 1]
xv12 = [0.0000, 0.0105, 0.0105, 0.0105]
tv12 = [0, 1, 0, 0]
xv13 = [0.8211, 0.7474, 0.7263, 0.6737]
tv13 = [0, 0, 0, 1]
xv14 = [0.8421, 0.0947, 0.7368, 0.8632]
tv14 = [0, 0, 0, 1]
xv15 = [0.1789, 0.1368, 0.0105, 0.8842]
tv15 = [0, 0, 0, 1]
xv16 = [0.1368, 0.0105, 0.8737, 0.8842]
tv16 = [0, 1, 0, 0]
xv17 = [0.4947, 0.1053, 0.0105, 0.9895]
tv17 = [0, 0, 0, 1]
xv18 = [0.8842, 0.6842, 0.8632, 0.8842]
tv18 = [0, 0, 0, 1]
xv19 = [0.0105, 0.0105, 0.0105, 0.4105]
tv19 = [0, 1, 0, 0]
xv20 = [0.6842, 0.8632, 0.8842, 0.8737]
tv20 = [0, 0, 1, 0]
xv21 = [0.0000, 0.0105, 0.0105, 0.0105]
tv21 = [0, 1, 0, 0]
xv22 = [0.0105, 0.0105, 0.8211, 0.8316]
tv22 = [0, 0, 0, 1]
xv23 = [0.3263, 0.0105, 0.7684, 0.7158]
tv23 = [1, 0, 0, 0]
xv24 = [0.0105, 0.0105, 0.0105, 0.0105]
tv24 = [0, 1, 0, 0]
xv25 = [0.7684, 0.7158, 0.9263, 0.0105]
tv25 = [1, 0, 0, 0]
xv26 = [0.0105, 0.3263, 0.3263, 0.0105]
tv26 = [0, 1, 0, 0]
xv27 = [0.0000, 0.0105, 0.0105, 0.0105]
tv27 = [0, 1, 0, 0]
xv28 = [0.0105, 0.0105, 0.8105, 0.7684]
tv28 = [0, 0, 1, 0]
xv29 = [0.3158, 0.7263, 0.8211, 0.7158]
tv29 = [0, 1, 0, 0]
xv30 = [0.3158, 0.4737, 0.1053, 0.0105]
tv30 = [0, 0, 1, 0]
xv31 = [0.8632, 0.7263, 0.6842, 0.8000]
tv31 = [1, 0, 0, 0]
xv32 = [0.7158, 0.0000, 0.0105, 0.0105]
tv32 = [0, 1, 0, 0]
xv33 = [0.0105, 0.0105, 0.0105, 0.8737]
tv33 = [1, 0, 0, 0]
xv34 = [0.7263, 0.6737, 0.6842, 0.8632]
tv34 = [0, 0, 1, 0]
xv35 = [0.8632, 0.8632, 0.3158, 0.3579]
tv35 = [0, 0, 1, 0]
xv36 = [0.7368, 0.8632, 0.8316, 0.8105]
tv36 = [0, 0, 1, 0]
xv37 = [0.9263, 0.1368, 0.0105, 0.8842]
tv37 = [0, 0, 0, 1]
xv38 = [0.7263, 0.6842, 0.8000, 0.6737]
tv38 = [0, 1, 0, 0]
xv39 = [0.1053, 0.0105, 0.9895, 0.3263]
tv39 = [0, 1, 0, 0]
xv40 = [0.9158, 0.0000, 0.0105, 0.0105]
tv40 = [0, 1, 0, 0]
xv41 = [0.0000, 0.0105, 0.0105, 0.0105]
tv41 = [0, 1, 0, 0]
xv42 = [0.6842, 0.8632, 0.8842, 0.8737]
tv42 = [0, 1, 0, 0]
xv43 = [0.0105, 0.8316, 0.8947, 0.8842]
tv43 = [1, 0, 0, 0]
xv44 = [0.6316, 0.5579, 0.1474, 0.6526]
tv44 = [1, 0, 0, 0]
xv45 = [0.6316, 0.5579, 0.1474, 0.6526]
tv45 = [1, 0, 0, 0]
xv46 = [0.7368, 0.8947, 0.8211, 0.7053]
tv46 = [0, 1, 0, 0]
xv47 = [0.7895, 0.7263, 0.0947, 0.6842]
tv47 = [0, 0, 1, 0]
xv48 = [0.0105, 0.8211, 0.1053, 0.0105]
tv48 = [0, 0, 0, 1]
xv49 = [0.0105, 0.0105, 0.0105, 0.8421]
tv49 = [0, 1, 0, 0]
xv50 = [0.0947, 0.6842, 0.8632, 0.8632]
tv50 = [0, 0, 1, 0]
xv51 = [0.3263, 0.0105, 0.3579, 0.1895]
tv51 = [1, 0, 0, 0]
xv52 = [0.0105, 0.0105, 0.8421, 0.6842]
tv52 = [0, 0, 0, 1]
xv53 = [0.8211, 0.1053, 0.0105, 0.9895]
tv53 = [0, 0, 0, 1]
xv54 = [0.0000, 0.0105, 0.0105, 0.0105]
tv54 = [0, 1, 0, 0]
xv55 = [0.7684, 0.7053, 0.7263, 0.6737]
tv55 = [0, 1, 0, 0]
xv56 = [0.0947, 0.6842, 0.8632, 0.8632]
tv56 = [0, 0, 1, 0]
xv57 = [0.1368, 0.0105, 0.7368, 0.8632]
tv57 = [0, 0, 0, 1]
xv58 = [0.1789, 0.1368, 0.0105, 0.8842]
tv58 = [0, 0, 0, 1]
xv59 = [0.1053, 0.0105, 0.9895, 0.3263]
tv59 = [0, 1, 0, 0]
xv60 = [0.8842, 0.0000, 0.9789, 0.0000]
tv60 = [1, 0, 0, 0]
xv61 = [0.8211, 0.7053, 0.0105, 0.7158]
tv61 = [0, 0, 1, 0]
xv62 = [0.0947, 0.6842, 0.8632, 0.8632]
tv62 = [0, 1, 0, 0]
xv63 = [0.1053, 0.0105, 0.9579, 0.0000]
tv63 = [0, 1, 0, 0]
xv64 = [0.0105, 0.8421, 0.6842, 0.8737]
tv64 = [1, 0, 0, 0]
xv65 = [0.8632, 0.8632, 0.1053, 0.0105]
tv65 = [0, 0, 1, 0]
xv66 = [0.3579, 0.1895, 0.0000, 0.0105]
tv66 = [0, 1, 0, 0]
xv67 = [0.8421, 0.6842, 0.8737, 0.8842]
tv67 = [0, 1, 0, 0]
xv68 = [0.0105, 0.9895, 0.3263, 0.0105]
tv68 = [0, 0, 0, 1]
xv69 = [0.0105, 0.0105, 0.0105, 0.8000]
tv69 = [0, 1, 0, 0]
xv70 = [0.9053, 0.6842, 0.8000, 0.3158]
tv70 = [0, 0, 1, 0]
xv71 = [0.0105, 0.9895, 0.3263, 0.0105]
tv71 = [0, 1, 0, 0]
xv72 = [0.0105, 0.0105, 0.0105, 0.8737]
tv72 = [1, 0, 0, 0]
xv73 = [0.7263, 0.6737, 0.6842, 0.8632]
tv73 = [0, 0, 1, 0]
xv74 = [0.8632, 0.8632, 0.3158, 0.3579]
tv74 = [0, 0, 1, 0]
xv75 = [0.7368, 0.8632, 0.8316, 0.8105]
tv75 = [0, 0, 1, 0]
xv76 = [0.0105, 0.8842, 0.8316, 0.3158]
tv76 = [0, 1, 0, 0]
xv77 = [0.9895, 0.3263, 0.0105, 0.8316]
tv77 = [0, 1, 0, 0]
xv78 = [0.9789, 0.0000, 0.0000, 0.7368]
tv78 = [0, 1, 0, 0]
xv79 = [0.0105, 0.9474, 0.7684, 0.8421]
tv79 = [1, 0, 0, 0]
xv80 = [0.8842, 0.7579, 0.0947, 0.6842]
tv80 = [0, 1, 0, 0]
xv81 = [0.1053, 0.0105, 0.9579, 0.0000]
tv81 = [0, 1, 0, 0]
xv82 = [0.0105, 0.8421, 0.6842, 0.8737]
tv82 = [1, 0, 0, 0]
xv83 = [0.1053, 0.0105, 0.9895, 0.3263]
tv83 = [0, 1, 0, 0]
xv84 = [0.0000, 0.0105, 0.0105, 0.0105]
tv84 = [0, 1, 0, 0]
xv85 = [0.8737, 0.8842, 0.0947, 0.6947]
tv85 = [0, 0, 1, 0]
xv86 = [0.3263, 0.0105, 0.3579, 0.2000]
tv86 = [1, 0, 0, 0]
xv87 = [0.0105, 0.0105, 0.8000, 0.7263]
tv87 = [0, 0, 1, 0]
xv88 = [0.6842, 0.8000, 0.3158, 0.3579]
tv88 = [0, 0, 1, 0]
xv89 = [0.9895, 0.3263, 0.0105, 0.4737]
tv89 = [0, 0, 1, 0]
xv90 = [0.0105, 0.0105, 0.0105, 0.8000]
tv90 = [0, 1, 0, 0]
xv91 = [0.9053, 0.6842, 0.8000, 0.3158]
tv91 = [0, 0, 1, 0]
xv92 = [0.0105, 0.9895, 0.3263, 0.0105]
tv92 = [0, 1, 0, 0]
xv93 = [0.0105, 0.0105, 0.0105, 0.0105]
tv93 = [0, 1, 0, 0]
xv94 = [0.0947, 0.6842, 0.3158, 0.4737]
tv94 = [0, 0, 1, 0]
xv95 = [0.6947, 0.3158, 0.4737, 0.2000]
tv95 = [0, 0, 1, 0]
xv96 = [0.3263, 0.0105, 0.4737, 0.0000]
tv96 = [0, 1, 0, 0]
xv97 = [0.0105, 0.8632, 0.6842, 0.8211]
tv97 = [0, 0, 0, 1]
xv98 = [0.8211, 0.3158, 0.4737, 0.1053]
tv98 = [0, 1, 0, 0]
xv99 = [0.0105, 0.4421, 0.3895, 0.6000]
tv99 = [1, 0, 0, 0]
[T0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv0) ~> pp
vec_sub(a=pp, b=tv0) ~> gg
get(arr=gg, idx=0) ~> g0
vec_scale(a=xv0, s=g0) ~> rg0
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv1) ~> pp
vec_sub(a=pp, b=tv1) ~> gg
get(arr=gg, idx=0) ~> g0
vec_scale(a=xv1, s=g0) ~> rg0
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv2) ~> pp
vec_sub(a=pp, b=tv2) ~> gg
get(arr=gg, idx=0) ~> g0
vec_scale(a=xv2, s=g0) ~> rg0
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv3) ~> pp
vec_sub(a=pp, b=tv3) ~> gg
get(arr=gg, idx=0) ~> g0
vec_scale(a=xv3, s=g0) ~> rg0
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv4) ~> pp
vec_sub(a=pp, b=tv4) ~> gg
get(arr=gg, idx=0) ~> g0
vec_scale(a=xv4, s=g0) ~> rg0
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv5) ~> pp
vec_sub(a=pp, b=tv5) ~> gg
get(arr=gg, idx=0) ~> g0
vec_scale(a=xv5, s=g0) ~> rg0
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv6) ~> pp
vec_sub(a=pp, b=tv6) ~> gg
get(arr=gg, idx=0) ~> g0
vec_scale(a=xv6, s=g0) ~> rg0
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv7) ~> pp
vec_sub(a=pp, b=tv7) ~> gg
get(arr=gg, idx=0) ~> g0
vec_scale(a=xv7, s=g0) ~> rg0
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv8) ~> pp
vec_sub(a=pp, b=tv8) ~> gg
get(arr=gg, idx=0) ~> g0
vec_scale(a=xv8, s=g0) ~> rg0
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv9) ~> pp
vec_sub(a=pp, b=tv9) ~> gg
get(arr=gg, idx=0) ~> g0
vec_scale(a=xv9, s=g0) ~> rg0
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv10) ~> pp
vec_sub(a=pp, b=tv10) ~> gg
get(arr=gg, idx=0) ~> g0
vec_scale(a=xv10, s=g0) ~> rg0
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv11) ~> pp
vec_sub(a=pp, b=tv11) ~> gg
get(arr=gg, idx=0) ~> g0
vec_scale(a=xv11, s=g0) ~> rg0
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv12) ~> pp
vec_sub(a=pp, b=tv12) ~> gg
get(arr=gg, idx=0) ~> g0
vec_scale(a=xv12, s=g0) ~> rg0
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv13) ~> pp
vec_sub(a=pp, b=tv13) ~> gg
get(arr=gg, idx=0) ~> g0
vec_scale(a=xv13, s=g0) ~> rg0
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv14) ~> pp
vec_sub(a=pp, b=tv14) ~> gg
get(arr=gg, idx=0) ~> g0
vec_scale(a=xv14, s=g0) ~> rg0
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv15) ~> pp
vec_sub(a=pp, b=tv15) ~> gg
get(arr=gg, idx=0) ~> g0
vec_scale(a=xv15, s=g0) ~> rg0
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv16) ~> pp
vec_sub(a=pp, b=tv16) ~> gg
get(arr=gg, idx=0) ~> g0
vec_scale(a=xv16, s=g0) ~> rg0
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv17) ~> pp
vec_sub(a=pp, b=tv17) ~> gg
get(arr=gg, idx=0) ~> g0
vec_scale(a=xv17, s=g0) ~> rg0
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv18) ~> pp
vec_sub(a=pp, b=tv18) ~> gg
get(arr=gg, idx=0) ~> g0
vec_scale(a=xv18, s=g0) ~> rg0
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv19) ~> pp
vec_sub(a=pp, b=tv19) ~> gg
get(arr=gg, idx=0) ~> g0
vec_scale(a=xv19, s=g0) ~> rg0
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv20) ~> pp
vec_sub(a=pp, b=tv20) ~> gg
get(arr=gg, idx=0) ~> g0
vec_scale(a=xv20, s=g0) ~> rg0
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv21) ~> pp
vec_sub(a=pp, b=tv21) ~> gg
get(arr=gg, idx=0) ~> g0
vec_scale(a=xv21, s=g0) ~> rg0
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv22) ~> pp
vec_sub(a=pp, b=tv22) ~> gg
get(arr=gg, idx=0) ~> g0
vec_scale(a=xv22, s=g0) ~> rg0
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv23) ~> pp
vec_sub(a=pp, b=tv23) ~> gg
get(arr=gg, idx=0) ~> g0
vec_scale(a=xv23, s=g0) ~> rg0
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv24) ~> pp
vec_sub(a=pp, b=tv24) ~> gg
get(arr=gg, idx=0) ~> g0
vec_scale(a=xv24, s=g0) ~> rg0
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv25) ~> pp
vec_sub(a=pp, b=tv25) ~> gg
get(arr=gg, idx=0) ~> g0
vec_scale(a=xv25, s=g0) ~> rg0
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv26) ~> pp
vec_sub(a=pp, b=tv26) ~> gg
get(arr=gg, idx=0) ~> g0
vec_scale(a=xv26, s=g0) ~> rg0
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv27) ~> pp
vec_sub(a=pp, b=tv27) ~> gg
get(arr=gg, idx=0) ~> g0
vec_scale(a=xv27, s=g0) ~> rg0
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv28) ~> pp
vec_sub(a=pp, b=tv28) ~> gg
get(arr=gg, idx=0) ~> g0
vec_scale(a=xv28, s=g0) ~> rg0
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv29) ~> pp
vec_sub(a=pp, b=tv29) ~> gg
get(arr=gg, idx=0) ~> g0
vec_scale(a=xv29, s=g0) ~> rg0
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv30) ~> pp
vec_sub(a=pp, b=tv30) ~> gg
get(arr=gg, idx=0) ~> g0
vec_scale(a=xv30, s=g0) ~> rg0
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv31) ~> pp
vec_sub(a=pp, b=tv31) ~> gg
get(arr=gg, idx=0) ~> g0
vec_scale(a=xv31, s=g0) ~> rg0
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv32) ~> pp
vec_sub(a=pp, b=tv32) ~> gg
get(arr=gg, idx=0) ~> g0
vec_scale(a=xv32, s=g0) ~> rg0
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv33) ~> pp
vec_sub(a=pp, b=tv33) ~> gg
get(arr=gg, idx=0) ~> g0
vec_scale(a=xv33, s=g0) ~> rg0
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv34) ~> pp
vec_sub(a=pp, b=tv34) ~> gg
get(arr=gg, idx=0) ~> g0
vec_scale(a=xv34, s=g0) ~> rg0
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv35) ~> pp
vec_sub(a=pp, b=tv35) ~> gg
get(arr=gg, idx=0) ~> g0
vec_scale(a=xv35, s=g0) ~> rg0
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv36) ~> pp
vec_sub(a=pp, b=tv36) ~> gg
get(arr=gg, idx=0) ~> g0
vec_scale(a=xv36, s=g0) ~> rg0
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv37) ~> pp
vec_sub(a=pp, b=tv37) ~> gg
get(arr=gg, idx=0) ~> g0
vec_scale(a=xv37, s=g0) ~> rg0
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv38) ~> pp
vec_sub(a=pp, b=tv38) ~> gg
get(arr=gg, idx=0) ~> g0
vec_scale(a=xv38, s=g0) ~> rg0
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv39) ~> pp
vec_sub(a=pp, b=tv39) ~> gg
get(arr=gg, idx=0) ~> g0
vec_scale(a=xv39, s=g0) ~> rg0
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv40) ~> pp
vec_sub(a=pp, b=tv40) ~> gg
get(arr=gg, idx=0) ~> g0
vec_scale(a=xv40, s=g0) ~> rg0
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv41) ~> pp
vec_sub(a=pp, b=tv41) ~> gg
get(arr=gg, idx=0) ~> g0
vec_scale(a=xv41, s=g0) ~> rg0
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv42) ~> pp
vec_sub(a=pp, b=tv42) ~> gg
get(arr=gg, idx=0) ~> g0
vec_scale(a=xv42, s=g0) ~> rg0
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv43) ~> pp
vec_sub(a=pp, b=tv43) ~> gg
get(arr=gg, idx=0) ~> g0
vec_scale(a=xv43, s=g0) ~> rg0
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv44) ~> pp
vec_sub(a=pp, b=tv44) ~> gg
get(arr=gg, idx=0) ~> g0
vec_scale(a=xv44, s=g0) ~> rg0
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv45) ~> pp
vec_sub(a=pp, b=tv45) ~> gg
get(arr=gg, idx=0) ~> g0
vec_scale(a=xv45, s=g0) ~> rg0
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv46) ~> pp
vec_sub(a=pp, b=tv46) ~> gg
get(arr=gg, idx=0) ~> g0
vec_scale(a=xv46, s=g0) ~> rg0
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv47) ~> pp
vec_sub(a=pp, b=tv47) ~> gg
get(arr=gg, idx=0) ~> g0
vec_scale(a=xv47, s=g0) ~> rg0
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv48) ~> pp
vec_sub(a=pp, b=tv48) ~> gg
get(arr=gg, idx=0) ~> g0
vec_scale(a=xv48, s=g0) ~> rg0
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv49) ~> pp
vec_sub(a=pp, b=tv49) ~> gg
get(arr=gg, idx=0) ~> g0
vec_scale(a=xv49, s=g0) ~> rg0
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv50) ~> pp
vec_sub(a=pp, b=tv50) ~> gg
get(arr=gg, idx=0) ~> g0
vec_scale(a=xv50, s=g0) ~> rg0
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv51) ~> pp
vec_sub(a=pp, b=tv51) ~> gg
get(arr=gg, idx=0) ~> g0
vec_scale(a=xv51, s=g0) ~> rg0
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv52) ~> pp
vec_sub(a=pp, b=tv52) ~> gg
get(arr=gg, idx=0) ~> g0
vec_scale(a=xv52, s=g0) ~> rg0
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv53) ~> pp
vec_sub(a=pp, b=tv53) ~> gg
get(arr=gg, idx=0) ~> g0
vec_scale(a=xv53, s=g0) ~> rg0
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv54) ~> pp
vec_sub(a=pp, b=tv54) ~> gg
get(arr=gg, idx=0) ~> g0
vec_scale(a=xv54, s=g0) ~> rg0
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv55) ~> pp
vec_sub(a=pp, b=tv55) ~> gg
get(arr=gg, idx=0) ~> g0
vec_scale(a=xv55, s=g0) ~> rg0
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv56) ~> pp
vec_sub(a=pp, b=tv56) ~> gg
get(arr=gg, idx=0) ~> g0
vec_scale(a=xv56, s=g0) ~> rg0
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv57) ~> pp
vec_sub(a=pp, b=tv57) ~> gg
get(arr=gg, idx=0) ~> g0
vec_scale(a=xv57, s=g0) ~> rg0
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv58) ~> pp
vec_sub(a=pp, b=tv58) ~> gg
get(arr=gg, idx=0) ~> g0
vec_scale(a=xv58, s=g0) ~> rg0
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv59) ~> pp
vec_sub(a=pp, b=tv59) ~> gg
get(arr=gg, idx=0) ~> g0
vec_scale(a=xv59, s=g0) ~> rg0
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv60) ~> pp
vec_sub(a=pp, b=tv60) ~> gg
get(arr=gg, idx=0) ~> g0
vec_scale(a=xv60, s=g0) ~> rg0
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv61) ~> pp
vec_sub(a=pp, b=tv61) ~> gg
get(arr=gg, idx=0) ~> g0
vec_scale(a=xv61, s=g0) ~> rg0
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv62) ~> pp
vec_sub(a=pp, b=tv62) ~> gg
get(arr=gg, idx=0) ~> g0
vec_scale(a=xv62, s=g0) ~> rg0
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv63) ~> pp
vec_sub(a=pp, b=tv63) ~> gg
get(arr=gg, idx=0) ~> g0
vec_scale(a=xv63, s=g0) ~> rg0
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv64) ~> pp
vec_sub(a=pp, b=tv64) ~> gg
get(arr=gg, idx=0) ~> g0
vec_scale(a=xv64, s=g0) ~> rg0
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv65) ~> pp
vec_sub(a=pp, b=tv65) ~> gg
get(arr=gg, idx=0) ~> g0
vec_scale(a=xv65, s=g0) ~> rg0
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv66) ~> pp
vec_sub(a=pp, b=tv66) ~> gg
get(arr=gg, idx=0) ~> g0
vec_scale(a=xv66, s=g0) ~> rg0
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv67) ~> pp
vec_sub(a=pp, b=tv67) ~> gg
get(arr=gg, idx=0) ~> g0
vec_scale(a=xv67, s=g0) ~> rg0
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv68) ~> pp
vec_sub(a=pp, b=tv68) ~> gg
get(arr=gg, idx=0) ~> g0
vec_scale(a=xv68, s=g0) ~> rg0
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv69) ~> pp
vec_sub(a=pp, b=tv69) ~> gg
get(arr=gg, idx=0) ~> g0
vec_scale(a=xv69, s=g0) ~> rg0
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv70) ~> pp
vec_sub(a=pp, b=tv70) ~> gg
get(arr=gg, idx=0) ~> g0
vec_scale(a=xv70, s=g0) ~> rg0
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv71) ~> pp
vec_sub(a=pp, b=tv71) ~> gg
get(arr=gg, idx=0) ~> g0
vec_scale(a=xv71, s=g0) ~> rg0
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv72) ~> pp
vec_sub(a=pp, b=tv72) ~> gg
get(arr=gg, idx=0) ~> g0
vec_scale(a=xv72, s=g0) ~> rg0
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv73) ~> pp
vec_sub(a=pp, b=tv73) ~> gg
get(arr=gg, idx=0) ~> g0
vec_scale(a=xv73, s=g0) ~> rg0
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv74) ~> pp
vec_sub(a=pp, b=tv74) ~> gg
get(arr=gg, idx=0) ~> g0
vec_scale(a=xv74, s=g0) ~> rg0
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv75) ~> pp
vec_sub(a=pp, b=tv75) ~> gg
get(arr=gg, idx=0) ~> g0
vec_scale(a=xv75, s=g0) ~> rg0
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv76) ~> pp
vec_sub(a=pp, b=tv76) ~> gg
get(arr=gg, idx=0) ~> g0
vec_scale(a=xv76, s=g0) ~> rg0
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv77) ~> pp
vec_sub(a=pp, b=tv77) ~> gg
get(arr=gg, idx=0) ~> g0
vec_scale(a=xv77, s=g0) ~> rg0
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv78) ~> pp
vec_sub(a=pp, b=tv78) ~> gg
get(arr=gg, idx=0) ~> g0
vec_scale(a=xv78, s=g0) ~> rg0
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv79) ~> pp
vec_sub(a=pp, b=tv79) ~> gg
get(arr=gg, idx=0) ~> g0
vec_scale(a=xv79, s=g0) ~> rg0
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv80) ~> pp
vec_sub(a=pp, b=tv80) ~> gg
get(arr=gg, idx=0) ~> g0
vec_scale(a=xv80, s=g0) ~> rg0
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv81) ~> pp
vec_sub(a=pp, b=tv81) ~> gg
get(arr=gg, idx=0) ~> g0
vec_scale(a=xv81, s=g0) ~> rg0
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv82) ~> pp
vec_sub(a=pp, b=tv82) ~> gg
get(arr=gg, idx=0) ~> g0
vec_scale(a=xv82, s=g0) ~> rg0
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv83) ~> pp
vec_sub(a=pp, b=tv83) ~> gg
get(arr=gg, idx=0) ~> g0
vec_scale(a=xv83, s=g0) ~> rg0
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv84) ~> pp
vec_sub(a=pp, b=tv84) ~> gg
get(arr=gg, idx=0) ~> g0
vec_scale(a=xv84, s=g0) ~> rg0
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv85) ~> pp
vec_sub(a=pp, b=tv85) ~> gg
get(arr=gg, idx=0) ~> g0
vec_scale(a=xv85, s=g0) ~> rg0
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv86) ~> pp
vec_sub(a=pp, b=tv86) ~> gg
get(arr=gg, idx=0) ~> g0
vec_scale(a=xv86, s=g0) ~> rg0
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv87) ~> pp
vec_sub(a=pp, b=tv87) ~> gg
get(arr=gg, idx=0) ~> g0
vec_scale(a=xv87, s=g0) ~> rg0
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv88) ~> pp
vec_sub(a=pp, b=tv88) ~> gg
get(arr=gg, idx=0) ~> g0
vec_scale(a=xv88, s=g0) ~> rg0
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv89) ~> pp
vec_sub(a=pp, b=tv89) ~> gg
get(arr=gg, idx=0) ~> g0
vec_scale(a=xv89, s=g0) ~> rg0
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv90) ~> pp
vec_sub(a=pp, b=tv90) ~> gg
get(arr=gg, idx=0) ~> g0
vec_scale(a=xv90, s=g0) ~> rg0
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv91) ~> pp
vec_sub(a=pp, b=tv91) ~> gg
get(arr=gg, idx=0) ~> g0
vec_scale(a=xv91, s=g0) ~> rg0
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv92) ~> pp
vec_sub(a=pp, b=tv92) ~> gg
get(arr=gg, idx=0) ~> g0
vec_scale(a=xv92, s=g0) ~> rg0
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv93) ~> pp
vec_sub(a=pp, b=tv93) ~> gg
get(arr=gg, idx=0) ~> g0
vec_scale(a=xv93, s=g0) ~> rg0
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv94) ~> pp
vec_sub(a=pp, b=tv94) ~> gg
get(arr=gg, idx=0) ~> g0
vec_scale(a=xv94, s=g0) ~> rg0
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv95) ~> pp
vec_sub(a=pp, b=tv95) ~> gg
get(arr=gg, idx=0) ~> g0
vec_scale(a=xv95, s=g0) ~> rg0
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv96) ~> pp
vec_sub(a=pp, b=tv96) ~> gg
get(arr=gg, idx=0) ~> g0
vec_scale(a=xv96, s=g0) ~> rg0
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv97) ~> pp
vec_sub(a=pp, b=tv97) ~> gg
get(arr=gg, idx=0) ~> g0
vec_scale(a=xv97, s=g0) ~> rg0
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv98) ~> pp
vec_sub(a=pp, b=tv98) ~> gg
get(arr=gg, idx=0) ~> g0
vec_scale(a=xv98, s=g0) ~> rg0
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xv99) ~> pp
vec_sub(a=pp, b=tv99) ~> gg
get(arr=gg, idx=0) ~> g0
vec_scale(a=xv99, s=g0) ~> rg0
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
join(arr=wr0, sep=",") ~> ws
write_file_t(path="weights_0.txt", content=ws) ~> ok
[T+]
show shall(wr0)