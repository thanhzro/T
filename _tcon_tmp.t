[T-]
import "lib/basic/std.t"
import "lib/advanced/ml_t.t"
row0 = [2.84474e-06, 9.55467e-08, 9.55467e-08, 0.999996]
row1 = [0.999988, 2.77036e-06, 9.55467e-08, 1.81726e-05]
row2 = [-3.38932e-07, 0.999994, 4.34128e-06, 1.16049e-05]
row3 = [-5.83492e-06, -1.06354e-06, 0.999985, 2.88698e-05]
bv = [0, 0, 0, 0]
xa = [1, 0, 0, 0]
xb = [0, 1, 0, 0]
xc = [0, 0, 1, 0]
xd = [0, 0, 0, 1]
[T0]
linear_rows(r0=row0, r1=row1, r2=row2, r3=row3, bv=bv, x=xa) ~> ra
argmax4(arr=ra) ~> aa
linear_rows(r0=row0, r1=row1, r2=row2, r3=row3, bv=bv, x=xb) ~> rb
argmax4(arr=rb) ~> ab
linear_rows(r0=row0, r1=row1, r2=row2, r3=row3, bv=bv, x=xc) ~> rc
argmax4(arr=rc) ~> ac
linear_rows(r0=row0, r1=row1, r2=row2, r3=row3, bv=bv, x=xd) ~> rd
argmax4(arr=rd) ~> ad
[T+]
show shall(aa)
show shall(ab)
show shall(ac)
show shall(ad)
