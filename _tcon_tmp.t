[T-]
import "lib/basic/std.t"
src = "hello,world"
[T0]
split(str=src, sep=",") ~> arr
[T+]
show shall(arr)
