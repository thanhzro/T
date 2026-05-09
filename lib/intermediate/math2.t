[T-]

func gcd(a, b) {
    past(a) ~> A
    past(b) ~> B
    loop {
        A % B >> r
        B >> A
        r >> B
        Gate B (== 0) >> done
    }
    A >> out
}

func lcm(a, b) {
    past(a) ~> A
    past(b) ~> B
    gcd(a=A, b=B) ~> G
    A * B >> prod
    prod / G >> out
}

func is_prime(n) {
    past(n) ~> N
    1 >> result
    Gate N (>= 2) >> ok
    isNumber(val=ok) ~> valid
    result * valid >> result
    2 >> i
    loop {
        i * i >> i2
        Gate i2 (> N) >> done
        N % i >> r
        Gate r (== 0) >> is_factor
        isNumber(val=is_factor) ~> factor_found
        1 - factor_found >> not_factor
        result * not_factor >> result
        i + 1 >> i
    }
    result >> out
}

func factorial(n) {
    past(n) ~> N
    1 >> result
    1 >> i
    loop {
        Gate i (> N) >> done
        result * i >> result
        i + 1 >> i
    }
    result >> out
}

func fibonacci(n) {
    past(n) ~> N
    0 >> a
    1 >> b
    1 >> i
    loop {
        Gate i (> N) >> done
        a + b >> tmp
        b >> a
        tmp >> b
        i + 1 >> i
    }
    a >> out
}

func median(arr) {
    past(arr) ~> A1
    sort(arr=A1) ~> A2
    len(val=A2) ~> L
    L / 2 >> mid
    get(arr=A2, idx=mid) ~> out
}

func mode(arr) {
    past(arr) ~> A1
    sort(arr=A1) ~> A2
    len(val=A2) ~> L
    0 >> max_count
    0 >> mode_val
    0 >> i
    loop {
        Gate i (>= L) >> done
        get(arr=A2, idx=i) ~> cur
        count(arr=A2, val=cur) ~> cnt
        cnt - max_count >> diff
        clamp(val=diff, lo=0, hi=1) ~> is_more
        [] >> opts_val
        push(arr=opts_val, val=mode_val) ~> opts_val
        push(arr=opts_val, val=cur) ~> opts_val
        get(arr=opts_val, idx=is_more) ~> mode_val
        [] >> opts_cnt
        push(arr=opts_cnt, val=max_count) ~> opts_cnt
        push(arr=opts_cnt, val=cnt) ~> opts_cnt
        get(arr=opts_cnt, idx=is_more) ~> max_count
        i + 1 >> i
    }
    mode_val >> out
}

func variance(arr) {
    past(arr) ~> A1
    avg(arr=A1) ~> mu
    F(A1) {
        now - mu >> diff
        diff * diff >> now
    }
    avg(arr=A1) ~> out
}

func std_dev(arr) {
    past(arr) ~> A1
    variance(arr=A1) ~> v
    sqrt(val=v) ~> out
}

func clamp_num(val, lo, hi) {
    past(val) ~> V
    past(lo) ~> Lo
    past(hi) ~> Hi
    clamp(val=V, lo=Lo, hi=Hi) ~> out
}

func lerp_range(arr, new_lo, new_hi) {
    past(arr) ~> A
    past(new_lo) ~> NL
    past(new_hi) ~> NH
    min_arr(arr=A) ~> mn
    max_arr(arr=A) ~> mx
    mx - mn >> rng
    NH - NL >> new_rng
    F(A) {
        now - mn >> shifted
        shifted / rng >> ratio
        ratio * new_rng >> scaled
        scaled + NL >> now
    }
    A >> out
}

func sum_digits(n) {
    past(n) ~> N
    abs(val=N) ~> pos
    floor(val=pos) ~> int_n
    toString(val=int_n) ~> s
    str_chars(str=s) ~> digits
    F(digits) {
        toNumber(val=now) ~> now
    }
    sum(arr=digits) ~> out
}

func is_divisor(n, d) {
    past(n) ~> N
    past(d) ~> D
    N / D >> q
    floor(val=q) ~> qi
    qi * D >> prod
    N - prod >> rem
    Gate rem (== 0) >> O1
    isNumber(val=O1) ~> out
}


func pow_mod(base, exp, mod) {
    past(base) ~> B
    past(exp) ~> E
    past(mod) ~> M
    1 >> result
    floor(val=E) ~> ei
    0 >> i
    loop {
        Gate i (>= ei) >> done
        result * B >> result
        result / M >> q
        floor(val=q) ~> qi
        qi * M >> prod
        result - prod >> result
        i + 1 >> i
    }
    result >> out
}

func digits_of(n) {
    past(n) ~> N
    abs(val=N) ~> pos
    floor(val=pos) ~> ni
    toString(val=ni) ~> s
    str_chars(str=s) ~> chars
    F(chars) {
        toNumber(val=now) ~> now
    }
    chars >> out
}

func nth_root(val, n) {
    past(val) ~> V
    past(n) ~> N
    safe_div(a=1, b=N) ~> exp
    ln(val=V) ~> lv
    lv * exp >> le
    exp_e(val=le) ~> out
}

func log_base(val, base) {
    past(val) ~> V
    past(base) ~> B
    ln(val=V) ~> lv
    ln(val=B) ~> lb
    safe_div(a=lv, b=lb) ~> out
}
