[T-]
import "lib/basic/std.t"
src = "func add(a, b) {|func mul(a, b) {|x = 10"
[T0]
split(str=src, sep="|") ~> lines
arr_filter_starts(arr=lines, prefix="func ") ~> funcs
[T+]
show shall(funcs)
