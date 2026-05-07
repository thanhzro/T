[T-]
data = [10,20,30]
target = 2

[T0]
F(data) {
    Gate idx (== target) >> O1
}

[T+]
show shall(O1)
