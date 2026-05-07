[T-]
read("diem.txt") ~> P1

[T0]
F(P1) {
    O1 + now >> O1
}

[T+]
show shall(O1)
