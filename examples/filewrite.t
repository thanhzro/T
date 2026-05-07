[T-]
arr scores = [80, 90, 70]

[T0]
past(scores) ~> P1
write("output.txt") << P1

[T+]
show shall(P1)
