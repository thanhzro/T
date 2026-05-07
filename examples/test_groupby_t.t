[T-]
import "lib/intermediate/array.t"
data = [1,2,1,3,2,1]

[T0]
groupBy_t(arr=data) ~> O1

[T+]
show shall(O1)
