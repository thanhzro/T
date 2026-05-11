[T-]
10 >> x
5 >> y

[T0]
func multiply(a, b) {
a * b >> out
}
func add(a, b) {
a + b >> out
}
multiply(a=x, b=y) ~> O1
add(a=x, b=y) ~> O2

[T+]
show shall(O1, O2)
