[T-]
import "lib/intermediate/math2.t"

func mean(arr) {
    past(arr) ~> A
    sum(arr=A) ~> s
    len(val=A) ~> n
    s / n >> out
}

func correlation(a, b) {
    past(a) ~> A
    past(b) ~> B
    mean(arr=A) ~> ma
    mean(arr=B) ~> mb
    zip_with(a=A, b=B) ~> pairs
    F(pairs) {
        get(arr=now, idx=0) ~> x
        get(arr=now, idx=1) ~> y
        x - ma >> dx
        y - mb >> dy
        dx * dy >> now
    }
    sum(arr=pairs) ~> cov
    std_dev(arr=A) ~> sa
    std_dev(arr=B) ~> sb
    len(val=A) ~> n
    sa * sb >> denom
    n * denom >> total
    cov / total >> out
}

func percentile(arr, p) {
    past(arr) ~> A
    past(p) ~> P
    sort(arr=A) ~> s
    len(val=s) ~> n
    P / 100 >> ratio
    ratio * n >> idx_raw
    floor(val=idx_raw) ~> idx
    get(arr=s, idx=idx) ~> out
}

func zscore(arr) {
    past(arr) ~> A
    mean(arr=A) ~> m
    std_dev(arr=A) ~> sd
    F(A) {
        now - m >> diff
        diff / sd >> now
    }
    A >> out
}

func z_score(arr) {
    past(arr) ~> A
    avg(arr=A) ~> mn
    std_dev(arr=A) ~> sd
    F(A) {
        now - mn >> diff
        safe_div(a=diff, b=sd) ~> now
    }
    A >> out
}


func range_of(arr) {
    past(arr) ~> A
    max_arr(arr=A) ~> mx
    min_arr(arr=A) ~> mn
    mx - mn >> out
}

func sum_sq(arr) {
    past(arr) ~> A
    F(A) { now * now >> now }
    sum(arr=A) ~> out
}
