[T-]
import "lib/basic/std.t"

[T0]
toNumber(val="abc") ~> O1
toNumber(val="123") ~> O2
get(arr=[1,2,3], idx=10) ~> O3
slice(str="hi", from=0, to=100) ~> O4
len(val="") ~> O5
range(n=0) ~> O6
sort(arr=[]) ~> O7
pop(arr=[]) ~> O8

[T+]
show shall(O1, O2, O3, O4, O5, O6, O7, O8)
