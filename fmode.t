[T-]
arr scores = [65, 80, 45, 90, 70]

[T0]
past(scores) ~> P1
F(P1) {
    Gate now (>= 70) >> O1
    now + 5 >> now
}

[T+]
show shall(O1)
