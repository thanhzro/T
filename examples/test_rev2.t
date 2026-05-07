[T-]
data = [10,20,30,40,50]

[T0]
len(val=data) ~> L1
range(n=L1) ~> O1
F(O1) {
    L1 - 1 - idx >> O4
    get(arr=data, idx=O4) ~> now
}

[T+]
show shall(O1)
