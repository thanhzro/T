[T-]
scores = [1, 2, 3, 4, 5, 6]

[T0]
F(scores) {
    Gate now (% 2 == 0) >> O1
}

[T+]
show shall(O1)
