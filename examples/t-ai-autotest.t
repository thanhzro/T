[T-]
import "lib/generated/math_gen.t"
import "lib/basic/std.t"

[T0]
add2(a=5, b=3) ~> r1
add2(a=0, b=0) ~> r2
mul2(a=4, b=4) ~> r3
mul2(a=0, b=5) ~> r4
r1 - 8 >> t1
r2 - 0 >> t2
r3 - 16 >> t3
r4 - 0 >> t4
abs(val=t1) ~> e1
abs(val=t2) ~> e2
abs(val=t3) ~> e3
abs(val=t4) ~> e4
e1 + e2 >> s1
s1 + e3 >> s2
s2 + e4 >> total_err
Gate total_err (== 0) >> all_pass
isNumber(val=all_pass) ~> passed

[T+]
show shall(r1, r2, r3, r4, passed)
