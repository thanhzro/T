[T-]
import "lib/basic/std.t"
import "lib/intermediate/array.t"

[T0]
arr_zip_map(a=[1,2,3], b=[10,20,30]) ~> O1
arr_diff(a=[1,2,3,4], b=[2,4]) ~> O2
arr_intersect(a=[1,2,3,4], b=[2,4,6]) ~> O3

[T+]
show shall(O1, O2, O3)
