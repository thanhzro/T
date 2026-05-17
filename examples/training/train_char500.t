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
mat_update_4(mat=wr0, grad=gs0, x=xvs0, lr=lr) ~> wr0
dot_product(a=gs0, b=gs0) ~> losss0
xvs1 = [0.1474, 0.6526, 0.0000, 0.0000]
tvs1 = [0, 0, 1, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs1) ~> ps1
vec_sub(a=ps1, b=tvs1) ~> gs1
mat_update_4(mat=wr0, grad=gs1, x=xvs1, lr=lr) ~> wr0
dot_product(a=gs1, b=gs1) ~> losss1
xvs2 = [0.0000, 0.0000, 0.7368, 0.8947]
tvs2 = [0, 0, 1, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs2) ~> ps2
vec_sub(a=ps2, b=tvs2) ~> gs2
mat_update_4(mat=wr0, grad=gs2, x=xvs2, lr=lr) ~> wr0
dot_product(a=gs2, b=gs2) ~> losss2
xvs3 = [0.7368, 0.8947, 0.8211, 0.7053]
tvs3 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs3) ~> ps3
vec_sub(a=ps3, b=tvs3) ~> gs3
mat_update_4(mat=wr0, grad=gs3, x=xvs3, lr=lr) ~> wr0
dot_product(a=gs3, b=gs3) ~> losss3
xvs4 = [0.8211, 0.7053, 0.0105, 0.7053]
tvs4 = [1, 0, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs4) ~> ps4
vec_sub(a=ps4, b=tvs4) ~> gs4
mat_update_4(mat=wr0, grad=gs4, x=xvs4, lr=lr) ~> wr0
dot_product(a=gs4, b=gs4) ~> losss4
xvs5 = [0.0105, 0.7053, 0.7579, 0.8947]
tvs5 = [0, 0, 1, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs5) ~> ps5
vec_sub(a=ps5, b=tvs5) ~> gs5
mat_update_4(mat=wr0, grad=gs5, x=xvs5, lr=lr) ~> wr0
dot_product(a=gs5, b=gs5) ~> losss5
xvs6 = [0.7579, 0.8947, 0.8211, 0.7895]
tvs6 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs6) ~> ps6
vec_sub(a=ps6, b=tvs6) ~> gs6
mat_update_4(mat=wr0, grad=gs6, x=xvs6, lr=lr) ~> wr0
dot_product(a=gs6, b=gs6) ~> losss6
xvs7 = [0.8211, 0.7895, 0.0947, 0.6842]
tvs7 = [0, 0, 1, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs7) ~> ps7
vec_sub(a=ps7, b=tvs7) ~> gs7
mat_update_4(mat=wr0, grad=gs7, x=xvs7, lr=lr) ~> wr0
dot_product(a=gs7, b=gs7) ~> losss7
xvs8 = [0.0947, 0.6842, 0.8632, 0.8632]
tvs8 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs8) ~> ps8
vec_sub(a=ps8, b=tvs8) ~> gs8
mat_update_4(mat=wr0, grad=gs8, x=xvs8, lr=lr) ~> wr0
dot_product(a=gs8, b=gs8) ~> losss8
xvs9 = [0.8632, 0.8632, 0.1368, 0.0105]
tvs9 = [0, 0, 1, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs9) ~> ps9
vec_sub(a=ps9, b=tvs9) ~> gs9
mat_update_4(mat=wr0, grad=gs9, x=xvs9, lr=lr) ~> wr0
dot_product(a=gs9, b=gs9) ~> losss9
xvs10 = [0.1368, 0.0105, 0.8211, 0.1053]
tvs10 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs10) ~> ps10
vec_sub(a=ps10, b=tvs10) ~> gs10
mat_update_4(mat=wr0, grad=gs10, x=xvs10, lr=lr) ~> wr0
dot_product(a=gs10, b=gs10) ~> losss10
xvs11 = [0.8211, 0.1053, 0.0105, 0.9579]
tvs11 = [1, 0, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs11) ~> ps11
vec_sub(a=ps11, b=tvs11) ~> gs11
mat_update_4(mat=wr0, grad=gs11, x=xvs11, lr=lr) ~> wr0
dot_product(a=gs11, b=gs11) ~> losss11
xvs12 = [0.0105, 0.9579, 0.0000, 0.0105]
tvs12 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs12) ~> ps12
vec_sub(a=ps12, b=tvs12) ~> gs12
mat_update_4(mat=wr0, grad=gs12, x=xvs12, lr=lr) ~> wr0
dot_product(a=gs12, b=gs12) ~> losss12
xvs13 = [0.0000, 0.0105, 0.0105, 0.0105]
tvs13 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs13) ~> ps13
vec_sub(a=ps13, b=tvs13) ~> gs13
mat_update_4(mat=wr0, grad=gs13, x=xvs13, lr=lr) ~> wr0
dot_product(a=gs13, b=gs13) ~> losss13
xvs14 = [0.0105, 0.0105, 0.0105, 0.8421]
tvs14 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs14) ~> ps14
vec_sub(a=ps14, b=tvs14) ~> gs14
mat_update_4(mat=wr0, grad=gs14, x=xvs14, lr=lr) ~> wr0
dot_product(a=gs14, b=gs14) ~> losss14
xvs15 = [0.0105, 0.8421, 0.6842, 0.8737]
tvs15 = [1, 0, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs15) ~> ps15
vec_sub(a=ps15, b=tvs15) ~> gs15
mat_update_4(mat=wr0, grad=gs15, x=xvs15, lr=lr) ~> wr0
dot_product(a=gs15, b=gs15) ~> losss15
xvs16 = [0.6842, 0.8737, 0.8842, 0.0947]
tvs16 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs16) ~> ps16
vec_sub(a=ps16, b=tvs16) ~> gs16
mat_update_4(mat=wr0, grad=gs16, x=xvs16, lr=lr) ~> wr0
dot_product(a=gs16, b=gs16) ~> losss16
xvs17 = [0.8842, 0.0947, 0.6842, 0.8632]
tvs17 = [0, 0, 1, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs17) ~> ps17
vec_sub(a=ps17, b=tvs17) ~> gs17
mat_update_4(mat=wr0, grad=gs17, x=xvs17, lr=lr) ~> wr0
dot_product(a=gs17, b=gs17) ~> losss17
xvs18 = [0.6842, 0.8632, 0.8632, 0.1053]
tvs18 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs18) ~> ps18
vec_sub(a=ps18, b=tvs18) ~> gs18
mat_update_4(mat=wr0, grad=gs18, x=xvs18, lr=lr) ~> wr0
dot_product(a=gs18, b=gs18) ~> losss18
xvs19 = [0.8632, 0.1053, 0.0105, 0.9895]
tvs19 = [0, 0, 0, 1]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs19) ~> ps19
vec_sub(a=ps19, b=tvs19) ~> gs19
mat_update_4(mat=wr0, grad=gs19, x=xvs19, lr=lr) ~> wr0
dot_product(a=gs19, b=gs19) ~> losss19
xvs20 = [0.0105, 0.9895, 0.3263, 0.0105]
tvs20 = [0, 0, 1, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs20) ~> ps20
vec_sub(a=ps20, b=tvs20) ~> gs20
mat_update_4(mat=wr0, grad=gs20, x=xvs20, lr=lr) ~> wr0
dot_product(a=gs20, b=gs20) ~> losss20
xvs21 = [0.3263, 0.0105, 0.3579, 0.1895]
tvs21 = [1, 0, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs21) ~> ps21
vec_sub(a=ps21, b=tvs21) ~> gs21
mat_update_4(mat=wr0, grad=gs21, x=xvs21, lr=lr) ~> wr0
dot_product(a=gs21, b=gs21) ~> losss21
xvs22 = [0.3579, 0.1895, 0.0000, 0.0105]
tvs22 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs22) ~> ps22
vec_sub(a=ps22, b=tvs22) ~> gs22
mat_update_4(mat=wr0, grad=gs22, x=xvs22, lr=lr) ~> wr0
dot_product(a=gs22, b=gs22) ~> losss22
xvs23 = [0.0000, 0.0105, 0.0105, 0.0105]
tvs23 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs23) ~> ps23
vec_sub(a=ps23, b=tvs23) ~> gs23
mat_update_4(mat=wr0, grad=gs23, x=xvs23, lr=lr) ~> wr0
dot_product(a=gs23, b=gs23) ~> losss23
xvs24 = [0.0105, 0.0105, 0.0105, 0.8421]
tvs24 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs24) ~> ps24
vec_sub(a=ps24, b=tvs24) ~> gs24
mat_update_4(mat=wr0, grad=gs24, x=xvs24, lr=lr) ~> wr0
dot_product(a=gs24, b=gs24) ~> losss24
xvs25 = [0.0105, 0.8421, 0.6842, 0.8737]
tvs25 = [1, 0, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs25) ~> ps25
vec_sub(a=ps25, b=tvs25) ~> gs25
mat_update_4(mat=wr0, grad=gs25, x=xvs25, lr=lr) ~> wr0
dot_product(a=gs25, b=gs25) ~> losss25
xvs26 = [0.6842, 0.8737, 0.8842, 0.0947]
tvs26 = [0, 0, 1, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs26) ~> ps26
vec_sub(a=ps26, b=tvs26) ~> gs26
mat_update_4(mat=wr0, grad=gs26, x=xvs26, lr=lr) ~> wr0
dot_product(a=gs26, b=gs26) ~> losss26
xvs27 = [0.8842, 0.0947, 0.8211, 0.1053]
tvs27 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs27) ~> ps27
vec_sub(a=ps27, b=tvs27) ~> gs27
mat_update_4(mat=wr0, grad=gs27, x=xvs27, lr=lr) ~> wr0
dot_product(a=gs27, b=gs27) ~> losss27
xvs28 = [0.8211, 0.1053, 0.0105, 0.9895]
tvs28 = [0, 0, 0, 1]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs28) ~> ps28
vec_sub(a=ps28, b=tvs28) ~> gs28
mat_update_4(mat=wr0, grad=gs28, x=xvs28, lr=lr) ~> wr0
dot_product(a=gs28, b=gs28) ~> losss28
xvs29 = [0.0105, 0.9895, 0.3263, 0.0105]
tvs29 = [0, 0, 0, 1]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs29) ~> ps29
vec_sub(a=ps29, b=tvs29) ~> gs29
mat_update_4(mat=wr0, grad=gs29, x=xvs29, lr=lr) ~> wr0
dot_product(a=gs29, b=gs29) ~> losss29
xvs30 = [0.3263, 0.0105, 0.4947, 0.0000]
tvs30 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs30) ~> ps30
vec_sub(a=ps30, b=tvs30) ~> gs30
mat_update_4(mat=wr0, grad=gs30, x=xvs30, lr=lr) ~> wr0
dot_product(a=gs30, b=gs30) ~> losss30
xvs31 = [0.4947, 0.0000, 0.0105, 0.0105]
tvs31 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs31) ~> ps31
vec_sub(a=ps31, b=tvs31) ~> gs31
mat_update_4(mat=wr0, grad=gs31, x=xvs31, lr=lr) ~> wr0
dot_product(a=gs31, b=gs31) ~> losss31
xvs32 = [0.0105, 0.0105, 0.0105, 0.0105]
tvs32 = [1, 0, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs32) ~> ps32
vec_sub(a=ps32, b=tvs32) ~> gs32
mat_update_4(mat=wr0, grad=gs32, x=xvs32, lr=lr) ~> wr0
dot_product(a=gs32, b=gs32) ~> losss32
xvs33 = [0.0105, 0.0105, 0.8000, 0.7263]
tvs33 = [0, 0, 1, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs33) ~> ps33
vec_sub(a=ps33, b=tvs33) ~> gs33
mat_update_4(mat=wr0, grad=gs33, x=xvs33, lr=lr) ~> wr0
dot_product(a=gs33, b=gs33) ~> losss33
xvs34 = [0.8000, 0.7263, 0.8211, 0.0947]
tvs34 = [0, 0, 1, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs34) ~> ps34
vec_sub(a=ps34, b=tvs34) ~> gs34
mat_update_4(mat=wr0, grad=gs34, x=xvs34, lr=lr) ~> wr0
dot_product(a=gs34, b=gs34) ~> losss34
xvs35 = [0.8211, 0.0947, 0.9053, 0.6842]
tvs35 = [1, 0, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs35) ~> ps35
vec_sub(a=ps35, b=tvs35) ~> gs35
mat_update_4(mat=wr0, grad=gs35, x=xvs35, lr=lr) ~> wr0
dot_product(a=gs35, b=gs35) ~> losss35
xvs36 = [0.9053, 0.6842, 0.8000, 0.3158]
tvs36 = [0, 0, 1, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs36) ~> ps36
vec_sub(a=ps36, b=tvs36) ~> gs36
mat_update_4(mat=wr0, grad=gs36, x=xvs36, lr=lr) ~> wr0
dot_product(a=gs36, b=gs36) ~> losss36
xvs37 = [0.8000, 0.3158, 0.3579, 0.1895]
tvs37 = [0, 0, 1, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs37) ~> ps37
vec_sub(a=ps37, b=tvs37) ~> gs37
mat_update_4(mat=wr0, grad=gs37, x=xvs37, lr=lr) ~> wr0
dot_product(a=gs37, b=gs37) ~> losss37
xvs38 = [0.3579, 0.1895, 0.1053, 0.0105]
tvs38 = [0, 0, 1, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs38) ~> ps38
vec_sub(a=ps38, b=tvs38) ~> gs38
mat_update_4(mat=wr0, grad=gs38, x=xvs38, lr=lr) ~> wr0
dot_product(a=gs38, b=gs38) ~> losss38
xvs39 = [0.1053, 0.0105, 0.9895, 0.3263]
tvs39 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs39) ~> ps39
vec_sub(a=ps39, b=tvs39) ~> gs39
mat_update_4(mat=wr0, grad=gs39, x=xvs39, lr=lr) ~> wr0
dot_product(a=gs39, b=gs39) ~> losss39
xvs40 = [0.9895, 0.3263, 0.0105, 0.4737]
tvs40 = [1, 0, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs40) ~> ps40
vec_sub(a=ps40, b=tvs40) ~> gs40
mat_update_4(mat=wr0, grad=gs40, x=xvs40, lr=lr) ~> wr0
dot_product(a=gs40, b=gs40) ~> losss40
xvs41 = [0.0105, 0.4737, 0.0000, 0.0105]
tvs41 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs41) ~> ps41
vec_sub(a=ps41, b=tvs41) ~> gs41
mat_update_4(mat=wr0, grad=gs41, x=xvs41, lr=lr) ~> wr0
dot_product(a=gs41, b=gs41) ~> losss41
xvs42 = [0.0000, 0.0105, 0.0105, 0.0105]
tvs42 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs42) ~> ps42
vec_sub(a=ps42, b=tvs42) ~> gs42
mat_update_4(mat=wr0, grad=gs42, x=xvs42, lr=lr) ~> wr0
dot_product(a=gs42, b=gs42) ~> losss42
xvs43 = [0.0105, 0.0105, 0.0105, 0.8632]
tvs43 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs43) ~> ps43
vec_sub(a=ps43, b=tvs43) ~> gs43
mat_update_4(mat=wr0, grad=gs43, x=xvs43, lr=lr) ~> wr0
dot_product(a=gs43, b=gs43) ~> losss43
xvs44 = [0.0105, 0.8632, 0.6842, 0.8211]
tvs44 = [0, 0, 0, 1]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs44) ~> ps44
vec_sub(a=ps44, b=tvs44) ~> gs44
mat_update_4(mat=wr0, grad=gs44, x=xvs44, lr=lr) ~> wr0
dot_product(a=gs44, b=gs44) ~> losss44
xvs45 = [0.6842, 0.8211, 0.7474, 0.7263]
tvs45 = [1, 0, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs45) ~> ps45
vec_sub(a=ps45, b=tvs45) ~> gs45
mat_update_4(mat=wr0, grad=gs45, x=xvs45, lr=lr) ~> wr0
dot_product(a=gs45, b=gs45) ~> losss45
xvs46 = [0.7474, 0.7263, 0.6737, 0.8737]
tvs46 = [1, 0, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs46) ~> ps46
vec_sub(a=ps46, b=tvs46) ~> gs46
mat_update_4(mat=wr0, grad=gs46, x=xvs46, lr=lr) ~> wr0
dot_product(a=gs46, b=gs46) ~> losss46
xvs47 = [0.6737, 0.8737, 0.8842, 0.7263]
tvs47 = [1, 0, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs47) ~> ps47
vec_sub(a=ps47, b=tvs47) ~> gs47
mat_update_4(mat=wr0, grad=gs47, x=xvs47, lr=lr) ~> wr0
dot_product(a=gs47, b=gs47) ~> losss47
xvs48 = [0.8842, 0.7263, 0.8421, 0.0947]
tvs48 = [0, 0, 1, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs48) ~> ps48
vec_sub(a=ps48, b=tvs48) ~> gs48
mat_update_4(mat=wr0, grad=gs48, x=xvs48, lr=lr) ~> wr0
dot_product(a=gs48, b=gs48) ~> losss48
xvs49 = [0.8421, 0.0947, 0.7368, 0.8632]
tvs49 = [0, 0, 0, 1]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs49) ~> ps49
vec_sub(a=ps49, b=tvs49) ~> gs49
mat_update_4(mat=wr0, grad=gs49, x=xvs49, lr=lr) ~> wr0
dot_product(a=gs49, b=gs49) ~> losss49
xvs50 = [0.7368, 0.8632, 0.8316, 0.8105]
tvs50 = [0, 0, 1, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs50) ~> ps50
vec_sub(a=ps50, b=tvs50) ~> gs50
mat_update_4(mat=wr0, grad=gs50, x=xvs50, lr=lr) ~> wr0
dot_product(a=gs50, b=gs50) ~> losss50
xvs51 = [0.8316, 0.8105, 0.3158, 0.1789]
tvs51 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs51) ~> ps51
vec_sub(a=ps51, b=tvs51) ~> gs51
mat_update_4(mat=wr0, grad=gs51, x=xvs51, lr=lr) ~> wr0
dot_product(a=gs51, b=gs51) ~> losss51
xvs52 = [0.3158, 0.1789, 0.1368, 0.0105]
tvs52 = [1, 0, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs52) ~> ps52
vec_sub(a=ps52, b=tvs52) ~> gs52
mat_update_4(mat=wr0, grad=gs52, x=xvs52, lr=lr) ~> wr0
dot_product(a=gs52, b=gs52) ~> losss52
xvs53 = [0.1368, 0.0105, 0.8842, 0.8316]
tvs53 = [0, 0, 1, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs53) ~> ps53
vec_sub(a=ps53, b=tvs53) ~> gs53
mat_update_4(mat=wr0, grad=gs53, x=xvs53, lr=lr) ~> wr0
dot_product(a=gs53, b=gs53) ~> losss53
xvs54 = [0.8842, 0.8316, 0.3158, 0.4737]
tvs54 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs54) ~> ps54
vec_sub(a=ps54, b=tvs54) ~> gs54
mat_update_4(mat=wr0, grad=gs54, x=xvs54, lr=lr) ~> wr0
dot_product(a=gs54, b=gs54) ~> losss54
xvs55 = [0.3158, 0.4737, 0.1368, 0.0105]
tvs55 = [0, 0, 0, 1]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs55) ~> ps55
vec_sub(a=ps55, b=tvs55) ~> gs55
mat_update_4(mat=wr0, grad=gs55, x=xvs55, lr=lr) ~> wr0
dot_product(a=gs55, b=gs55) ~> losss55
xvs56 = [0.1368, 0.0105, 0.8737, 0.8842]
tvs56 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs56) ~> ps56
vec_sub(a=ps56, b=tvs56) ~> gs56
mat_update_4(mat=wr0, grad=gs56, x=xvs56, lr=lr) ~> wr0
dot_product(a=gs56, b=gs56) ~> losss56
xvs57 = [0.8737, 0.8842, 0.7263, 0.8421]
tvs57 = [0, 0, 1, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs57) ~> ps57
vec_sub(a=ps57, b=tvs57) ~> gs57
mat_update_4(mat=wr0, grad=gs57, x=xvs57, lr=lr) ~> wr0
dot_product(a=gs57, b=gs57) ~> losss57
xvs58 = [0.7263, 0.8421, 0.3158, 0.4947]
tvs58 = [0, 0, 1, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs58) ~> ps58
vec_sub(a=ps58, b=tvs58) ~> gs58
mat_update_4(mat=wr0, grad=gs58, x=xvs58, lr=lr) ~> wr0
dot_product(a=gs58, b=gs58) ~> losss58
xvs59 = [0.3158, 0.4947, 0.1053, 0.0105]
tvs59 = [0, 0, 1, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs59) ~> ps59
vec_sub(a=ps59, b=tvs59) ~> gs59
mat_update_4(mat=wr0, grad=gs59, x=xvs59, lr=lr) ~> wr0
dot_product(a=gs59, b=gs59) ~> losss59
xvs60 = [0.1053, 0.0105, 0.9895, 0.3263]
tvs60 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs60) ~> ps60
vec_sub(a=ps60, b=tvs60) ~> gs60
mat_update_4(mat=wr0, grad=gs60, x=xvs60, lr=lr) ~> wr0
dot_product(a=gs60, b=gs60) ~> losss60
xvs61 = [0.9895, 0.3263, 0.0105, 0.8737]
tvs61 = [1, 0, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs61) ~> ps61
vec_sub(a=ps61, b=tvs61) ~> gs61
mat_update_4(mat=wr0, grad=gs61, x=xvs61, lr=lr) ~> wr0
dot_product(a=gs61, b=gs61) ~> losss61
xvs62 = [0.0105, 0.8737, 0.8842, 0.6842]
tvs62 = [0, 0, 1, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs62) ~> ps62
vec_sub(a=ps62, b=tvs62) ~> gs62
mat_update_4(mat=wr0, grad=gs62, x=xvs62, lr=lr) ~> wr0
dot_product(a=gs62, b=gs62) ~> losss62
xvs63 = [0.8842, 0.6842, 0.8632, 0.8842]
tvs63 = [0, 0, 0, 1]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs63) ~> ps63
vec_sub(a=ps63, b=tvs63) ~> gs63
mat_update_4(mat=wr0, grad=gs63, x=xvs63, lr=lr) ~> wr0
dot_product(a=gs63, b=gs63) ~> losss63
xvs64 = [0.8632, 0.8842, 0.8737, 0.0000]
tvs64 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs64) ~> ps64
vec_sub(a=ps64, b=tvs64) ~> gs64
mat_update_4(mat=wr0, grad=gs64, x=xvs64, lr=lr) ~> wr0
dot_product(a=gs64, b=gs64) ~> losss64
xvs65 = [0.8737, 0.0000, 0.0105, 0.0105]
tvs65 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs65) ~> ps65
vec_sub(a=ps65, b=tvs65) ~> gs65
mat_update_4(mat=wr0, grad=gs65, x=xvs65, lr=lr) ~> wr0
dot_product(a=gs65, b=gs65) ~> losss65
xvs66 = [0.0105, 0.0105, 0.0105, 0.0105]
tvs66 = [0, 0, 0, 1]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs66) ~> ps66
vec_sub(a=ps66, b=tvs66) ~> gs66
mat_update_4(mat=wr0, grad=gs66, x=xvs66, lr=lr) ~> wr0
dot_product(a=gs66, b=gs66) ~> losss66
xvs67 = [0.0105, 0.0105, 0.4105, 0.0947]
tvs67 = [0, 0, 0, 1]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs67) ~> ps67
vec_sub(a=ps67, b=tvs67) ~> gs67
mat_update_4(mat=wr0, grad=gs67, x=xvs67, lr=lr) ~> wr0
dot_product(a=gs67, b=gs67) ~> losss67
xvs68 = [0.4105, 0.0947, 0.8737, 0.8842]
tvs68 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs68) ~> ps68
vec_sub(a=ps68, b=tvs68) ~> gs68
mat_update_4(mat=wr0, grad=gs68, x=xvs68, lr=lr) ~> wr0
dot_product(a=gs68, b=gs68) ~> losss68
xvs69 = [0.8737, 0.8842, 0.6842, 0.8632]
tvs69 = [1, 0, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs69) ~> ps69
vec_sub(a=ps69, b=tvs69) ~> gs69
mat_update_4(mat=wr0, grad=gs69, x=xvs69, lr=lr) ~> wr0
dot_product(a=gs69, b=gs69) ~> losss69
xvs70 = [0.6842, 0.8632, 0.8842, 0.8737]
tvs70 = [0, 0, 1, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs70) ~> ps70
vec_sub(a=ps70, b=tvs70) ~> gs70
mat_update_4(mat=wr0, grad=gs70, x=xvs70, lr=lr) ~> wr0
dot_product(a=gs70, b=gs70) ~> losss70
xvs71 = [0.8842, 0.8737, 0.1053, 0.0105]
tvs71 = [0, 0, 0, 1]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs71) ~> ps71
vec_sub(a=ps71, b=tvs71) ~> gs71
mat_update_4(mat=wr0, grad=gs71, x=xvs71, lr=lr) ~> wr0
dot_product(a=gs71, b=gs71) ~> losss71
xvs72 = [0.1053, 0.0105, 0.9579, 0.0000]
tvs72 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs72) ~> ps72
vec_sub(a=ps72, b=tvs72) ~> gs72
mat_update_4(mat=wr0, grad=gs72, x=xvs72, lr=lr) ~> wr0
dot_product(a=gs72, b=gs72) ~> losss72
xvs73 = [0.9579, 0.0000, 0.0105, 0.0105]
tvs73 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs73) ~> ps73
vec_sub(a=ps73, b=tvs73) ~> gs73
mat_update_4(mat=wr0, grad=gs73, x=xvs73, lr=lr) ~> wr0
dot_product(a=gs73, b=gs73) ~> losss73
xvs74 = [0.0105, 0.0105, 0.0105, 0.0105]
tvs74 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs74) ~> ps74
vec_sub(a=ps74, b=tvs74) ~> gs74
mat_update_4(mat=wr0, grad=gs74, x=xvs74, lr=lr) ~> wr0
dot_product(a=gs74, b=gs74) ~> losss74
xvs75 = [0.0105, 0.0105, 0.0105, 0.0105]
tvs75 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs75) ~> ps75
vec_sub(a=ps75, b=tvs75) ~> gs75
mat_update_4(mat=wr0, grad=gs75, x=xvs75, lr=lr) ~> wr0
dot_product(a=gs75, b=gs75) ~> losss75
xvs76 = [0.0105, 0.0105, 0.0105, 0.0105]
tvs76 = [0, 0, 1, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs76) ~> ps76
vec_sub(a=ps76, b=tvs76) ~> gs76
mat_update_4(mat=wr0, grad=gs76, x=xvs76, lr=lr) ~> wr0
dot_product(a=gs76, b=gs76) ~> losss76
xvs77 = [0.0105, 0.0105, 0.8211, 0.8316]
tvs77 = [0, 0, 0, 1]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs77) ~> ps77
vec_sub(a=ps77, b=tvs77) ~> gs77
mat_update_4(mat=wr0, grad=gs77, x=xvs77, lr=lr) ~> wr0
dot_product(a=gs77, b=gs77) ~> losss77
xvs78 = [0.8211, 0.8316, 0.9158, 0.0105]
tvs78 = [0, 0, 0, 1]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs78) ~> ps78
vec_sub(a=ps78, b=tvs78) ~> gs78
mat_update_4(mat=wr0, grad=gs78, x=xvs78, lr=lr) ~> wr0
dot_product(a=gs78, b=gs78) ~> losss78
xvs79 = [0.9158, 0.0105, 0.3263, 0.3263]
tvs79 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs79) ~> ps79
vec_sub(a=ps79, b=tvs79) ~> gs79
mat_update_4(mat=wr0, grad=gs79, x=xvs79, lr=lr) ~> wr0
dot_product(a=gs79, b=gs79) ~> losss79
xvs80 = [0.3263, 0.3263, 0.0105, 0.7684]
tvs80 = [1, 0, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs80) ~> ps80
vec_sub(a=ps80, b=tvs80) ~> gs80
mat_update_4(mat=wr0, grad=gs80, x=xvs80, lr=lr) ~> wr0
dot_product(a=gs80, b=gs80) ~> losss80
xvs81 = [0.0105, 0.7684, 0.7158, 0.9263]
tvs81 = [1, 0, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs81) ~> ps81
vec_sub(a=ps81, b=tvs81) ~> gs81
mat_update_4(mat=wr0, grad=gs81, x=xvs81, lr=lr) ~> wr0
dot_product(a=gs81, b=gs81) ~> losss81
xvs82 = [0.7158, 0.9263, 0.0000, 0.0105]
tvs82 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs82) ~> ps82
vec_sub(a=ps82, b=tvs82) ~> gs82
mat_update_4(mat=wr0, grad=gs82, x=xvs82, lr=lr) ~> wr0
dot_product(a=gs82, b=gs82) ~> losss82
xvs83 = [0.0000, 0.0105, 0.0105, 0.0105]
tvs83 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs83) ~> ps83
vec_sub(a=ps83, b=tvs83) ~> gs83
mat_update_4(mat=wr0, grad=gs83, x=xvs83, lr=lr) ~> wr0
dot_product(a=gs83, b=gs83) ~> losss83
xvs84 = [0.0105, 0.0105, 0.0105, 0.0105]
tvs84 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs84) ~> ps84
vec_sub(a=ps84, b=tvs84) ~> gs84
mat_update_4(mat=wr0, grad=gs84, x=xvs84, lr=lr) ~> wr0
dot_product(a=gs84, b=gs84) ~> losss84
xvs85 = [0.0105, 0.0105, 0.0105, 0.0105]
tvs85 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs85) ~> ps85
vec_sub(a=ps85, b=tvs85) ~> gs85
mat_update_4(mat=wr0, grad=gs85, x=xvs85, lr=lr) ~> wr0
dot_product(a=gs85, b=gs85) ~> losss85
xvs86 = [0.0105, 0.0105, 0.0105, 0.7684]
tvs86 = [1, 0, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs86) ~> ps86
vec_sub(a=ps86, b=tvs86) ~> gs86
mat_update_4(mat=wr0, grad=gs86, x=xvs86, lr=lr) ~> wr0
dot_product(a=gs86, b=gs86) ~> losss86
xvs87 = [0.0105, 0.7684, 0.7158, 0.9263]
tvs87 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs87) ~> ps87
vec_sub(a=ps87, b=tvs87) ~> gs87
mat_update_4(mat=wr0, grad=gs87, x=xvs87, lr=lr) ~> wr0
dot_product(a=gs87, b=gs87) ~> losss87
xvs88 = [0.7158, 0.9263, 0.0105, 0.1263]
tvs88 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs88) ~> ps88
vec_sub(a=ps88, b=tvs88) ~> gs88
mat_update_4(mat=wr0, grad=gs88, x=xvs88, lr=lr) ~> wr0
dot_product(a=gs88, b=gs88) ~> losss88
xvs89 = [0.0105, 0.1263, 0.0105, 0.4947]
tvs89 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs89) ~> ps89
vec_sub(a=ps89, b=tvs89) ~> gs89
mat_update_4(mat=wr0, grad=gs89, x=xvs89, lr=lr) ~> wr0
dot_product(a=gs89, b=gs89) ~> losss89
xvs90 = [0.0105, 0.4947, 0.0105, 0.3263]
tvs90 = [0, 0, 0, 1]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs90) ~> ps90
vec_sub(a=ps90, b=tvs90) ~> gs90
mat_update_4(mat=wr0, grad=gs90, x=xvs90, lr=lr) ~> wr0
dot_product(a=gs90, b=gs90) ~> losss90
xvs91 = [0.0105, 0.3263, 0.3263, 0.0105]
tvs91 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs91) ~> ps91
vec_sub(a=ps91, b=tvs91) ~> gs91
mat_update_4(mat=wr0, grad=gs91, x=xvs91, lr=lr) ~> wr0
dot_product(a=gs91, b=gs91) ~> losss91
xvs92 = [0.3263, 0.0105, 0.7263, 0.8211]
tvs92 = [1, 0, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs92) ~> ps92
vec_sub(a=ps92, b=tvs92) ~> gs92
mat_update_4(mat=wr0, grad=gs92, x=xvs92, lr=lr) ~> wr0
dot_product(a=gs92, b=gs92) ~> losss92
xvs93 = [0.7263, 0.8211, 0.7158, 0.0000]
tvs93 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs93) ~> ps93
vec_sub(a=ps93, b=tvs93) ~> gs93
mat_update_4(mat=wr0, grad=gs93, x=xvs93, lr=lr) ~> wr0
dot_product(a=gs93, b=gs93) ~> losss93
xvs94 = [0.7158, 0.0000, 0.0105, 0.0105]
tvs94 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs94) ~> ps94
vec_sub(a=ps94, b=tvs94) ~> gs94
mat_update_4(mat=wr0, grad=gs94, x=xvs94, lr=lr) ~> wr0
dot_product(a=gs94, b=gs94) ~> losss94
xvs95 = [0.0105, 0.0105, 0.0105, 0.0105]
tvs95 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs95) ~> ps95
vec_sub(a=ps95, b=tvs95) ~> gs95
mat_update_4(mat=wr0, grad=gs95, x=xvs95, lr=lr) ~> wr0
dot_product(a=gs95, b=gs95) ~> losss95
xvs96 = [0.0105, 0.0105, 0.0105, 0.0105]
tvs96 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs96) ~> ps96
vec_sub(a=ps96, b=tvs96) ~> gs96
mat_update_4(mat=wr0, grad=gs96, x=xvs96, lr=lr) ~> wr0
dot_product(a=gs96, b=gs96) ~> losss96
xvs97 = [0.0105, 0.0105, 0.0105, 0.0105]
tvs97 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs97) ~> ps97
vec_sub(a=ps97, b=tvs97) ~> gs97
mat_update_4(mat=wr0, grad=gs97, x=xvs97, lr=lr) ~> wr0
dot_product(a=gs97, b=gs97) ~> losss97
xvs98 = [0.0105, 0.0105, 0.8105, 0.7684]
tvs98 = [0, 0, 1, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs98) ~> ps98
vec_sub(a=ps98, b=tvs98) ~> gs98
mat_update_4(mat=wr0, grad=gs98, x=xvs98, lr=lr) ~> wr0
dot_product(a=gs98, b=gs98) ~> losss98
xvs99 = [0.8105, 0.7684, 0.8211, 0.0947]
tvs99 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs99) ~> ps99
vec_sub(a=ps99, b=tvs99) ~> gs99
mat_update_4(mat=wr0, grad=gs99, x=xvs99, lr=lr) ~> wr0
dot_product(a=gs99, b=gs99) ~> losss99
xvs100 = [0.8211, 0.0947, 0.6842, 0.3158]
tvs100 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs100) ~> ps100
vec_sub(a=ps100, b=tvs100) ~> gs100
mat_update_4(mat=wr0, grad=gs100, x=xvs100, lr=lr) ~> wr0
dot_product(a=gs100, b=gs100) ~> losss100
xvs101 = [0.6842, 0.3158, 0.7263, 0.8211]
tvs101 = [1, 0, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs101) ~> ps101
vec_sub(a=ps101, b=tvs101) ~> gs101
mat_update_4(mat=wr0, grad=gs101, x=xvs101, lr=lr) ~> wr0
dot_product(a=gs101, b=gs101) ~> losss101
xvs102 = [0.7263, 0.8211, 0.7158, 0.1368]
tvs102 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs102) ~> ps102
vec_sub(a=ps102, b=tvs102) ~> gs102
mat_update_4(mat=wr0, grad=gs102, x=xvs102, lr=lr) ~> wr0
dot_product(a=gs102, b=gs102) ~> losss102
xvs103 = [0.7158, 0.1368, 0.0105, 0.6947]
tvs103 = [0, 0, 1, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs103) ~> ps103
vec_sub(a=ps103, b=tvs103) ~> gs103
mat_update_4(mat=wr0, grad=gs103, x=xvs103, lr=lr) ~> wr0
dot_product(a=gs103, b=gs103) ~> losss103
xvs104 = [0.0105, 0.6947, 0.3158, 0.4737]
tvs104 = [0, 0, 1, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs104) ~> ps104
vec_sub(a=ps104, b=tvs104) ~> gs104
mat_update_4(mat=wr0, grad=gs104, x=xvs104, lr=lr) ~> wr0
dot_product(a=gs104, b=gs104) ~> losss104
xvs105 = [0.3158, 0.4737, 0.1053, 0.0105]
tvs105 = [0, 0, 1, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs105) ~> ps105
vec_sub(a=ps105, b=tvs105) ~> gs105
mat_update_4(mat=wr0, grad=gs105, x=xvs105, lr=lr) ~> wr0
dot_product(a=gs105, b=gs105) ~> losss105
xvs106 = [0.1053, 0.0105, 0.9895, 0.3263]
tvs106 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs106) ~> ps106
vec_sub(a=ps106, b=tvs106) ~> gs106
mat_update_4(mat=wr0, grad=gs106, x=xvs106, lr=lr) ~> wr0
dot_product(a=gs106, b=gs106) ~> losss106
xvs107 = [0.9895, 0.3263, 0.0105, 0.8632]
tvs107 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs107) ~> ps107
vec_sub(a=ps107, b=tvs107) ~> gs107
mat_update_4(mat=wr0, grad=gs107, x=xvs107, lr=lr) ~> wr0
dot_product(a=gs107, b=gs107) ~> losss107
xvs108 = [0.0105, 0.8632, 0.7263, 0.6842]
tvs108 = [1, 0, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs108) ~> ps108
vec_sub(a=ps108, b=tvs108) ~> gs108
mat_update_4(mat=wr0, grad=gs108, x=xvs108, lr=lr) ~> wr0
dot_product(a=gs108, b=gs108) ~> losss108
xvs109 = [0.7263, 0.6842, 0.8000, 0.6737]
tvs109 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs109) ~> ps109
vec_sub(a=ps109, b=tvs109) ~> gs109
mat_update_4(mat=wr0, grad=gs109, x=xvs109, lr=lr) ~> wr0
dot_product(a=gs109, b=gs109) ~> losss109
xvs110 = [0.8000, 0.6737, 0.7263, 0.8211]
tvs110 = [1, 0, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs110) ~> ps110
vec_sub(a=ps110, b=tvs110) ~> gs110
mat_update_4(mat=wr0, grad=gs110, x=xvs110, lr=lr) ~> wr0
dot_product(a=gs110, b=gs110) ~> losss110
xvs111 = [0.7263, 0.8211, 0.7158, 0.0000]
tvs111 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs111) ~> ps111
vec_sub(a=ps111, b=tvs111) ~> gs111
mat_update_4(mat=wr0, grad=gs111, x=xvs111, lr=lr) ~> wr0
dot_product(a=gs111, b=gs111) ~> losss111
xvs112 = [0.7158, 0.0000, 0.0105, 0.0105]
tvs112 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs112) ~> ps112
vec_sub(a=ps112, b=tvs112) ~> gs112
mat_update_4(mat=wr0, grad=gs112, x=xvs112, lr=lr) ~> wr0
dot_product(a=gs112, b=gs112) ~> losss112
xvs113 = [0.0105, 0.0105, 0.0105, 0.0105]
tvs113 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs113) ~> ps113
vec_sub(a=ps113, b=tvs113) ~> gs113
mat_update_4(mat=wr0, grad=gs113, x=xvs113, lr=lr) ~> wr0
dot_product(a=gs113, b=gs113) ~> losss113
xvs114 = [0.0105, 0.0105, 0.0105, 0.0105]
tvs114 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs114) ~> ps114
vec_sub(a=ps114, b=tvs114) ~> gs114
mat_update_4(mat=wr0, grad=gs114, x=xvs114, lr=lr) ~> wr0
dot_product(a=gs114, b=gs114) ~> losss114
xvs115 = [0.0105, 0.0105, 0.0105, 0.0105]
tvs115 = [0, 0, 0, 1]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs115) ~> ps115
vec_sub(a=ps115, b=tvs115) ~> gs115
mat_update_4(mat=wr0, grad=gs115, x=xvs115, lr=lr) ~> wr0
dot_product(a=gs115, b=gs115) ~> losss115
xvs116 = [0.0105, 0.0105, 0.8737, 0.8000]
tvs116 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs116) ~> ps116
vec_sub(a=ps116, b=tvs116) ~> gs116
mat_update_4(mat=wr0, grad=gs116, x=xvs116, lr=lr) ~> wr0
dot_product(a=gs116, b=gs116) ~> losss116
xvs117 = [0.8737, 0.8000, 0.7684, 0.7053]
tvs117 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs117) ~> ps117
vec_sub(a=ps117, b=tvs117) ~> gs117
mat_update_4(mat=wr0, grad=gs117, x=xvs117, lr=lr) ~> wr0
dot_product(a=gs117, b=gs117) ~> losss117
xvs118 = [0.7684, 0.7053, 0.7263, 0.6737]
tvs118 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs118) ~> ps118
vec_sub(a=ps118, b=tvs118) ~> gs118
mat_update_4(mat=wr0, grad=gs118, x=xvs118, lr=lr) ~> wr0
dot_product(a=gs118, b=gs118) ~> losss118
xvs119 = [0.7263, 0.6737, 0.6842, 0.8632]
tvs119 = [0, 0, 1, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs119) ~> ps119
vec_sub(a=ps119, b=tvs119) ~> gs119
mat_update_4(mat=wr0, grad=gs119, x=xvs119, lr=lr) ~> wr0
dot_product(a=gs119, b=gs119) ~> losss119
xvs120 = [0.6842, 0.8632, 0.8632, 0.0947]
tvs120 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs120) ~> ps120
vec_sub(a=ps120, b=tvs120) ~> gs120
mat_update_4(mat=wr0, grad=gs120, x=xvs120, lr=lr) ~> wr0
dot_product(a=gs120, b=gs120) ~> losss120
xvs121 = [0.8632, 0.0947, 0.6842, 0.8632]
tvs121 = [0, 0, 1, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs121) ~> ps121
vec_sub(a=ps121, b=tvs121) ~> gs121
mat_update_4(mat=wr0, grad=gs121, x=xvs121, lr=lr) ~> wr0
dot_product(a=gs121, b=gs121) ~> losss121
xvs122 = [0.6842, 0.8632, 0.8632, 0.3158]
tvs122 = [0, 0, 1, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs122) ~> ps122
vec_sub(a=ps122, b=tvs122) ~> gs122
mat_update_4(mat=wr0, grad=gs122, x=xvs122, lr=lr) ~> wr0
dot_product(a=gs122, b=gs122) ~> losss122
xvs123 = [0.8632, 0.3158, 0.3579, 0.1895]
tvs123 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs123) ~> ps123
vec_sub(a=ps123, b=tvs123) ~> gs123
mat_update_4(mat=wr0, grad=gs123, x=xvs123, lr=lr) ~> wr0
dot_product(a=gs123, b=gs123) ~> losss123
xvs124 = [0.3579, 0.1895, 0.1368, 0.0105]
tvs124 = [0, 0, 1, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs124) ~> ps124
vec_sub(a=ps124, b=tvs124) ~> gs124
mat_update_4(mat=wr0, grad=gs124, x=xvs124, lr=lr) ~> wr0
dot_product(a=gs124, b=gs124) ~> losss124
xvs125 = [0.1368, 0.0105, 0.7368, 0.8632]
tvs125 = [0, 0, 0, 1]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs125) ~> ps125
vec_sub(a=ps125, b=tvs125) ~> gs125
mat_update_4(mat=wr0, grad=gs125, x=xvs125, lr=lr) ~> wr0
dot_product(a=gs125, b=gs125) ~> losss125
xvs126 = [0.7368, 0.8632, 0.8316, 0.8105]
tvs126 = [0, 0, 1, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs126) ~> ps126
vec_sub(a=ps126, b=tvs126) ~> gs126
mat_update_4(mat=wr0, grad=gs126, x=xvs126, lr=lr) ~> wr0
dot_product(a=gs126, b=gs126) ~> losss126
xvs127 = [0.8316, 0.8105, 0.3158, 0.7684]
tvs127 = [1, 0, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs127) ~> ps127
vec_sub(a=ps127, b=tvs127) ~> gs127
mat_update_4(mat=wr0, grad=gs127, x=xvs127, lr=lr) ~> wr0
dot_product(a=gs127, b=gs127) ~> losss127
xvs128 = [0.3158, 0.7684, 0.7158, 0.9263]
tvs128 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs128) ~> ps128
vec_sub(a=ps128, b=tvs128) ~> gs128
mat_update_4(mat=wr0, grad=gs128, x=xvs128, lr=lr) ~> wr0
dot_product(a=gs128, b=gs128) ~> losss128
xvs129 = [0.7158, 0.9263, 0.1368, 0.0105]
tvs129 = [1, 0, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs129) ~> ps129
vec_sub(a=ps129, b=tvs129) ~> gs129
mat_update_4(mat=wr0, grad=gs129, x=xvs129, lr=lr) ~> wr0
dot_product(a=gs129, b=gs129) ~> losss129
xvs130 = [0.1368, 0.0105, 0.8842, 0.8316]
tvs130 = [0, 0, 1, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs130) ~> ps130
vec_sub(a=ps130, b=tvs130) ~> gs130
mat_update_4(mat=wr0, grad=gs130, x=xvs130, lr=lr) ~> wr0
dot_product(a=gs130, b=gs130) ~> losss130
xvs131 = [0.8842, 0.8316, 0.3158, 0.8632]
tvs131 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs131) ~> ps131
vec_sub(a=ps131, b=tvs131) ~> gs131
mat_update_4(mat=wr0, grad=gs131, x=xvs131, lr=lr) ~> wr0
dot_product(a=gs131, b=gs131) ~> losss131
xvs132 = [0.3158, 0.8632, 0.7263, 0.6842]
tvs132 = [1, 0, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs132) ~> ps132
vec_sub(a=ps132, b=tvs132) ~> gs132
mat_update_4(mat=wr0, grad=gs132, x=xvs132, lr=lr) ~> wr0
dot_product(a=gs132, b=gs132) ~> losss132
xvs133 = [0.7263, 0.6842, 0.8000, 0.6737]
tvs133 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs133) ~> ps133
vec_sub(a=ps133, b=tvs133) ~> gs133
mat_update_4(mat=wr0, grad=gs133, x=xvs133, lr=lr) ~> wr0
dot_product(a=gs133, b=gs133) ~> losss133
xvs134 = [0.8000, 0.6737, 0.7263, 0.8211]
tvs134 = [1, 0, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs134) ~> ps134
vec_sub(a=ps134, b=tvs134) ~> gs134
mat_update_4(mat=wr0, grad=gs134, x=xvs134, lr=lr) ~> wr0
dot_product(a=gs134, b=gs134) ~> losss134
xvs135 = [0.7263, 0.8211, 0.7158, 0.1053]
tvs135 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs135) ~> ps135
vec_sub(a=ps135, b=tvs135) ~> gs135
mat_update_4(mat=wr0, grad=gs135, x=xvs135, lr=lr) ~> wr0
dot_product(a=gs135, b=gs135) ~> losss135
xvs136 = [0.7158, 0.1053, 0.0105, 0.9895]
tvs136 = [0, 0, 0, 1]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs136) ~> ps136
vec_sub(a=ps136, b=tvs136) ~> gs136
mat_update_4(mat=wr0, grad=gs136, x=xvs136, lr=lr) ~> wr0
dot_product(a=gs136, b=gs136) ~> losss136
xvs137 = [0.0105, 0.9895, 0.3263, 0.0105]
tvs137 = [0, 0, 1, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs137) ~> ps137
vec_sub(a=ps137, b=tvs137) ~> gs137
mat_update_4(mat=wr0, grad=gs137, x=xvs137, lr=lr) ~> wr0
dot_product(a=gs137, b=gs137) ~> losss137
xvs138 = [0.3263, 0.0105, 0.8211, 0.8316]
tvs138 = [0, 0, 0, 1]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs138) ~> ps138
vec_sub(a=ps138, b=tvs138) ~> gs138
mat_update_4(mat=wr0, grad=gs138, x=xvs138, lr=lr) ~> wr0
dot_product(a=gs138, b=gs138) ~> losss138
xvs139 = [0.8211, 0.8316, 0.9158, 0.0000]
tvs139 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs139) ~> ps139
vec_sub(a=ps139, b=tvs139) ~> gs139
mat_update_4(mat=wr0, grad=gs139, x=xvs139, lr=lr) ~> wr0
dot_product(a=gs139, b=gs139) ~> losss139
xvs140 = [0.9158, 0.0000, 0.0105, 0.0105]
tvs140 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs140) ~> ps140
vec_sub(a=ps140, b=tvs140) ~> gs140
mat_update_4(mat=wr0, grad=gs140, x=xvs140, lr=lr) ~> wr0
dot_product(a=gs140, b=gs140) ~> losss140
xvs141 = [0.0105, 0.0105, 0.0105, 0.0105]
tvs141 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs141) ~> ps141
vec_sub(a=ps141, b=tvs141) ~> gs141
mat_update_4(mat=wr0, grad=gs141, x=xvs141, lr=lr) ~> wr0
dot_product(a=gs141, b=gs141) ~> losss141
xvs142 = [0.0105, 0.0105, 0.9789, 0.0000]
tvs142 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs142) ~> ps142
vec_sub(a=ps142, b=tvs142) ~> gs142
mat_update_4(mat=wr0, grad=gs142, x=xvs142, lr=lr) ~> wr0
dot_product(a=gs142, b=gs142) ~> losss142
xvs143 = [0.9789, 0.0000, 0.0105, 0.0105]
tvs143 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs143) ~> ps143
vec_sub(a=ps143, b=tvs143) ~> gs143
mat_update_4(mat=wr0, grad=gs143, x=xvs143, lr=lr) ~> wr0
dot_product(a=gs143, b=gs143) ~> losss143
xvs144 = [0.0105, 0.0105, 0.0105, 0.0105]
tvs144 = [0, 0, 0, 1]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs144) ~> ps144
vec_sub(a=ps144, b=tvs144) ~> gs144
mat_update_4(mat=wr0, grad=gs144, x=xvs144, lr=lr) ~> wr0
dot_product(a=gs144, b=gs144) ~> losss144
xvs145 = [0.0105, 0.0105, 0.8737, 0.8842]
tvs145 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs145) ~> ps145
vec_sub(a=ps145, b=tvs145) ~> gs145
mat_update_4(mat=wr0, grad=gs145, x=xvs145, lr=lr) ~> wr0
dot_product(a=gs145, b=gs145) ~> losss145
xvs146 = [0.8737, 0.8842, 0.6842, 0.8632]
tvs146 = [1, 0, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs146) ~> ps146
vec_sub(a=ps146, b=tvs146) ~> gs146
mat_update_4(mat=wr0, grad=gs146, x=xvs146, lr=lr) ~> wr0
dot_product(a=gs146, b=gs146) ~> losss146
xvs147 = [0.6842, 0.8632, 0.8842, 0.8737]
tvs147 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs147) ~> ps147
vec_sub(a=ps147, b=tvs147) ~> gs147
mat_update_4(mat=wr0, grad=gs147, x=xvs147, lr=lr) ~> wr0
dot_product(a=gs147, b=gs147) ~> losss147
xvs148 = [0.8842, 0.8737, 0.0105, 0.3263]
tvs148 = [0, 0, 0, 1]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs148) ~> ps148
vec_sub(a=ps148, b=tvs148) ~> gs148
mat_update_4(mat=wr0, grad=gs148, x=xvs148, lr=lr) ~> wr0
dot_product(a=gs148, b=gs148) ~> losss148
xvs149 = [0.0105, 0.3263, 0.3263, 0.0105]
tvs149 = [0, 0, 0, 1]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs149) ~> ps149
vec_sub(a=ps149, b=tvs149) ~> gs149
mat_update_4(mat=wr0, grad=gs149, x=xvs149, lr=lr) ~> wr0
dot_product(a=gs149, b=gs149) ~> losss149
xvs150 = [0.3263, 0.0105, 0.8316, 0.8947]
tvs150 = [1, 0, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs150) ~> ps150
vec_sub(a=ps150, b=tvs150) ~> gs150
mat_update_4(mat=wr0, grad=gs150, x=xvs150, lr=lr) ~> wr0
dot_product(a=gs150, b=gs150) ~> losss150
xvs151 = [0.8316, 0.8947, 0.8842, 0.0000]
tvs151 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs151) ~> ps151
vec_sub(a=ps151, b=tvs151) ~> gs151
mat_update_4(mat=wr0, grad=gs151, x=xvs151, lr=lr) ~> wr0
dot_product(a=gs151, b=gs151) ~> losss151
xvs152 = [0.8842, 0.0000, 0.9789, 0.0000]
tvs152 = [1, 0, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs152) ~> ps152
vec_sub(a=ps152, b=tvs152) ~> gs152
mat_update_4(mat=wr0, grad=gs152, x=xvs152, lr=lr) ~> wr0
dot_product(a=gs152, b=gs152) ~> losss152
xvs153 = [0.9789, 0.0000, 0.6316, 0.5579]
tvs153 = [0, 0, 1, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs153) ~> ps153
vec_sub(a=ps153, b=tvs153) ~> gs153
mat_update_4(mat=wr0, grad=gs153, x=xvs153, lr=lr) ~> wr0
dot_product(a=gs153, b=gs153) ~> losss153
xvs154 = [0.6316, 0.5579, 0.1474, 0.6526]
tvs154 = [1, 0, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs154) ~> ps154
vec_sub(a=ps154, b=tvs154) ~> gs154
mat_update_4(mat=wr0, grad=gs154, x=xvs154, lr=lr) ~> wr0
dot_product(a=gs154, b=gs154) ~> losss154
xvs155 = [0.1474, 0.6526, 0.0000, 0.0000]
tvs155 = [1, 0, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs155) ~> ps155
vec_sub(a=ps155, b=tvs155) ~> gs155
mat_update_4(mat=wr0, grad=gs155, x=xvs155, lr=lr) ~> wr0
dot_product(a=gs155, b=gs155) ~> losss155
xvs156 = [0.0000, 0.0000, 0.0000, 0.6316]
tvs156 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs156) ~> ps156
vec_sub(a=ps156, b=tvs156) ~> gs156
mat_update_4(mat=wr0, grad=gs156, x=xvs156, lr=lr) ~> wr0
dot_product(a=gs156, b=gs156) ~> losss156
xvs157 = [0.0000, 0.6316, 0.5579, 0.1474]
tvs157 = [0, 0, 1, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs157) ~> ps157
vec_sub(a=ps157, b=tvs157) ~> gs157
mat_update_4(mat=wr0, grad=gs157, x=xvs157, lr=lr) ~> wr0
dot_product(a=gs157, b=gs157) ~> losss157
xvs158 = [0.5579, 0.1474, 0.6526, 0.0000]
tvs158 = [1, 0, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs158) ~> ps158
vec_sub(a=ps158, b=tvs158) ~> gs158
mat_update_4(mat=wr0, grad=gs158, x=xvs158, lr=lr) ~> wr0
dot_product(a=gs158, b=gs158) ~> losss158
xvs159 = [0.6526, 0.0000, 0.0000, 0.0000]
tvs159 = [0, 0, 1, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs159) ~> ps159
vec_sub(a=ps159, b=tvs159) ~> gs159
mat_update_4(mat=wr0, grad=gs159, x=xvs159, lr=lr) ~> wr0
dot_product(a=gs159, b=gs159) ~> losss159
xvs160 = [0.0000, 0.0000, 0.7368, 0.8947]
tvs160 = [0, 0, 1, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs160) ~> ps160
vec_sub(a=ps160, b=tvs160) ~> gs160
mat_update_4(mat=wr0, grad=gs160, x=xvs160, lr=lr) ~> wr0
dot_product(a=gs160, b=gs160) ~> losss160
xvs161 = [0.7368, 0.8947, 0.8211, 0.7053]
tvs161 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs161) ~> ps161
vec_sub(a=ps161, b=tvs161) ~> gs161
mat_update_4(mat=wr0, grad=gs161, x=xvs161, lr=lr) ~> wr0
dot_product(a=gs161, b=gs161) ~> losss161
xvs162 = [0.8211, 0.7053, 0.0105, 0.8842]
tvs162 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs162) ~> ps162
vec_sub(a=ps162, b=tvs162) ~> gs162
mat_update_4(mat=wr0, grad=gs162, x=xvs162, lr=lr) ~> wr0
dot_product(a=gs162, b=gs162) ~> losss162
xvs163 = [0.0105, 0.8842, 0.6842, 0.7895]
tvs163 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs163) ~> ps163
vec_sub(a=ps163, b=tvs163) ~> gs163
mat_update_4(mat=wr0, grad=gs163, x=xvs163, lr=lr) ~> wr0
dot_product(a=gs163, b=gs163) ~> losss163
xvs164 = [0.6842, 0.7895, 0.7263, 0.0947]
tvs164 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs164) ~> ps164
vec_sub(a=ps164, b=tvs164) ~> gs164
mat_update_4(mat=wr0, grad=gs164, x=xvs164, lr=lr) ~> wr0
dot_product(a=gs164, b=gs164) ~> losss164
xvs165 = [0.7263, 0.0947, 0.6842, 0.8632]
tvs165 = [0, 0, 1, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs165) ~> ps165
vec_sub(a=ps165, b=tvs165) ~> gs165
mat_update_4(mat=wr0, grad=gs165, x=xvs165, lr=lr) ~> wr0
dot_product(a=gs165, b=gs165) ~> losss165
xvs166 = [0.6842, 0.8632, 0.8632, 0.1368]
tvs166 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs166) ~> ps166
vec_sub(a=ps166, b=tvs166) ~> gs166
mat_update_4(mat=wr0, grad=gs166, x=xvs166, lr=lr) ~> wr0
dot_product(a=gs166, b=gs166) ~> losss166
xvs167 = [0.8632, 0.1368, 0.0105, 0.8211]
tvs167 = [0, 0, 1, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs167) ~> ps167
vec_sub(a=ps167, b=tvs167) ~> gs167
mat_update_4(mat=wr0, grad=gs167, x=xvs167, lr=lr) ~> wr0
dot_product(a=gs167, b=gs167) ~> losss167
xvs168 = [0.0105, 0.8211, 0.1053, 0.0105]
tvs168 = [0, 0, 0, 1]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs168) ~> ps168
vec_sub(a=ps168, b=tvs168) ~> gs168
mat_update_4(mat=wr0, grad=gs168, x=xvs168, lr=lr) ~> wr0
dot_product(a=gs168, b=gs168) ~> losss168
xvs169 = [0.1053, 0.0105, 0.9579, 0.0000]
tvs169 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs169) ~> ps169
vec_sub(a=ps169, b=tvs169) ~> gs169
mat_update_4(mat=wr0, grad=gs169, x=xvs169, lr=lr) ~> wr0
dot_product(a=gs169, b=gs169) ~> losss169
xvs170 = [0.9579, 0.0000, 0.0105, 0.0105]
tvs170 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs170) ~> ps170
vec_sub(a=ps170, b=tvs170) ~> gs170
mat_update_4(mat=wr0, grad=gs170, x=xvs170, lr=lr) ~> wr0
dot_product(a=gs170, b=gs170) ~> losss170
xvs171 = [0.0105, 0.0105, 0.0105, 0.0105]
tvs171 = [1, 0, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs171) ~> ps171
vec_sub(a=ps171, b=tvs171) ~> gs171
mat_update_4(mat=wr0, grad=gs171, x=xvs171, lr=lr) ~> wr0
dot_product(a=gs171, b=gs171) ~> losss171
xvs172 = [0.0105, 0.0105, 0.8421, 0.6842]
tvs172 = [0, 0, 0, 1]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs172) ~> ps172
vec_sub(a=ps172, b=tvs172) ~> gs172
mat_update_4(mat=wr0, grad=gs172, x=xvs172, lr=lr) ~> wr0
dot_product(a=gs172, b=gs172) ~> losss172
xvs173 = [0.8421, 0.6842, 0.8737, 0.8842]
tvs173 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs173) ~> ps173
vec_sub(a=ps173, b=tvs173) ~> gs173
mat_update_4(mat=wr0, grad=gs173, x=xvs173, lr=lr) ~> wr0
dot_product(a=gs173, b=gs173) ~> losss173
xvs174 = [0.8737, 0.8842, 0.0947, 0.6842]
tvs174 = [0, 0, 1, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs174) ~> ps174
vec_sub(a=ps174, b=tvs174) ~> gs174
mat_update_4(mat=wr0, grad=gs174, x=xvs174, lr=lr) ~> wr0
dot_product(a=gs174, b=gs174) ~> losss174
xvs175 = [0.0947, 0.6842, 0.8632, 0.8632]
tvs175 = [0, 0, 1, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs175) ~> ps175
vec_sub(a=ps175, b=tvs175) ~> gs175
mat_update_4(mat=wr0, grad=gs175, x=xvs175, lr=lr) ~> wr0
dot_product(a=gs175, b=gs175) ~> losss175
xvs176 = [0.8632, 0.8632, 0.1053, 0.0105]
tvs176 = [0, 0, 1, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs176) ~> ps176
vec_sub(a=ps176, b=tvs176) ~> gs176
mat_update_4(mat=wr0, grad=gs176, x=xvs176, lr=lr) ~> wr0
dot_product(a=gs176, b=gs176) ~> losss176
xvs177 = [0.1053, 0.0105, 0.9895, 0.3263]
tvs177 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs177) ~> ps177
vec_sub(a=ps177, b=tvs177) ~> gs177
mat_update_4(mat=wr0, grad=gs177, x=xvs177, lr=lr) ~> wr0
dot_product(a=gs177, b=gs177) ~> losss177
xvs178 = [0.9895, 0.3263, 0.0105, 0.3579]
tvs178 = [0, 0, 1, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs178) ~> ps178
vec_sub(a=ps178, b=tvs178) ~> gs178
mat_update_4(mat=wr0, grad=gs178, x=xvs178, lr=lr) ~> wr0
dot_product(a=gs178, b=gs178) ~> losss178
xvs179 = [0.0105, 0.3579, 0.1895, 0.0000]
tvs179 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs179) ~> ps179
vec_sub(a=ps179, b=tvs179) ~> gs179
mat_update_4(mat=wr0, grad=gs179, x=xvs179, lr=lr) ~> wr0
dot_product(a=gs179, b=gs179) ~> losss179
xvs180 = [0.1895, 0.0000, 0.0105, 0.0105]
tvs180 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs180) ~> ps180
vec_sub(a=ps180, b=tvs180) ~> gs180
mat_update_4(mat=wr0, grad=gs180, x=xvs180, lr=lr) ~> wr0
dot_product(a=gs180, b=gs180) ~> losss180
xvs181 = [0.0105, 0.0105, 0.0105, 0.0105]
tvs181 = [1, 0, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs181) ~> ps181
vec_sub(a=ps181, b=tvs181) ~> gs181
mat_update_4(mat=wr0, grad=gs181, x=xvs181, lr=lr) ~> wr0
dot_product(a=gs181, b=gs181) ~> losss181
xvs182 = [0.0105, 0.0105, 0.8421, 0.6842]
tvs182 = [0, 0, 0, 1]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs182) ~> ps182
vec_sub(a=ps182, b=tvs182) ~> gs182
mat_update_4(mat=wr0, grad=gs182, x=xvs182, lr=lr) ~> wr0
dot_product(a=gs182, b=gs182) ~> losss182
xvs183 = [0.8421, 0.6842, 0.8737, 0.8842]
tvs183 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs183) ~> ps183
vec_sub(a=ps183, b=tvs183) ~> gs183
mat_update_4(mat=wr0, grad=gs183, x=xvs183, lr=lr) ~> wr0
dot_product(a=gs183, b=gs183) ~> losss183
xvs184 = [0.8737, 0.8842, 0.0947, 0.8211]
tvs184 = [0, 0, 1, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs184) ~> ps184
vec_sub(a=ps184, b=tvs184) ~> gs184
mat_update_4(mat=wr0, grad=gs184, x=xvs184, lr=lr) ~> wr0
dot_product(a=gs184, b=gs184) ~> losss184
xvs185 = [0.0947, 0.8211, 0.1053, 0.0105]
tvs185 = [0, 0, 1, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs185) ~> ps185
vec_sub(a=ps185, b=tvs185) ~> gs185
mat_update_4(mat=wr0, grad=gs185, x=xvs185, lr=lr) ~> wr0
dot_product(a=gs185, b=gs185) ~> losss185
xvs186 = [0.1053, 0.0105, 0.9895, 0.3263]
tvs186 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs186) ~> ps186
vec_sub(a=ps186, b=tvs186) ~> gs186
mat_update_4(mat=wr0, grad=gs186, x=xvs186, lr=lr) ~> wr0
dot_product(a=gs186, b=gs186) ~> losss186
xvs187 = [0.9895, 0.3263, 0.0105, 0.4947]
tvs187 = [1, 0, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs187) ~> ps187
vec_sub(a=ps187, b=tvs187) ~> gs187
mat_update_4(mat=wr0, grad=gs187, x=xvs187, lr=lr) ~> wr0
dot_product(a=gs187, b=gs187) ~> losss187
xvs188 = [0.0105, 0.4947, 0.0000, 0.0105]
tvs188 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs188) ~> ps188
vec_sub(a=ps188, b=tvs188) ~> gs188
mat_update_4(mat=wr0, grad=gs188, x=xvs188, lr=lr) ~> wr0
dot_product(a=gs188, b=gs188) ~> losss188
xvs189 = [0.0000, 0.0105, 0.0105, 0.0105]
tvs189 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs189) ~> ps189
vec_sub(a=ps189, b=tvs189) ~> gs189
mat_update_4(mat=wr0, grad=gs189, x=xvs189, lr=lr) ~> wr0
dot_product(a=gs189, b=gs189) ~> losss189
xvs190 = [0.0105, 0.0105, 0.0105, 0.8737]
tvs190 = [1, 0, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs190) ~> ps190
vec_sub(a=ps190, b=tvs190) ~> gs190
mat_update_4(mat=wr0, grad=gs190, x=xvs190, lr=lr) ~> wr0
dot_product(a=gs190, b=gs190) ~> losss190
xvs191 = [0.0105, 0.8737, 0.8000, 0.7684]
tvs191 = [0, 0, 0, 1]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs191) ~> ps191
vec_sub(a=ps191, b=tvs191) ~> gs191
mat_update_4(mat=wr0, grad=gs191, x=xvs191, lr=lr) ~> wr0
dot_product(a=gs191, b=gs191) ~> losss191
xvs192 = [0.8000, 0.7684, 0.7053, 0.7263]
tvs192 = [1, 0, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs192) ~> ps192
vec_sub(a=ps192, b=tvs192) ~> gs192
mat_update_4(mat=wr0, grad=gs192, x=xvs192, lr=lr) ~> wr0
dot_product(a=gs192, b=gs192) ~> losss192
xvs193 = [0.7053, 0.7263, 0.6737, 0.6842]
tvs193 = [0, 0, 1, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs193) ~> ps193
vec_sub(a=ps193, b=tvs193) ~> gs193
mat_update_4(mat=wr0, grad=gs193, x=xvs193, lr=lr) ~> wr0
dot_product(a=gs193, b=gs193) ~> losss193
xvs194 = [0.6737, 0.6842, 0.8632, 0.8632]
tvs194 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs194) ~> ps194
vec_sub(a=ps194, b=tvs194) ~> gs194
mat_update_4(mat=wr0, grad=gs194, x=xvs194, lr=lr) ~> wr0
dot_product(a=gs194, b=gs194) ~> losss194
xvs195 = [0.8632, 0.8632, 0.0947, 0.6842]
tvs195 = [0, 0, 1, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs195) ~> ps195
vec_sub(a=ps195, b=tvs195) ~> gs195
mat_update_4(mat=wr0, grad=gs195, x=xvs195, lr=lr) ~> wr0
dot_product(a=gs195, b=gs195) ~> losss195
xvs196 = [0.0947, 0.6842, 0.8632, 0.8632]
tvs196 = [0, 0, 1, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs196) ~> ps196
vec_sub(a=ps196, b=tvs196) ~> gs196
mat_update_4(mat=wr0, grad=gs196, x=xvs196, lr=lr) ~> wr0
dot_product(a=gs196, b=gs196) ~> losss196
xvs197 = [0.8632, 0.8632, 0.3158, 0.3579]
tvs197 = [0, 0, 1, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs197) ~> ps197
vec_sub(a=ps197, b=tvs197) ~> gs197
mat_update_4(mat=wr0, grad=gs197, x=xvs197, lr=lr) ~> wr0
dot_product(a=gs197, b=gs197) ~> losss197
xvs198 = [0.3158, 0.3579, 0.1895, 0.1368]
tvs198 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs198) ~> ps198
vec_sub(a=ps198, b=tvs198) ~> gs198
mat_update_4(mat=wr0, grad=gs198, x=xvs198, lr=lr) ~> wr0
dot_product(a=gs198, b=gs198) ~> losss198
xvs199 = [0.1895, 0.1368, 0.0105, 0.7368]
tvs199 = [0, 0, 1, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs199) ~> ps199
vec_sub(a=ps199, b=tvs199) ~> gs199
mat_update_4(mat=wr0, grad=gs199, x=xvs199, lr=lr) ~> wr0
dot_product(a=gs199, b=gs199) ~> losss199
xvs200 = [0.0105, 0.7368, 0.8632, 0.8316]
tvs200 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs200) ~> ps200
vec_sub(a=ps200, b=tvs200) ~> gs200
mat_update_4(mat=wr0, grad=gs200, x=xvs200, lr=lr) ~> wr0
dot_product(a=gs200, b=gs200) ~> losss200
xvs201 = [0.8632, 0.8316, 0.8105, 0.3158]
tvs201 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs201) ~> ps201
vec_sub(a=ps201, b=tvs201) ~> gs201
mat_update_4(mat=wr0, grad=gs201, x=xvs201, lr=lr) ~> wr0
dot_product(a=gs201, b=gs201) ~> losss201
xvs202 = [0.8105, 0.3158, 0.1789, 0.1368]
tvs202 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs202) ~> ps202
vec_sub(a=ps202, b=tvs202) ~> gs202
mat_update_4(mat=wr0, grad=gs202, x=xvs202, lr=lr) ~> wr0
dot_product(a=gs202, b=gs202) ~> losss202
xvs203 = [0.1789, 0.1368, 0.0105, 0.8842]
tvs203 = [0, 0, 0, 1]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs203) ~> ps203
vec_sub(a=ps203, b=tvs203) ~> gs203
mat_update_4(mat=wr0, grad=gs203, x=xvs203, lr=lr) ~> wr0
dot_product(a=gs203, b=gs203) ~> losss203
xvs204 = [0.0105, 0.8842, 0.8316, 0.3158]
tvs204 = [0, 0, 0, 1]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs204) ~> ps204
vec_sub(a=ps204, b=tvs204) ~> gs204
mat_update_4(mat=wr0, grad=gs204, x=xvs204, lr=lr) ~> wr0
dot_product(a=gs204, b=gs204) ~> losss204
xvs205 = [0.8316, 0.3158, 0.4947, 0.1053]
tvs205 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs205) ~> ps205
vec_sub(a=ps205, b=tvs205) ~> gs205
mat_update_4(mat=wr0, grad=gs205, x=xvs205, lr=lr) ~> wr0
dot_product(a=gs205, b=gs205) ~> losss205
xvs206 = [0.4947, 0.1053, 0.0105, 0.9895]
tvs206 = [0, 0, 0, 1]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs206) ~> ps206
vec_sub(a=ps206, b=tvs206) ~> gs206
mat_update_4(mat=wr0, grad=gs206, x=xvs206, lr=lr) ~> wr0
dot_product(a=gs206, b=gs206) ~> losss206
xvs207 = [0.0105, 0.9895, 0.3263, 0.0105]
tvs207 = [0, 0, 0, 1]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs207) ~> ps207
vec_sub(a=ps207, b=tvs207) ~> gs207
mat_update_4(mat=wr0, grad=gs207, x=xvs207, lr=lr) ~> wr0
dot_product(a=gs207, b=gs207) ~> losss207
xvs208 = [0.3263, 0.0105, 0.8316, 0.8947]
tvs208 = [1, 0, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs208) ~> ps208
vec_sub(a=ps208, b=tvs208) ~> gs208
mat_update_4(mat=wr0, grad=gs208, x=xvs208, lr=lr) ~> wr0
dot_product(a=gs208, b=gs208) ~> losss208
xvs209 = [0.8316, 0.8947, 0.8842, 0.0000]
tvs209 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs209) ~> ps209
vec_sub(a=ps209, b=tvs209) ~> gs209
mat_update_4(mat=wr0, grad=gs209, x=xvs209, lr=lr) ~> wr0
dot_product(a=gs209, b=gs209) ~> losss209
xvs210 = [0.8842, 0.0000, 0.9789, 0.0000]
tvs210 = [1, 0, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs210) ~> ps210
vec_sub(a=ps210, b=tvs210) ~> gs210
mat_update_4(mat=wr0, grad=gs210, x=xvs210, lr=lr) ~> wr0
dot_product(a=gs210, b=gs210) ~> losss210
xvs211 = [0.9789, 0.0000, 0.0000, 0.7368]
tvs211 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs211) ~> ps211
vec_sub(a=ps211, b=tvs211) ~> gs211
mat_update_4(mat=wr0, grad=gs211, x=xvs211, lr=lr) ~> wr0
dot_product(a=gs211, b=gs211) ~> losss211
xvs212 = [0.0000, 0.7368, 0.8947, 0.8211]
tvs212 = [0, 0, 0, 1]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs212) ~> ps212
vec_sub(a=ps212, b=tvs212) ~> gs212
mat_update_4(mat=wr0, grad=gs212, x=xvs212, lr=lr) ~> wr0
dot_product(a=gs212, b=gs212) ~> losss212
xvs213 = [0.8947, 0.8211, 0.7053, 0.0105]
tvs213 = [1, 0, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs213) ~> ps213
vec_sub(a=ps213, b=tvs213) ~> gs213
mat_update_4(mat=wr0, grad=gs213, x=xvs213, lr=lr) ~> wr0
dot_product(a=gs213, b=gs213) ~> losss213
xvs214 = [0.7053, 0.0105, 0.7158, 0.8632]
tvs214 = [0, 0, 0, 1]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs214) ~> ps214
vec_sub(a=ps214, b=tvs214) ~> gs214
mat_update_4(mat=wr0, grad=gs214, x=xvs214, lr=lr) ~> wr0
dot_product(a=gs214, b=gs214) ~> losss214
xvs215 = [0.7158, 0.8632, 0.8316, 0.8421]
tvs215 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs215) ~> ps215
vec_sub(a=ps215, b=tvs215) ~> gs215
mat_update_4(mat=wr0, grad=gs215, x=xvs215, lr=lr) ~> wr0
dot_product(a=gs215, b=gs215) ~> losss215
xvs216 = [0.8316, 0.8421, 0.0947, 0.6842]
tvs216 = [0, 0, 1, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs216) ~> ps216
vec_sub(a=ps216, b=tvs216) ~> gs216
mat_update_4(mat=wr0, grad=gs216, x=xvs216, lr=lr) ~> wr0
dot_product(a=gs216, b=gs216) ~> losss216
xvs217 = [0.0947, 0.6842, 0.8632, 0.8632]
tvs217 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs217) ~> ps217
vec_sub(a=ps217, b=tvs217) ~> gs217
mat_update_4(mat=wr0, grad=gs217, x=xvs217, lr=lr) ~> wr0
dot_product(a=gs217, b=gs217) ~> losss217
xvs218 = [0.8632, 0.8632, 0.1368, 0.0105]
tvs218 = [0, 0, 1, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs218) ~> ps218
vec_sub(a=ps218, b=tvs218) ~> gs218
mat_update_4(mat=wr0, grad=gs218, x=xvs218, lr=lr) ~> wr0
dot_product(a=gs218, b=gs218) ~> losss218
xvs219 = [0.1368, 0.0105, 0.8211, 0.1053]
tvs219 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs219) ~> ps219
vec_sub(a=ps219, b=tvs219) ~> gs219
mat_update_4(mat=wr0, grad=gs219, x=xvs219, lr=lr) ~> wr0
dot_product(a=gs219, b=gs219) ~> losss219
xvs220 = [0.8211, 0.1053, 0.0105, 0.9579]
tvs220 = [1, 0, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs220) ~> ps220
vec_sub(a=ps220, b=tvs220) ~> gs220
mat_update_4(mat=wr0, grad=gs220, x=xvs220, lr=lr) ~> wr0
dot_product(a=gs220, b=gs220) ~> losss220
xvs221 = [0.0105, 0.9579, 0.0000, 0.0105]
tvs221 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs221) ~> ps221
vec_sub(a=ps221, b=tvs221) ~> gs221
mat_update_4(mat=wr0, grad=gs221, x=xvs221, lr=lr) ~> wr0
dot_product(a=gs221, b=gs221) ~> losss221
xvs222 = [0.0000, 0.0105, 0.0105, 0.0105]
tvs222 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs222) ~> ps222
vec_sub(a=ps222, b=tvs222) ~> gs222
mat_update_4(mat=wr0, grad=gs222, x=xvs222, lr=lr) ~> wr0
dot_product(a=gs222, b=gs222) ~> losss222
xvs223 = [0.0105, 0.0105, 0.0105, 0.8421]
tvs223 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs223) ~> ps223
vec_sub(a=ps223, b=tvs223) ~> gs223
mat_update_4(mat=wr0, grad=gs223, x=xvs223, lr=lr) ~> wr0
dot_product(a=gs223, b=gs223) ~> losss223
xvs224 = [0.0105, 0.8421, 0.6842, 0.8737]
tvs224 = [1, 0, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs224) ~> ps224
vec_sub(a=ps224, b=tvs224) ~> gs224
mat_update_4(mat=wr0, grad=gs224, x=xvs224, lr=lr) ~> wr0
dot_product(a=gs224, b=gs224) ~> losss224
xvs225 = [0.6842, 0.8737, 0.8842, 0.0947]
tvs225 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs225) ~> ps225
vec_sub(a=ps225, b=tvs225) ~> gs225
mat_update_4(mat=wr0, grad=gs225, x=xvs225, lr=lr) ~> wr0
dot_product(a=gs225, b=gs225) ~> losss225
xvs226 = [0.8842, 0.0947, 0.6842, 0.8632]
tvs226 = [0, 0, 1, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs226) ~> ps226
vec_sub(a=ps226, b=tvs226) ~> gs226
mat_update_4(mat=wr0, grad=gs226, x=xvs226, lr=lr) ~> wr0
dot_product(a=gs226, b=gs226) ~> losss226
xvs227 = [0.6842, 0.8632, 0.8632, 0.1053]
tvs227 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs227) ~> ps227
vec_sub(a=ps227, b=tvs227) ~> gs227
mat_update_4(mat=wr0, grad=gs227, x=xvs227, lr=lr) ~> wr0
dot_product(a=gs227, b=gs227) ~> losss227
xvs228 = [0.8632, 0.1053, 0.0105, 0.9895]
tvs228 = [0, 0, 0, 1]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs228) ~> ps228
vec_sub(a=ps228, b=tvs228) ~> gs228
mat_update_4(mat=wr0, grad=gs228, x=xvs228, lr=lr) ~> wr0
dot_product(a=gs228, b=gs228) ~> losss228
xvs229 = [0.0105, 0.9895, 0.3263, 0.0105]
tvs229 = [0, 0, 1, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs229) ~> ps229
vec_sub(a=ps229, b=tvs229) ~> gs229
mat_update_4(mat=wr0, grad=gs229, x=xvs229, lr=lr) ~> wr0
dot_product(a=gs229, b=gs229) ~> losss229
xvs230 = [0.3263, 0.0105, 0.3579, 0.1895]
tvs230 = [1, 0, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs230) ~> ps230
vec_sub(a=ps230, b=tvs230) ~> gs230
mat_update_4(mat=wr0, grad=gs230, x=xvs230, lr=lr) ~> wr0
dot_product(a=gs230, b=gs230) ~> losss230
xvs231 = [0.3579, 0.1895, 0.0000, 0.0105]
tvs231 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs231) ~> ps231
vec_sub(a=ps231, b=tvs231) ~> gs231
mat_update_4(mat=wr0, grad=gs231, x=xvs231, lr=lr) ~> wr0
dot_product(a=gs231, b=gs231) ~> losss231
xvs232 = [0.0000, 0.0105, 0.0105, 0.0105]
tvs232 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs232) ~> ps232
vec_sub(a=ps232, b=tvs232) ~> gs232
mat_update_4(mat=wr0, grad=gs232, x=xvs232, lr=lr) ~> wr0
dot_product(a=gs232, b=gs232) ~> losss232
xvs233 = [0.0105, 0.0105, 0.0105, 0.8421]
tvs233 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs233) ~> ps233
vec_sub(a=ps233, b=tvs233) ~> gs233
mat_update_4(mat=wr0, grad=gs233, x=xvs233, lr=lr) ~> wr0
dot_product(a=gs233, b=gs233) ~> losss233
xvs234 = [0.0105, 0.8421, 0.6842, 0.8737]
tvs234 = [1, 0, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs234) ~> ps234
vec_sub(a=ps234, b=tvs234) ~> gs234
mat_update_4(mat=wr0, grad=gs234, x=xvs234, lr=lr) ~> wr0
dot_product(a=gs234, b=gs234) ~> losss234
xvs235 = [0.6842, 0.8737, 0.8842, 0.0947]
tvs235 = [0, 0, 1, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs235) ~> ps235
vec_sub(a=ps235, b=tvs235) ~> gs235
mat_update_4(mat=wr0, grad=gs235, x=xvs235, lr=lr) ~> wr0
dot_product(a=gs235, b=gs235) ~> losss235
xvs236 = [0.8842, 0.0947, 0.8211, 0.1053]
tvs236 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs236) ~> ps236
vec_sub(a=ps236, b=tvs236) ~> gs236
mat_update_4(mat=wr0, grad=gs236, x=xvs236, lr=lr) ~> wr0
dot_product(a=gs236, b=gs236) ~> losss236
xvs237 = [0.8211, 0.1053, 0.0105, 0.9895]
tvs237 = [0, 0, 0, 1]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs237) ~> ps237
vec_sub(a=ps237, b=tvs237) ~> gs237
mat_update_4(mat=wr0, grad=gs237, x=xvs237, lr=lr) ~> wr0
dot_product(a=gs237, b=gs237) ~> losss237
xvs238 = [0.0105, 0.9895, 0.3263, 0.0105]
tvs238 = [0, 0, 0, 1]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs238) ~> ps238
vec_sub(a=ps238, b=tvs238) ~> gs238
mat_update_4(mat=wr0, grad=gs238, x=xvs238, lr=lr) ~> wr0
dot_product(a=gs238, b=gs238) ~> losss238
xvs239 = [0.3263, 0.0105, 0.4947, 0.0000]
tvs239 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs239) ~> ps239
vec_sub(a=ps239, b=tvs239) ~> gs239
mat_update_4(mat=wr0, grad=gs239, x=xvs239, lr=lr) ~> wr0
dot_product(a=gs239, b=gs239) ~> losss239
xvs240 = [0.4947, 0.0000, 0.0105, 0.0105]
tvs240 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs240) ~> ps240
vec_sub(a=ps240, b=tvs240) ~> gs240
mat_update_4(mat=wr0, grad=gs240, x=xvs240, lr=lr) ~> wr0
dot_product(a=gs240, b=gs240) ~> losss240
xvs241 = [0.0105, 0.0105, 0.0105, 0.0105]
tvs241 = [1, 0, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs241) ~> ps241
vec_sub(a=ps241, b=tvs241) ~> gs241
mat_update_4(mat=wr0, grad=gs241, x=xvs241, lr=lr) ~> wr0
dot_product(a=gs241, b=gs241) ~> losss241
xvs242 = [0.0105, 0.0105, 0.8000, 0.7263]
tvs242 = [0, 0, 1, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs242) ~> ps242
vec_sub(a=ps242, b=tvs242) ~> gs242
mat_update_4(mat=wr0, grad=gs242, x=xvs242, lr=lr) ~> wr0
dot_product(a=gs242, b=gs242) ~> losss242
xvs243 = [0.8000, 0.7263, 0.8211, 0.0947]
tvs243 = [0, 0, 1, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs243) ~> ps243
vec_sub(a=ps243, b=tvs243) ~> gs243
mat_update_4(mat=wr0, grad=gs243, x=xvs243, lr=lr) ~> wr0
dot_product(a=gs243, b=gs243) ~> losss243
xvs244 = [0.8211, 0.0947, 0.9053, 0.6842]
tvs244 = [1, 0, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs244) ~> ps244
vec_sub(a=ps244, b=tvs244) ~> gs244
mat_update_4(mat=wr0, grad=gs244, x=xvs244, lr=lr) ~> wr0
dot_product(a=gs244, b=gs244) ~> losss244
xvs245 = [0.9053, 0.6842, 0.8000, 0.3158]
tvs245 = [0, 0, 1, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs245) ~> ps245
vec_sub(a=ps245, b=tvs245) ~> gs245
mat_update_4(mat=wr0, grad=gs245, x=xvs245, lr=lr) ~> wr0
dot_product(a=gs245, b=gs245) ~> losss245
xvs246 = [0.8000, 0.3158, 0.3579, 0.1895]
tvs246 = [0, 0, 1, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs246) ~> ps246
vec_sub(a=ps246, b=tvs246) ~> gs246
mat_update_4(mat=wr0, grad=gs246, x=xvs246, lr=lr) ~> wr0
dot_product(a=gs246, b=gs246) ~> losss246
xvs247 = [0.3579, 0.1895, 0.1053, 0.0105]
tvs247 = [0, 0, 1, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs247) ~> ps247
vec_sub(a=ps247, b=tvs247) ~> gs247
mat_update_4(mat=wr0, grad=gs247, x=xvs247, lr=lr) ~> wr0
dot_product(a=gs247, b=gs247) ~> losss247
xvs248 = [0.1053, 0.0105, 0.9895, 0.3263]
tvs248 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs248) ~> ps248
vec_sub(a=ps248, b=tvs248) ~> gs248
mat_update_4(mat=wr0, grad=gs248, x=xvs248, lr=lr) ~> wr0
dot_product(a=gs248, b=gs248) ~> losss248
xvs249 = [0.9895, 0.3263, 0.0105, 0.4737]
tvs249 = [1, 0, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs249) ~> ps249
vec_sub(a=ps249, b=tvs249) ~> gs249
mat_update_4(mat=wr0, grad=gs249, x=xvs249, lr=lr) ~> wr0
dot_product(a=gs249, b=gs249) ~> losss249
xvs250 = [0.0105, 0.4737, 0.0000, 0.0105]
tvs250 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs250) ~> ps250
vec_sub(a=ps250, b=tvs250) ~> gs250
mat_update_4(mat=wr0, grad=gs250, x=xvs250, lr=lr) ~> wr0
dot_product(a=gs250, b=gs250) ~> losss250
xvs251 = [0.0000, 0.0105, 0.0105, 0.0105]
tvs251 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs251) ~> ps251
vec_sub(a=ps251, b=tvs251) ~> gs251
mat_update_4(mat=wr0, grad=gs251, x=xvs251, lr=lr) ~> wr0
dot_product(a=gs251, b=gs251) ~> losss251
xvs252 = [0.0105, 0.0105, 0.0105, 0.8737]
tvs252 = [1, 0, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs252) ~> ps252
vec_sub(a=ps252, b=tvs252) ~> gs252
mat_update_4(mat=wr0, grad=gs252, x=xvs252, lr=lr) ~> wr0
dot_product(a=gs252, b=gs252) ~> losss252
xvs253 = [0.0105, 0.8737, 0.8000, 0.7684]
tvs253 = [0, 0, 0, 1]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs253) ~> ps253
vec_sub(a=ps253, b=tvs253) ~> gs253
mat_update_4(mat=wr0, grad=gs253, x=xvs253, lr=lr) ~> wr0
dot_product(a=gs253, b=gs253) ~> losss253
xvs254 = [0.8000, 0.7684, 0.7053, 0.7263]
tvs254 = [1, 0, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs254) ~> ps254
vec_sub(a=ps254, b=tvs254) ~> gs254
mat_update_4(mat=wr0, grad=gs254, x=xvs254, lr=lr) ~> wr0
dot_product(a=gs254, b=gs254) ~> losss254
xvs255 = [0.7053, 0.7263, 0.6737, 0.6842]
tvs255 = [0, 0, 1, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs255) ~> ps255
vec_sub(a=ps255, b=tvs255) ~> gs255
mat_update_4(mat=wr0, grad=gs255, x=xvs255, lr=lr) ~> wr0
dot_product(a=gs255, b=gs255) ~> losss255
xvs256 = [0.6737, 0.6842, 0.8632, 0.8632]
tvs256 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs256) ~> ps256
vec_sub(a=ps256, b=tvs256) ~> gs256
mat_update_4(mat=wr0, grad=gs256, x=xvs256, lr=lr) ~> wr0
dot_product(a=gs256, b=gs256) ~> losss256
xvs257 = [0.8632, 0.8632, 0.0947, 0.6842]
tvs257 = [0, 0, 1, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs257) ~> ps257
vec_sub(a=ps257, b=tvs257) ~> gs257
mat_update_4(mat=wr0, grad=gs257, x=xvs257, lr=lr) ~> wr0
dot_product(a=gs257, b=gs257) ~> losss257
xvs258 = [0.0947, 0.6842, 0.8632, 0.8632]
tvs258 = [0, 0, 1, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs258) ~> ps258
vec_sub(a=ps258, b=tvs258) ~> gs258
mat_update_4(mat=wr0, grad=gs258, x=xvs258, lr=lr) ~> wr0
dot_product(a=gs258, b=gs258) ~> losss258
xvs259 = [0.8632, 0.8632, 0.3158, 0.3579]
tvs259 = [0, 0, 1, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs259) ~> ps259
vec_sub(a=ps259, b=tvs259) ~> gs259
mat_update_4(mat=wr0, grad=gs259, x=xvs259, lr=lr) ~> wr0
dot_product(a=gs259, b=gs259) ~> losss259
xvs260 = [0.3158, 0.3579, 0.1895, 0.1368]
tvs260 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs260) ~> ps260
vec_sub(a=ps260, b=tvs260) ~> gs260
mat_update_4(mat=wr0, grad=gs260, x=xvs260, lr=lr) ~> wr0
dot_product(a=gs260, b=gs260) ~> losss260
xvs261 = [0.1895, 0.1368, 0.0105, 0.7368]
tvs261 = [0, 0, 1, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs261) ~> ps261
vec_sub(a=ps261, b=tvs261) ~> gs261
mat_update_4(mat=wr0, grad=gs261, x=xvs261, lr=lr) ~> wr0
dot_product(a=gs261, b=gs261) ~> losss261
xvs262 = [0.0105, 0.7368, 0.8632, 0.8316]
tvs262 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs262) ~> ps262
vec_sub(a=ps262, b=tvs262) ~> gs262
mat_update_4(mat=wr0, grad=gs262, x=xvs262, lr=lr) ~> wr0
dot_product(a=gs262, b=gs262) ~> losss262
xvs263 = [0.8632, 0.8316, 0.8105, 0.3158]
tvs263 = [0, 0, 0, 1]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs263) ~> ps263
vec_sub(a=ps263, b=tvs263) ~> gs263
mat_update_4(mat=wr0, grad=gs263, x=xvs263, lr=lr) ~> wr0
dot_product(a=gs263, b=gs263) ~> losss263
xvs264 = [0.8105, 0.3158, 0.4947, 0.1368]
tvs264 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs264) ~> ps264
vec_sub(a=ps264, b=tvs264) ~> gs264
mat_update_4(mat=wr0, grad=gs264, x=xvs264, lr=lr) ~> wr0
dot_product(a=gs264, b=gs264) ~> losss264
xvs265 = [0.4947, 0.1368, 0.0105, 0.8842]
tvs265 = [0, 0, 0, 1]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs265) ~> ps265
vec_sub(a=ps265, b=tvs265) ~> gs265
mat_update_4(mat=wr0, grad=gs265, x=xvs265, lr=lr) ~> wr0
dot_product(a=gs265, b=gs265) ~> losss265
xvs266 = [0.0105, 0.8842, 0.8316, 0.3158]
tvs266 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs266) ~> ps266
vec_sub(a=ps266, b=tvs266) ~> gs266
mat_update_4(mat=wr0, grad=gs266, x=xvs266, lr=lr) ~> wr0
dot_product(a=gs266, b=gs266) ~> losss266
xvs267 = [0.8316, 0.3158, 0.4737, 0.1053]
tvs267 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs267) ~> ps267
vec_sub(a=ps267, b=tvs267) ~> gs267
mat_update_4(mat=wr0, grad=gs267, x=xvs267, lr=lr) ~> wr0
dot_product(a=gs267, b=gs267) ~> losss267
xvs268 = [0.4737, 0.1053, 0.0105, 0.9895]
tvs268 = [0, 0, 0, 1]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs268) ~> ps268
vec_sub(a=ps268, b=tvs268) ~> gs268
mat_update_4(mat=wr0, grad=gs268, x=xvs268, lr=lr) ~> wr0
dot_product(a=gs268, b=gs268) ~> losss268
xvs269 = [0.0105, 0.9895, 0.3263, 0.0105]
tvs269 = [0, 0, 0, 1]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs269) ~> ps269
vec_sub(a=ps269, b=tvs269) ~> gs269
mat_update_4(mat=wr0, grad=gs269, x=xvs269, lr=lr) ~> wr0
dot_product(a=gs269, b=gs269) ~> losss269
xvs270 = [0.3263, 0.0105, 0.8316, 0.8947]
tvs270 = [1, 0, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs270) ~> ps270
vec_sub(a=ps270, b=tvs270) ~> gs270
mat_update_4(mat=wr0, grad=gs270, x=xvs270, lr=lr) ~> wr0
dot_product(a=gs270, b=gs270) ~> losss270
xvs271 = [0.8316, 0.8947, 0.8842, 0.0000]
tvs271 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs271) ~> ps271
vec_sub(a=ps271, b=tvs271) ~> gs271
mat_update_4(mat=wr0, grad=gs271, x=xvs271, lr=lr) ~> wr0
dot_product(a=gs271, b=gs271) ~> losss271
xvs272 = [0.8842, 0.0000, 0.9789, 0.0000]
tvs272 = [1, 0, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs272) ~> ps272
vec_sub(a=ps272, b=tvs272) ~> gs272
mat_update_4(mat=wr0, grad=gs272, x=xvs272, lr=lr) ~> wr0
dot_product(a=gs272, b=gs272) ~> losss272
xvs273 = [0.9789, 0.0000, 0.0000, 0.7368]
tvs273 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs273) ~> ps273
vec_sub(a=ps273, b=tvs273) ~> gs273
mat_update_4(mat=wr0, grad=gs273, x=xvs273, lr=lr) ~> wr0
dot_product(a=gs273, b=gs273) ~> losss273
xvs274 = [0.0000, 0.7368, 0.8947, 0.8211]
tvs274 = [0, 0, 0, 1]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs274) ~> ps274
vec_sub(a=ps274, b=tvs274) ~> gs274
mat_update_4(mat=wr0, grad=gs274, x=xvs274, lr=lr) ~> wr0
dot_product(a=gs274, b=gs274) ~> losss274
xvs275 = [0.8947, 0.8211, 0.7053, 0.0105]
tvs275 = [0, 0, 1, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs275) ~> ps275
vec_sub(a=ps275, b=tvs275) ~> gs275
mat_update_4(mat=wr0, grad=gs275, x=xvs275, lr=lr) ~> wr0
dot_product(a=gs275, b=gs275) ~> losss275
xvs276 = [0.7053, 0.0105, 0.9474, 0.7684]
tvs276 = [1, 0, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs276) ~> ps276
vec_sub(a=ps276, b=tvs276) ~> gs276
mat_update_4(mat=wr0, grad=gs276, x=xvs276, lr=lr) ~> wr0
dot_product(a=gs276, b=gs276) ~> losss276
xvs277 = [0.9474, 0.7684, 0.8421, 0.6737]
tvs277 = [0, 0, 0, 1]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs277) ~> ps277
vec_sub(a=ps277, b=tvs277) ~> gs277
mat_update_4(mat=wr0, grad=gs277, x=xvs277, lr=lr) ~> wr0
dot_product(a=gs277, b=gs277) ~> losss277
xvs278 = [0.8421, 0.6737, 0.9158, 0.7684]
tvs278 = [1, 0, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs278) ~> ps278
vec_sub(a=ps278, b=tvs278) ~> gs278
mat_update_4(mat=wr0, grad=gs278, x=xvs278, lr=lr) ~> wr0
dot_product(a=gs278, b=gs278) ~> losss278
xvs279 = [0.9158, 0.7684, 0.8842, 0.7579]
tvs279 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs279) ~> ps279
vec_sub(a=ps279, b=tvs279) ~> gs279
mat_update_4(mat=wr0, grad=gs279, x=xvs279, lr=lr) ~> wr0
dot_product(a=gs279, b=gs279) ~> losss279
xvs280 = [0.8842, 0.7579, 0.0947, 0.6842]
tvs280 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs280) ~> ps280
vec_sub(a=ps280, b=tvs280) ~> gs280
mat_update_4(mat=wr0, grad=gs280, x=xvs280, lr=lr) ~> wr0
dot_product(a=gs280, b=gs280) ~> losss280
xvs281 = [0.0947, 0.6842, 0.1368, 0.0105]
tvs281 = [0, 0, 1, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs281) ~> ps281
vec_sub(a=ps281, b=tvs281) ~> gs281
mat_update_4(mat=wr0, grad=gs281, x=xvs281, lr=lr) ~> wr0
dot_product(a=gs281, b=gs281) ~> losss281
xvs282 = [0.1368, 0.0105, 0.6947, 0.1053]
tvs282 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs282) ~> ps282
vec_sub(a=ps282, b=tvs282) ~> gs282
mat_update_4(mat=wr0, grad=gs282, x=xvs282, lr=lr) ~> wr0
dot_product(a=gs282, b=gs282) ~> losss282
xvs283 = [0.6947, 0.1053, 0.0105, 0.9579]
tvs283 = [1, 0, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs283) ~> ps283
vec_sub(a=ps283, b=tvs283) ~> gs283
mat_update_4(mat=wr0, grad=gs283, x=xvs283, lr=lr) ~> wr0
dot_product(a=gs283, b=gs283) ~> losss283
xvs284 = [0.0105, 0.9579, 0.0000, 0.0105]
tvs284 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs284) ~> ps284
vec_sub(a=ps284, b=tvs284) ~> gs284
mat_update_4(mat=wr0, grad=gs284, x=xvs284, lr=lr) ~> wr0
dot_product(a=gs284, b=gs284) ~> losss284
xvs285 = [0.0000, 0.0105, 0.0105, 0.0105]
tvs285 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs285) ~> ps285
vec_sub(a=ps285, b=tvs285) ~> gs285
mat_update_4(mat=wr0, grad=gs285, x=xvs285, lr=lr) ~> wr0
dot_product(a=gs285, b=gs285) ~> losss285
xvs286 = [0.0105, 0.0105, 0.0105, 0.8421]
tvs286 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs286) ~> ps286
vec_sub(a=ps286, b=tvs286) ~> gs286
mat_update_4(mat=wr0, grad=gs286, x=xvs286, lr=lr) ~> wr0
dot_product(a=gs286, b=gs286) ~> losss286
xvs287 = [0.0105, 0.8421, 0.6842, 0.8737]
tvs287 = [1, 0, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs287) ~> ps287
vec_sub(a=ps287, b=tvs287) ~> gs287
mat_update_4(mat=wr0, grad=gs287, x=xvs287, lr=lr) ~> wr0
dot_product(a=gs287, b=gs287) ~> losss287
xvs288 = [0.6842, 0.8737, 0.8842, 0.0947]
tvs288 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs288) ~> ps288
vec_sub(a=ps288, b=tvs288) ~> gs288
mat_update_4(mat=wr0, grad=gs288, x=xvs288, lr=lr) ~> wr0
dot_product(a=gs288, b=gs288) ~> losss288
xvs289 = [0.8842, 0.0947, 0.6842, 0.1053]
tvs289 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs289) ~> ps289
vec_sub(a=ps289, b=tvs289) ~> gs289
mat_update_4(mat=wr0, grad=gs289, x=xvs289, lr=lr) ~> wr0
dot_product(a=gs289, b=gs289) ~> losss289
xvs290 = [0.6842, 0.1053, 0.0105, 0.9895]
tvs290 = [0, 0, 0, 1]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs290) ~> ps290
vec_sub(a=ps290, b=tvs290) ~> gs290
mat_update_4(mat=wr0, grad=gs290, x=xvs290, lr=lr) ~> wr0
dot_product(a=gs290, b=gs290) ~> losss290
xvs291 = [0.0105, 0.9895, 0.3263, 0.0105]
tvs291 = [0, 0, 1, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs291) ~> ps291
vec_sub(a=ps291, b=tvs291) ~> gs291
mat_update_4(mat=wr0, grad=gs291, x=xvs291, lr=lr) ~> wr0
dot_product(a=gs291, b=gs291) ~> losss291
xvs292 = [0.3263, 0.0105, 0.3579, 0.1895]
tvs292 = [1, 0, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs292) ~> ps292
vec_sub(a=ps292, b=tvs292) ~> gs292
mat_update_4(mat=wr0, grad=gs292, x=xvs292, lr=lr) ~> wr0
dot_product(a=gs292, b=gs292) ~> losss292
xvs293 = [0.3579, 0.1895, 0.0000, 0.0105]
tvs293 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs293) ~> ps293
vec_sub(a=ps293, b=tvs293) ~> gs293
mat_update_4(mat=wr0, grad=gs293, x=xvs293, lr=lr) ~> wr0
dot_product(a=gs293, b=gs293) ~> losss293
xvs294 = [0.0000, 0.0105, 0.0105, 0.0105]
tvs294 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs294) ~> ps294
vec_sub(a=ps294, b=tvs294) ~> gs294
mat_update_4(mat=wr0, grad=gs294, x=xvs294, lr=lr) ~> wr0
dot_product(a=gs294, b=gs294) ~> losss294
xvs295 = [0.0105, 0.0105, 0.0105, 0.8421]
tvs295 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs295) ~> ps295
vec_sub(a=ps295, b=tvs295) ~> gs295
mat_update_4(mat=wr0, grad=gs295, x=xvs295, lr=lr) ~> wr0
dot_product(a=gs295, b=gs295) ~> losss295
xvs296 = [0.0105, 0.8421, 0.6842, 0.8737]
tvs296 = [1, 0, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs296) ~> ps296
vec_sub(a=ps296, b=tvs296) ~> gs296
mat_update_4(mat=wr0, grad=gs296, x=xvs296, lr=lr) ~> wr0
dot_product(a=gs296, b=gs296) ~> losss296
xvs297 = [0.6842, 0.8737, 0.8842, 0.0947]
tvs297 = [0, 0, 1, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs297) ~> ps297
vec_sub(a=ps297, b=tvs297) ~> gs297
mat_update_4(mat=wr0, grad=gs297, x=xvs297, lr=lr) ~> wr0
dot_product(a=gs297, b=gs297) ~> losss297
xvs298 = [0.8842, 0.0947, 0.6947, 0.1053]
tvs298 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs298) ~> ps298
vec_sub(a=ps298, b=tvs298) ~> gs298
mat_update_4(mat=wr0, grad=gs298, x=xvs298, lr=lr) ~> wr0
dot_product(a=gs298, b=gs298) ~> losss298
xvs299 = [0.6947, 0.1053, 0.0105, 0.9895]
tvs299 = [0, 0, 0, 1]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs299) ~> ps299
vec_sub(a=ps299, b=tvs299) ~> gs299
mat_update_4(mat=wr0, grad=gs299, x=xvs299, lr=lr) ~> wr0
dot_product(a=gs299, b=gs299) ~> losss299
xvs300 = [0.0105, 0.9895, 0.3263, 0.0105]
tvs300 = [0, 0, 1, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs300) ~> ps300
vec_sub(a=ps300, b=tvs300) ~> gs300
mat_update_4(mat=wr0, grad=gs300, x=xvs300, lr=lr) ~> wr0
dot_product(a=gs300, b=gs300) ~> losss300
xvs301 = [0.3263, 0.0105, 0.3579, 0.2000]
tvs301 = [1, 0, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs301) ~> ps301
vec_sub(a=ps301, b=tvs301) ~> gs301
mat_update_4(mat=wr0, grad=gs301, x=xvs301, lr=lr) ~> wr0
dot_product(a=gs301, b=gs301) ~> losss301
xvs302 = [0.3579, 0.2000, 0.0000, 0.0105]
tvs302 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs302) ~> ps302
vec_sub(a=ps302, b=tvs302) ~> gs302
mat_update_4(mat=wr0, grad=gs302, x=xvs302, lr=lr) ~> wr0
dot_product(a=gs302, b=gs302) ~> losss302
xvs303 = [0.0000, 0.0105, 0.0105, 0.0105]
tvs303 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs303) ~> ps303
vec_sub(a=ps303, b=tvs303) ~> gs303
mat_update_4(mat=wr0, grad=gs303, x=xvs303, lr=lr) ~> wr0
dot_product(a=gs303, b=gs303) ~> losss303
xvs304 = [0.0105, 0.0105, 0.0105, 0.8000]
tvs304 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs304) ~> ps304
vec_sub(a=ps304, b=tvs304) ~> gs304
mat_update_4(mat=wr0, grad=gs304, x=xvs304, lr=lr) ~> wr0
dot_product(a=gs304, b=gs304) ~> losss304
xvs305 = [0.0105, 0.8000, 0.7263, 0.8211]
tvs305 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs305) ~> ps305
vec_sub(a=ps305, b=tvs305) ~> gs305
mat_update_4(mat=wr0, grad=gs305, x=xvs305, lr=lr) ~> wr0
dot_product(a=gs305, b=gs305) ~> losss305
xvs306 = [0.7263, 0.8211, 0.0947, 0.9053]
tvs306 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs306) ~> ps306
vec_sub(a=ps306, b=tvs306) ~> gs306
mat_update_4(mat=wr0, grad=gs306, x=xvs306, lr=lr) ~> wr0
dot_product(a=gs306, b=gs306) ~> losss306
xvs307 = [0.0947, 0.9053, 0.6842, 0.8000]
tvs307 = [0, 0, 1, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs307) ~> ps307
vec_sub(a=ps307, b=tvs307) ~> gs307
mat_update_4(mat=wr0, grad=gs307, x=xvs307, lr=lr) ~> wr0
dot_product(a=gs307, b=gs307) ~> losss307
xvs308 = [0.6842, 0.8000, 0.3158, 0.3579]
tvs308 = [0, 0, 1, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs308) ~> ps308
vec_sub(a=ps308, b=tvs308) ~> gs308
mat_update_4(mat=wr0, grad=gs308, x=xvs308, lr=lr) ~> wr0
dot_product(a=gs308, b=gs308) ~> losss308
xvs309 = [0.3158, 0.3579, 0.1895, 0.1053]
tvs309 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs309) ~> ps309
vec_sub(a=ps309, b=tvs309) ~> gs309
mat_update_4(mat=wr0, grad=gs309, x=xvs309, lr=lr) ~> wr0
dot_product(a=gs309, b=gs309) ~> losss309
xvs310 = [0.1895, 0.1053, 0.0105, 0.9895]
tvs310 = [0, 0, 0, 1]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs310) ~> ps310
vec_sub(a=ps310, b=tvs310) ~> gs310
mat_update_4(mat=wr0, grad=gs310, x=xvs310, lr=lr) ~> wr0
dot_product(a=gs310, b=gs310) ~> losss310
xvs311 = [0.0105, 0.9895, 0.3263, 0.0105]
tvs311 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs311) ~> ps311
vec_sub(a=ps311, b=tvs311) ~> gs311
mat_update_4(mat=wr0, grad=gs311, x=xvs311, lr=lr) ~> wr0
dot_product(a=gs311, b=gs311) ~> losss311
xvs312 = [0.3263, 0.0105, 0.4737, 0.1895]
tvs312 = [1, 0, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs312) ~> ps312
vec_sub(a=ps312, b=tvs312) ~> gs312
mat_update_4(mat=wr0, grad=gs312, x=xvs312, lr=lr) ~> wr0
dot_product(a=gs312, b=gs312) ~> losss312
xvs313 = [0.4737, 0.1895, 0.0000, 0.0105]
tvs313 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs313) ~> ps313
vec_sub(a=ps313, b=tvs313) ~> gs313
mat_update_4(mat=wr0, grad=gs313, x=xvs313, lr=lr) ~> wr0
dot_product(a=gs313, b=gs313) ~> losss313
xvs314 = [0.0000, 0.0105, 0.0105, 0.0105]
tvs314 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs314) ~> ps314
vec_sub(a=ps314, b=tvs314) ~> gs314
mat_update_4(mat=wr0, grad=gs314, x=xvs314, lr=lr) ~> wr0
dot_product(a=gs314, b=gs314) ~> losss314
xvs315 = [0.0105, 0.0105, 0.0105, 0.8000]
tvs315 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs315) ~> ps315
vec_sub(a=ps315, b=tvs315) ~> gs315
mat_update_4(mat=wr0, grad=gs315, x=xvs315, lr=lr) ~> wr0
dot_product(a=gs315, b=gs315) ~> losss315
xvs316 = [0.0105, 0.8000, 0.7263, 0.8211]
tvs316 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs316) ~> ps316
vec_sub(a=ps316, b=tvs316) ~> gs316
mat_update_4(mat=wr0, grad=gs316, x=xvs316, lr=lr) ~> wr0
dot_product(a=gs316, b=gs316) ~> losss316
xvs317 = [0.7263, 0.8211, 0.0947, 0.9053]
tvs317 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs317) ~> ps317
vec_sub(a=ps317, b=tvs317) ~> gs317
mat_update_4(mat=wr0, grad=gs317, x=xvs317, lr=lr) ~> wr0
dot_product(a=gs317, b=gs317) ~> losss317
xvs318 = [0.0947, 0.9053, 0.6842, 0.8000]
tvs318 = [0, 0, 1, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs318) ~> ps318
vec_sub(a=ps318, b=tvs318) ~> gs318
mat_update_4(mat=wr0, grad=gs318, x=xvs318, lr=lr) ~> wr0
dot_product(a=gs318, b=gs318) ~> losss318
xvs319 = [0.6842, 0.8000, 0.3158, 0.3579]
tvs319 = [0, 0, 0, 1]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs319) ~> ps319
vec_sub(a=ps319, b=tvs319) ~> gs319
mat_update_4(mat=wr0, grad=gs319, x=xvs319, lr=lr) ~> wr0
dot_product(a=gs319, b=gs319) ~> losss319
xvs320 = [0.3158, 0.3579, 0.2000, 0.1053]
tvs320 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs320) ~> ps320
vec_sub(a=ps320, b=tvs320) ~> gs320
mat_update_4(mat=wr0, grad=gs320, x=xvs320, lr=lr) ~> wr0
dot_product(a=gs320, b=gs320) ~> losss320
xvs321 = [0.2000, 0.1053, 0.0105, 0.9895]
tvs321 = [0, 0, 0, 1]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs321) ~> ps321
vec_sub(a=ps321, b=tvs321) ~> gs321
mat_update_4(mat=wr0, grad=gs321, x=xvs321, lr=lr) ~> wr0
dot_product(a=gs321, b=gs321) ~> losss321
xvs322 = [0.0105, 0.9895, 0.3263, 0.0105]
tvs322 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs322) ~> ps322
vec_sub(a=ps322, b=tvs322) ~> gs322
mat_update_4(mat=wr0, grad=gs322, x=xvs322, lr=lr) ~> wr0
dot_product(a=gs322, b=gs322) ~> losss322
xvs323 = [0.3263, 0.0105, 0.4737, 0.2000]
tvs323 = [1, 0, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs323) ~> ps323
vec_sub(a=ps323, b=tvs323) ~> gs323
mat_update_4(mat=wr0, grad=gs323, x=xvs323, lr=lr) ~> wr0
dot_product(a=gs323, b=gs323) ~> losss323
xvs324 = [0.4737, 0.2000, 0.0000, 0.0105]
tvs324 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs324) ~> ps324
vec_sub(a=ps324, b=tvs324) ~> gs324
mat_update_4(mat=wr0, grad=gs324, x=xvs324, lr=lr) ~> wr0
dot_product(a=gs324, b=gs324) ~> losss324
xvs325 = [0.0000, 0.0105, 0.0105, 0.0105]
tvs325 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs325) ~> ps325
vec_sub(a=ps325, b=tvs325) ~> gs325
mat_update_4(mat=wr0, grad=gs325, x=xvs325, lr=lr) ~> wr0
dot_product(a=gs325, b=gs325) ~> losss325
xvs326 = [0.0105, 0.0105, 0.0105, 0.8105]
tvs326 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs326) ~> ps326
vec_sub(a=ps326, b=tvs326) ~> gs326
mat_update_4(mat=wr0, grad=gs326, x=xvs326, lr=lr) ~> wr0
dot_product(a=gs326, b=gs326) ~> losss326
xvs327 = [0.0105, 0.8105, 0.7684, 0.8211]
tvs327 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs327) ~> ps327
vec_sub(a=ps327, b=tvs327) ~> gs327
mat_update_4(mat=wr0, grad=gs327, x=xvs327, lr=lr) ~> wr0
dot_product(a=gs327, b=gs327) ~> losss327
xvs328 = [0.7684, 0.8211, 0.0947, 0.6842]
tvs328 = [0, 0, 1, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs328) ~> ps328
vec_sub(a=ps328, b=tvs328) ~> gs328
mat_update_4(mat=wr0, grad=gs328, x=xvs328, lr=lr) ~> wr0
dot_product(a=gs328, b=gs328) ~> losss328
xvs329 = [0.0947, 0.6842, 0.3158, 0.4737]
tvs329 = [0, 0, 1, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs329) ~> ps329
vec_sub(a=ps329, b=tvs329) ~> gs329
mat_update_4(mat=wr0, grad=gs329, x=xvs329, lr=lr) ~> wr0
dot_product(a=gs329, b=gs329) ~> losss329
xvs330 = [0.3158, 0.4737, 0.1895, 0.1368]
tvs330 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs330) ~> ps330
vec_sub(a=ps330, b=tvs330) ~> gs330
mat_update_4(mat=wr0, grad=gs330, x=xvs330, lr=lr) ~> wr0
dot_product(a=gs330, b=gs330) ~> losss330
xvs331 = [0.1895, 0.1368, 0.0105, 0.6947]
tvs331 = [0, 0, 1, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs331) ~> ps331
vec_sub(a=ps331, b=tvs331) ~> gs331
mat_update_4(mat=wr0, grad=gs331, x=xvs331, lr=lr) ~> wr0
dot_product(a=gs331, b=gs331) ~> losss331
xvs332 = [0.0105, 0.6947, 0.3158, 0.4737]
tvs332 = [0, 0, 0, 1]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs332) ~> ps332
vec_sub(a=ps332, b=tvs332) ~> gs332
mat_update_4(mat=wr0, grad=gs332, x=xvs332, lr=lr) ~> wr0
dot_product(a=gs332, b=gs332) ~> losss332
xvs333 = [0.3158, 0.4737, 0.2000, 0.1053]
tvs333 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs333) ~> ps333
vec_sub(a=ps333, b=tvs333) ~> gs333
mat_update_4(mat=wr0, grad=gs333, x=xvs333, lr=lr) ~> wr0
dot_product(a=gs333, b=gs333) ~> losss333
xvs334 = [0.2000, 0.1053, 0.0105, 0.9895]
tvs334 = [0, 0, 0, 1]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs334) ~> ps334
vec_sub(a=ps334, b=tvs334) ~> gs334
mat_update_4(mat=wr0, grad=gs334, x=xvs334, lr=lr) ~> wr0
dot_product(a=gs334, b=gs334) ~> losss334
xvs335 = [0.0105, 0.9895, 0.3263, 0.0105]
tvs335 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs335) ~> ps335
vec_sub(a=ps335, b=tvs335) ~> gs335
mat_update_4(mat=wr0, grad=gs335, x=xvs335, lr=lr) ~> wr0
dot_product(a=gs335, b=gs335) ~> losss335
xvs336 = [0.3263, 0.0105, 0.4737, 0.0000]
tvs336 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs336) ~> ps336
vec_sub(a=ps336, b=tvs336) ~> gs336
mat_update_4(mat=wr0, grad=gs336, x=xvs336, lr=lr) ~> wr0
dot_product(a=gs336, b=gs336) ~> losss336
xvs337 = [0.4737, 0.0000, 0.0105, 0.0105]
tvs337 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs337) ~> ps337
vec_sub(a=ps337, b=tvs337) ~> gs337
mat_update_4(mat=wr0, grad=gs337, x=xvs337, lr=lr) ~> wr0
dot_product(a=gs337, b=gs337) ~> losss337
xvs338 = [0.0105, 0.0105, 0.0105, 0.0105]
tvs338 = [0, 0, 1, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs338) ~> ps338
vec_sub(a=ps338, b=tvs338) ~> gs338
mat_update_4(mat=wr0, grad=gs338, x=xvs338, lr=lr) ~> wr0
dot_product(a=gs338, b=gs338) ~> losss338
xvs339 = [0.0105, 0.0105, 0.8632, 0.6842]
tvs339 = [0, 0, 1, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs339) ~> ps339
vec_sub(a=ps339, b=tvs339) ~> gs339
mat_update_4(mat=wr0, grad=gs339, x=xvs339, lr=lr) ~> wr0
dot_product(a=gs339, b=gs339) ~> losss339
xvs340 = [0.8632, 0.6842, 0.8211, 0.7474]
tvs340 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs340) ~> ps340
vec_sub(a=ps340, b=tvs340) ~> gs340
mat_update_4(mat=wr0, grad=gs340, x=xvs340, lr=lr) ~> wr0
dot_product(a=gs340, b=gs340) ~> losss340
xvs341 = [0.8211, 0.7474, 0.7263, 0.0947]
tvs341 = [0, 0, 1, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs341) ~> ps341
vec_sub(a=ps341, b=tvs341) ~> gs341
mat_update_4(mat=wr0, grad=gs341, x=xvs341, lr=lr) ~> wr0
dot_product(a=gs341, b=gs341) ~> losss341
xvs342 = [0.7263, 0.0947, 0.8211, 0.3158]
tvs342 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs342) ~> ps342
vec_sub(a=ps342, b=tvs342) ~> gs342
mat_update_4(mat=wr0, grad=gs342, x=xvs342, lr=lr) ~> wr0
dot_product(a=gs342, b=gs342) ~> losss342
xvs343 = [0.8211, 0.3158, 0.4737, 0.1053]
tvs343 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs343) ~> ps343
vec_sub(a=ps343, b=tvs343) ~> gs343
mat_update_4(mat=wr0, grad=gs343, x=xvs343, lr=lr) ~> wr0
dot_product(a=gs343, b=gs343) ~> losss343
xvs344 = [0.4737, 0.1053, 0.0105, 0.9895]
tvs344 = [0, 0, 0, 1]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs344) ~> ps344
vec_sub(a=ps344, b=tvs344) ~> gs344
mat_update_4(mat=wr0, grad=gs344, x=xvs344, lr=lr) ~> wr0
dot_product(a=gs344, b=gs344) ~> losss344
xvs345 = [0.0105, 0.9895, 0.3263, 0.0105]
tvs345 = [0, 0, 1, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs345) ~> ps345
vec_sub(a=ps345, b=tvs345) ~> gs345
mat_update_4(mat=wr0, grad=gs345, x=xvs345, lr=lr) ~> wr0
dot_product(a=gs345, b=gs345) ~> losss345
xvs346 = [0.3263, 0.0105, 0.4421, 0.3895]
tvs346 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs346) ~> ps346
vec_sub(a=ps346, b=tvs346) ~> gs346
mat_update_4(mat=wr0, grad=gs346, x=xvs346, lr=lr) ~> wr0
dot_product(a=gs346, b=gs346) ~> losss346
xvs347 = [0.4421, 0.3895, 0.6000, 0.0000]
tvs347 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs347) ~> ps347
vec_sub(a=ps347, b=tvs347) ~> gs347
mat_update_4(mat=wr0, grad=gs347, x=xvs347, lr=lr) ~> wr0
dot_product(a=gs347, b=gs347) ~> losss347
xvs348 = [0.6000, 0.0000, 0.0105, 0.0105]
tvs348 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs348) ~> ps348
vec_sub(a=ps348, b=tvs348) ~> gs348
mat_update_4(mat=wr0, grad=gs348, x=xvs348, lr=lr) ~> wr0
dot_product(a=gs348, b=gs348) ~> losss348
xvs349 = [0.0105, 0.0105, 0.0105, 0.0105]
tvs349 = [0, 0, 0, 1]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs349) ~> ps349
vec_sub(a=ps349, b=tvs349) ~> gs349
mat_update_4(mat=wr0, grad=gs349, x=xvs349, lr=lr) ~> wr0
dot_product(a=gs349, b=gs349) ~> losss349
xvs350 = [0.0105, 0.0105, 0.4105, 0.0947]
tvs350 = [0, 0, 1, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs350) ~> ps350
vec_sub(a=ps350, b=tvs350) ~> gs350
mat_update_4(mat=wr0, grad=gs350, x=xvs350, lr=lr) ~> wr0
dot_product(a=gs350, b=gs350) ~> losss350
xvs351 = [0.4105, 0.0947, 0.4421, 0.3895]
tvs351 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs351) ~> ps351
vec_sub(a=ps351, b=tvs351) ~> gs351
mat_update_4(mat=wr0, grad=gs351, x=xvs351, lr=lr) ~> wr0
dot_product(a=gs351, b=gs351) ~> losss351
xvs352 = [0.4421, 0.3895, 0.6000, 0.1053]
tvs352 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs352) ~> ps352
vec_sub(a=ps352, b=tvs352) ~> gs352
mat_update_4(mat=wr0, grad=gs352, x=xvs352, lr=lr) ~> wr0
dot_product(a=gs352, b=gs352) ~> losss352
xvs353 = [0.6000, 0.1053, 0.0105, 0.9579]
tvs353 = [1, 0, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs353) ~> ps353
vec_sub(a=ps353, b=tvs353) ~> gs353
mat_update_4(mat=wr0, grad=gs353, x=xvs353, lr=lr) ~> wr0
dot_product(a=gs353, b=gs353) ~> losss353
xvs354 = [0.0105, 0.9579, 0.0000, 0.0105]
tvs354 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs354) ~> ps354
vec_sub(a=ps354, b=tvs354) ~> gs354
mat_update_4(mat=wr0, grad=gs354, x=xvs354, lr=lr) ~> wr0
dot_product(a=gs354, b=gs354) ~> losss354
xvs355 = [0.0000, 0.0105, 0.0105, 0.0105]
tvs355 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs355) ~> ps355
vec_sub(a=ps355, b=tvs355) ~> gs355
mat_update_4(mat=wr0, grad=gs355, x=xvs355, lr=lr) ~> wr0
dot_product(a=gs355, b=gs355) ~> losss355
xvs356 = [0.0105, 0.0105, 0.0105, 0.0105]
tvs356 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs356) ~> ps356
vec_sub(a=ps356, b=tvs356) ~> gs356
mat_update_4(mat=wr0, grad=gs356, x=xvs356, lr=lr) ~> wr0
dot_product(a=gs356, b=gs356) ~> losss356
xvs357 = [0.0105, 0.0105, 0.0105, 0.0105]
tvs357 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs357) ~> ps357
vec_sub(a=ps357, b=tvs357) ~> gs357
mat_update_4(mat=wr0, grad=gs357, x=xvs357, lr=lr) ~> wr0
dot_product(a=gs357, b=gs357) ~> losss357
xvs358 = [0.0105, 0.0105, 0.0105, 0.7474]
tvs358 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs358) ~> ps358
vec_sub(a=ps358, b=tvs358) ~> gs358
mat_update_4(mat=wr0, grad=gs358, x=xvs358, lr=lr) ~> wr0
dot_product(a=gs358, b=gs358) ~> losss358
xvs359 = [0.0105, 0.7474, 0.7263, 0.8842]
tvs359 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs359) ~> ps359
vec_sub(a=ps359, b=tvs359) ~> gs359
mat_update_4(mat=wr0, grad=gs359, x=xvs359, lr=lr) ~> wr0
dot_product(a=gs359, b=gs359) ~> losss359
xvs360 = [0.7263, 0.8842, 0.0947, 0.6842]
tvs360 = [0, 0, 1, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs360) ~> ps360
vec_sub(a=ps360, b=tvs360) ~> gs360
mat_update_4(mat=wr0, grad=gs360, x=xvs360, lr=lr) ~> wr0
dot_product(a=gs360, b=gs360) ~> losss360
xvs361 = [0.0947, 0.6842, 0.8632, 0.8632]
tvs361 = [0, 0, 1, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs361) ~> ps361
vec_sub(a=ps361, b=tvs361) ~> gs361
mat_update_4(mat=wr0, grad=gs361, x=xvs361, lr=lr) ~> wr0
dot_product(a=gs361, b=gs361) ~> losss361
xvs362 = [0.8632, 0.8632, 0.3158, 0.3579]
tvs362 = [0, 0, 1, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs362) ~> ps362
vec_sub(a=ps362, b=tvs362) ~> gs362
mat_update_4(mat=wr0, grad=gs362, x=xvs362, lr=lr) ~> wr0
dot_product(a=gs362, b=gs362) ~> losss362
xvs363 = [0.3158, 0.3579, 0.1895, 0.1368]
tvs363 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs363) ~> ps363
vec_sub(a=ps363, b=tvs363) ~> gs363
mat_update_4(mat=wr0, grad=gs363, x=xvs363, lr=lr) ~> wr0
dot_product(a=gs363, b=gs363) ~> losss363
xvs364 = [0.1895, 0.1368, 0.0105, 0.7684]
tvs364 = [1, 0, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs364) ~> ps364
vec_sub(a=ps364, b=tvs364) ~> gs364
mat_update_4(mat=wr0, grad=gs364, x=xvs364, lr=lr) ~> wr0
dot_product(a=gs364, b=gs364) ~> losss364
xvs365 = [0.0105, 0.7684, 0.7158, 0.9263]
tvs365 = [0, 0, 1, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs365) ~> ps365
vec_sub(a=ps365, b=tvs365) ~> gs365
mat_update_4(mat=wr0, grad=gs365, x=xvs365, lr=lr) ~> wr0
dot_product(a=gs365, b=gs365) ~> losss365
xvs366 = [0.7158, 0.9263, 0.3158, 0.8211]
tvs366 = [0, 0, 0, 1]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs366) ~> ps366
vec_sub(a=ps366, b=tvs366) ~> gs366
mat_update_4(mat=wr0, grad=gs366, x=xvs366, lr=lr) ~> wr0
dot_product(a=gs366, b=gs366) ~> losss366
xvs367 = [0.3158, 0.8211, 0.8316, 0.9158]
tvs367 = [0, 0, 1, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs367) ~> ps367
vec_sub(a=ps367, b=tvs367) ~> gs367
mat_update_4(mat=wr0, grad=gs367, x=xvs367, lr=lr) ~> wr0
dot_product(a=gs367, b=gs367) ~> losss367
xvs368 = [0.8316, 0.9158, 0.1053, 0.0105]
tvs368 = [0, 0, 1, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs368) ~> ps368
vec_sub(a=ps368, b=tvs368) ~> gs368
mat_update_4(mat=wr0, grad=gs368, x=xvs368, lr=lr) ~> wr0
dot_product(a=gs368, b=gs368) ~> losss368
xvs369 = [0.1053, 0.0105, 0.9895, 0.3263]
tvs369 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs369) ~> ps369
vec_sub(a=ps369, b=tvs369) ~> gs369
mat_update_4(mat=wr0, grad=gs369, x=xvs369, lr=lr) ~> wr0
dot_product(a=gs369, b=gs369) ~> losss369
xvs370 = [0.9895, 0.3263, 0.0105, 0.9053]
tvs370 = [0, 0, 1, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs370) ~> ps370
vec_sub(a=ps370, b=tvs370) ~> gs370
mat_update_4(mat=wr0, grad=gs370, x=xvs370, lr=lr) ~> wr0
dot_product(a=gs370, b=gs370) ~> losss370
xvs371 = [0.0105, 0.9053, 0.1895, 0.0000]
tvs371 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs371) ~> ps371
vec_sub(a=ps371, b=tvs371) ~> gs371
mat_update_4(mat=wr0, grad=gs371, x=xvs371, lr=lr) ~> wr0
dot_product(a=gs371, b=gs371) ~> losss371
xvs372 = [0.1895, 0.0000, 0.0105, 0.0105]
tvs372 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs372) ~> ps372
vec_sub(a=ps372, b=tvs372) ~> gs372
mat_update_4(mat=wr0, grad=gs372, x=xvs372, lr=lr) ~> wr0
dot_product(a=gs372, b=gs372) ~> losss372
xvs373 = [0.0105, 0.0105, 0.0105, 0.0105]
tvs373 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs373) ~> ps373
vec_sub(a=ps373, b=tvs373) ~> gs373
mat_update_4(mat=wr0, grad=gs373, x=xvs373, lr=lr) ~> wr0
dot_product(a=gs373, b=gs373) ~> losss373
xvs374 = [0.0105, 0.0105, 0.0105, 0.0105]
tvs374 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs374) ~> ps374
vec_sub(a=ps374, b=tvs374) ~> gs374
mat_update_4(mat=wr0, grad=gs374, x=xvs374, lr=lr) ~> wr0
dot_product(a=gs374, b=gs374) ~> losss374
xvs375 = [0.0105, 0.0105, 0.0105, 0.0105]
tvs375 = [0, 0, 0, 1]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs375) ~> ps375
vec_sub(a=ps375, b=tvs375) ~> gs375
mat_update_4(mat=wr0, grad=gs375, x=xvs375, lr=lr) ~> wr0
dot_product(a=gs375, b=gs375) ~> losss375
xvs376 = [0.0105, 0.0105, 0.7474, 0.7263]
tvs376 = [1, 0, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs376) ~> ps376
vec_sub(a=ps376, b=tvs376) ~> gs376
mat_update_4(mat=wr0, grad=gs376, x=xvs376, lr=lr) ~> wr0
dot_product(a=gs376, b=gs376) ~> losss376
xvs377 = [0.7474, 0.7263, 0.8842, 0.0947]
tvs377 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs377) ~> ps377
vec_sub(a=ps377, b=tvs377) ~> gs377
mat_update_4(mat=wr0, grad=gs377, x=xvs377, lr=lr) ~> wr0
dot_product(a=gs377, b=gs377) ~> losss377
xvs378 = [0.8842, 0.0947, 0.6842, 0.8632]
tvs378 = [0, 0, 1, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs378) ~> ps378
vec_sub(a=ps378, b=tvs378) ~> gs378
mat_update_4(mat=wr0, grad=gs378, x=xvs378, lr=lr) ~> wr0
dot_product(a=gs378, b=gs378) ~> losss378
xvs379 = [0.6842, 0.8632, 0.8632, 0.3158]
tvs379 = [0, 0, 1, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs379) ~> ps379
vec_sub(a=ps379, b=tvs379) ~> gs379
mat_update_4(mat=wr0, grad=gs379, x=xvs379, lr=lr) ~> wr0
dot_product(a=gs379, b=gs379) ~> losss379
xvs380 = [0.8632, 0.3158, 0.3579, 0.2000]
tvs380 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs380) ~> ps380
vec_sub(a=ps380, b=tvs380) ~> gs380
mat_update_4(mat=wr0, grad=gs380, x=xvs380, lr=lr) ~> wr0
dot_product(a=gs380, b=gs380) ~> losss380
xvs381 = [0.3579, 0.2000, 0.1368, 0.0105]
tvs381 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs381) ~> ps381
vec_sub(a=ps381, b=tvs381) ~> gs381
mat_update_4(mat=wr0, grad=gs381, x=xvs381, lr=lr) ~> wr0
dot_product(a=gs381, b=gs381) ~> losss381
xvs382 = [0.1368, 0.0105, 0.7684, 0.7158]
tvs382 = [1, 0, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs382) ~> ps382
vec_sub(a=ps382, b=tvs382) ~> gs382
mat_update_4(mat=wr0, grad=gs382, x=xvs382, lr=lr) ~> wr0
dot_product(a=gs382, b=gs382) ~> losss382
xvs383 = [0.7684, 0.7158, 0.9263, 0.3158]
tvs383 = [0, 0, 1, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs383) ~> ps383
vec_sub(a=ps383, b=tvs383) ~> gs383
mat_update_4(mat=wr0, grad=gs383, x=xvs383, lr=lr) ~> wr0
dot_product(a=gs383, b=gs383) ~> losss383
xvs384 = [0.9263, 0.3158, 0.8211, 0.8316]
tvs384 = [0, 0, 0, 1]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs384) ~> ps384
vec_sub(a=ps384, b=tvs384) ~> gs384
mat_update_4(mat=wr0, grad=gs384, x=xvs384, lr=lr) ~> wr0
dot_product(a=gs384, b=gs384) ~> losss384
xvs385 = [0.8211, 0.8316, 0.9158, 0.1053]
tvs385 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs385) ~> ps385
vec_sub(a=ps385, b=tvs385) ~> gs385
mat_update_4(mat=wr0, grad=gs385, x=xvs385, lr=lr) ~> wr0
dot_product(a=gs385, b=gs385) ~> losss385
xvs386 = [0.9158, 0.1053, 0.0105, 0.9895]
tvs386 = [0, 0, 0, 1]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs386) ~> ps386
vec_sub(a=ps386, b=tvs386) ~> gs386
mat_update_4(mat=wr0, grad=gs386, x=xvs386, lr=lr) ~> wr0
dot_product(a=gs386, b=gs386) ~> losss386
xvs387 = [0.0105, 0.9895, 0.3263, 0.0105]
tvs387 = [0, 0, 1, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs387) ~> ps387
vec_sub(a=ps387, b=tvs387) ~> gs387
mat_update_4(mat=wr0, grad=gs387, x=xvs387, lr=lr) ~> wr0
dot_product(a=gs387, b=gs387) ~> losss387
xvs388 = [0.3263, 0.0105, 0.9053, 0.2000]
tvs388 = [1, 0, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs388) ~> ps388
vec_sub(a=ps388, b=tvs388) ~> gs388
mat_update_4(mat=wr0, grad=gs388, x=xvs388, lr=lr) ~> wr0
dot_product(a=gs388, b=gs388) ~> losss388
xvs389 = [0.9053, 0.2000, 0.0000, 0.0105]
tvs389 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs389) ~> ps389
vec_sub(a=ps389, b=tvs389) ~> gs389
mat_update_4(mat=wr0, grad=gs389, x=xvs389, lr=lr) ~> wr0
dot_product(a=gs389, b=gs389) ~> losss389
xvs390 = [0.0000, 0.0105, 0.0105, 0.0105]
tvs390 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs390) ~> ps390
vec_sub(a=ps390, b=tvs390) ~> gs390
mat_update_4(mat=wr0, grad=gs390, x=xvs390, lr=lr) ~> wr0
dot_product(a=gs390, b=gs390) ~> losss390
xvs391 = [0.0105, 0.0105, 0.0105, 0.0105]
tvs391 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs391) ~> ps391
vec_sub(a=ps391, b=tvs391) ~> gs391
mat_update_4(mat=wr0, grad=gs391, x=xvs391, lr=lr) ~> wr0
dot_product(a=gs391, b=gs391) ~> losss391
xvs392 = [0.0105, 0.0105, 0.0105, 0.0105]
tvs392 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs392) ~> ps392
vec_sub(a=ps392, b=tvs392) ~> gs392
mat_update_4(mat=wr0, grad=gs392, x=xvs392, lr=lr) ~> wr0
dot_product(a=gs392, b=gs392) ~> losss392
xvs393 = [0.0105, 0.0105, 0.0105, 0.6316]
tvs393 = [0, 0, 1, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs393) ~> ps393
vec_sub(a=ps393, b=tvs393) ~> gs393
mat_update_4(mat=wr0, grad=gs393, x=xvs393, lr=lr) ~> wr0
dot_product(a=gs393, b=gs393) ~> losss393
xvs394 = [0.0105, 0.6316, 0.6526, 0.0105]
tvs394 = [0, 0, 0, 1]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs394) ~> ps394
vec_sub(a=ps394, b=tvs394) ~> gs394
mat_update_4(mat=wr0, grad=gs394, x=xvs394, lr=lr) ~> wr0
dot_product(a=gs394, b=gs394) ~> losss394
xvs395 = [0.6526, 0.0105, 0.3263, 0.3263]
tvs395 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs395) ~> ps395
vec_sub(a=ps395, b=tvs395) ~> gs395
mat_update_4(mat=wr0, grad=gs395, x=xvs395, lr=lr) ~> wr0
dot_product(a=gs395, b=gs395) ~> losss395
xvs396 = [0.3263, 0.3263, 0.0105, 0.8421]
tvs396 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs396) ~> ps396
vec_sub(a=ps396, b=tvs396) ~> gs396
mat_update_4(mat=wr0, grad=gs396, x=xvs396, lr=lr) ~> wr0
dot_product(a=gs396, b=gs396) ~> losss396
xvs397 = [0.0105, 0.8421, 0.6842, 0.7684]
tvs397 = [0, 0, 1, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs397) ~> ps397
vec_sub(a=ps397, b=tvs397) ~> gs397
mat_update_4(mat=wr0, grad=gs397, x=xvs397, lr=lr) ~> wr0
dot_product(a=gs397, b=gs397) ~> losss397
xvs398 = [0.6842, 0.7684, 0.8632, 0.0000]
tvs398 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs398) ~> ps398
vec_sub(a=ps398, b=tvs398) ~> gs398
mat_update_4(mat=wr0, grad=gs398, x=xvs398, lr=lr) ~> wr0
dot_product(a=gs398, b=gs398) ~> losss398
xvs399 = [0.8632, 0.0000, 0.0105, 0.0105]
tvs399 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs399) ~> ps399
vec_sub(a=ps399, b=tvs399) ~> gs399
mat_update_4(mat=wr0, grad=gs399, x=xvs399, lr=lr) ~> wr0
dot_product(a=gs399, b=gs399) ~> losss399
xvs400 = [0.0105, 0.0105, 0.0105, 0.0105]
tvs400 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs400) ~> ps400
vec_sub(a=ps400, b=tvs400) ~> gs400
mat_update_4(mat=wr0, grad=gs400, x=xvs400, lr=lr) ~> wr0
dot_product(a=gs400, b=gs400) ~> losss400
xvs401 = [0.0105, 0.0105, 0.0105, 0.0105]
tvs401 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs401) ~> ps401
vec_sub(a=ps401, b=tvs401) ~> gs401
mat_update_4(mat=wr0, grad=gs401, x=xvs401, lr=lr) ~> wr0
dot_product(a=gs401, b=gs401) ~> losss401
xvs402 = [0.0105, 0.0105, 0.0105, 0.0105]
tvs402 = [1, 0, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs402) ~> ps402
vec_sub(a=ps402, b=tvs402) ~> gs402
mat_update_4(mat=wr0, grad=gs402, x=xvs402, lr=lr) ~> wr0
dot_product(a=gs402, b=gs402) ~> losss402
xvs403 = [0.0105, 0.0105, 0.8421, 0.8947]
tvs403 = [0, 0, 0, 1]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs403) ~> ps403
vec_sub(a=ps403, b=tvs403) ~> gs403
mat_update_4(mat=wr0, grad=gs403, x=xvs403, lr=lr) ~> wr0
dot_product(a=gs403, b=gs403) ~> losss403
xvs404 = [0.8421, 0.8947, 0.8737, 0.7579]
tvs404 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs404) ~> ps404
vec_sub(a=ps404, b=tvs404) ~> gs404
mat_update_4(mat=wr0, grad=gs404, x=xvs404, lr=lr) ~> wr0
dot_product(a=gs404, b=gs404) ~> losss404
xvs405 = [0.8737, 0.7579, 0.0947, 0.6842]
tvs405 = [0, 0, 1, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs405) ~> ps405
vec_sub(a=ps405, b=tvs405) ~> gs405
mat_update_4(mat=wr0, grad=gs405, x=xvs405, lr=lr) ~> wr0
dot_product(a=gs405, b=gs405) ~> losss405
xvs406 = [0.0947, 0.6842, 0.8632, 0.8632]
tvs406 = [0, 0, 1, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs406) ~> ps406
vec_sub(a=ps406, b=tvs406) ~> gs406
mat_update_4(mat=wr0, grad=gs406, x=xvs406, lr=lr) ~> wr0
dot_product(a=gs406, b=gs406) ~> losss406
xvs407 = [0.8632, 0.8632, 0.3158, 0.8421]
tvs407 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs407) ~> ps407
vec_sub(a=ps407, b=tvs407) ~> gs407
mat_update_4(mat=wr0, grad=gs407, x=xvs407, lr=lr) ~> wr0
dot_product(a=gs407, b=gs407) ~> losss407
xvs408 = [0.3158, 0.8421, 0.6842, 0.7684]
tvs408 = [0, 0, 1, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs408) ~> ps408
vec_sub(a=ps408, b=tvs408) ~> gs408
mat_update_4(mat=wr0, grad=gs408, x=xvs408, lr=lr) ~> wr0
dot_product(a=gs408, b=gs408) ~> losss408
xvs409 = [0.6842, 0.7684, 0.8632, 0.1368]
tvs409 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs409) ~> ps409
vec_sub(a=ps409, b=tvs409) ~> gs409
mat_update_4(mat=wr0, grad=gs409, x=xvs409, lr=lr) ~> wr0
dot_product(a=gs409, b=gs409) ~> losss409
xvs410 = [0.8632, 0.1368, 0.0105, 0.9053]
tvs410 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs410) ~> ps410
vec_sub(a=ps410, b=tvs410) ~> gs410
mat_update_4(mat=wr0, grad=gs410, x=xvs410, lr=lr) ~> wr0
dot_product(a=gs410, b=gs410) ~> losss410
xvs411 = [0.0105, 0.9053, 0.6842, 0.8000]
tvs411 = [0, 0, 1, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs411) ~> ps411
vec_sub(a=ps411, b=tvs411) ~> gs411
mat_update_4(mat=wr0, grad=gs411, x=xvs411, lr=lr) ~> wr0
dot_product(a=gs411, b=gs411) ~> losss411
xvs412 = [0.6842, 0.8000, 0.3158, 0.9053]
tvs412 = [0, 0, 1, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs412) ~> ps412
vec_sub(a=ps412, b=tvs412) ~> gs412
mat_update_4(mat=wr0, grad=gs412, x=xvs412, lr=lr) ~> wr0
dot_product(a=gs412, b=gs412) ~> losss412
xvs413 = [0.3158, 0.9053, 0.1895, 0.1053]
tvs413 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs413) ~> ps413
vec_sub(a=ps413, b=tvs413) ~> gs413
mat_update_4(mat=wr0, grad=gs413, x=xvs413, lr=lr) ~> wr0
dot_product(a=gs413, b=gs413) ~> losss413
xvs414 = [0.1895, 0.1053, 0.0105, 0.9895]
tvs414 = [0, 0, 0, 1]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs414) ~> ps414
vec_sub(a=ps414, b=tvs414) ~> gs414
mat_update_4(mat=wr0, grad=gs414, x=xvs414, lr=lr) ~> wr0
dot_product(a=gs414, b=gs414) ~> losss414
xvs415 = [0.0105, 0.9895, 0.3263, 0.0105]
tvs415 = [1, 0, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs415) ~> ps415
vec_sub(a=ps415, b=tvs415) ~> gs415
mat_update_4(mat=wr0, grad=gs415, x=xvs415, lr=lr) ~> wr0
dot_product(a=gs415, b=gs415) ~> losss415
xvs416 = [0.3263, 0.0105, 0.8421, 0.6842]
tvs416 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs416) ~> ps416
vec_sub(a=ps416, b=tvs416) ~> gs416
mat_update_4(mat=wr0, grad=gs416, x=xvs416, lr=lr) ~> wr0
dot_product(a=gs416, b=gs416) ~> losss416
xvs417 = [0.8421, 0.6842, 0.7684, 0.8632]
tvs417 = [1, 0, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs417) ~> ps417
vec_sub(a=ps417, b=tvs417) ~> gs417
mat_update_4(mat=wr0, grad=gs417, x=xvs417, lr=lr) ~> wr0
dot_product(a=gs417, b=gs417) ~> losss417
xvs418 = [0.7684, 0.8632, 0.0000, 0.0105]
tvs418 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs418) ~> ps418
vec_sub(a=ps418, b=tvs418) ~> gs418
mat_update_4(mat=wr0, grad=gs418, x=xvs418, lr=lr) ~> wr0
dot_product(a=gs418, b=gs418) ~> losss418
xvs419 = [0.0000, 0.0105, 0.0105, 0.0105]
tvs419 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs419) ~> ps419
vec_sub(a=ps419, b=tvs419) ~> gs419
mat_update_4(mat=wr0, grad=gs419, x=xvs419, lr=lr) ~> wr0
dot_product(a=gs419, b=gs419) ~> losss419
xvs420 = [0.0105, 0.0105, 0.0105, 0.0105]
tvs420 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs420) ~> ps420
vec_sub(a=ps420, b=tvs420) ~> gs420
mat_update_4(mat=wr0, grad=gs420, x=xvs420, lr=lr) ~> wr0
dot_product(a=gs420, b=gs420) ~> losss420
xvs421 = [0.0105, 0.0105, 0.0105, 0.0105]
tvs421 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs421) ~> ps421
vec_sub(a=ps421, b=tvs421) ~> gs421
mat_update_4(mat=wr0, grad=gs421, x=xvs421, lr=lr) ~> wr0
dot_product(a=gs421, b=gs421) ~> losss421
xvs422 = [0.0105, 0.0105, 0.0105, 0.8421]
tvs422 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs422) ~> ps422
vec_sub(a=ps422, b=tvs422) ~> gs422
mat_update_4(mat=wr0, grad=gs422, x=xvs422, lr=lr) ~> wr0
dot_product(a=gs422, b=gs422) ~> losss422
xvs423 = [0.0105, 0.8421, 0.8947, 0.8737]
tvs423 = [1, 0, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs423) ~> ps423
vec_sub(a=ps423, b=tvs423) ~> gs423
mat_update_4(mat=wr0, grad=gs423, x=xvs423, lr=lr) ~> wr0
dot_product(a=gs423, b=gs423) ~> losss423
xvs424 = [0.8947, 0.8737, 0.7579, 0.0947]
tvs424 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs424) ~> ps424
vec_sub(a=ps424, b=tvs424) ~> gs424
mat_update_4(mat=wr0, grad=gs424, x=xvs424, lr=lr) ~> wr0
dot_product(a=gs424, b=gs424) ~> losss424
xvs425 = [0.7579, 0.0947, 0.6842, 0.8632]
tvs425 = [0, 0, 1, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs425) ~> ps425
vec_sub(a=ps425, b=tvs425) ~> gs425
mat_update_4(mat=wr0, grad=gs425, x=xvs425, lr=lr) ~> wr0
dot_product(a=gs425, b=gs425) ~> losss425
xvs426 = [0.6842, 0.8632, 0.8632, 0.3158]
tvs426 = [1, 0, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs426) ~> ps426
vec_sub(a=ps426, b=tvs426) ~> gs426
mat_update_4(mat=wr0, grad=gs426, x=xvs426, lr=lr) ~> wr0
dot_product(a=gs426, b=gs426) ~> losss426
xvs427 = [0.8632, 0.3158, 0.8421, 0.6842]
tvs427 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs427) ~> ps427
vec_sub(a=ps427, b=tvs427) ~> gs427
mat_update_4(mat=wr0, grad=gs427, x=xvs427, lr=lr) ~> wr0
dot_product(a=gs427, b=gs427) ~> losss427
xvs428 = [0.8421, 0.6842, 0.7684, 0.8632]
tvs428 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs428) ~> ps428
vec_sub(a=ps428, b=tvs428) ~> gs428
mat_update_4(mat=wr0, grad=gs428, x=xvs428, lr=lr) ~> wr0
dot_product(a=gs428, b=gs428) ~> losss428
xvs429 = [0.7684, 0.8632, 0.1368, 0.0105]
tvs429 = [0, 0, 1, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs429) ~> ps429
vec_sub(a=ps429, b=tvs429) ~> gs429
mat_update_4(mat=wr0, grad=gs429, x=xvs429, lr=lr) ~> wr0
dot_product(a=gs429, b=gs429) ~> losss429
xvs430 = [0.1368, 0.0105, 0.9053, 0.6842]
tvs430 = [1, 0, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs430) ~> ps430
vec_sub(a=ps430, b=tvs430) ~> gs430
mat_update_4(mat=wr0, grad=gs430, x=xvs430, lr=lr) ~> wr0
dot_product(a=gs430, b=gs430) ~> losss430
xvs431 = [0.9053, 0.6842, 0.8000, 0.3158]
tvs431 = [0, 0, 1, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs431) ~> ps431
vec_sub(a=ps431, b=tvs431) ~> gs431
mat_update_4(mat=wr0, grad=gs431, x=xvs431, lr=lr) ~> wr0
dot_product(a=gs431, b=gs431) ~> losss431
xvs432 = [0.8000, 0.3158, 0.9053, 0.2000]
tvs432 = [0, 0, 1, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs432) ~> ps432
vec_sub(a=ps432, b=tvs432) ~> gs432
mat_update_4(mat=wr0, grad=gs432, x=xvs432, lr=lr) ~> wr0
dot_product(a=gs432, b=gs432) ~> losss432
xvs433 = [0.9053, 0.2000, 0.1053, 0.0105]
tvs433 = [0, 0, 1, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs433) ~> ps433
vec_sub(a=ps433, b=tvs433) ~> gs433
mat_update_4(mat=wr0, grad=gs433, x=xvs433, lr=lr) ~> wr0
dot_product(a=gs433, b=gs433) ~> losss433
xvs434 = [0.1053, 0.0105, 0.9895, 0.3263]
tvs434 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs434) ~> ps434
vec_sub(a=ps434, b=tvs434) ~> gs434
mat_update_4(mat=wr0, grad=gs434, x=xvs434, lr=lr) ~> wr0
dot_product(a=gs434, b=gs434) ~> losss434
xvs435 = [0.9895, 0.3263, 0.0105, 0.8421]
tvs435 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs435) ~> ps435
vec_sub(a=ps435, b=tvs435) ~> gs435
mat_update_4(mat=wr0, grad=gs435, x=xvs435, lr=lr) ~> wr0
dot_product(a=gs435, b=gs435) ~> losss435
xvs436 = [0.0105, 0.8421, 0.6842, 0.7684]
tvs436 = [0, 0, 1, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs436) ~> ps436
vec_sub(a=ps436, b=tvs436) ~> gs436
mat_update_4(mat=wr0, grad=gs436, x=xvs436, lr=lr) ~> wr0
dot_product(a=gs436, b=gs436) ~> losss436
xvs437 = [0.6842, 0.7684, 0.8632, 0.0000]
tvs437 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs437) ~> ps437
vec_sub(a=ps437, b=tvs437) ~> gs437
mat_update_4(mat=wr0, grad=gs437, x=xvs437, lr=lr) ~> wr0
dot_product(a=gs437, b=gs437) ~> losss437
xvs438 = [0.8632, 0.0000, 0.0105, 0.0105]
tvs438 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs438) ~> ps438
vec_sub(a=ps438, b=tvs438) ~> gs438
mat_update_4(mat=wr0, grad=gs438, x=xvs438, lr=lr) ~> wr0
dot_product(a=gs438, b=gs438) ~> losss438
xvs439 = [0.0105, 0.0105, 0.0105, 0.0105]
tvs439 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs439) ~> ps439
vec_sub(a=ps439, b=tvs439) ~> gs439
mat_update_4(mat=wr0, grad=gs439, x=xvs439, lr=lr) ~> wr0
dot_product(a=gs439, b=gs439) ~> losss439
xvs440 = [0.0105, 0.0105, 0.0105, 0.0105]
tvs440 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs440) ~> ps440
vec_sub(a=ps440, b=tvs440) ~> gs440
mat_update_4(mat=wr0, grad=gs440, x=xvs440, lr=lr) ~> wr0
dot_product(a=gs440, b=gs440) ~> losss440
xvs441 = [0.0105, 0.0105, 0.0105, 0.0105]
tvs441 = [1, 0, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs441) ~> ps441
vec_sub(a=ps441, b=tvs441) ~> gs441
mat_update_4(mat=wr0, grad=gs441, x=xvs441, lr=lr) ~> wr0
dot_product(a=gs441, b=gs441) ~> losss441
xvs442 = [0.0105, 0.0105, 0.8421, 0.6842]
tvs442 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs442) ~> ps442
vec_sub(a=ps442, b=tvs442) ~> gs442
mat_update_4(mat=wr0, grad=gs442, x=xvs442, lr=lr) ~> wr0
dot_product(a=gs442, b=gs442) ~> losss442
xvs443 = [0.8421, 0.6842, 0.7684, 0.8632]
tvs443 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs443) ~> ps443
vec_sub(a=ps443, b=tvs443) ~> gs443
mat_update_4(mat=wr0, grad=gs443, x=xvs443, lr=lr) ~> wr0
dot_product(a=gs443, b=gs443) ~> losss443
xvs444 = [0.7684, 0.8632, 0.0105, 0.3263]
tvs444 = [0, 0, 0, 1]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs444) ~> ps444
vec_sub(a=ps444, b=tvs444) ~> gs444
mat_update_4(mat=wr0, grad=gs444, x=xvs444, lr=lr) ~> wr0
dot_product(a=gs444, b=gs444) ~> losss444
xvs445 = [0.0105, 0.3263, 0.3263, 0.0105]
tvs445 = [0, 0, 1, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs445) ~> ps445
vec_sub(a=ps445, b=tvs445) ~> gs445
mat_update_4(mat=wr0, grad=gs445, x=xvs445, lr=lr) ~> wr0
dot_product(a=gs445, b=gs445) ~> losss445
xvs446 = [0.3263, 0.0105, 0.8211, 0.8316]
tvs446 = [0, 0, 0, 1]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs446) ~> ps446
vec_sub(a=ps446, b=tvs446) ~> gs446
mat_update_4(mat=wr0, grad=gs446, x=xvs446, lr=lr) ~> wr0
dot_product(a=gs446, b=gs446) ~> losss446
xvs447 = [0.8211, 0.8316, 0.9158, 0.0000]
tvs447 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs447) ~> ps447
vec_sub(a=ps447, b=tvs447) ~> gs447
mat_update_4(mat=wr0, grad=gs447, x=xvs447, lr=lr) ~> wr0
dot_product(a=gs447, b=gs447) ~> losss447
xvs448 = [0.9158, 0.0000, 0.0105, 0.0105]
tvs448 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs448) ~> ps448
vec_sub(a=ps448, b=tvs448) ~> gs448
mat_update_4(mat=wr0, grad=gs448, x=xvs448, lr=lr) ~> wr0
dot_product(a=gs448, b=gs448) ~> losss448
xvs449 = [0.0105, 0.0105, 0.0105, 0.0105]
tvs449 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs449) ~> ps449
vec_sub(a=ps449, b=tvs449) ~> gs449
mat_update_4(mat=wr0, grad=gs449, x=xvs449, lr=lr) ~> wr0
dot_product(a=gs449, b=gs449) ~> losss449
xvs450 = [0.0105, 0.0105, 0.9789, 0.0000]
tvs450 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs450) ~> ps450
vec_sub(a=ps450, b=tvs450) ~> gs450
mat_update_4(mat=wr0, grad=gs450, x=xvs450, lr=lr) ~> wr0
dot_product(a=gs450, b=gs450) ~> losss450
xvs451 = [0.9789, 0.0000, 0.0105, 0.0105]
tvs451 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs451) ~> ps451
vec_sub(a=ps451, b=tvs451) ~> gs451
mat_update_4(mat=wr0, grad=gs451, x=xvs451, lr=lr) ~> wr0
dot_product(a=gs451, b=gs451) ~> losss451
xvs452 = [0.0105, 0.0105, 0.0105, 0.0105]
tvs452 = [0, 0, 1, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs452) ~> ps452
vec_sub(a=ps452, b=tvs452) ~> gs452
mat_update_4(mat=wr0, grad=gs452, x=xvs452, lr=lr) ~> wr0
dot_product(a=gs452, b=gs452) ~> losss452
xvs453 = [0.0105, 0.0105, 0.4421, 0.3895]
tvs453 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs453) ~> ps453
vec_sub(a=ps453, b=tvs453) ~> gs453
mat_update_4(mat=wr0, grad=gs453, x=xvs453, lr=lr) ~> wr0
dot_product(a=gs453, b=gs453) ~> losss453
xvs454 = [0.4421, 0.3895, 0.6000, 0.0105]
tvs454 = [0, 0, 0, 1]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs454) ~> ps454
vec_sub(a=ps454, b=tvs454) ~> gs454
mat_update_4(mat=wr0, grad=gs454, x=xvs454, lr=lr) ~> wr0
dot_product(a=gs454, b=gs454) ~> losss454
xvs455 = [0.6000, 0.0105, 0.3263, 0.3263]
tvs455 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs455) ~> ps455
vec_sub(a=ps455, b=tvs455) ~> gs455
mat_update_4(mat=wr0, grad=gs455, x=xvs455, lr=lr) ~> wr0
dot_product(a=gs455, b=gs455) ~> losss455
xvs456 = [0.3263, 0.3263, 0.0105, 0.8316]
tvs456 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs456) ~> ps456
vec_sub(a=ps456, b=tvs456) ~> gs456
mat_update_4(mat=wr0, grad=gs456, x=xvs456, lr=lr) ~> wr0
dot_product(a=gs456, b=gs456) ~> losss456
xvs457 = [0.0105, 0.8316, 0.8947, 0.8842]
tvs457 = [1, 0, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs457) ~> ps457
vec_sub(a=ps457, b=tvs457) ~> gs457
mat_update_4(mat=wr0, grad=gs457, x=xvs457, lr=lr) ~> wr0
dot_product(a=gs457, b=gs457) ~> losss457
xvs458 = [0.8947, 0.8842, 0.0000, 0.9789]
tvs458 = [1, 0, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs458) ~> ps458
vec_sub(a=ps458, b=tvs458) ~> gs458
mat_update_4(mat=wr0, grad=gs458, x=xvs458, lr=lr) ~> wr0
dot_product(a=gs458, b=gs458) ~> losss458
xvs459 = [0.0000, 0.9789, 0.0000, 0.0000]
tvs459 = [0, 0, 1, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs459) ~> ps459
vec_sub(a=ps459, b=tvs459) ~> gs459
mat_update_4(mat=wr0, grad=gs459, x=xvs459, lr=lr) ~> wr0
dot_product(a=gs459, b=gs459) ~> losss459
xvs460 = [0.0000, 0.0000, 0.7368, 0.8947]
tvs460 = [0, 0, 1, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs460) ~> ps460
vec_sub(a=ps460, b=tvs460) ~> gs460
mat_update_4(mat=wr0, grad=gs460, x=xvs460, lr=lr) ~> wr0
dot_product(a=gs460, b=gs460) ~> losss460
xvs461 = [0.7368, 0.8947, 0.8211, 0.7053]
tvs461 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs461) ~> ps461
vec_sub(a=ps461, b=tvs461) ~> gs461
mat_update_4(mat=wr0, grad=gs461, x=xvs461, lr=lr) ~> wr0
dot_product(a=gs461, b=gs461) ~> losss461
xvs462 = [0.8211, 0.7053, 0.0105, 0.7368]
tvs462 = [1, 0, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs462) ~> ps462
vec_sub(a=ps462, b=tvs462) ~> gs462
mat_update_4(mat=wr0, grad=gs462, x=xvs462, lr=lr) ~> wr0
dot_product(a=gs462, b=gs462) ~> losss462
xvs463 = [0.0105, 0.7368, 0.8000, 0.6842]
tvs463 = [1, 0, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs463) ~> ps463
vec_sub(a=ps463, b=tvs463) ~> gs463
mat_update_4(mat=wr0, grad=gs463, x=xvs463, lr=lr) ~> wr0
dot_product(a=gs463, b=gs463) ~> losss463
xvs464 = [0.8000, 0.6842, 0.8842, 0.8842]
tvs464 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs464) ~> ps464
vec_sub(a=ps464, b=tvs464) ~> gs464
mat_update_4(mat=wr0, grad=gs464, x=xvs464, lr=lr) ~> wr0
dot_product(a=gs464, b=gs464) ~> losss464
xvs465 = [0.8842, 0.8842, 0.7263, 0.8211]
tvs465 = [1, 0, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs465) ~> ps465
vec_sub(a=ps465, b=tvs465) ~> gs465
mat_update_4(mat=wr0, grad=gs465, x=xvs465, lr=lr) ~> wr0
dot_product(a=gs465, b=gs465) ~> losss465
xvs466 = [0.7263, 0.8211, 0.6737, 0.7158]
tvs466 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs466) ~> ps466
vec_sub(a=ps466, b=tvs466) ~> gs466
mat_update_4(mat=wr0, grad=gs466, x=xvs466, lr=lr) ~> wr0
dot_product(a=gs466, b=gs466) ~> losss466
xvs467 = [0.6737, 0.7158, 0.7263, 0.7263]
tvs467 = [1, 0, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs467) ~> ps467
vec_sub(a=ps467, b=tvs467) ~> gs467
mat_update_4(mat=wr0, grad=gs467, x=xvs467, lr=lr) ~> wr0
dot_product(a=gs467, b=gs467) ~> losss467
xvs468 = [0.7263, 0.7263, 0.8421, 0.0947]
tvs468 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs468) ~> ps468
vec_sub(a=ps468, b=tvs468) ~> gs468
mat_update_4(mat=wr0, grad=gs468, x=xvs468, lr=lr) ~> wr0
dot_product(a=gs468, b=gs468) ~> losss468
xvs469 = [0.8421, 0.0947, 0.6842, 0.8632]
tvs469 = [0, 0, 1, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs469) ~> ps469
vec_sub(a=ps469, b=tvs469) ~> gs469
mat_update_4(mat=wr0, grad=gs469, x=xvs469, lr=lr) ~> wr0
dot_product(a=gs469, b=gs469) ~> losss469
xvs470 = [0.6842, 0.8632, 0.8632, 0.1053]
tvs470 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs470) ~> ps470
vec_sub(a=ps470, b=tvs470) ~> gs470
mat_update_4(mat=wr0, grad=gs470, x=xvs470, lr=lr) ~> wr0
dot_product(a=gs470, b=gs470) ~> losss470
xvs471 = [0.8632, 0.1053, 0.0105, 0.9579]
tvs471 = [1, 0, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs471) ~> ps471
vec_sub(a=ps471, b=tvs471) ~> gs471
mat_update_4(mat=wr0, grad=gs471, x=xvs471, lr=lr) ~> wr0
dot_product(a=gs471, b=gs471) ~> losss471
xvs472 = [0.0105, 0.9579, 0.0000, 0.0105]
tvs472 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs472) ~> ps472
vec_sub(a=ps472, b=tvs472) ~> gs472
mat_update_4(mat=wr0, grad=gs472, x=xvs472, lr=lr) ~> wr0
dot_product(a=gs472, b=gs472) ~> losss472
xvs473 = [0.0000, 0.0105, 0.0105, 0.0105]
tvs473 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs473) ~> ps473
vec_sub(a=ps473, b=tvs473) ~> gs473
mat_update_4(mat=wr0, grad=gs473, x=xvs473, lr=lr) ~> wr0
dot_product(a=gs473, b=gs473) ~> losss473
xvs474 = [0.0105, 0.0105, 0.0105, 0.8421]
tvs474 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs474) ~> ps474
vec_sub(a=ps474, b=tvs474) ~> gs474
mat_update_4(mat=wr0, grad=gs474, x=xvs474, lr=lr) ~> wr0
dot_product(a=gs474, b=gs474) ~> losss474
xvs475 = [0.0105, 0.8421, 0.6842, 0.8737]
tvs475 = [1, 0, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs475) ~> ps475
vec_sub(a=ps475, b=tvs475) ~> gs475
mat_update_4(mat=wr0, grad=gs475, x=xvs475, lr=lr) ~> wr0
dot_product(a=gs475, b=gs475) ~> losss475
xvs476 = [0.6842, 0.8737, 0.8842, 0.0947]
tvs476 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs476) ~> ps476
vec_sub(a=ps476, b=tvs476) ~> gs476
mat_update_4(mat=wr0, grad=gs476, x=xvs476, lr=lr) ~> wr0
dot_product(a=gs476, b=gs476) ~> losss476
xvs477 = [0.8842, 0.0947, 0.6842, 0.8632]
tvs477 = [0, 0, 1, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs477) ~> ps477
vec_sub(a=ps477, b=tvs477) ~> gs477
mat_update_4(mat=wr0, grad=gs477, x=xvs477, lr=lr) ~> wr0
dot_product(a=gs477, b=gs477) ~> losss477
xvs478 = [0.6842, 0.8632, 0.8632, 0.1053]
tvs478 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs478) ~> ps478
vec_sub(a=ps478, b=tvs478) ~> gs478
mat_update_4(mat=wr0, grad=gs478, x=xvs478, lr=lr) ~> wr0
dot_product(a=gs478, b=gs478) ~> losss478
xvs479 = [0.8632, 0.1053, 0.0105, 0.9895]
tvs479 = [0, 0, 0, 1]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs479) ~> ps479
vec_sub(a=ps479, b=tvs479) ~> gs479
mat_update_4(mat=wr0, grad=gs479, x=xvs479, lr=lr) ~> wr0
dot_product(a=gs479, b=gs479) ~> losss479
xvs480 = [0.0105, 0.9895, 0.3263, 0.0105]
tvs480 = [0, 0, 1, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs480) ~> ps480
vec_sub(a=ps480, b=tvs480) ~> gs480
mat_update_4(mat=wr0, grad=gs480, x=xvs480, lr=lr) ~> wr0
dot_product(a=gs480, b=gs480) ~> losss480
xvs481 = [0.3263, 0.0105, 0.3579, 0.1895]
tvs481 = [1, 0, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs481) ~> ps481
vec_sub(a=ps481, b=tvs481) ~> gs481
mat_update_4(mat=wr0, grad=gs481, x=xvs481, lr=lr) ~> wr0
dot_product(a=gs481, b=gs481) ~> losss481
xvs482 = [0.3579, 0.1895, 0.0000, 0.0105]
tvs482 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs482) ~> ps482
vec_sub(a=ps482, b=tvs482) ~> gs482
mat_update_4(mat=wr0, grad=gs482, x=xvs482, lr=lr) ~> wr0
dot_product(a=gs482, b=gs482) ~> losss482
xvs483 = [0.0000, 0.0105, 0.0105, 0.0105]
tvs483 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs483) ~> ps483
vec_sub(a=ps483, b=tvs483) ~> gs483
mat_update_4(mat=wr0, grad=gs483, x=xvs483, lr=lr) ~> wr0
dot_product(a=gs483, b=gs483) ~> losss483
xvs484 = [0.0105, 0.0105, 0.0105, 0.7368]
tvs484 = [1, 0, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs484) ~> ps484
vec_sub(a=ps484, b=tvs484) ~> gs484
mat_update_4(mat=wr0, grad=gs484, x=xvs484, lr=lr) ~> wr0
dot_product(a=gs484, b=gs484) ~> losss484
xvs485 = [0.0105, 0.7368, 0.8000, 0.6842]
tvs485 = [1, 0, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs485) ~> ps485
vec_sub(a=ps485, b=tvs485) ~> gs485
mat_update_4(mat=wr0, grad=gs485, x=xvs485, lr=lr) ~> wr0
dot_product(a=gs485, b=gs485) ~> losss485
xvs486 = [0.8000, 0.6842, 0.8842, 0.8842]
tvs486 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs486) ~> ps486
vec_sub(a=ps486, b=tvs486) ~> gs486
mat_update_4(mat=wr0, grad=gs486, x=xvs486, lr=lr) ~> wr0
dot_product(a=gs486, b=gs486) ~> losss486
xvs487 = [0.8842, 0.8842, 0.7263, 0.8211]
tvs487 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs487) ~> ps487
vec_sub(a=ps487, b=tvs487) ~> gs487
mat_update_4(mat=wr0, grad=gs487, x=xvs487, lr=lr) ~> wr0
dot_product(a=gs487, b=gs487) ~> losss487
xvs488 = [0.7263, 0.8211, 0.0947, 0.6842]
tvs488 = [0, 0, 1, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs488) ~> ps488
vec_sub(a=ps488, b=tvs488) ~> gs488
mat_update_4(mat=wr0, grad=gs488, x=xvs488, lr=lr) ~> wr0
dot_product(a=gs488, b=gs488) ~> losss488
xvs489 = [0.0947, 0.6842, 0.8632, 0.8632]
tvs489 = [0, 0, 1, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs489) ~> ps489
vec_sub(a=ps489, b=tvs489) ~> gs489
mat_update_4(mat=wr0, grad=gs489, x=xvs489, lr=lr) ~> wr0
dot_product(a=gs489, b=gs489) ~> losss489
xvs490 = [0.8632, 0.8632, 0.3158, 0.3579]
tvs490 = [0, 0, 1, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs490) ~> ps490
vec_sub(a=ps490, b=tvs490) ~> gs490
mat_update_4(mat=wr0, grad=gs490, x=xvs490, lr=lr) ~> wr0
dot_product(a=gs490, b=gs490) ~> losss490
xvs491 = [0.3158, 0.3579, 0.1895, 0.1053]
tvs491 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs491) ~> ps491
vec_sub(a=ps491, b=tvs491) ~> gs491
mat_update_4(mat=wr0, grad=gs491, x=xvs491, lr=lr) ~> wr0
dot_product(a=gs491, b=gs491) ~> losss491
xvs492 = [0.1895, 0.1053, 0.0105, 0.9895]
tvs492 = [0, 0, 0, 1]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs492) ~> ps492
vec_sub(a=ps492, b=tvs492) ~> gs492
mat_update_4(mat=wr0, grad=gs492, x=xvs492, lr=lr) ~> wr0
dot_product(a=gs492, b=gs492) ~> losss492
xvs493 = [0.0105, 0.9895, 0.3263, 0.0105]
tvs493 = [1, 0, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs493) ~> ps493
vec_sub(a=ps493, b=tvs493) ~> gs493
mat_update_4(mat=wr0, grad=gs493, x=xvs493, lr=lr) ~> wr0
dot_product(a=gs493, b=gs493) ~> losss493
xvs494 = [0.3263, 0.0105, 0.5053, 0.1895]
tvs494 = [1, 0, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs494) ~> ps494
vec_sub(a=ps494, b=tvs494) ~> gs494
mat_update_4(mat=wr0, grad=gs494, x=xvs494, lr=lr) ~> wr0
dot_product(a=gs494, b=gs494) ~> losss494
xvs495 = [0.5053, 0.1895, 0.0000, 0.0105]
tvs495 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs495) ~> ps495
vec_sub(a=ps495, b=tvs495) ~> gs495
mat_update_4(mat=wr0, grad=gs495, x=xvs495, lr=lr) ~> wr0
dot_product(a=gs495, b=gs495) ~> losss495
xvs496 = [0.0000, 0.0105, 0.0105, 0.0105]
tvs496 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs496) ~> ps496
vec_sub(a=ps496, b=tvs496) ~> gs496
mat_update_4(mat=wr0, grad=gs496, x=xvs496, lr=lr) ~> wr0
dot_product(a=gs496, b=gs496) ~> losss496
xvs497 = [0.0105, 0.0105, 0.0105, 0.7368]
tvs497 = [1, 0, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs497) ~> ps497
vec_sub(a=ps497, b=tvs497) ~> gs497
mat_update_4(mat=wr0, grad=gs497, x=xvs497, lr=lr) ~> wr0
dot_product(a=gs497, b=gs497) ~> losss497
xvs498 = [0.0105, 0.7368, 0.8000, 0.6842]
tvs498 = [1, 0, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs498) ~> ps498
vec_sub(a=ps498, b=tvs498) ~> gs498
mat_update_4(mat=wr0, grad=gs498, x=xvs498, lr=lr) ~> wr0
dot_product(a=gs498, b=gs498) ~> losss498
xvs499 = [0.8000, 0.6842, 0.8842, 0.8842]
tvs499 = [0, 1, 0, 0]
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=xvs499) ~> ps499
vec_sub(a=ps499, b=tvs499) ~> gs499
mat_update_4(mat=wr0, grad=gs499, x=xvs499, lr=lr) ~> wr0
dot_product(a=gs499, b=gs499) ~> losss499
[T+]
show shall(loss0)
show shall(loss499)
show shall(wr0)