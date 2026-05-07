[T-]
arr matrix = [[1, 2], [3, 4]]

[T0]
past(matrix) ~> P1
F(P1) {
    F(now) {
        O1 + now >> O1
    }
}

[T+]
show shall(O1)
