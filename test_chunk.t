[T-]
import "lib/intermediate/array.t"
data = [1,2,3,4,5,6,7,8]

[T0]
chunk(arr=data, n=3) ~> O1

[T+]
show shall(O1)
