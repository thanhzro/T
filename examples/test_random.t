[T-]

[T0]
rand_int(min=1, max=100) ~> O1
timestamp() ~> O2

[T+]
show shall(O1)
show shall(O2)
