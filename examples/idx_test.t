[T-]
data = [10, 20, 30, 40, 50]

[T0]
F(data) {
    Gate idx (>= 1 && <= 3) >> O1
}

[T+]
show shall(O1)
