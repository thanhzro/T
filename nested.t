[T-]
arr matrix = [1, 2, 3]

[T0]
past(matrix) ~> P1
F(P1) {
    now * 2 >> O1
}

[T+]
show shall(O1)
