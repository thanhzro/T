[T-]
base = 2
exp = 8

[T0]
range(n=exp) ~> O1
1 >> acc
F(O1) {
    acc * base >> acc
}

[T+]
show shall(acc)
