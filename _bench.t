[T-]
x = 100
[T0]
x * 2 >> r1
abs(val=x) ~> r2
r1 + r2 >> r3
[T+]
show shall(r3)
