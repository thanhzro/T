[T-]
import "lib/basic/std.t"

[T0]
split(str="", sep=",") ~> O1
join(arr=[], sep=",") ~> O2
indexOf(str="hello", sub="xyz") ~> O3
replace(str="hello", old="xyz", new="ABC") ~> O4
trim(str="") ~> O5
upper(str="") ~> O6

[T+]
show shall(O1, O2, O3, O4, O5, O6)
