[T-]
import "lib/basic/std.t"
import "lib/intermediate/math2.t"
import "lib/intermediate/datetime.t"
data = [2,4,4,4,5,5,7,9]

[T0]
variance(arr=data) ~> O1
std_dev(arr=data) ~> O2
timestamp() ~> ts
date_add(ts=ts, days=7) ~> O3
format_date(ts=O3) ~> O4

[T+]
show shall(O1, O2, O4)
