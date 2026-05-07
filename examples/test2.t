[T-]
scores = [80, 95, 60, 90, 40]

[T0]
F(scores) {
    Gate now (>= 80) >> O1
}

[T+]
show shall(O1)
