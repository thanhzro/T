[T-]
import "lib/basic/std.t"
import "lib/advanced/ml_t.t"
w0r0 = [0.5, 0.3, 0.2, 0.1]
w0r1 = [0.1, 0.5, 0.3, 0.1]
w0r2 = [0.2, 0.1, 0.5, 0.2]
w0r3 = [0.1, 0.2, 0.1, 0.5]
bv = [0, 0, 0, 0]
lr = 0.3
x0 = [1, 0, 0, 0]
t0 = [0, 1, 0, 0]
x1 = [0, 1, 0, 0]
t1 = [0, 0, 1, 0]
x2 = [0, 0, 1, 0]
t2 = [0, 0, 0, 1]
x3 = [0, 0, 0, 1]
t3 = [1, 0, 0, 0]
[T0]
[] >> wm0
push(arr=wm0, val=w0r0) ~> wm0
push(arr=wm0, val=w0r1) ~> wm0
push(arr=wm0, val=w0r2) ~> wm0
push(arr=wm0, val=w0r3) ~> wm0
linear(x=x0, weights=wm0, bias=bv) ~> pe0
vec_sub(a=pe0, b=t0) ~> ge0
get(arr=ge0, idx=0) ~> gs0_0
vec_scale(a=x0, s=gs0_0) ~> rg0_0
sgd_update(weights=w0r0, grad=rg0_0, lr=lr) ~> nr0_0
get(arr=ge0, idx=1) ~> gs0_1
vec_scale(a=x0, s=gs0_1) ~> rg0_1
sgd_update(weights=w0r1, grad=rg0_1, lr=lr) ~> nr0_1
get(arr=ge0, idx=2) ~> gs0_2
vec_scale(a=x0, s=gs0_2) ~> rg0_2
sgd_update(weights=w0r2, grad=rg0_2, lr=lr) ~> nr0_2
get(arr=ge0, idx=3) ~> gs0_3
vec_scale(a=x0, s=gs0_3) ~> rg0_3
sgd_update(weights=w0r3, grad=rg0_3, lr=lr) ~> nr0_3
[] >> wm1
push(arr=wm1, val=nr0_0) ~> wm1
push(arr=wm1, val=nr0_1) ~> wm1
push(arr=wm1, val=nr0_2) ~> wm1
push(arr=wm1, val=nr0_3) ~> wm1
linear(x=x1, weights=wm1, bias=bv) ~> pe1
vec_sub(a=pe1, b=t1) ~> ge1
get(arr=ge1, idx=0) ~> gs1_0
vec_scale(a=x1, s=gs1_0) ~> rg1_0
sgd_update(weights=nr0_0, grad=rg1_0, lr=lr) ~> nr1_0
get(arr=ge1, idx=1) ~> gs1_1
vec_scale(a=x1, s=gs1_1) ~> rg1_1
sgd_update(weights=nr0_1, grad=rg1_1, lr=lr) ~> nr1_1
get(arr=ge1, idx=2) ~> gs1_2
vec_scale(a=x1, s=gs1_2) ~> rg1_2
sgd_update(weights=nr0_2, grad=rg1_2, lr=lr) ~> nr1_2
get(arr=ge1, idx=3) ~> gs1_3
vec_scale(a=x1, s=gs1_3) ~> rg1_3
sgd_update(weights=nr0_3, grad=rg1_3, lr=lr) ~> nr1_3
[] >> wm2
push(arr=wm2, val=nr1_0) ~> wm2
push(arr=wm2, val=nr1_1) ~> wm2
push(arr=wm2, val=nr1_2) ~> wm2
push(arr=wm2, val=nr1_3) ~> wm2
linear(x=x2, weights=wm2, bias=bv) ~> pe2
vec_sub(a=pe2, b=t2) ~> ge2
get(arr=ge2, idx=0) ~> gs2_0
vec_scale(a=x2, s=gs2_0) ~> rg2_0
sgd_update(weights=nr1_0, grad=rg2_0, lr=lr) ~> nr2_0
get(arr=ge2, idx=1) ~> gs2_1
vec_scale(a=x2, s=gs2_1) ~> rg2_1
sgd_update(weights=nr1_1, grad=rg2_1, lr=lr) ~> nr2_1
get(arr=ge2, idx=2) ~> gs2_2
vec_scale(a=x2, s=gs2_2) ~> rg2_2
sgd_update(weights=nr1_2, grad=rg2_2, lr=lr) ~> nr2_2
get(arr=ge2, idx=3) ~> gs2_3
vec_scale(a=x2, s=gs2_3) ~> rg2_3
sgd_update(weights=nr1_3, grad=rg2_3, lr=lr) ~> nr2_3
[] >> wm3
push(arr=wm3, val=nr2_0) ~> wm3
push(arr=wm3, val=nr2_1) ~> wm3
push(arr=wm3, val=nr2_2) ~> wm3
push(arr=wm3, val=nr2_3) ~> wm3
linear(x=x3, weights=wm3, bias=bv) ~> pe3
vec_sub(a=pe3, b=t3) ~> ge3
get(arr=ge3, idx=0) ~> gs3_0
vec_scale(a=x3, s=gs3_0) ~> rg3_0
sgd_update(weights=nr2_0, grad=rg3_0, lr=lr) ~> nr3_0
get(arr=ge3, idx=1) ~> gs3_1
vec_scale(a=x3, s=gs3_1) ~> rg3_1
sgd_update(weights=nr2_1, grad=rg3_1, lr=lr) ~> nr3_1
get(arr=ge3, idx=2) ~> gs3_2
vec_scale(a=x3, s=gs3_2) ~> rg3_2
sgd_update(weights=nr2_2, grad=rg3_2, lr=lr) ~> nr3_2
get(arr=ge3, idx=3) ~> gs3_3
vec_scale(a=x3, s=gs3_3) ~> rg3_3
sgd_update(weights=nr2_3, grad=rg3_3, lr=lr) ~> nr3_3
[] >> wm4
push(arr=wm4, val=nr3_0) ~> wm4
push(arr=wm4, val=nr3_1) ~> wm4
push(arr=wm4, val=nr3_2) ~> wm4
push(arr=wm4, val=nr3_3) ~> wm4
linear(x=x0, weights=wm4, bias=bv) ~> pe4
vec_sub(a=pe4, b=t0) ~> ge4
get(arr=ge4, idx=0) ~> gs4_0
vec_scale(a=x0, s=gs4_0) ~> rg4_0
sgd_update(weights=nr3_0, grad=rg4_0, lr=lr) ~> nr4_0
get(arr=ge4, idx=1) ~> gs4_1
vec_scale(a=x0, s=gs4_1) ~> rg4_1
sgd_update(weights=nr3_1, grad=rg4_1, lr=lr) ~> nr4_1
get(arr=ge4, idx=2) ~> gs4_2
vec_scale(a=x0, s=gs4_2) ~> rg4_2
sgd_update(weights=nr3_2, grad=rg4_2, lr=lr) ~> nr4_2
get(arr=ge4, idx=3) ~> gs4_3
vec_scale(a=x0, s=gs4_3) ~> rg4_3
sgd_update(weights=nr3_3, grad=rg4_3, lr=lr) ~> nr4_3
[] >> wm5
push(arr=wm5, val=nr4_0) ~> wm5
push(arr=wm5, val=nr4_1) ~> wm5
push(arr=wm5, val=nr4_2) ~> wm5
push(arr=wm5, val=nr4_3) ~> wm5
linear(x=x1, weights=wm5, bias=bv) ~> pe5
vec_sub(a=pe5, b=t1) ~> ge5
get(arr=ge5, idx=0) ~> gs5_0
vec_scale(a=x1, s=gs5_0) ~> rg5_0
sgd_update(weights=nr4_0, grad=rg5_0, lr=lr) ~> nr5_0
get(arr=ge5, idx=1) ~> gs5_1
vec_scale(a=x1, s=gs5_1) ~> rg5_1
sgd_update(weights=nr4_1, grad=rg5_1, lr=lr) ~> nr5_1
get(arr=ge5, idx=2) ~> gs5_2
vec_scale(a=x1, s=gs5_2) ~> rg5_2
sgd_update(weights=nr4_2, grad=rg5_2, lr=lr) ~> nr5_2
get(arr=ge5, idx=3) ~> gs5_3
vec_scale(a=x1, s=gs5_3) ~> rg5_3
sgd_update(weights=nr4_3, grad=rg5_3, lr=lr) ~> nr5_3
[] >> wm6
push(arr=wm6, val=nr5_0) ~> wm6
push(arr=wm6, val=nr5_1) ~> wm6
push(arr=wm6, val=nr5_2) ~> wm6
push(arr=wm6, val=nr5_3) ~> wm6
linear(x=x2, weights=wm6, bias=bv) ~> pe6
vec_sub(a=pe6, b=t2) ~> ge6
get(arr=ge6, idx=0) ~> gs6_0
vec_scale(a=x2, s=gs6_0) ~> rg6_0
sgd_update(weights=nr5_0, grad=rg6_0, lr=lr) ~> nr6_0
get(arr=ge6, idx=1) ~> gs6_1
vec_scale(a=x2, s=gs6_1) ~> rg6_1
sgd_update(weights=nr5_1, grad=rg6_1, lr=lr) ~> nr6_1
get(arr=ge6, idx=2) ~> gs6_2
vec_scale(a=x2, s=gs6_2) ~> rg6_2
sgd_update(weights=nr5_2, grad=rg6_2, lr=lr) ~> nr6_2
get(arr=ge6, idx=3) ~> gs6_3
vec_scale(a=x2, s=gs6_3) ~> rg6_3
sgd_update(weights=nr5_3, grad=rg6_3, lr=lr) ~> nr6_3
[] >> wm7
push(arr=wm7, val=nr6_0) ~> wm7
push(arr=wm7, val=nr6_1) ~> wm7
push(arr=wm7, val=nr6_2) ~> wm7
push(arr=wm7, val=nr6_3) ~> wm7
linear(x=x3, weights=wm7, bias=bv) ~> pe7
vec_sub(a=pe7, b=t3) ~> ge7
get(arr=ge7, idx=0) ~> gs7_0
vec_scale(a=x3, s=gs7_0) ~> rg7_0
sgd_update(weights=nr6_0, grad=rg7_0, lr=lr) ~> nr7_0
get(arr=ge7, idx=1) ~> gs7_1
vec_scale(a=x3, s=gs7_1) ~> rg7_1
sgd_update(weights=nr6_1, grad=rg7_1, lr=lr) ~> nr7_1
get(arr=ge7, idx=2) ~> gs7_2
vec_scale(a=x3, s=gs7_2) ~> rg7_2
sgd_update(weights=nr6_2, grad=rg7_2, lr=lr) ~> nr7_2
get(arr=ge7, idx=3) ~> gs7_3
vec_scale(a=x3, s=gs7_3) ~> rg7_3
sgd_update(weights=nr6_3, grad=rg7_3, lr=lr) ~> nr7_3
[] >> wm8
push(arr=wm8, val=nr7_0) ~> wm8
push(arr=wm8, val=nr7_1) ~> wm8
push(arr=wm8, val=nr7_2) ~> wm8
push(arr=wm8, val=nr7_3) ~> wm8
linear(x=x0, weights=wm8, bias=bv) ~> pe8
vec_sub(a=pe8, b=t0) ~> ge8
get(arr=ge8, idx=0) ~> gs8_0
vec_scale(a=x0, s=gs8_0) ~> rg8_0
sgd_update(weights=nr7_0, grad=rg8_0, lr=lr) ~> nr8_0
get(arr=ge8, idx=1) ~> gs8_1
vec_scale(a=x0, s=gs8_1) ~> rg8_1
sgd_update(weights=nr7_1, grad=rg8_1, lr=lr) ~> nr8_1
get(arr=ge8, idx=2) ~> gs8_2
vec_scale(a=x0, s=gs8_2) ~> rg8_2
sgd_update(weights=nr7_2, grad=rg8_2, lr=lr) ~> nr8_2
get(arr=ge8, idx=3) ~> gs8_3
vec_scale(a=x0, s=gs8_3) ~> rg8_3
sgd_update(weights=nr7_3, grad=rg8_3, lr=lr) ~> nr8_3
[] >> wm9
push(arr=wm9, val=nr8_0) ~> wm9
push(arr=wm9, val=nr8_1) ~> wm9
push(arr=wm9, val=nr8_2) ~> wm9
push(arr=wm9, val=nr8_3) ~> wm9
linear(x=x1, weights=wm9, bias=bv) ~> pe9
vec_sub(a=pe9, b=t1) ~> ge9
get(arr=ge9, idx=0) ~> gs9_0
vec_scale(a=x1, s=gs9_0) ~> rg9_0
sgd_update(weights=nr8_0, grad=rg9_0, lr=lr) ~> nr9_0
get(arr=ge9, idx=1) ~> gs9_1
vec_scale(a=x1, s=gs9_1) ~> rg9_1
sgd_update(weights=nr8_1, grad=rg9_1, lr=lr) ~> nr9_1
get(arr=ge9, idx=2) ~> gs9_2
vec_scale(a=x1, s=gs9_2) ~> rg9_2
sgd_update(weights=nr8_2, grad=rg9_2, lr=lr) ~> nr9_2
get(arr=ge9, idx=3) ~> gs9_3
vec_scale(a=x1, s=gs9_3) ~> rg9_3
sgd_update(weights=nr8_3, grad=rg9_3, lr=lr) ~> nr9_3
[] >> wm10
push(arr=wm10, val=nr9_0) ~> wm10
push(arr=wm10, val=nr9_1) ~> wm10
push(arr=wm10, val=nr9_2) ~> wm10
push(arr=wm10, val=nr9_3) ~> wm10
linear(x=x2, weights=wm10, bias=bv) ~> pe10
vec_sub(a=pe10, b=t2) ~> ge10
get(arr=ge10, idx=0) ~> gs10_0
vec_scale(a=x2, s=gs10_0) ~> rg10_0
sgd_update(weights=nr9_0, grad=rg10_0, lr=lr) ~> nr10_0
get(arr=ge10, idx=1) ~> gs10_1
vec_scale(a=x2, s=gs10_1) ~> rg10_1
sgd_update(weights=nr9_1, grad=rg10_1, lr=lr) ~> nr10_1
get(arr=ge10, idx=2) ~> gs10_2
vec_scale(a=x2, s=gs10_2) ~> rg10_2
sgd_update(weights=nr9_2, grad=rg10_2, lr=lr) ~> nr10_2
get(arr=ge10, idx=3) ~> gs10_3
vec_scale(a=x2, s=gs10_3) ~> rg10_3
sgd_update(weights=nr9_3, grad=rg10_3, lr=lr) ~> nr10_3
[] >> wm11
push(arr=wm11, val=nr10_0) ~> wm11
push(arr=wm11, val=nr10_1) ~> wm11
push(arr=wm11, val=nr10_2) ~> wm11
push(arr=wm11, val=nr10_3) ~> wm11
linear(x=x3, weights=wm11, bias=bv) ~> pe11
vec_sub(a=pe11, b=t3) ~> ge11
get(arr=ge11, idx=0) ~> gs11_0
vec_scale(a=x3, s=gs11_0) ~> rg11_0
sgd_update(weights=nr10_0, grad=rg11_0, lr=lr) ~> nr11_0
get(arr=ge11, idx=1) ~> gs11_1
vec_scale(a=x3, s=gs11_1) ~> rg11_1
sgd_update(weights=nr10_1, grad=rg11_1, lr=lr) ~> nr11_1
get(arr=ge11, idx=2) ~> gs11_2
vec_scale(a=x3, s=gs11_2) ~> rg11_2
sgd_update(weights=nr10_2, grad=rg11_2, lr=lr) ~> nr11_2
get(arr=ge11, idx=3) ~> gs11_3
vec_scale(a=x3, s=gs11_3) ~> rg11_3
sgd_update(weights=nr10_3, grad=rg11_3, lr=lr) ~> nr11_3
[] >> wm12
push(arr=wm12, val=nr11_0) ~> wm12
push(arr=wm12, val=nr11_1) ~> wm12
push(arr=wm12, val=nr11_2) ~> wm12
push(arr=wm12, val=nr11_3) ~> wm12
linear(x=x0, weights=wm12, bias=bv) ~> pe12
vec_sub(a=pe12, b=t0) ~> ge12
get(arr=ge12, idx=0) ~> gs12_0
vec_scale(a=x0, s=gs12_0) ~> rg12_0
sgd_update(weights=nr11_0, grad=rg12_0, lr=lr) ~> nr12_0
get(arr=ge12, idx=1) ~> gs12_1
vec_scale(a=x0, s=gs12_1) ~> rg12_1
sgd_update(weights=nr11_1, grad=rg12_1, lr=lr) ~> nr12_1
get(arr=ge12, idx=2) ~> gs12_2
vec_scale(a=x0, s=gs12_2) ~> rg12_2
sgd_update(weights=nr11_2, grad=rg12_2, lr=lr) ~> nr12_2
get(arr=ge12, idx=3) ~> gs12_3
vec_scale(a=x0, s=gs12_3) ~> rg12_3
sgd_update(weights=nr11_3, grad=rg12_3, lr=lr) ~> nr12_3
[] >> wm13
push(arr=wm13, val=nr12_0) ~> wm13
push(arr=wm13, val=nr12_1) ~> wm13
push(arr=wm13, val=nr12_2) ~> wm13
push(arr=wm13, val=nr12_3) ~> wm13
linear(x=x1, weights=wm13, bias=bv) ~> pe13
vec_sub(a=pe13, b=t1) ~> ge13
get(arr=ge13, idx=0) ~> gs13_0
vec_scale(a=x1, s=gs13_0) ~> rg13_0
sgd_update(weights=nr12_0, grad=rg13_0, lr=lr) ~> nr13_0
get(arr=ge13, idx=1) ~> gs13_1
vec_scale(a=x1, s=gs13_1) ~> rg13_1
sgd_update(weights=nr12_1, grad=rg13_1, lr=lr) ~> nr13_1
get(arr=ge13, idx=2) ~> gs13_2
vec_scale(a=x1, s=gs13_2) ~> rg13_2
sgd_update(weights=nr12_2, grad=rg13_2, lr=lr) ~> nr13_2
get(arr=ge13, idx=3) ~> gs13_3
vec_scale(a=x1, s=gs13_3) ~> rg13_3
sgd_update(weights=nr12_3, grad=rg13_3, lr=lr) ~> nr13_3
[] >> wm14
push(arr=wm14, val=nr13_0) ~> wm14
push(arr=wm14, val=nr13_1) ~> wm14
push(arr=wm14, val=nr13_2) ~> wm14
push(arr=wm14, val=nr13_3) ~> wm14
linear(x=x2, weights=wm14, bias=bv) ~> pe14
vec_sub(a=pe14, b=t2) ~> ge14
get(arr=ge14, idx=0) ~> gs14_0
vec_scale(a=x2, s=gs14_0) ~> rg14_0
sgd_update(weights=nr13_0, grad=rg14_0, lr=lr) ~> nr14_0
get(arr=ge14, idx=1) ~> gs14_1
vec_scale(a=x2, s=gs14_1) ~> rg14_1
sgd_update(weights=nr13_1, grad=rg14_1, lr=lr) ~> nr14_1
get(arr=ge14, idx=2) ~> gs14_2
vec_scale(a=x2, s=gs14_2) ~> rg14_2
sgd_update(weights=nr13_2, grad=rg14_2, lr=lr) ~> nr14_2
get(arr=ge14, idx=3) ~> gs14_3
vec_scale(a=x2, s=gs14_3) ~> rg14_3
sgd_update(weights=nr13_3, grad=rg14_3, lr=lr) ~> nr14_3
[] >> wm15
push(arr=wm15, val=nr14_0) ~> wm15
push(arr=wm15, val=nr14_1) ~> wm15
push(arr=wm15, val=nr14_2) ~> wm15
push(arr=wm15, val=nr14_3) ~> wm15
linear(x=x3, weights=wm15, bias=bv) ~> pe15
vec_sub(a=pe15, b=t3) ~> ge15
get(arr=ge15, idx=0) ~> gs15_0
vec_scale(a=x3, s=gs15_0) ~> rg15_0
sgd_update(weights=nr14_0, grad=rg15_0, lr=lr) ~> nr15_0
get(arr=ge15, idx=1) ~> gs15_1
vec_scale(a=x3, s=gs15_1) ~> rg15_1
sgd_update(weights=nr14_1, grad=rg15_1, lr=lr) ~> nr15_1
get(arr=ge15, idx=2) ~> gs15_2
vec_scale(a=x3, s=gs15_2) ~> rg15_2
sgd_update(weights=nr14_2, grad=rg15_2, lr=lr) ~> nr15_2
get(arr=ge15, idx=3) ~> gs15_3
vec_scale(a=x3, s=gs15_3) ~> rg15_3
sgd_update(weights=nr14_3, grad=rg15_3, lr=lr) ~> nr15_3
[] >> wm16
push(arr=wm16, val=nr15_0) ~> wm16
push(arr=wm16, val=nr15_1) ~> wm16
push(arr=wm16, val=nr15_2) ~> wm16
push(arr=wm16, val=nr15_3) ~> wm16
linear(x=x0, weights=wm16, bias=bv) ~> pe16
vec_sub(a=pe16, b=t0) ~> ge16
get(arr=ge16, idx=0) ~> gs16_0
vec_scale(a=x0, s=gs16_0) ~> rg16_0
sgd_update(weights=nr15_0, grad=rg16_0, lr=lr) ~> nr16_0
get(arr=ge16, idx=1) ~> gs16_1
vec_scale(a=x0, s=gs16_1) ~> rg16_1
sgd_update(weights=nr15_1, grad=rg16_1, lr=lr) ~> nr16_1
get(arr=ge16, idx=2) ~> gs16_2
vec_scale(a=x0, s=gs16_2) ~> rg16_2
sgd_update(weights=nr15_2, grad=rg16_2, lr=lr) ~> nr16_2
get(arr=ge16, idx=3) ~> gs16_3
vec_scale(a=x0, s=gs16_3) ~> rg16_3
sgd_update(weights=nr15_3, grad=rg16_3, lr=lr) ~> nr16_3
[] >> wm17
push(arr=wm17, val=nr16_0) ~> wm17
push(arr=wm17, val=nr16_1) ~> wm17
push(arr=wm17, val=nr16_2) ~> wm17
push(arr=wm17, val=nr16_3) ~> wm17
linear(x=x1, weights=wm17, bias=bv) ~> pe17
vec_sub(a=pe17, b=t1) ~> ge17
get(arr=ge17, idx=0) ~> gs17_0
vec_scale(a=x1, s=gs17_0) ~> rg17_0
sgd_update(weights=nr16_0, grad=rg17_0, lr=lr) ~> nr17_0
get(arr=ge17, idx=1) ~> gs17_1
vec_scale(a=x1, s=gs17_1) ~> rg17_1
sgd_update(weights=nr16_1, grad=rg17_1, lr=lr) ~> nr17_1
get(arr=ge17, idx=2) ~> gs17_2
vec_scale(a=x1, s=gs17_2) ~> rg17_2
sgd_update(weights=nr16_2, grad=rg17_2, lr=lr) ~> nr17_2
get(arr=ge17, idx=3) ~> gs17_3
vec_scale(a=x1, s=gs17_3) ~> rg17_3
sgd_update(weights=nr16_3, grad=rg17_3, lr=lr) ~> nr17_3
[] >> wm18
push(arr=wm18, val=nr17_0) ~> wm18
push(arr=wm18, val=nr17_1) ~> wm18
push(arr=wm18, val=nr17_2) ~> wm18
push(arr=wm18, val=nr17_3) ~> wm18
linear(x=x2, weights=wm18, bias=bv) ~> pe18
vec_sub(a=pe18, b=t2) ~> ge18
get(arr=ge18, idx=0) ~> gs18_0
vec_scale(a=x2, s=gs18_0) ~> rg18_0
sgd_update(weights=nr17_0, grad=rg18_0, lr=lr) ~> nr18_0
get(arr=ge18, idx=1) ~> gs18_1
vec_scale(a=x2, s=gs18_1) ~> rg18_1
sgd_update(weights=nr17_1, grad=rg18_1, lr=lr) ~> nr18_1
get(arr=ge18, idx=2) ~> gs18_2
vec_scale(a=x2, s=gs18_2) ~> rg18_2
sgd_update(weights=nr17_2, grad=rg18_2, lr=lr) ~> nr18_2
get(arr=ge18, idx=3) ~> gs18_3
vec_scale(a=x2, s=gs18_3) ~> rg18_3
sgd_update(weights=nr17_3, grad=rg18_3, lr=lr) ~> nr18_3
[] >> wm19
push(arr=wm19, val=nr18_0) ~> wm19
push(arr=wm19, val=nr18_1) ~> wm19
push(arr=wm19, val=nr18_2) ~> wm19
push(arr=wm19, val=nr18_3) ~> wm19
linear(x=x3, weights=wm19, bias=bv) ~> pe19
vec_sub(a=pe19, b=t3) ~> ge19
get(arr=ge19, idx=0) ~> gs19_0
vec_scale(a=x3, s=gs19_0) ~> rg19_0
sgd_update(weights=nr18_0, grad=rg19_0, lr=lr) ~> nr19_0
get(arr=ge19, idx=1) ~> gs19_1
vec_scale(a=x3, s=gs19_1) ~> rg19_1
sgd_update(weights=nr18_1, grad=rg19_1, lr=lr) ~> nr19_1
get(arr=ge19, idx=2) ~> gs19_2
vec_scale(a=x3, s=gs19_2) ~> rg19_2
sgd_update(weights=nr18_2, grad=rg19_2, lr=lr) ~> nr19_2
get(arr=ge19, idx=3) ~> gs19_3
vec_scale(a=x3, s=gs19_3) ~> rg19_3
sgd_update(weights=nr18_3, grad=rg19_3, lr=lr) ~> nr19_3
[] >> wm20
push(arr=wm20, val=nr19_0) ~> wm20
push(arr=wm20, val=nr19_1) ~> wm20
push(arr=wm20, val=nr19_2) ~> wm20
push(arr=wm20, val=nr19_3) ~> wm20
linear(x=x0, weights=wm20, bias=bv) ~> pe20
vec_sub(a=pe20, b=t0) ~> ge20
get(arr=ge20, idx=0) ~> gs20_0
vec_scale(a=x0, s=gs20_0) ~> rg20_0
sgd_update(weights=nr19_0, grad=rg20_0, lr=lr) ~> nr20_0
get(arr=ge20, idx=1) ~> gs20_1
vec_scale(a=x0, s=gs20_1) ~> rg20_1
sgd_update(weights=nr19_1, grad=rg20_1, lr=lr) ~> nr20_1
get(arr=ge20, idx=2) ~> gs20_2
vec_scale(a=x0, s=gs20_2) ~> rg20_2
sgd_update(weights=nr19_2, grad=rg20_2, lr=lr) ~> nr20_2
get(arr=ge20, idx=3) ~> gs20_3
vec_scale(a=x0, s=gs20_3) ~> rg20_3
sgd_update(weights=nr19_3, grad=rg20_3, lr=lr) ~> nr20_3
[] >> wm21
push(arr=wm21, val=nr20_0) ~> wm21
push(arr=wm21, val=nr20_1) ~> wm21
push(arr=wm21, val=nr20_2) ~> wm21
push(arr=wm21, val=nr20_3) ~> wm21
linear(x=x1, weights=wm21, bias=bv) ~> pe21
vec_sub(a=pe21, b=t1) ~> ge21
get(arr=ge21, idx=0) ~> gs21_0
vec_scale(a=x1, s=gs21_0) ~> rg21_0
sgd_update(weights=nr20_0, grad=rg21_0, lr=lr) ~> nr21_0
get(arr=ge21, idx=1) ~> gs21_1
vec_scale(a=x1, s=gs21_1) ~> rg21_1
sgd_update(weights=nr20_1, grad=rg21_1, lr=lr) ~> nr21_1
get(arr=ge21, idx=2) ~> gs21_2
vec_scale(a=x1, s=gs21_2) ~> rg21_2
sgd_update(weights=nr20_2, grad=rg21_2, lr=lr) ~> nr21_2
get(arr=ge21, idx=3) ~> gs21_3
vec_scale(a=x1, s=gs21_3) ~> rg21_3
sgd_update(weights=nr20_3, grad=rg21_3, lr=lr) ~> nr21_3
[] >> wm22
push(arr=wm22, val=nr21_0) ~> wm22
push(arr=wm22, val=nr21_1) ~> wm22
push(arr=wm22, val=nr21_2) ~> wm22
push(arr=wm22, val=nr21_3) ~> wm22
linear(x=x2, weights=wm22, bias=bv) ~> pe22
vec_sub(a=pe22, b=t2) ~> ge22
get(arr=ge22, idx=0) ~> gs22_0
vec_scale(a=x2, s=gs22_0) ~> rg22_0
sgd_update(weights=nr21_0, grad=rg22_0, lr=lr) ~> nr22_0
get(arr=ge22, idx=1) ~> gs22_1
vec_scale(a=x2, s=gs22_1) ~> rg22_1
sgd_update(weights=nr21_1, grad=rg22_1, lr=lr) ~> nr22_1
get(arr=ge22, idx=2) ~> gs22_2
vec_scale(a=x2, s=gs22_2) ~> rg22_2
sgd_update(weights=nr21_2, grad=rg22_2, lr=lr) ~> nr22_2
get(arr=ge22, idx=3) ~> gs22_3
vec_scale(a=x2, s=gs22_3) ~> rg22_3
sgd_update(weights=nr21_3, grad=rg22_3, lr=lr) ~> nr22_3
[] >> wm23
push(arr=wm23, val=nr22_0) ~> wm23
push(arr=wm23, val=nr22_1) ~> wm23
push(arr=wm23, val=nr22_2) ~> wm23
push(arr=wm23, val=nr22_3) ~> wm23
linear(x=x3, weights=wm23, bias=bv) ~> pe23
vec_sub(a=pe23, b=t3) ~> ge23
get(arr=ge23, idx=0) ~> gs23_0
vec_scale(a=x3, s=gs23_0) ~> rg23_0
sgd_update(weights=nr22_0, grad=rg23_0, lr=lr) ~> nr23_0
get(arr=ge23, idx=1) ~> gs23_1
vec_scale(a=x3, s=gs23_1) ~> rg23_1
sgd_update(weights=nr22_1, grad=rg23_1, lr=lr) ~> nr23_1
get(arr=ge23, idx=2) ~> gs23_2
vec_scale(a=x3, s=gs23_2) ~> rg23_2
sgd_update(weights=nr22_2, grad=rg23_2, lr=lr) ~> nr23_2
get(arr=ge23, idx=3) ~> gs23_3
vec_scale(a=x3, s=gs23_3) ~> rg23_3
sgd_update(weights=nr22_3, grad=rg23_3, lr=lr) ~> nr23_3
[] >> wm24
push(arr=wm24, val=nr23_0) ~> wm24
push(arr=wm24, val=nr23_1) ~> wm24
push(arr=wm24, val=nr23_2) ~> wm24
push(arr=wm24, val=nr23_3) ~> wm24
linear(x=x0, weights=wm24, bias=bv) ~> pe24
vec_sub(a=pe24, b=t0) ~> ge24
get(arr=ge24, idx=0) ~> gs24_0
vec_scale(a=x0, s=gs24_0) ~> rg24_0
sgd_update(weights=nr23_0, grad=rg24_0, lr=lr) ~> nr24_0
get(arr=ge24, idx=1) ~> gs24_1
vec_scale(a=x0, s=gs24_1) ~> rg24_1
sgd_update(weights=nr23_1, grad=rg24_1, lr=lr) ~> nr24_1
get(arr=ge24, idx=2) ~> gs24_2
vec_scale(a=x0, s=gs24_2) ~> rg24_2
sgd_update(weights=nr23_2, grad=rg24_2, lr=lr) ~> nr24_2
get(arr=ge24, idx=3) ~> gs24_3
vec_scale(a=x0, s=gs24_3) ~> rg24_3
sgd_update(weights=nr23_3, grad=rg24_3, lr=lr) ~> nr24_3
[] >> wm25
push(arr=wm25, val=nr24_0) ~> wm25
push(arr=wm25, val=nr24_1) ~> wm25
push(arr=wm25, val=nr24_2) ~> wm25
push(arr=wm25, val=nr24_3) ~> wm25
linear(x=x1, weights=wm25, bias=bv) ~> pe25
vec_sub(a=pe25, b=t1) ~> ge25
get(arr=ge25, idx=0) ~> gs25_0
vec_scale(a=x1, s=gs25_0) ~> rg25_0
sgd_update(weights=nr24_0, grad=rg25_0, lr=lr) ~> nr25_0
get(arr=ge25, idx=1) ~> gs25_1
vec_scale(a=x1, s=gs25_1) ~> rg25_1
sgd_update(weights=nr24_1, grad=rg25_1, lr=lr) ~> nr25_1
get(arr=ge25, idx=2) ~> gs25_2
vec_scale(a=x1, s=gs25_2) ~> rg25_2
sgd_update(weights=nr24_2, grad=rg25_2, lr=lr) ~> nr25_2
get(arr=ge25, idx=3) ~> gs25_3
vec_scale(a=x1, s=gs25_3) ~> rg25_3
sgd_update(weights=nr24_3, grad=rg25_3, lr=lr) ~> nr25_3
[] >> wm26
push(arr=wm26, val=nr25_0) ~> wm26
push(arr=wm26, val=nr25_1) ~> wm26
push(arr=wm26, val=nr25_2) ~> wm26
push(arr=wm26, val=nr25_3) ~> wm26
linear(x=x2, weights=wm26, bias=bv) ~> pe26
vec_sub(a=pe26, b=t2) ~> ge26
get(arr=ge26, idx=0) ~> gs26_0
vec_scale(a=x2, s=gs26_0) ~> rg26_0
sgd_update(weights=nr25_0, grad=rg26_0, lr=lr) ~> nr26_0
get(arr=ge26, idx=1) ~> gs26_1
vec_scale(a=x2, s=gs26_1) ~> rg26_1
sgd_update(weights=nr25_1, grad=rg26_1, lr=lr) ~> nr26_1
get(arr=ge26, idx=2) ~> gs26_2
vec_scale(a=x2, s=gs26_2) ~> rg26_2
sgd_update(weights=nr25_2, grad=rg26_2, lr=lr) ~> nr26_2
get(arr=ge26, idx=3) ~> gs26_3
vec_scale(a=x2, s=gs26_3) ~> rg26_3
sgd_update(weights=nr25_3, grad=rg26_3, lr=lr) ~> nr26_3
[] >> wm27
push(arr=wm27, val=nr26_0) ~> wm27
push(arr=wm27, val=nr26_1) ~> wm27
push(arr=wm27, val=nr26_2) ~> wm27
push(arr=wm27, val=nr26_3) ~> wm27
linear(x=x3, weights=wm27, bias=bv) ~> pe27
vec_sub(a=pe27, b=t3) ~> ge27
get(arr=ge27, idx=0) ~> gs27_0
vec_scale(a=x3, s=gs27_0) ~> rg27_0
sgd_update(weights=nr26_0, grad=rg27_0, lr=lr) ~> nr27_0
get(arr=ge27, idx=1) ~> gs27_1
vec_scale(a=x3, s=gs27_1) ~> rg27_1
sgd_update(weights=nr26_1, grad=rg27_1, lr=lr) ~> nr27_1
get(arr=ge27, idx=2) ~> gs27_2
vec_scale(a=x3, s=gs27_2) ~> rg27_2
sgd_update(weights=nr26_2, grad=rg27_2, lr=lr) ~> nr27_2
get(arr=ge27, idx=3) ~> gs27_3
vec_scale(a=x3, s=gs27_3) ~> rg27_3
sgd_update(weights=nr26_3, grad=rg27_3, lr=lr) ~> nr27_3
[] >> wm28
push(arr=wm28, val=nr27_0) ~> wm28
push(arr=wm28, val=nr27_1) ~> wm28
push(arr=wm28, val=nr27_2) ~> wm28
push(arr=wm28, val=nr27_3) ~> wm28
linear(x=x0, weights=wm28, bias=bv) ~> pe28
vec_sub(a=pe28, b=t0) ~> ge28
get(arr=ge28, idx=0) ~> gs28_0
vec_scale(a=x0, s=gs28_0) ~> rg28_0
sgd_update(weights=nr27_0, grad=rg28_0, lr=lr) ~> nr28_0
get(arr=ge28, idx=1) ~> gs28_1
vec_scale(a=x0, s=gs28_1) ~> rg28_1
sgd_update(weights=nr27_1, grad=rg28_1, lr=lr) ~> nr28_1
get(arr=ge28, idx=2) ~> gs28_2
vec_scale(a=x0, s=gs28_2) ~> rg28_2
sgd_update(weights=nr27_2, grad=rg28_2, lr=lr) ~> nr28_2
get(arr=ge28, idx=3) ~> gs28_3
vec_scale(a=x0, s=gs28_3) ~> rg28_3
sgd_update(weights=nr27_3, grad=rg28_3, lr=lr) ~> nr28_3
[] >> wm29
push(arr=wm29, val=nr28_0) ~> wm29
push(arr=wm29, val=nr28_1) ~> wm29
push(arr=wm29, val=nr28_2) ~> wm29
push(arr=wm29, val=nr28_3) ~> wm29
linear(x=x1, weights=wm29, bias=bv) ~> pe29
vec_sub(a=pe29, b=t1) ~> ge29
get(arr=ge29, idx=0) ~> gs29_0
vec_scale(a=x1, s=gs29_0) ~> rg29_0
sgd_update(weights=nr28_0, grad=rg29_0, lr=lr) ~> nr29_0
get(arr=ge29, idx=1) ~> gs29_1
vec_scale(a=x1, s=gs29_1) ~> rg29_1
sgd_update(weights=nr28_1, grad=rg29_1, lr=lr) ~> nr29_1
get(arr=ge29, idx=2) ~> gs29_2
vec_scale(a=x1, s=gs29_2) ~> rg29_2
sgd_update(weights=nr28_2, grad=rg29_2, lr=lr) ~> nr29_2
get(arr=ge29, idx=3) ~> gs29_3
vec_scale(a=x1, s=gs29_3) ~> rg29_3
sgd_update(weights=nr28_3, grad=rg29_3, lr=lr) ~> nr29_3
[] >> wm30
push(arr=wm30, val=nr29_0) ~> wm30
push(arr=wm30, val=nr29_1) ~> wm30
push(arr=wm30, val=nr29_2) ~> wm30
push(arr=wm30, val=nr29_3) ~> wm30
linear(x=x2, weights=wm30, bias=bv) ~> pe30
vec_sub(a=pe30, b=t2) ~> ge30
get(arr=ge30, idx=0) ~> gs30_0
vec_scale(a=x2, s=gs30_0) ~> rg30_0
sgd_update(weights=nr29_0, grad=rg30_0, lr=lr) ~> nr30_0
get(arr=ge30, idx=1) ~> gs30_1
vec_scale(a=x2, s=gs30_1) ~> rg30_1
sgd_update(weights=nr29_1, grad=rg30_1, lr=lr) ~> nr30_1
get(arr=ge30, idx=2) ~> gs30_2
vec_scale(a=x2, s=gs30_2) ~> rg30_2
sgd_update(weights=nr29_2, grad=rg30_2, lr=lr) ~> nr30_2
get(arr=ge30, idx=3) ~> gs30_3
vec_scale(a=x2, s=gs30_3) ~> rg30_3
sgd_update(weights=nr29_3, grad=rg30_3, lr=lr) ~> nr30_3
[] >> wm31
push(arr=wm31, val=nr30_0) ~> wm31
push(arr=wm31, val=nr30_1) ~> wm31
push(arr=wm31, val=nr30_2) ~> wm31
push(arr=wm31, val=nr30_3) ~> wm31
linear(x=x3, weights=wm31, bias=bv) ~> pe31
vec_sub(a=pe31, b=t3) ~> ge31
get(arr=ge31, idx=0) ~> gs31_0
vec_scale(a=x3, s=gs31_0) ~> rg31_0
sgd_update(weights=nr30_0, grad=rg31_0, lr=lr) ~> nr31_0
get(arr=ge31, idx=1) ~> gs31_1
vec_scale(a=x3, s=gs31_1) ~> rg31_1
sgd_update(weights=nr30_1, grad=rg31_1, lr=lr) ~> nr31_1
get(arr=ge31, idx=2) ~> gs31_2
vec_scale(a=x3, s=gs31_2) ~> rg31_2
sgd_update(weights=nr30_2, grad=rg31_2, lr=lr) ~> nr31_2
get(arr=ge31, idx=3) ~> gs31_3
vec_scale(a=x3, s=gs31_3) ~> rg31_3
sgd_update(weights=nr30_3, grad=rg31_3, lr=lr) ~> nr31_3
[] >> wfinal
push(arr=wfinal, val=nr31_0) ~> wfinal
push(arr=wfinal, val=nr31_1) ~> wfinal
push(arr=wfinal, val=nr31_2) ~> wfinal
push(arr=wfinal, val=nr31_3) ~> wfinal
linear(x=x0, weights=wfinal, bias=bv) ~> c0
softmax(arr=c0) ~> prob0
argmax4(arr=prob0) ~> ans0
linear(x=x1, weights=wfinal, bias=bv) ~> c1
softmax(arr=c1) ~> prob1
argmax4(arr=prob1) ~> ans1
linear(x=x2, weights=wfinal, bias=bv) ~> c2
softmax(arr=c2) ~> prob2
argmax4(arr=prob2) ~> ans2
linear(x=x3, weights=wfinal, bias=bv) ~> c3
softmax(arr=c3) ~> prob3
argmax4(arr=prob3) ~> ans3
[T+]
show shall(ans0)
show shall(ans1)
show shall(ans2)
show shall(ans3)