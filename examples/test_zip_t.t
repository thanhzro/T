[T-]
data = [1,2,3]
b = [4,5,6]

[T0]
len(val=data) ~> L1
range(n=L1) ~> O1
F(O1) {
    get(arr=data, idx=idx) ~> now
}

[T+]
show shall(O1)
