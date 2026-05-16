[T-]
import "lib/basic/std.t"
import "lib/advanced/ml_t.t"
r0 = [0.5, 0.3, 0.2, 0.1]
r1 = [0.1, 0.5, 0.3, 0.1]
r2 = [0.2, 0.1, 0.5, 0.2]
r3 = [0.1, 0.2, 0.1, 0.5]
xvec = [1, 0, 0, 0]
[T0]
mat_mmv(src=r0, sz=4, inp=xvec) ~> out0
mat_mmv(src=r1, sz=4, inp=xvec) ~> out1
mat_mmv(src=r2, sz=4, inp=xvec) ~> out2
mat_mmv(src=r3, sz=4, inp=xvec) ~> out3
[T+]
show shall(out0)
show shall(out1)
show shall(out2)
show shall(out3)
