[T-]
func test(n) {
    range_step(from=0, to=n, step=1) ~> out
}
[T0]
test(n=5) ~> r
[T+]
show shall(r)
