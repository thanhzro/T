[T-]
import "lib/basic/std.t"
import "lib/intermediate/array.t"

[T0]
arr_diff(a=[1,2,3,4], b=[2,4]) ~> O1
exec(cmd="cat set_a.txt") ~> O2
exec(cmd="cat set_op.py") ~> O3

[T+]
show shall(O2, O3, O1)
