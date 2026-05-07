[T-]
func add(a, b) {
    past(a) ~> P1
    past(b) ~> P2
    P1 + P2 >> out
}
x = 5
y = 3

[T0]
add(a=x, b=y) ~> O1

[T+]
show shall(O1)
