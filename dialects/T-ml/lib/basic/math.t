func floor(val) {
    past(val) ~> V
    V % 1 >> rem
    V - rem >> base
    0 >> adj
    Gate rem (< 0) >> adj
    base - adj >> out
}

[T-]


func sum(arr) {
    past(arr) ~> P1
    F(P1) {
        O1 + now >> O1
    }
    return O1
}

func avg(arr) {
    past(arr) ~> P1
    sum(arr=P1) ~> O1
    len(val=P1) ~> O2
    O1 / O2 >> O3
    return O3
}

func clamp(val, lo, hi) {
    past(val) ~> P1
    past(lo) ~> P2
    past(hi) ~> P3
    max(a=P1, b=P2) ~> O1
    min(a=O1, b=P3) ~> O2
    return O2
}

func pow(base, exp) {
    past(base) ~> A1
    past(exp) ~> A2
    range(n=A2) ~> O1
    1 >> acc
    F(O1) {
        acc * A1 >> acc
    }
    acc >> out
}

func abs(val) {
    past(val) ~> A1
    0 - A1 >> B1
    max(a=A1, b=B1) ~> out
}

func max_arr(arr) {
    past(arr) ~> A1
    sort(arr=A1) ~> sorted
    last(arr=sorted) ~> out
}

func min_arr(arr) {
    past(arr) ~> A1
    sort(arr=A1) ~> sorted
    first(arr=sorted) ~> out
}

func pi() {
    3.14159265358979 >> out
}

func round(val) {
    past(val) ~> A1
    A1 + 0.5 >> tmp
    floor(val=tmp) ~> out
}

func ceil(val) {
    past(val) ~> A1
    0 - A1 >> neg
    floor(val=neg) ~> f
    0 - f >> out
}

func log2(val) {
    past(val) ~> A1
    log(val=A1) ~> L
    log(val=2) ~> L2
    L / L2 >> out
}

func log10(val) {
    past(val) ~> A1
    log(val=A1) ~> L
    log(val=10) ~> L10
    L / L10 >> out
}

func tan(val) {
    past(val) ~> A1
    sin(val=A1) ~> S
    cos(val=A1) ~> C
    S / C >> out
}

func hypot(a, b) {
    past(a) ~> A
    past(b) ~> B
    A * A >> a2
    B * B >> b2
    a2 + b2 >> sum
    sqrt(val=sum) ~> out
}

func sin(val) {
    past(val) ~> x
    pow(base=x, exp=3) ~> x3
    pow(base=x, exp=5) ~> x5
    pow(base=x, exp=7) ~> x7
    x3 / 6 >> t1
    x5 / 120 >> t2
    x7 / 5040 >> t3
    x - t1 >> r1
    r1 + t2 >> r2
    r2 - t3 >> out
}

func cos(val) {
    past(val) ~> x
    pow(base=x, exp=2) ~> x2
    pow(base=x, exp=4) ~> x4
    pow(base=x, exp=6) ~> x6
    x2 / 2 >> t1
    x4 / 24 >> t2
    x6 / 720 >> t3
    1 - t1 >> r1
    r1 + t2 >> r2
    r2 - t3 >> out
}

func max(a, b) {
    max2(a=a, b=b) ~> out
}

func min(a, b) {
    min2(a=a, b=b) ~> out
}

func max2(a, b) {
    past(a) ~> A
    past(b) ~> B
    [] >> arr
    push(arr=arr, val=A) ~> arr
    push(arr=arr, val=B) ~> arr
    sort(arr=arr) ~> s
    last(arr=s) ~> out
}

func min2(a, b) {
    past(a) ~> A
    past(b) ~> B
    [] >> arr
    push(arr=arr, val=A) ~> arr
    push(arr=arr, val=B) ~> arr
    sort(arr=arr) ~> s
    first(arr=s) ~> out
}

func rand_int(min, max) {
    past(min) ~> A
    past(max) ~> B
    random(min=A, max=B) ~> r
    floor(val=r) ~> out
}

func random(min, max) {
    past(min) ~> A
    past(max) ~> B
    toString(val=A) ~> sa
    toString(val=B) ~> sb
    "shuf -i " + sa + "-" + sb + " -n 1" >> cmd
    exec(cmd=cmd) ~> raw
    trim(str=raw) ~> n
    toNumber(val=n) ~> out
}

func timestamp() {
    exec(cmd="date +%s") ~> raw
    trim(str=raw) ~> n
    toNumber(val=n) ~> out
}

func arctan(val) {
    past(val) ~> V
    atan(val=V) ~> out
}

func arctan2(y, x) {
    past(y) ~> Y
    past(x) ~> X
    atan2(y=Y, x=X) ~> out
}

func exp_e(val) {
    past(val) ~> V
    exp(val=V) ~> out
}

func ln(val) {
    past(val) ~> V
    log(val=V) ~> out
}

func sqrt_n(val) {
    past(val) ~> V
    sqrt(val=V) ~> out
}

func floor_n(val) {
    past(val) ~> V
    floor(val=V) ~> out
}

func product(arr) {
    past(arr) ~> A
    1 >> result
    F(A) {
        result * now >> result
        result >> now
    }
    last(arr=A) ~> out
}


func is_even(n) {
    past(n) ~> N
    floor(val=N) ~> ni
    ni / 2 >> half
    floor(val=half) ~> h
    h * 2 >> doubled
    ni - doubled >> rem
    0 >> out
    0 >> out
    Gate rem (== 0) >> out
}

func is_odd(n) {
    past(n) ~> N
    is_even(n=N) ~> even
    1 - even >> out
}


func map_range(val, in_lo, in_hi, out_lo, out_hi) {
    past(val) ~> V
    past(in_lo) ~> IL
    past(in_hi) ~> IH
    past(out_lo) ~> OL
    past(out_hi) ~> OH
    V - IL >> shifted
    IH - IL >> in_range
    OH - OL >> out_range
    shifted / in_range >> ratio
    ratio * out_range >> scaled
    scaled + OL >> out
}

func safe_div(a, b) {
    past(a) ~> A
    past(b) ~> B
    0 >> iz
    Gate B (== 0) >> iz
    1 - iz >> do_div
    A * do_div >> safe_a
    B + iz >> safe_b
    safe_a / safe_b >> out
}

func max3(a, b, c) {
    past(a) ~> A
    past(b) ~> B
    past(c) ~> C
    max2(a=A, b=B) ~> ab
    max2(a=ab, b=C) ~> out
}

func min3(a, b, c) {
    past(a) ~> A
    past(b) ~> B
    past(c) ~> C
    min2(a=A, b=B) ~> ab
    min2(a=ab, b=C) ~> out
}

func cube(n) {
    past(n) ~> N
    N * N >> sq
    sq * N >> out
}




func between(val, lo, hi) {
    past(val) ~> V
    past(lo) ~> Lo
    past(hi) ~> Hi
    validate_range(val=V, lo=Lo, hi=Hi) ~> out
}

func to_rad(deg) {
    past(deg) ~> D
    pi() ~> p
    D * p >> scaled
    scaled / 180 >> out
}

func to_deg(rad) {
    past(rad) ~> R
    pi() ~> p
    R * 180 >> scaled
    scaled / p >> out
}


func deg_to_rad(deg) {
    past(deg) ~> D
    to_rad(deg=D) ~> out
}

func rad_to_deg(rad) {
    past(rad) ~> R
    to_deg(rad=R) ~> out
}

func interpolate(arr, t) {
    past(arr) ~> A
    past(t) ~> Tv
    len(val=A) ~> n
    n - 1 >> last
    get(arr=A, idx=0) ~> first
    get(arr=A, idx=last) ~> end
    lerp(a=first, b=end, t=Tv) ~> out
}

func sqrt(val) {
    past(val) ~> V
    sqrt_n(val=V) ~> out
}
