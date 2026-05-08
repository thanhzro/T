[T-]
import "lib/basic/std.t"
import "lib/intermediate/array.t"
import "lib/intermediate/math2.t"
data = [1,2,3,4,5,6]

[T0]
mode(arr=[1,2,2,3,3,3]) ~> O1
partition(arr=data, val=3) ~> O2
zip_longest(a=[1,2,3], b=["a","b"], fill=0) ~> O3

[T+]
show shall(O1, O2, O3)
