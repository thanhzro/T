[T-]
data = [10, 20, 30, 40, 50]

[T0]
F(data) {
    Gate now (>= 20) >> O1
}

[T+]
show shall(O1)
