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

func percent(val, total) {
    past(val) ~> V
    past(total) ~> T
    V / T >> ratio
    ratio * 100 >> out
}

func average_arr(arr) {
    past(arr) ~> A
    sum(arr=A) ~> s
    len(val=A) ~> n
    s / n >> out
}

func clamp_arr(arr, lo, hi) {
    past(arr) ~> A
    past(lo) ~> Lo
    past(hi) ~> Hi
    F(A) {
        clamp(val=now, lo=Lo, hi=Hi) ~> now
    }
    A >> out
}

func moving_avg(arr, window) {
    past(arr) ~> A
    past(window) ~> W
    len(val=A) ~> n
    n - W >> lim
    lim + 1 >> count
    range(n=count) ~> idx
    F(idx) {
        slice_arr(arr=A, from=now, to=now+W) ~> win
        avg(arr=win) ~> now
    }
    idx >> out
}
