[T-]
import "lib/basic/std.t"
import "lib/intermediate/array.t"
import "lib/intermediate/string2.t"
data = [1,2,3,4,5]

[T0]
rotate(arr=data, n=2) ~> O1
lstrip(str="  hello") ~> O2
rstrip(str="hello  ") ~> O3
center(str="hi", n=8) ~> O4

[T+]
show shall(O1, O2, O3, O4)
