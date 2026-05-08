[T-]
import "lib/basic/std.t"
import "lib/intermediate/string2.t"
import "lib/intermediate/math2.t"

[T0]
slugify(str="Hello World Foo") ~> O1
is_numeric(str="123.45") ~> O2
is_numeric(str="abc") ~> O3
fibonacci(n=10) ~> O4
median(arr=[3,1,4,1,5,9,2,6]) ~> O5

[T+]
show shall(O1, O2, O3, O4, O5)
