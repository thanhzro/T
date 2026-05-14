[T-]
func double(n) {
    past(n) ~> x
    x * 2 >> result
}
[T0]
double(n=5) ~> r
[T+]
show shall(r)
