[T-]
import "lib/basic/std.t"
src = "[T-]|func add() {|x = 10"
[T0]
split(str=src, sep="|") ~> arr
[] >> result
F(arr) { Gate now (!= "[T-]") >> result }
[T+]
show shall(result)
