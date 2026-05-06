[T-]
m = [115, 104, 111, 119]
[T0]
past(m) ~> P1
F(P1) {
Gate now (== 115) >> O1
Gate O1 (== 115) >> O3
Gate now (== 104) >> O4
Gate O3 (== 115) Gate O4 (== 104) >> O2
}
[T+]
show shall(O2)
