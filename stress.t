[T-]
read("small.txt") ~> P1

[T0]
past(P1) ~> P2
F(P2) {
    now + O1 >> O1
}

[T+]
show O1
