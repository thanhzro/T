[T-]
import "lib/basic/std.t"
import "lib/advanced/ml_t.t"
row0 = [0.5, 0.3, 0.2, 0.1]
row1 = [0.1, 0.5, 0.3, 0.1]
row2 = [0.2, 0.1, 0.5, 0.2]
row3 = [0.1, 0.2, 0.1, 0.5]
bv = [0, 0, 0, 0]
lr = 0.3
xa = [1, 0, 0, 0]
ta = [0, 1, 0, 0]
xb = [0, 1, 0, 0]
tb = [0, 0, 1, 0]
xc = [0, 0, 1, 0]
tc = [0, 0, 0, 1]
xd = [0, 0, 0, 1]
td = [1, 0, 0, 0]
[T0]
linear_rows(r0=row0, r1=row1, r2=row2, r3=row3, bv=bv, x=xa) ~> _p00
vec_sub(a=_p00, b=ta) ~> _g00
get(arr=_g00, idx=0) ~> _gs000
vec_scale(a=xa, s=_gs000) ~> _rg000
sgd_update(weights=row0, grad=_rg000, lr=lr) ~> _nr000
get(arr=_g00, idx=1) ~> _gs001
vec_scale(a=xa, s=_gs001) ~> _rg001
sgd_update(weights=row1, grad=_rg001, lr=lr) ~> _nr001
get(arr=_g00, idx=2) ~> _gs002
vec_scale(a=xa, s=_gs002) ~> _rg002
sgd_update(weights=row2, grad=_rg002, lr=lr) ~> _nr002
get(arr=_g00, idx=3) ~> _gs003
vec_scale(a=xa, s=_gs003) ~> _rg003
sgd_update(weights=row3, grad=_rg003, lr=lr) ~> _nr003
linear_rows(r0=_nr000, r1=_nr001, r2=_nr002, r3=_nr003, bv=bv, x=xb) ~> _p01
vec_sub(a=_p01, b=tb) ~> _g01
get(arr=_g01, idx=0) ~> _gs010
vec_scale(a=xb, s=_gs010) ~> _rg010
sgd_update(weights=_nr000, grad=_rg010, lr=lr) ~> _nr010
get(arr=_g01, idx=1) ~> _gs011
vec_scale(a=xb, s=_gs011) ~> _rg011
sgd_update(weights=_nr001, grad=_rg011, lr=lr) ~> _nr011
get(arr=_g01, idx=2) ~> _gs012
vec_scale(a=xb, s=_gs012) ~> _rg012
sgd_update(weights=_nr002, grad=_rg012, lr=lr) ~> _nr012
get(arr=_g01, idx=3) ~> _gs013
vec_scale(a=xb, s=_gs013) ~> _rg013
sgd_update(weights=_nr003, grad=_rg013, lr=lr) ~> _nr013
linear_rows(r0=_nr010, r1=_nr011, r2=_nr012, r3=_nr013, bv=bv, x=xc) ~> _p02
vec_sub(a=_p02, b=tc) ~> _g02
get(arr=_g02, idx=0) ~> _gs020
vec_scale(a=xc, s=_gs020) ~> _rg020
sgd_update(weights=_nr010, grad=_rg020, lr=lr) ~> _nr020
get(arr=_g02, idx=1) ~> _gs021
vec_scale(a=xc, s=_gs021) ~> _rg021
sgd_update(weights=_nr011, grad=_rg021, lr=lr) ~> _nr021
get(arr=_g02, idx=2) ~> _gs022
vec_scale(a=xc, s=_gs022) ~> _rg022
sgd_update(weights=_nr012, grad=_rg022, lr=lr) ~> _nr022
get(arr=_g02, idx=3) ~> _gs023
vec_scale(a=xc, s=_gs023) ~> _rg023
sgd_update(weights=_nr013, grad=_rg023, lr=lr) ~> _nr023
linear_rows(r0=_nr020, r1=_nr021, r2=_nr022, r3=_nr023, bv=bv, x=xd) ~> _p03
vec_sub(a=_p03, b=td) ~> _g03
get(arr=_g03, idx=0) ~> _gs030
vec_scale(a=xd, s=_gs030) ~> _rg030
sgd_update(weights=_nr020, grad=_rg030, lr=lr) ~> _nr030
get(arr=_g03, idx=1) ~> _gs031
vec_scale(a=xd, s=_gs031) ~> _rg031
sgd_update(weights=_nr021, grad=_rg031, lr=lr) ~> _nr031
get(arr=_g03, idx=2) ~> _gs032
vec_scale(a=xd, s=_gs032) ~> _rg032
sgd_update(weights=_nr022, grad=_rg032, lr=lr) ~> _nr032
get(arr=_g03, idx=3) ~> _gs033
vec_scale(a=xd, s=_gs033) ~> _rg033
sgd_update(weights=_nr023, grad=_rg033, lr=lr) ~> _nr033
linear_rows(r0=_nr030, r1=_nr031, r2=_nr032, r3=_nr033, bv=bv, x=xa) ~> _p10
vec_sub(a=_p10, b=ta) ~> _g10
get(arr=_g10, idx=0) ~> _gs100
vec_scale(a=xa, s=_gs100) ~> _rg100
sgd_update(weights=_nr030, grad=_rg100, lr=lr) ~> _nr100
get(arr=_g10, idx=1) ~> _gs101
vec_scale(a=xa, s=_gs101) ~> _rg101
sgd_update(weights=_nr031, grad=_rg101, lr=lr) ~> _nr101
get(arr=_g10, idx=2) ~> _gs102
vec_scale(a=xa, s=_gs102) ~> _rg102
sgd_update(weights=_nr032, grad=_rg102, lr=lr) ~> _nr102
get(arr=_g10, idx=3) ~> _gs103
vec_scale(a=xa, s=_gs103) ~> _rg103
sgd_update(weights=_nr033, grad=_rg103, lr=lr) ~> _nr103
linear_rows(r0=_nr100, r1=_nr101, r2=_nr102, r3=_nr103, bv=bv, x=xb) ~> _p11
vec_sub(a=_p11, b=tb) ~> _g11
get(arr=_g11, idx=0) ~> _gs110
vec_scale(a=xb, s=_gs110) ~> _rg110
sgd_update(weights=_nr100, grad=_rg110, lr=lr) ~> _nr110
get(arr=_g11, idx=1) ~> _gs111
vec_scale(a=xb, s=_gs111) ~> _rg111
sgd_update(weights=_nr101, grad=_rg111, lr=lr) ~> _nr111
get(arr=_g11, idx=2) ~> _gs112
vec_scale(a=xb, s=_gs112) ~> _rg112
sgd_update(weights=_nr102, grad=_rg112, lr=lr) ~> _nr112
get(arr=_g11, idx=3) ~> _gs113
vec_scale(a=xb, s=_gs113) ~> _rg113
sgd_update(weights=_nr103, grad=_rg113, lr=lr) ~> _nr113
linear_rows(r0=_nr110, r1=_nr111, r2=_nr112, r3=_nr113, bv=bv, x=xc) ~> _p12
vec_sub(a=_p12, b=tc) ~> _g12
get(arr=_g12, idx=0) ~> _gs120
vec_scale(a=xc, s=_gs120) ~> _rg120
sgd_update(weights=_nr110, grad=_rg120, lr=lr) ~> _nr120
get(arr=_g12, idx=1) ~> _gs121
vec_scale(a=xc, s=_gs121) ~> _rg121
sgd_update(weights=_nr111, grad=_rg121, lr=lr) ~> _nr121
get(arr=_g12, idx=2) ~> _gs122
vec_scale(a=xc, s=_gs122) ~> _rg122
sgd_update(weights=_nr112, grad=_rg122, lr=lr) ~> _nr122
get(arr=_g12, idx=3) ~> _gs123
vec_scale(a=xc, s=_gs123) ~> _rg123
sgd_update(weights=_nr113, grad=_rg123, lr=lr) ~> _nr123
linear_rows(r0=_nr120, r1=_nr121, r2=_nr122, r3=_nr123, bv=bv, x=xd) ~> _p13
vec_sub(a=_p13, b=td) ~> _g13
get(arr=_g13, idx=0) ~> _gs130
vec_scale(a=xd, s=_gs130) ~> _rg130
sgd_update(weights=_nr120, grad=_rg130, lr=lr) ~> _nr130
get(arr=_g13, idx=1) ~> _gs131
vec_scale(a=xd, s=_gs131) ~> _rg131
sgd_update(weights=_nr121, grad=_rg131, lr=lr) ~> _nr131
get(arr=_g13, idx=2) ~> _gs132
vec_scale(a=xd, s=_gs132) ~> _rg132
sgd_update(weights=_nr122, grad=_rg132, lr=lr) ~> _nr132
get(arr=_g13, idx=3) ~> _gs133
vec_scale(a=xd, s=_gs133) ~> _rg133
sgd_update(weights=_nr123, grad=_rg133, lr=lr) ~> _nr133
linear_rows(r0=_nr130, r1=_nr131, r2=_nr132, r3=_nr133, bv=bv, x=xa) ~> _p20
vec_sub(a=_p20, b=ta) ~> _g20
get(arr=_g20, idx=0) ~> _gs200
vec_scale(a=xa, s=_gs200) ~> _rg200
sgd_update(weights=_nr130, grad=_rg200, lr=lr) ~> _nr200
get(arr=_g20, idx=1) ~> _gs201
vec_scale(a=xa, s=_gs201) ~> _rg201
sgd_update(weights=_nr131, grad=_rg201, lr=lr) ~> _nr201
get(arr=_g20, idx=2) ~> _gs202
vec_scale(a=xa, s=_gs202) ~> _rg202
sgd_update(weights=_nr132, grad=_rg202, lr=lr) ~> _nr202
get(arr=_g20, idx=3) ~> _gs203
vec_scale(a=xa, s=_gs203) ~> _rg203
sgd_update(weights=_nr133, grad=_rg203, lr=lr) ~> _nr203
linear_rows(r0=_nr200, r1=_nr201, r2=_nr202, r3=_nr203, bv=bv, x=xb) ~> _p21
vec_sub(a=_p21, b=tb) ~> _g21
get(arr=_g21, idx=0) ~> _gs210
vec_scale(a=xb, s=_gs210) ~> _rg210
sgd_update(weights=_nr200, grad=_rg210, lr=lr) ~> _nr210
get(arr=_g21, idx=1) ~> _gs211
vec_scale(a=xb, s=_gs211) ~> _rg211
sgd_update(weights=_nr201, grad=_rg211, lr=lr) ~> _nr211
get(arr=_g21, idx=2) ~> _gs212
vec_scale(a=xb, s=_gs212) ~> _rg212
sgd_update(weights=_nr202, grad=_rg212, lr=lr) ~> _nr212
get(arr=_g21, idx=3) ~> _gs213
vec_scale(a=xb, s=_gs213) ~> _rg213
sgd_update(weights=_nr203, grad=_rg213, lr=lr) ~> _nr213
linear_rows(r0=_nr210, r1=_nr211, r2=_nr212, r3=_nr213, bv=bv, x=xc) ~> _p22
vec_sub(a=_p22, b=tc) ~> _g22
get(arr=_g22, idx=0) ~> _gs220
vec_scale(a=xc, s=_gs220) ~> _rg220
sgd_update(weights=_nr210, grad=_rg220, lr=lr) ~> _nr220
get(arr=_g22, idx=1) ~> _gs221
vec_scale(a=xc, s=_gs221) ~> _rg221
sgd_update(weights=_nr211, grad=_rg221, lr=lr) ~> _nr221
get(arr=_g22, idx=2) ~> _gs222
vec_scale(a=xc, s=_gs222) ~> _rg222
sgd_update(weights=_nr212, grad=_rg222, lr=lr) ~> _nr222
get(arr=_g22, idx=3) ~> _gs223
vec_scale(a=xc, s=_gs223) ~> _rg223
sgd_update(weights=_nr213, grad=_rg223, lr=lr) ~> _nr223
linear_rows(r0=_nr220, r1=_nr221, r2=_nr222, r3=_nr223, bv=bv, x=xd) ~> _p23
vec_sub(a=_p23, b=td) ~> _g23
get(arr=_g23, idx=0) ~> _gs230
vec_scale(a=xd, s=_gs230) ~> _rg230
sgd_update(weights=_nr220, grad=_rg230, lr=lr) ~> _nr230
get(arr=_g23, idx=1) ~> _gs231
vec_scale(a=xd, s=_gs231) ~> _rg231
sgd_update(weights=_nr221, grad=_rg231, lr=lr) ~> _nr231
get(arr=_g23, idx=2) ~> _gs232
vec_scale(a=xd, s=_gs232) ~> _rg232
sgd_update(weights=_nr222, grad=_rg232, lr=lr) ~> _nr232
get(arr=_g23, idx=3) ~> _gs233
vec_scale(a=xd, s=_gs233) ~> _rg233
sgd_update(weights=_nr223, grad=_rg233, lr=lr) ~> _nr233
linear_rows(r0=_nr230, r1=_nr231, r2=_nr232, r3=_nr233, bv=bv, x=xa) ~> _p30
vec_sub(a=_p30, b=ta) ~> _g30
get(arr=_g30, idx=0) ~> _gs300
vec_scale(a=xa, s=_gs300) ~> _rg300
sgd_update(weights=_nr230, grad=_rg300, lr=lr) ~> _nr300
get(arr=_g30, idx=1) ~> _gs301
vec_scale(a=xa, s=_gs301) ~> _rg301
sgd_update(weights=_nr231, grad=_rg301, lr=lr) ~> _nr301
get(arr=_g30, idx=2) ~> _gs302
vec_scale(a=xa, s=_gs302) ~> _rg302
sgd_update(weights=_nr232, grad=_rg302, lr=lr) ~> _nr302
get(arr=_g30, idx=3) ~> _gs303
vec_scale(a=xa, s=_gs303) ~> _rg303
sgd_update(weights=_nr233, grad=_rg303, lr=lr) ~> _nr303
linear_rows(r0=_nr300, r1=_nr301, r2=_nr302, r3=_nr303, bv=bv, x=xb) ~> _p31
vec_sub(a=_p31, b=tb) ~> _g31
get(arr=_g31, idx=0) ~> _gs310
vec_scale(a=xb, s=_gs310) ~> _rg310
sgd_update(weights=_nr300, grad=_rg310, lr=lr) ~> _nr310
get(arr=_g31, idx=1) ~> _gs311
vec_scale(a=xb, s=_gs311) ~> _rg311
sgd_update(weights=_nr301, grad=_rg311, lr=lr) ~> _nr311
get(arr=_g31, idx=2) ~> _gs312
vec_scale(a=xb, s=_gs312) ~> _rg312
sgd_update(weights=_nr302, grad=_rg312, lr=lr) ~> _nr312
get(arr=_g31, idx=3) ~> _gs313
vec_scale(a=xb, s=_gs313) ~> _rg313
sgd_update(weights=_nr303, grad=_rg313, lr=lr) ~> _nr313
linear_rows(r0=_nr310, r1=_nr311, r2=_nr312, r3=_nr313, bv=bv, x=xc) ~> _p32
vec_sub(a=_p32, b=tc) ~> _g32
get(arr=_g32, idx=0) ~> _gs320
vec_scale(a=xc, s=_gs320) ~> _rg320
sgd_update(weights=_nr310, grad=_rg320, lr=lr) ~> _nr320
get(arr=_g32, idx=1) ~> _gs321
vec_scale(a=xc, s=_gs321) ~> _rg321
sgd_update(weights=_nr311, grad=_rg321, lr=lr) ~> _nr321
get(arr=_g32, idx=2) ~> _gs322
vec_scale(a=xc, s=_gs322) ~> _rg322
sgd_update(weights=_nr312, grad=_rg322, lr=lr) ~> _nr322
get(arr=_g32, idx=3) ~> _gs323
vec_scale(a=xc, s=_gs323) ~> _rg323
sgd_update(weights=_nr313, grad=_rg323, lr=lr) ~> _nr323
linear_rows(r0=_nr320, r1=_nr321, r2=_nr322, r3=_nr323, bv=bv, x=xd) ~> _p33
vec_sub(a=_p33, b=td) ~> _g33
get(arr=_g33, idx=0) ~> _gs330
vec_scale(a=xd, s=_gs330) ~> _rg330
sgd_update(weights=_nr320, grad=_rg330, lr=lr) ~> _nr330
get(arr=_g33, idx=1) ~> _gs331
vec_scale(a=xd, s=_gs331) ~> _rg331
sgd_update(weights=_nr321, grad=_rg331, lr=lr) ~> _nr331
get(arr=_g33, idx=2) ~> _gs332
vec_scale(a=xd, s=_gs332) ~> _rg332
sgd_update(weights=_nr322, grad=_rg332, lr=lr) ~> _nr332
get(arr=_g33, idx=3) ~> _gs333
vec_scale(a=xd, s=_gs333) ~> _rg333
sgd_update(weights=_nr323, grad=_rg333, lr=lr) ~> _nr333
linear_rows(r0=_nr330, r1=_nr331, r2=_nr332, r3=_nr333, bv=bv, x=xa) ~> _p40
vec_sub(a=_p40, b=ta) ~> _g40
get(arr=_g40, idx=0) ~> _gs400
vec_scale(a=xa, s=_gs400) ~> _rg400
sgd_update(weights=_nr330, grad=_rg400, lr=lr) ~> _nr400
get(arr=_g40, idx=1) ~> _gs401
vec_scale(a=xa, s=_gs401) ~> _rg401
sgd_update(weights=_nr331, grad=_rg401, lr=lr) ~> _nr401
get(arr=_g40, idx=2) ~> _gs402
vec_scale(a=xa, s=_gs402) ~> _rg402
sgd_update(weights=_nr332, grad=_rg402, lr=lr) ~> _nr402
get(arr=_g40, idx=3) ~> _gs403
vec_scale(a=xa, s=_gs403) ~> _rg403
sgd_update(weights=_nr333, grad=_rg403, lr=lr) ~> _nr403
linear_rows(r0=_nr400, r1=_nr401, r2=_nr402, r3=_nr403, bv=bv, x=xb) ~> _p41
vec_sub(a=_p41, b=tb) ~> _g41
get(arr=_g41, idx=0) ~> _gs410
vec_scale(a=xb, s=_gs410) ~> _rg410
sgd_update(weights=_nr400, grad=_rg410, lr=lr) ~> _nr410
get(arr=_g41, idx=1) ~> _gs411
vec_scale(a=xb, s=_gs411) ~> _rg411
sgd_update(weights=_nr401, grad=_rg411, lr=lr) ~> _nr411
get(arr=_g41, idx=2) ~> _gs412
vec_scale(a=xb, s=_gs412) ~> _rg412
sgd_update(weights=_nr402, grad=_rg412, lr=lr) ~> _nr412
get(arr=_g41, idx=3) ~> _gs413
vec_scale(a=xb, s=_gs413) ~> _rg413
sgd_update(weights=_nr403, grad=_rg413, lr=lr) ~> _nr413
linear_rows(r0=_nr410, r1=_nr411, r2=_nr412, r3=_nr413, bv=bv, x=xc) ~> _p42
vec_sub(a=_p42, b=tc) ~> _g42
get(arr=_g42, idx=0) ~> _gs420
vec_scale(a=xc, s=_gs420) ~> _rg420
sgd_update(weights=_nr410, grad=_rg420, lr=lr) ~> _nr420
get(arr=_g42, idx=1) ~> _gs421
vec_scale(a=xc, s=_gs421) ~> _rg421
sgd_update(weights=_nr411, grad=_rg421, lr=lr) ~> _nr421
get(arr=_g42, idx=2) ~> _gs422
vec_scale(a=xc, s=_gs422) ~> _rg422
sgd_update(weights=_nr412, grad=_rg422, lr=lr) ~> _nr422
get(arr=_g42, idx=3) ~> _gs423
vec_scale(a=xc, s=_gs423) ~> _rg423
sgd_update(weights=_nr413, grad=_rg423, lr=lr) ~> _nr423
linear_rows(r0=_nr420, r1=_nr421, r2=_nr422, r3=_nr423, bv=bv, x=xd) ~> _p43
vec_sub(a=_p43, b=td) ~> _g43
get(arr=_g43, idx=0) ~> _gs430
vec_scale(a=xd, s=_gs430) ~> _rg430
sgd_update(weights=_nr420, grad=_rg430, lr=lr) ~> _nr430
get(arr=_g43, idx=1) ~> _gs431
vec_scale(a=xd, s=_gs431) ~> _rg431
sgd_update(weights=_nr421, grad=_rg431, lr=lr) ~> _nr431
get(arr=_g43, idx=2) ~> _gs432
vec_scale(a=xd, s=_gs432) ~> _rg432
sgd_update(weights=_nr422, grad=_rg432, lr=lr) ~> _nr432
get(arr=_g43, idx=3) ~> _gs433
vec_scale(a=xd, s=_gs433) ~> _rg433
sgd_update(weights=_nr423, grad=_rg433, lr=lr) ~> _nr433
linear_rows(r0=_nr430, r1=_nr431, r2=_nr432, r3=_nr433, bv=bv, x=xa) ~> _p50
vec_sub(a=_p50, b=ta) ~> _g50
get(arr=_g50, idx=0) ~> _gs500
vec_scale(a=xa, s=_gs500) ~> _rg500
sgd_update(weights=_nr430, grad=_rg500, lr=lr) ~> _nr500
get(arr=_g50, idx=1) ~> _gs501
vec_scale(a=xa, s=_gs501) ~> _rg501
sgd_update(weights=_nr431, grad=_rg501, lr=lr) ~> _nr501
get(arr=_g50, idx=2) ~> _gs502
vec_scale(a=xa, s=_gs502) ~> _rg502
sgd_update(weights=_nr432, grad=_rg502, lr=lr) ~> _nr502
get(arr=_g50, idx=3) ~> _gs503
vec_scale(a=xa, s=_gs503) ~> _rg503
sgd_update(weights=_nr433, grad=_rg503, lr=lr) ~> _nr503
linear_rows(r0=_nr500, r1=_nr501, r2=_nr502, r3=_nr503, bv=bv, x=xb) ~> _p51
vec_sub(a=_p51, b=tb) ~> _g51
get(arr=_g51, idx=0) ~> _gs510
vec_scale(a=xb, s=_gs510) ~> _rg510
sgd_update(weights=_nr500, grad=_rg510, lr=lr) ~> _nr510
get(arr=_g51, idx=1) ~> _gs511
vec_scale(a=xb, s=_gs511) ~> _rg511
sgd_update(weights=_nr501, grad=_rg511, lr=lr) ~> _nr511
get(arr=_g51, idx=2) ~> _gs512
vec_scale(a=xb, s=_gs512) ~> _rg512
sgd_update(weights=_nr502, grad=_rg512, lr=lr) ~> _nr512
get(arr=_g51, idx=3) ~> _gs513
vec_scale(a=xb, s=_gs513) ~> _rg513
sgd_update(weights=_nr503, grad=_rg513, lr=lr) ~> _nr513
linear_rows(r0=_nr510, r1=_nr511, r2=_nr512, r3=_nr513, bv=bv, x=xc) ~> _p52
vec_sub(a=_p52, b=tc) ~> _g52
get(arr=_g52, idx=0) ~> _gs520
vec_scale(a=xc, s=_gs520) ~> _rg520
sgd_update(weights=_nr510, grad=_rg520, lr=lr) ~> _nr520
get(arr=_g52, idx=1) ~> _gs521
vec_scale(a=xc, s=_gs521) ~> _rg521
sgd_update(weights=_nr511, grad=_rg521, lr=lr) ~> _nr521
get(arr=_g52, idx=2) ~> _gs522
vec_scale(a=xc, s=_gs522) ~> _rg522
sgd_update(weights=_nr512, grad=_rg522, lr=lr) ~> _nr522
get(arr=_g52, idx=3) ~> _gs523
vec_scale(a=xc, s=_gs523) ~> _rg523
sgd_update(weights=_nr513, grad=_rg523, lr=lr) ~> _nr523
linear_rows(r0=_nr520, r1=_nr521, r2=_nr522, r3=_nr523, bv=bv, x=xd) ~> _p53
vec_sub(a=_p53, b=td) ~> _g53
get(arr=_g53, idx=0) ~> _gs530
vec_scale(a=xd, s=_gs530) ~> _rg530
sgd_update(weights=_nr520, grad=_rg530, lr=lr) ~> _nr530
get(arr=_g53, idx=1) ~> _gs531
vec_scale(a=xd, s=_gs531) ~> _rg531
sgd_update(weights=_nr521, grad=_rg531, lr=lr) ~> _nr531
get(arr=_g53, idx=2) ~> _gs532
vec_scale(a=xd, s=_gs532) ~> _rg532
sgd_update(weights=_nr522, grad=_rg532, lr=lr) ~> _nr532
get(arr=_g53, idx=3) ~> _gs533
vec_scale(a=xd, s=_gs533) ~> _rg533
sgd_update(weights=_nr523, grad=_rg533, lr=lr) ~> _nr533
linear_rows(r0=_nr530, r1=_nr531, r2=_nr532, r3=_nr533, bv=bv, x=xa) ~> _p60
vec_sub(a=_p60, b=ta) ~> _g60
get(arr=_g60, idx=0) ~> _gs600
vec_scale(a=xa, s=_gs600) ~> _rg600
sgd_update(weights=_nr530, grad=_rg600, lr=lr) ~> _nr600
get(arr=_g60, idx=1) ~> _gs601
vec_scale(a=xa, s=_gs601) ~> _rg601
sgd_update(weights=_nr531, grad=_rg601, lr=lr) ~> _nr601
get(arr=_g60, idx=2) ~> _gs602
vec_scale(a=xa, s=_gs602) ~> _rg602
sgd_update(weights=_nr532, grad=_rg602, lr=lr) ~> _nr602
get(arr=_g60, idx=3) ~> _gs603
vec_scale(a=xa, s=_gs603) ~> _rg603
sgd_update(weights=_nr533, grad=_rg603, lr=lr) ~> _nr603
linear_rows(r0=_nr600, r1=_nr601, r2=_nr602, r3=_nr603, bv=bv, x=xb) ~> _p61
vec_sub(a=_p61, b=tb) ~> _g61
get(arr=_g61, idx=0) ~> _gs610
vec_scale(a=xb, s=_gs610) ~> _rg610
sgd_update(weights=_nr600, grad=_rg610, lr=lr) ~> _nr610
get(arr=_g61, idx=1) ~> _gs611
vec_scale(a=xb, s=_gs611) ~> _rg611
sgd_update(weights=_nr601, grad=_rg611, lr=lr) ~> _nr611
get(arr=_g61, idx=2) ~> _gs612
vec_scale(a=xb, s=_gs612) ~> _rg612
sgd_update(weights=_nr602, grad=_rg612, lr=lr) ~> _nr612
get(arr=_g61, idx=3) ~> _gs613
vec_scale(a=xb, s=_gs613) ~> _rg613
sgd_update(weights=_nr603, grad=_rg613, lr=lr) ~> _nr613
linear_rows(r0=_nr610, r1=_nr611, r2=_nr612, r3=_nr613, bv=bv, x=xc) ~> _p62
vec_sub(a=_p62, b=tc) ~> _g62
get(arr=_g62, idx=0) ~> _gs620
vec_scale(a=xc, s=_gs620) ~> _rg620
sgd_update(weights=_nr610, grad=_rg620, lr=lr) ~> _nr620
get(arr=_g62, idx=1) ~> _gs621
vec_scale(a=xc, s=_gs621) ~> _rg621
sgd_update(weights=_nr611, grad=_rg621, lr=lr) ~> _nr621
get(arr=_g62, idx=2) ~> _gs622
vec_scale(a=xc, s=_gs622) ~> _rg622
sgd_update(weights=_nr612, grad=_rg622, lr=lr) ~> _nr622
get(arr=_g62, idx=3) ~> _gs623
vec_scale(a=xc, s=_gs623) ~> _rg623
sgd_update(weights=_nr613, grad=_rg623, lr=lr) ~> _nr623
linear_rows(r0=_nr620, r1=_nr621, r2=_nr622, r3=_nr623, bv=bv, x=xd) ~> _p63
vec_sub(a=_p63, b=td) ~> _g63
get(arr=_g63, idx=0) ~> _gs630
vec_scale(a=xd, s=_gs630) ~> _rg630
sgd_update(weights=_nr620, grad=_rg630, lr=lr) ~> _nr630
get(arr=_g63, idx=1) ~> _gs631
vec_scale(a=xd, s=_gs631) ~> _rg631
sgd_update(weights=_nr621, grad=_rg631, lr=lr) ~> _nr631
get(arr=_g63, idx=2) ~> _gs632
vec_scale(a=xd, s=_gs632) ~> _rg632
sgd_update(weights=_nr622, grad=_rg632, lr=lr) ~> _nr632
get(arr=_g63, idx=3) ~> _gs633
vec_scale(a=xd, s=_gs633) ~> _rg633
sgd_update(weights=_nr623, grad=_rg633, lr=lr) ~> _nr633
linear_rows(r0=_nr630, r1=_nr631, r2=_nr632, r3=_nr633, bv=bv, x=xa) ~> _p70
vec_sub(a=_p70, b=ta) ~> _g70
get(arr=_g70, idx=0) ~> _gs700
vec_scale(a=xa, s=_gs700) ~> _rg700
sgd_update(weights=_nr630, grad=_rg700, lr=lr) ~> _nr700
get(arr=_g70, idx=1) ~> _gs701
vec_scale(a=xa, s=_gs701) ~> _rg701
sgd_update(weights=_nr631, grad=_rg701, lr=lr) ~> _nr701
get(arr=_g70, idx=2) ~> _gs702
vec_scale(a=xa, s=_gs702) ~> _rg702
sgd_update(weights=_nr632, grad=_rg702, lr=lr) ~> _nr702
get(arr=_g70, idx=3) ~> _gs703
vec_scale(a=xa, s=_gs703) ~> _rg703
sgd_update(weights=_nr633, grad=_rg703, lr=lr) ~> _nr703
linear_rows(r0=_nr700, r1=_nr701, r2=_nr702, r3=_nr703, bv=bv, x=xb) ~> _p71
vec_sub(a=_p71, b=tb) ~> _g71
get(arr=_g71, idx=0) ~> _gs710
vec_scale(a=xb, s=_gs710) ~> _rg710
sgd_update(weights=_nr700, grad=_rg710, lr=lr) ~> _nr710
get(arr=_g71, idx=1) ~> _gs711
vec_scale(a=xb, s=_gs711) ~> _rg711
sgd_update(weights=_nr701, grad=_rg711, lr=lr) ~> _nr711
get(arr=_g71, idx=2) ~> _gs712
vec_scale(a=xb, s=_gs712) ~> _rg712
sgd_update(weights=_nr702, grad=_rg712, lr=lr) ~> _nr712
get(arr=_g71, idx=3) ~> _gs713
vec_scale(a=xb, s=_gs713) ~> _rg713
sgd_update(weights=_nr703, grad=_rg713, lr=lr) ~> _nr713
linear_rows(r0=_nr710, r1=_nr711, r2=_nr712, r3=_nr713, bv=bv, x=xc) ~> _p72
vec_sub(a=_p72, b=tc) ~> _g72
get(arr=_g72, idx=0) ~> _gs720
vec_scale(a=xc, s=_gs720) ~> _rg720
sgd_update(weights=_nr710, grad=_rg720, lr=lr) ~> _nr720
get(arr=_g72, idx=1) ~> _gs721
vec_scale(a=xc, s=_gs721) ~> _rg721
sgd_update(weights=_nr711, grad=_rg721, lr=lr) ~> _nr721
get(arr=_g72, idx=2) ~> _gs722
vec_scale(a=xc, s=_gs722) ~> _rg722
sgd_update(weights=_nr712, grad=_rg722, lr=lr) ~> _nr722
get(arr=_g72, idx=3) ~> _gs723
vec_scale(a=xc, s=_gs723) ~> _rg723
sgd_update(weights=_nr713, grad=_rg723, lr=lr) ~> _nr723
linear_rows(r0=_nr720, r1=_nr721, r2=_nr722, r3=_nr723, bv=bv, x=xd) ~> _p73
vec_sub(a=_p73, b=td) ~> _g73
get(arr=_g73, idx=0) ~> _gs730
vec_scale(a=xd, s=_gs730) ~> _rg730
sgd_update(weights=_nr720, grad=_rg730, lr=lr) ~> _nr730
get(arr=_g73, idx=1) ~> _gs731
vec_scale(a=xd, s=_gs731) ~> _rg731
sgd_update(weights=_nr721, grad=_rg731, lr=lr) ~> _nr731
get(arr=_g73, idx=2) ~> _gs732
vec_scale(a=xd, s=_gs732) ~> _rg732
sgd_update(weights=_nr722, grad=_rg732, lr=lr) ~> _nr732
get(arr=_g73, idx=3) ~> _gs733
vec_scale(a=xd, s=_gs733) ~> _rg733
sgd_update(weights=_nr723, grad=_rg733, lr=lr) ~> _nr733
linear_rows(r0=_nr730, r1=_nr731, r2=_nr732, r3=_nr733, bv=bv, x=xa) ~> _p80
vec_sub(a=_p80, b=ta) ~> _g80
get(arr=_g80, idx=0) ~> _gs800
vec_scale(a=xa, s=_gs800) ~> _rg800
sgd_update(weights=_nr730, grad=_rg800, lr=lr) ~> _nr800
get(arr=_g80, idx=1) ~> _gs801
vec_scale(a=xa, s=_gs801) ~> _rg801
sgd_update(weights=_nr731, grad=_rg801, lr=lr) ~> _nr801
get(arr=_g80, idx=2) ~> _gs802
vec_scale(a=xa, s=_gs802) ~> _rg802
sgd_update(weights=_nr732, grad=_rg802, lr=lr) ~> _nr802
get(arr=_g80, idx=3) ~> _gs803
vec_scale(a=xa, s=_gs803) ~> _rg803
sgd_update(weights=_nr733, grad=_rg803, lr=lr) ~> _nr803
linear_rows(r0=_nr800, r1=_nr801, r2=_nr802, r3=_nr803, bv=bv, x=xb) ~> _p81
vec_sub(a=_p81, b=tb) ~> _g81
get(arr=_g81, idx=0) ~> _gs810
vec_scale(a=xb, s=_gs810) ~> _rg810
sgd_update(weights=_nr800, grad=_rg810, lr=lr) ~> _nr810
get(arr=_g81, idx=1) ~> _gs811
vec_scale(a=xb, s=_gs811) ~> _rg811
sgd_update(weights=_nr801, grad=_rg811, lr=lr) ~> _nr811
get(arr=_g81, idx=2) ~> _gs812
vec_scale(a=xb, s=_gs812) ~> _rg812
sgd_update(weights=_nr802, grad=_rg812, lr=lr) ~> _nr812
get(arr=_g81, idx=3) ~> _gs813
vec_scale(a=xb, s=_gs813) ~> _rg813
sgd_update(weights=_nr803, grad=_rg813, lr=lr) ~> _nr813
linear_rows(r0=_nr810, r1=_nr811, r2=_nr812, r3=_nr813, bv=bv, x=xc) ~> _p82
vec_sub(a=_p82, b=tc) ~> _g82
get(arr=_g82, idx=0) ~> _gs820
vec_scale(a=xc, s=_gs820) ~> _rg820
sgd_update(weights=_nr810, grad=_rg820, lr=lr) ~> _nr820
get(arr=_g82, idx=1) ~> _gs821
vec_scale(a=xc, s=_gs821) ~> _rg821
sgd_update(weights=_nr811, grad=_rg821, lr=lr) ~> _nr821
get(arr=_g82, idx=2) ~> _gs822
vec_scale(a=xc, s=_gs822) ~> _rg822
sgd_update(weights=_nr812, grad=_rg822, lr=lr) ~> _nr822
get(arr=_g82, idx=3) ~> _gs823
vec_scale(a=xc, s=_gs823) ~> _rg823
sgd_update(weights=_nr813, grad=_rg823, lr=lr) ~> _nr823
linear_rows(r0=_nr820, r1=_nr821, r2=_nr822, r3=_nr823, bv=bv, x=xd) ~> _p83
vec_sub(a=_p83, b=td) ~> _g83
get(arr=_g83, idx=0) ~> _gs830
vec_scale(a=xd, s=_gs830) ~> _rg830
sgd_update(weights=_nr820, grad=_rg830, lr=lr) ~> _nr830
get(arr=_g83, idx=1) ~> _gs831
vec_scale(a=xd, s=_gs831) ~> _rg831
sgd_update(weights=_nr821, grad=_rg831, lr=lr) ~> _nr831
get(arr=_g83, idx=2) ~> _gs832
vec_scale(a=xd, s=_gs832) ~> _rg832
sgd_update(weights=_nr822, grad=_rg832, lr=lr) ~> _nr832
get(arr=_g83, idx=3) ~> _gs833
vec_scale(a=xd, s=_gs833) ~> _rg833
sgd_update(weights=_nr823, grad=_rg833, lr=lr) ~> _nr833
linear_rows(r0=_nr830, r1=_nr831, r2=_nr832, r3=_nr833, bv=bv, x=xa) ~> _p90
vec_sub(a=_p90, b=ta) ~> _g90
get(arr=_g90, idx=0) ~> _gs900
vec_scale(a=xa, s=_gs900) ~> _rg900
sgd_update(weights=_nr830, grad=_rg900, lr=lr) ~> _nr900
get(arr=_g90, idx=1) ~> _gs901
vec_scale(a=xa, s=_gs901) ~> _rg901
sgd_update(weights=_nr831, grad=_rg901, lr=lr) ~> _nr901
get(arr=_g90, idx=2) ~> _gs902
vec_scale(a=xa, s=_gs902) ~> _rg902
sgd_update(weights=_nr832, grad=_rg902, lr=lr) ~> _nr902
get(arr=_g90, idx=3) ~> _gs903
vec_scale(a=xa, s=_gs903) ~> _rg903
sgd_update(weights=_nr833, grad=_rg903, lr=lr) ~> _nr903
linear_rows(r0=_nr900, r1=_nr901, r2=_nr902, r3=_nr903, bv=bv, x=xb) ~> _p91
vec_sub(a=_p91, b=tb) ~> _g91
get(arr=_g91, idx=0) ~> _gs910
vec_scale(a=xb, s=_gs910) ~> _rg910
sgd_update(weights=_nr900, grad=_rg910, lr=lr) ~> _nr910
get(arr=_g91, idx=1) ~> _gs911
vec_scale(a=xb, s=_gs911) ~> _rg911
sgd_update(weights=_nr901, grad=_rg911, lr=lr) ~> _nr911
get(arr=_g91, idx=2) ~> _gs912
vec_scale(a=xb, s=_gs912) ~> _rg912
sgd_update(weights=_nr902, grad=_rg912, lr=lr) ~> _nr912
get(arr=_g91, idx=3) ~> _gs913
vec_scale(a=xb, s=_gs913) ~> _rg913
sgd_update(weights=_nr903, grad=_rg913, lr=lr) ~> _nr913
linear_rows(r0=_nr910, r1=_nr911, r2=_nr912, r3=_nr913, bv=bv, x=xc) ~> _p92
vec_sub(a=_p92, b=tc) ~> _g92
get(arr=_g92, idx=0) ~> _gs920
vec_scale(a=xc, s=_gs920) ~> _rg920
sgd_update(weights=_nr910, grad=_rg920, lr=lr) ~> _nr920
get(arr=_g92, idx=1) ~> _gs921
vec_scale(a=xc, s=_gs921) ~> _rg921
sgd_update(weights=_nr911, grad=_rg921, lr=lr) ~> _nr921
get(arr=_g92, idx=2) ~> _gs922
vec_scale(a=xc, s=_gs922) ~> _rg922
sgd_update(weights=_nr912, grad=_rg922, lr=lr) ~> _nr922
get(arr=_g92, idx=3) ~> _gs923
vec_scale(a=xc, s=_gs923) ~> _rg923
sgd_update(weights=_nr913, grad=_rg923, lr=lr) ~> _nr923
linear_rows(r0=_nr920, r1=_nr921, r2=_nr922, r3=_nr923, bv=bv, x=xd) ~> _p93
vec_sub(a=_p93, b=td) ~> _g93
get(arr=_g93, idx=0) ~> _gs930
vec_scale(a=xd, s=_gs930) ~> _rg930
sgd_update(weights=_nr920, grad=_rg930, lr=lr) ~> _nr930
get(arr=_g93, idx=1) ~> _gs931
vec_scale(a=xd, s=_gs931) ~> _rg931
sgd_update(weights=_nr921, grad=_rg931, lr=lr) ~> _nr931
get(arr=_g93, idx=2) ~> _gs932
vec_scale(a=xd, s=_gs932) ~> _rg932
sgd_update(weights=_nr922, grad=_rg932, lr=lr) ~> _nr932
get(arr=_g93, idx=3) ~> _gs933
vec_scale(a=xd, s=_gs933) ~> _rg933
sgd_update(weights=_nr923, grad=_rg933, lr=lr) ~> _nr933
linear_rows(r0=_nr930, r1=_nr931, r2=_nr932, r3=_nr933, bv=bv, x=xa) ~> _c0
softmax(arr=_c0) ~> _pr0
argmax4(arr=_pr0) ~> _an0
linear_rows(r0=_nr930, r1=_nr931, r2=_nr932, r3=_nr933, bv=bv, x=xb) ~> _c1
softmax(arr=_c1) ~> _pr1
argmax4(arr=_pr1) ~> _an1
linear_rows(r0=_nr930, r1=_nr931, r2=_nr932, r3=_nr933, bv=bv, x=xc) ~> _c2
softmax(arr=_c2) ~> _pr2
argmax4(arr=_pr2) ~> _an2
linear_rows(r0=_nr930, r1=_nr931, r2=_nr932, r3=_nr933, bv=bv, x=xd) ~> _c3
softmax(arr=_c3) ~> _pr3
argmax4(arr=_pr3) ~> _an3
[T+]
show shall(_an0)
show shall(_an1)
show shall(_an2)
show shall(_an3)