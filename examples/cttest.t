[T-]
chars = ["a", "B", "c"]

[T0]
past(chars) ~> P1
F(P1) {
    Gate now (== "a") >> now
    "X" >> now
}

[T+]
show shall(P1)
