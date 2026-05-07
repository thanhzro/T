[T-]
data = [1,2,2,3,3,3]

[T0]
unique(arr=data) ~> O1
push(arr=data, val=99) ~> O2
floor(val=3.7) ~> O3
round(val=3.5) ~> O4
pow(a=2, b=8) ~> O5

[T+]
show shall(O1)
show shall(O2)
show shall(O3)
show shall(O4)
show shall(O5)
