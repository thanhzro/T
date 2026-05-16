[T-]
import "lib/basic/std.t"
import "lib/advanced/ml_t.t"
row0 = [1, 0, 0, 0]
bv = [0, 0, 0, 0]
xa = [1, 0, 0, 0]
[T0]
linear_rows(r0=row0, r1=row0, r2=row0, r3=row0, bv=bv, x=xa) ~> pred_ep0_p0
len(val=pred_ep0_p0) ~> plen
get(arr=pred_ep0_p0, idx=0) ~> v0
[T+]
show shall(plen)
show shall(v0)
