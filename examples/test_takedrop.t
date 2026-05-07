[T-]
import "lib/intermediate/array.t"
data = [1,2,3,4,5,6]

[T0]
take(arr=data, n=3) ~> O1
drop(arr=data, n=3) ~> O2

[T+]
show shall(O1, O2)
