[T-]
import "lib/intermediate/array.t"
a = [1,2,3]
b = ["a","b","c"]

[T0]
zip_with(a=a, b=b) ~> O1

[T+]
show shall(O1)
