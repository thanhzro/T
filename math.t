[T-]
x = -5
a = 3
b = 7

[T0]
abs(val=x) ~> P1
max(a=a, b=b) ~> P2
min(a=a, b=b) ~> P3

[T+]
show shall(P1)
show shall(P2)
show shall(P3)
