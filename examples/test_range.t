[T-]
data = [10,20,30,40,50]

[T0]
range(n=5) ~> O1
get(arr=data, idx=2) ~> O2

[T+]
show shall(O1)
show shall(O2)
