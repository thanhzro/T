[T-]
import "lib/basic/std.t"
func test(arr) {
    past(arr) ~> _A
    [] >> _filtered
    F(_A) { Gate now (!= "") >> _filtered }
    _filtered >> out
}
arr = ["a", "", "b"]
[T0]
test(arr=arr) ~> r
[T+]
show shall(r)
