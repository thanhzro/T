[T-]


func lerp(a, b, t) {
    past(a) ~> A
    past(b) ~> B
    past(t) ~> Tv
    B - A >> diff
    diff * Tv >> scaled
    A + scaled >> out
}

func sign(val) {
    past(val) ~> V
    Gate V (> 0) >> pos
    isNumber(val=pos) ~> is_pos
    Gate V (< 0) >> neg
    isNumber(val=neg) ~> is_neg
    is_pos - is_neg >> out
}




func sum_range(lo, hi) {
    past(lo) ~> Lo
    past(hi) ~> Hi
    Hi - Lo >> n
    n + 1 >> n1
    Lo + Hi >> ft
    ft * n1 >> prod
    prod / 2 >> out
}


func e() {
    exp(val=1) ~> out
}
