[T-]
data = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

[T0]
past(data) ~> P1
F(P1) {
    now * now >> O1
}
sum(arr=O1) ~> RESULT

[T+]
show shall(RESULT)
