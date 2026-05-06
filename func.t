[T-]
a = 10
b = 20

func tinh_tong(a, b) {
    past(a) ~> P1
    past(b) ~> P2
    P1 + P2 >> O1
    return O1
}

[T0]
tinh_tong(a=a, b=b) ~> P3

[T+]
show shall(P3)
