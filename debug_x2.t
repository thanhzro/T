[T-]
import "lib/basic/std.t"
import "lib/advanced/ml_t.t"
row0 = [0.5, 0.3, 0.2, 0.1]
row1 = [0.1, 0.5, 0.3, 0.1]
row2 = [0.2, 0.1, 0.5, 0.2]
row3 = [0.1, 0.2, 0.1, 0.5]
bv = [0, 0, 0, 0]
x2 = [0, 0, 1, 0]
t2 = [0, 0, 0, 1]
lr = 0.3
[T0]
linear_rows(r0=row0, r1=row1, r2=row2, r3=row3, bv=bv, x=x2) ~> _p_e0_i2
vec_sub(a=_p_e0_i2, b=t2) ~> _g_e0_i2
[T+]
show shall(_p_e0_i2)
show shall(_g_e0_i2)
