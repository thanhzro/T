[T-]
import "lib/basic/std.t"
a = [1, 2, 3, 4]
b = [5, 6, 7, 8]
[T0]
vec_concat(a=a, b=b) ~> c
len(val=c) ~> n
[T+]
show shall(c)
show shall(n)
