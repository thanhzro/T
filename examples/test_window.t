[T-]
import "lib/intermediate/array.t"
data = [1,2,3,4,5]

[T0]
sliding_window(arr=data, n=3) ~> O1

[T+]
show shall(O1)
