[T-]
data = [10,20,30]

[T0]
range(n=3) ~> O1
F(O1) {
    get(arr=data, idx=idx) ~> now
}

[T+]
show shall(O1)
