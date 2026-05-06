[T-]
ten = "pass"

[T0]
past(ten) ~> P1
Gate P1 (== "pass") >> O1

[T+]
show shall(O1)
