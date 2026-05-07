[T-]
arr scores = [80, 90, 70]

[T0]
past(scores) ~> P1
sum(arr=P1) ~> O1

[T+]
show shall(O1)
write("result.txt") shall(O1)
