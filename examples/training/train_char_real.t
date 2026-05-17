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
xvs0 = [0.6316, 0.5579, 0.1474, 0.6526]
tvs0 = [1, 0, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs0) ~> ps0
vec_sub(a=ps0, b=tvs0) ~> gs0
get(arr=gs0, idx=0) ~> gss00
vec_scale(a=xvs0, s=gss00) ~> rgs00
sgd_update(weights=wr0, grad=rgs00, lr=lr) ~> wr0
xvs1 = [0.6526, 0.0000, 0.0000, 0.7368]
tvs1 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs1) ~> ps1
vec_sub(a=ps1, b=tvs1) ~> gs1
get(arr=gs1, idx=0) ~> gss10
vec_scale(a=xvs1, s=gss10) ~> rgs10
sgd_update(weights=wr0, grad=rgs10, lr=lr) ~> wr0
xvs2 = [0.7368, 0.8947, 0.8211, 0.7053]
tvs2 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs2) ~> ps2
vec_sub(a=ps2, b=tvs2) ~> gs2
get(arr=gs2, idx=0) ~> gss20
vec_scale(a=xvs2, s=gss20) ~> rgs20
sgd_update(weights=wr0, grad=rgs20, lr=lr) ~> wr0
xvs3 = [0.7053, 0.0105, 0.7053, 0.7579]
tvs3 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs3) ~> ps3
vec_sub(a=ps3, b=tvs3) ~> gs3
get(arr=gs3, idx=0) ~> gss30
vec_scale(a=xvs3, s=gss30) ~> rgs30
sgd_update(weights=wr0, grad=rgs30, lr=lr) ~> wr0
xvs4 = [0.7579, 0.8947, 0.8211, 0.7895]
tvs4 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs4) ~> ps4
vec_sub(a=ps4, b=tvs4) ~> gs4
get(arr=gs4, idx=0) ~> gss40
vec_scale(a=xvs4, s=gss40) ~> rgs40
sgd_update(weights=wr0, grad=rgs40, lr=lr) ~> wr0
xvs5 = [0.7895, 0.0947, 0.6842, 0.8632]
tvs5 = [0, 0, 1, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs5) ~> ps5
vec_sub(a=ps5, b=tvs5) ~> gs5
get(arr=gs5, idx=0) ~> gss50
vec_scale(a=xvs5, s=gss50) ~> rgs50
sgd_update(weights=wr0, grad=rgs50, lr=lr) ~> wr0
xvs6 = [0.8632, 0.8632, 0.1368, 0.0105]
tvs6 = [0, 0, 1, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs6) ~> ps6
vec_sub(a=ps6, b=tvs6) ~> gs6
get(arr=gs6, idx=0) ~> gss60
vec_scale(a=xvs6, s=gss60) ~> rgs60
sgd_update(weights=wr0, grad=rgs60, lr=lr) ~> wr0
xvs7 = [0.0105, 0.8211, 0.1053, 0.0105]
tvs7 = [0, 0, 0, 1]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs7) ~> ps7
vec_sub(a=ps7, b=tvs7) ~> gs7
get(arr=gs7, idx=0) ~> gss70
vec_scale(a=xvs7, s=gss70) ~> rgs70
sgd_update(weights=wr0, grad=rgs70, lr=lr) ~> wr0
xvs8 = [0.0105, 0.9579, 0.0000, 0.0105]
tvs8 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs8) ~> ps8
vec_sub(a=ps8, b=tvs8) ~> gs8
get(arr=gs8, idx=0) ~> gss80
vec_scale(a=xvs8, s=gss80) ~> rgs80
sgd_update(weights=wr0, grad=rgs80, lr=lr) ~> wr0
xvs9 = [0.0105, 0.0105, 0.0105, 0.0105]
tvs9 = [1, 0, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs9) ~> ps9
vec_sub(a=ps9, b=tvs9) ~> gs9
get(arr=gs9, idx=0) ~> gss90
vec_scale(a=xvs9, s=gss90) ~> rgs90
sgd_update(weights=wr0, grad=rgs90, lr=lr) ~> wr0
xvs10 = [0.0105, 0.8421, 0.6842, 0.8737]
tvs10 = [1, 0, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs10) ~> ps10
vec_sub(a=ps10, b=tvs10) ~> gs10
get(arr=gs10, idx=0) ~> gss100
vec_scale(a=xvs10, s=gss100) ~> rgs100
sgd_update(weights=wr0, grad=rgs100, lr=lr) ~> wr0
xvs11 = [0.8737, 0.8842, 0.0947, 0.6842]
tvs11 = [0, 0, 1, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs11) ~> ps11
vec_sub(a=ps11, b=tvs11) ~> gs11
get(arr=gs11, idx=0) ~> gss110
vec_scale(a=xvs11, s=gss110) ~> rgs110
sgd_update(weights=wr0, grad=rgs110, lr=lr) ~> wr0
xvs12 = [0.6842, 0.8632, 0.8632, 0.1053]
tvs12 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs12) ~> ps12
vec_sub(a=ps12, b=tvs12) ~> gs12
get(arr=gs12, idx=0) ~> gss120
vec_scale(a=xvs12, s=gss120) ~> rgs120
sgd_update(weights=wr0, grad=rgs120, lr=lr) ~> wr0
xvs13 = [0.1053, 0.0105, 0.9895, 0.3263]
tvs13 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs13) ~> ps13
vec_sub(a=ps13, b=tvs13) ~> gs13
get(arr=gs13, idx=0) ~> gss130
vec_scale(a=xvs13, s=gss130) ~> rgs130
sgd_update(weights=wr0, grad=rgs130, lr=lr) ~> wr0
xvs14 = [0.3263, 0.0105, 0.3579, 0.1895]
tvs14 = [1, 0, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs14) ~> ps14
vec_sub(a=ps14, b=tvs14) ~> gs14
get(arr=gs14, idx=0) ~> gss140
vec_scale(a=xvs14, s=gss140) ~> rgs140
sgd_update(weights=wr0, grad=rgs140, lr=lr) ~> wr0
xvs15 = [0.1895, 0.0000, 0.0105, 0.0105]
tvs15 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs15) ~> ps15
vec_sub(a=ps15, b=tvs15) ~> gs15
get(arr=gs15, idx=0) ~> gss150
vec_scale(a=xvs15, s=gss150) ~> rgs150
sgd_update(weights=wr0, grad=rgs150, lr=lr) ~> wr0
xvs16 = [0.0105, 0.0105, 0.0105, 0.8421]
tvs16 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs16) ~> ps16
vec_sub(a=ps16, b=tvs16) ~> gs16
get(arr=gs16, idx=0) ~> gss160
vec_scale(a=xvs16, s=gss160) ~> rgs160
sgd_update(weights=wr0, grad=rgs160, lr=lr) ~> wr0
xvs17 = [0.8421, 0.6842, 0.8737, 0.8842]
tvs17 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs17) ~> ps17
vec_sub(a=ps17, b=tvs17) ~> gs17
get(arr=gs17, idx=0) ~> gss170
vec_scale(a=xvs17, s=gss170) ~> rgs170
sgd_update(weights=wr0, grad=rgs170, lr=lr) ~> wr0
xvs18 = [0.8842, 0.0947, 0.8211, 0.1053]
tvs18 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs18) ~> ps18
vec_sub(a=ps18, b=tvs18) ~> gs18
get(arr=gs18, idx=0) ~> gss180
vec_scale(a=xvs18, s=gss180) ~> rgs180
sgd_update(weights=wr0, grad=rgs180, lr=lr) ~> wr0
xvs19 = [0.1053, 0.0105, 0.9895, 0.3263]
tvs19 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs19) ~> ps19
vec_sub(a=ps19, b=tvs19) ~> gs19
get(arr=gs19, idx=0) ~> gss190
vec_scale(a=xvs19, s=gss190) ~> rgs190
sgd_update(weights=wr0, grad=rgs190, lr=lr) ~> wr0
xvs20 = [0.3263, 0.0105, 0.4947, 0.0000]
tvs20 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs20) ~> ps20
vec_sub(a=ps20, b=tvs20) ~> gs20
get(arr=gs20, idx=0) ~> gss200
vec_scale(a=xvs20, s=gss200) ~> rgs200
sgd_update(weights=wr0, grad=rgs200, lr=lr) ~> wr0
xvs21 = [0.0000, 0.0105, 0.0105, 0.0105]
tvs21 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs21) ~> ps21
vec_sub(a=ps21, b=tvs21) ~> gs21
get(arr=gs21, idx=0) ~> gss210
vec_scale(a=xvs21, s=gss210) ~> rgs210
sgd_update(weights=wr0, grad=rgs210, lr=lr) ~> wr0
xvs22 = [0.0105, 0.0105, 0.8000, 0.7263]
tvs22 = [0, 0, 1, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs22) ~> ps22
vec_sub(a=ps22, b=tvs22) ~> gs22
get(arr=gs22, idx=0) ~> gss220
vec_scale(a=xvs22, s=gss220) ~> rgs220
sgd_update(weights=wr0, grad=rgs220, lr=lr) ~> wr0
xvs23 = [0.7263, 0.8211, 0.0947, 0.9053]
tvs23 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs23) ~> ps23
vec_sub(a=ps23, b=tvs23) ~> gs23
get(arr=gs23, idx=0) ~> gss230
vec_scale(a=xvs23, s=gss230) ~> rgs230
sgd_update(weights=wr0, grad=rgs230, lr=lr) ~> wr0
xvs24 = [0.9053, 0.6842, 0.8000, 0.3158]
tvs24 = [0, 0, 1, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs24) ~> ps24
vec_sub(a=ps24, b=tvs24) ~> gs24
get(arr=gs24, idx=0) ~> gss240
vec_scale(a=xvs24, s=gss240) ~> rgs240
sgd_update(weights=wr0, grad=rgs240, lr=lr) ~> wr0
xvs25 = [0.3158, 0.3579, 0.1895, 0.1053]
tvs25 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs25) ~> ps25
vec_sub(a=ps25, b=tvs25) ~> gs25
get(arr=gs25, idx=0) ~> gss250
vec_scale(a=xvs25, s=gss250) ~> rgs250
sgd_update(weights=wr0, grad=rgs250, lr=lr) ~> wr0
xvs26 = [0.1053, 0.0105, 0.9895, 0.3263]
tvs26 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs26) ~> ps26
vec_sub(a=ps26, b=tvs26) ~> gs26
get(arr=gs26, idx=0) ~> gss260
vec_scale(a=xvs26, s=gss260) ~> rgs260
sgd_update(weights=wr0, grad=rgs260, lr=lr) ~> wr0
xvs27 = [0.3263, 0.0105, 0.4737, 0.0000]
tvs27 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs27) ~> ps27
vec_sub(a=ps27, b=tvs27) ~> gs27
get(arr=gs27, idx=0) ~> gss270
vec_scale(a=xvs27, s=gss270) ~> rgs270
sgd_update(weights=wr0, grad=rgs270, lr=lr) ~> wr0
xvs28 = [0.0000, 0.0105, 0.0105, 0.0105]
tvs28 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs28) ~> ps28
vec_sub(a=ps28, b=tvs28) ~> gs28
get(arr=gs28, idx=0) ~> gss280
vec_scale(a=xvs28, s=gss280) ~> rgs280
sgd_update(weights=wr0, grad=rgs280, lr=lr) ~> wr0
xvs29 = [0.0105, 0.0105, 0.8632, 0.6842]
tvs29 = [0, 0, 1, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs29) ~> ps29
vec_sub(a=ps29, b=tvs29) ~> gs29
get(arr=gs29, idx=0) ~> gss290
vec_scale(a=xvs29, s=gss290) ~> rgs290
sgd_update(weights=wr0, grad=rgs290, lr=lr) ~> wr0
xvs30 = [0.6842, 0.8211, 0.7474, 0.7263]
tvs30 = [1, 0, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs30) ~> ps30
vec_sub(a=ps30, b=tvs30) ~> gs30
get(arr=gs30, idx=0) ~> gss300
vec_scale(a=xvs30, s=gss300) ~> rgs300
sgd_update(weights=wr0, grad=rgs300, lr=lr) ~> wr0
xvs31 = [0.7263, 0.6737, 0.8737, 0.8842]
tvs31 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs31) ~> ps31
vec_sub(a=ps31, b=tvs31) ~> gs31
get(arr=gs31, idx=0) ~> gss310
vec_scale(a=xvs31, s=gss310) ~> rgs310
sgd_update(weights=wr0, grad=rgs310, lr=lr) ~> wr0
xvs32 = [0.8842, 0.7263, 0.8421, 0.0947]
tvs32 = [0, 0, 1, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs32) ~> ps32
vec_sub(a=ps32, b=tvs32) ~> gs32
get(arr=gs32, idx=0) ~> gss320
vec_scale(a=xvs32, s=gss320) ~> rgs320
sgd_update(weights=wr0, grad=rgs320, lr=lr) ~> wr0
xvs33 = [0.0947, 0.7368, 0.8632, 0.8316]
tvs33 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs33) ~> ps33
vec_sub(a=ps33, b=tvs33) ~> gs33
get(arr=gs33, idx=0) ~> gss330
vec_scale(a=xvs33, s=gss330) ~> rgs330
sgd_update(weights=wr0, grad=rgs330, lr=lr) ~> wr0
xvs34 = [0.8316, 0.8105, 0.3158, 0.1789]
tvs34 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs34) ~> ps34
vec_sub(a=ps34, b=tvs34) ~> gs34
get(arr=gs34, idx=0) ~> gss340
vec_scale(a=xvs34, s=gss340) ~> rgs340
sgd_update(weights=wr0, grad=rgs340, lr=lr) ~> wr0
xvs35 = [0.1789, 0.1368, 0.0105, 0.8842]
tvs35 = [0, 0, 0, 1]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs35) ~> ps35
vec_sub(a=ps35, b=tvs35) ~> gs35
get(arr=gs35, idx=0) ~> gss350
vec_scale(a=xvs35, s=gss350) ~> rgs350
sgd_update(weights=wr0, grad=rgs350, lr=lr) ~> wr0
xvs36 = [0.8842, 0.8316, 0.3158, 0.4737]
tvs36 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs36) ~> ps36
vec_sub(a=ps36, b=tvs36) ~> gs36
get(arr=gs36, idx=0) ~> gss360
vec_scale(a=xvs36, s=gss360) ~> rgs360
sgd_update(weights=wr0, grad=rgs360, lr=lr) ~> wr0
xvs37 = [0.4737, 0.1368, 0.0105, 0.8737]
tvs37 = [1, 0, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs37) ~> ps37
vec_sub(a=ps37, b=tvs37) ~> gs37
get(arr=gs37, idx=0) ~> gss370
vec_scale(a=xvs37, s=gss370) ~> rgs370
sgd_update(weights=wr0, grad=rgs370, lr=lr) ~> wr0
xvs38 = [0.8737, 0.8842, 0.7263, 0.8421]
tvs38 = [0, 0, 1, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs38) ~> ps38
vec_sub(a=ps38, b=tvs38) ~> gs38
get(arr=gs38, idx=0) ~> gss380
vec_scale(a=xvs38, s=gss380) ~> rgs380
sgd_update(weights=wr0, grad=rgs380, lr=lr) ~> wr0
xvs39 = [0.8421, 0.3158, 0.4947, 0.1053]
tvs39 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs39) ~> ps39
vec_sub(a=ps39, b=tvs39) ~> gs39
get(arr=gs39, idx=0) ~> gss390
vec_scale(a=xvs39, s=gss390) ~> rgs390
sgd_update(weights=wr0, grad=rgs390, lr=lr) ~> wr0
xvs40 = [0.1053, 0.0105, 0.9895, 0.3263]
tvs40 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs40) ~> ps40
vec_sub(a=ps40, b=tvs40) ~> gs40
get(arr=gs40, idx=0) ~> gss400
vec_scale(a=xvs40, s=gss400) ~> rgs400
sgd_update(weights=wr0, grad=rgs400, lr=lr) ~> wr0
xvs41 = [0.3263, 0.0105, 0.8737, 0.8842]
tvs41 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs41) ~> ps41
vec_sub(a=ps41, b=tvs41) ~> gs41
get(arr=gs41, idx=0) ~> gss410
vec_scale(a=xvs41, s=gss410) ~> rgs410
sgd_update(weights=wr0, grad=rgs410, lr=lr) ~> wr0
xvs42 = [0.8842, 0.6842, 0.8632, 0.8842]
tvs42 = [0, 0, 0, 1]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs42) ~> ps42
vec_sub(a=ps42, b=tvs42) ~> gs42
get(arr=gs42, idx=0) ~> gss420
vec_scale(a=xvs42, s=gss420) ~> rgs420
sgd_update(weights=wr0, grad=rgs420, lr=lr) ~> wr0
xvs43 = [0.8842, 0.8737, 0.0000, 0.0105]
tvs43 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs43) ~> ps43
vec_sub(a=ps43, b=tvs43) ~> gs43
get(arr=gs43, idx=0) ~> gss430
vec_scale(a=xvs43, s=gss430) ~> rgs430
sgd_update(weights=wr0, grad=rgs430, lr=lr) ~> wr0
xvs44 = [0.0105, 0.0105, 0.0105, 0.0105]
tvs44 = [0, 0, 0, 1]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs44) ~> ps44
vec_sub(a=ps44, b=tvs44) ~> gs44
get(arr=gs44, idx=0) ~> gss440
vec_scale(a=xvs44, s=gss440) ~> rgs440
sgd_update(weights=wr0, grad=rgs440, lr=lr) ~> wr0
xvs45 = [0.0105, 0.4105, 0.0947, 0.8737]
tvs45 = [1, 0, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs45) ~> ps45
vec_sub(a=ps45, b=tvs45) ~> gs45
get(arr=gs45, idx=0) ~> gss450
vec_scale(a=xvs45, s=gss450) ~> rgs450
sgd_update(weights=wr0, grad=rgs450, lr=lr) ~> wr0
xvs46 = [0.8737, 0.8842, 0.6842, 0.8632]
tvs46 = [1, 0, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs46) ~> ps46
vec_sub(a=ps46, b=tvs46) ~> gs46
get(arr=gs46, idx=0) ~> gss460
vec_scale(a=xvs46, s=gss460) ~> rgs460
sgd_update(weights=wr0, grad=rgs460, lr=lr) ~> wr0
xvs47 = [0.8632, 0.8842, 0.8737, 0.1053]
tvs47 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs47) ~> ps47
vec_sub(a=ps47, b=tvs47) ~> gs47
get(arr=gs47, idx=0) ~> gss470
vec_scale(a=xvs47, s=gss470) ~> rgs470
sgd_update(weights=wr0, grad=rgs470, lr=lr) ~> wr0
xvs48 = [0.1053, 0.0105, 0.9579, 0.0000]
tvs48 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs48) ~> ps48
vec_sub(a=ps48, b=tvs48) ~> gs48
get(arr=gs48, idx=0) ~> gss480
vec_scale(a=xvs48, s=gss480) ~> rgs480
sgd_update(weights=wr0, grad=rgs480, lr=lr) ~> wr0
xvs49 = [0.0000, 0.0105, 0.0105, 0.0105]
tvs49 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs49) ~> ps49
vec_sub(a=ps49, b=tvs49) ~> gs49
get(arr=gs49, idx=0) ~> gss490
vec_scale(a=xvs49, s=gss490) ~> rgs490
sgd_update(weights=wr0, grad=rgs490, lr=lr) ~> wr0
[T+]
show shall(wr0)