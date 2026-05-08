[T-]
import "lib/basic/std.t"
import "lib/intermediate/math2.t"

func clamp(val, lo, hi) {
    past(val) ~> V
    past(lo) ~> L
    past(hi) ~> H
    max2(a=V, b=L) ~> v1
    min2(a=v1, b=H) ~> out
}

func lerp(a, b, t) {
    past(a) ~> A
    past(b) ~> B
    past(t) ~> T
    B - A >> diff
    diff * T >> scaled
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

func round(val) {
    past(val) ~> V
    V + 0.5 >> shifted
    floor(val=shifted) ~> out
}

func ceil(val) {
    past(val) ~> V
    0 - V >> neg
    floor(val=neg) ~> f
    0 - f >> out
}

func pow(base, exp) {
    past(base) ~> B
    past(exp) ~> E
    log(val=B) ~> lb
    lb * E >> le
    exp(val=le) ~> out
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

func pi() {
    atan(val=1) ~> a
    a * 4 >> out
}

func e() {
    exp(val=1) ~> out
}
