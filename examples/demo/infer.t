[T-]
import "lib/basic/std.t"
import "lib/advanced/ml_t.t"
row0 = [4.14908e-05, 2.25393e-06, 2.25393e-06, 0.999952]
row1 = [0.999834, 4.82526e-05, 2.25393e-06, 0.000200608]
row2 = [-9.85873e-06, 0.999908, 6.79663e-05, 0.000143133]
row3 = [-7.20977e-05, -1.15457e-05, 0.999811, 0.000334715]
bv = [0, 0, 0, 0]
xa = [1, 0, 0, 0]
xb = [0, 1, 0, 0]
xc = [0, 0, 1, 0]
xd = [0, 0, 0, 1]
[T0]
linear_rows(r0=row0, r1=row1, r2=row2, r3=row3, bv=bv, x=xa) ~> ff0
softmax(arr=ff0) ~> pb0
argmax4(arr=pb0) ~> an0
linear_rows(r0=row0, r1=row1, r2=row2, r3=row3, bv=bv, x=xb) ~> ff1
softmax(arr=ff1) ~> pb1
argmax4(arr=pb1) ~> an1
linear_rows(r0=row0, r1=row1, r2=row2, r3=row3, bv=bv, x=xc) ~> ff2
softmax(arr=ff2) ~> pb2
argmax4(arr=pb2) ~> an2
linear_rows(r0=row0, r1=row1, r2=row2, r3=row3, bv=bv, x=xd) ~> ff3
softmax(arr=ff3) ~> pb3
argmax4(arr=pb3) ~> an3
[T+]
show shall(an0)
show shall(an1)
show shall(an2)
show shall(an3)