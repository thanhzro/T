[T-]
func cong(a, b) {
    past(a) ~> P1
    past(b) ~> P2
    P1 + P2 >> O1
    return O1
}
