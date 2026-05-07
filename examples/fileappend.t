[T-]
bonus = [100, 95]

[T0]
past(bonus) ~> P1
append("output.txt") << P1

[T+]
show shall(P1)
