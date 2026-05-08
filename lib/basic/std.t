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



func upper(str) {
    past(str) ~> P1
    chars(str=P1) ~> P2
    F(P2) {
        charCode(str=now) ~> O1
        Gate O1 (>= 97 && <= 122) >> now
        O1 - 32 >> O4
        fromChar(val=O4) ~> now
    }
    join(arr=P2, sep="") ~> O5
    return O5
}

func lower(str) {
    past(str) ~> P1
    chars(str=P1) ~> P2
    F(P2) {
        charCode(str=now) ~> O1
        Gate O1 (>= 65 && <= 90) >> now
        O1 + 32 >> O4
        fromChar(val=O4) ~> now
    }
    join(arr=P2, sep="") ~> O5
    return O5
}



func first(arr) {
    past(arr) ~> P1
    get(arr=P1, idx=0) ~> out
}

func last(arr) {
    past(arr) ~> P1
    len(val=P1) ~> L1
    L1 - 1 >> L2
    get(arr=P1, idx=L2) ~> out
}

func clamp(val, lo, hi) {
    past(val) ~> P1
    past(lo) ~> P2
    past(hi) ~> P3
    max(a=P1, b=P2) ~> O1
    min(a=O1, b=P3) ~> O2
    return O2
}


func startsWith(str, prefix) {
    past(str) ~> P1
    past(prefix) ~> P2
    indexOf(str=P1, sub=P2) ~> O1
    Gate O1 (== 0) >> O2
    return O2
}

func endsWith(str, suffix) {
    past(str) ~> P1
    past(suffix) ~> P2
    len(val=P1) ~> O1
    len(val=P2) ~> O2
    O1 - O2 >> O3
    indexOf(str=P1, sub=P2) ~> O4
    Gate O4 (== O3) >> O5
    return O5
}



func repeat(str, n) {
    past(str) ~> P1
    past(n) ~> P2
    range(n=P2) ~> O1
    "" >> result
    F(O1) {
        result + P1 >> result
    }
    return result
}




func reverse(arr) {
    past(arr) ~> A1
    len(val=A1) ~> L1
    range(n=L1) ~> O1
    F(O1) {
        L1 - 1 - idx >> O4
        get(arr=A1, idx=O4) ~> now
    }
    O1 >> out
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

func toString(val) {
    past(val) ~> A1
    "{A1}" >> out
}

func count(arr, val) {
    past(arr) ~> A1
    past(val) ~> A2
    F(A1) {
        Gate now (== A2) >> O1
    }
    len(val=O1) ~> out
}

func pi() {
    3.14159265358979 >> out
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

func contains(str, sub) {
    indexOf(str=str, sub=sub) ~> O1
    O1 + 1 >> O2
    clamp(val=O2, lo=0, hi=1) ~> out
}

func padLeft(str, n, ch) {
    past(str) ~> A1
    past(n) ~> A2
    past(ch) ~> A3
    len(val=A1) ~> B1
    A2 - B1 >> B2
    repeat(str=A3, n=B2) ~> B3
    B3 + A1 >> out
}

func padRight(str, n, ch) {
    past(str) ~> A1
    past(n) ~> A2
    past(ch) ~> A3
    len(val=A1) ~> B1
    A2 - B1 >> B2
    repeat(str=A3, n=B2) ~> B3
    A1 + B3 >> out
}



func unique(arr) {
    past(arr) ~> A1
    sort(arr=A1) ~> A2
    F(A2) {
        idx - 1 >> prev_idx
        get(arr=A2, idx=prev_idx) ~> prev
        Gate idx (== 0) || now (!= prev) >> O1
    }
    O1 >> out
}


func replace(str, old, new) {
    past(str) ~> A1
    past(old) ~> A2
    past(new) ~> A3
    split(str=A1, sep=A2) ~> parts
    join(arr=parts, sep=A3) ~> out
}

func trim(str) {
    past(str) ~> A1
    len(val=A1) ~> L
    0 >> start
    loop {
        slice(str=A1, from=start, to=start+1) ~> ch
        start + 1 >> start
        Gate ch (!= " ") >> done
    }
    start - 1 >> real_start
    L - 1 >> end
    loop {
        slice(str=A1, from=end, to=end+1) ~> ch2
        end - 1 >> end
        Gate ch2 (!= " ") >> done2
    }
    end + 2 >> real_end
    slice(str=A1, from=real_start, to=real_end) ~> out
}

func zip(a, b) {
    past(a) ~> A1
    past(b) ~> A2
    len(val=A1) ~> L1
    len(val=A2) ~> L2
    min(a=L1, b=L2) ~> L
    range(n=L) ~> IDX
    F(IDX) {
        get(arr=A1, idx=now) ~> v1
        get(arr=A2, idx=now) ~> v2
        [] >> pair
        push(arr=pair, val=v1) ~> pair
        push(arr=pair, val=v2) ~> pair
        pair >> now
    }
    IDX >> out
}

func flatten(arr) {
    past(arr) ~> A1
    [] >> result
    F(A1) {
        isArray(val=now) ~> is_arr
        Gate is_arr (== 1) >> O1
    }
    F(O1) {
        F(now) {
            push(arr=result, val=now) ~> result
        }
    }
    result >> out
}

func max(a, b) {
    max2(a=a, b=b) ~> out
}

func min(a, b) {
    min2(a=a, b=b) ~> out
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






func to_hex(str) {
    past(str) ~> A1
    chars(str=A1) ~> ch
    F(ch) {
        charCode(str=now) ~> code
        num_to_hex(val=code) ~> now
    }
    join(arr=ch, sep="") ~> out
}

func url_encode(str) {
    past(str) ~> A1
    chars(str=A1) ~> ch
    F(ch) {
        regex_match(str=now, pat="^[a-zA-Z0-9._~-]$") ~> ok
        charCode(str=now) ~> code
        num_to_hex(val=code) ~> hex
        "%" + hex >> encoded
        [] >> opts
        push(arr=opts, val=encoded) ~> opts
        push(arr=opts, val=now) ~> opts
        get(arr=opts, idx=ok) ~> now
    }
    join(arr=ch, sep="") ~> out
}

func hex_char_to_num(ch) {
    past(ch) ~> A1
    charCode(str=A1) ~> code
    48 >> zero
    55 >> A_off
    57 >> nine
    code - zero >> digit
    code - A_off >> alpha
    Gate code (> nine) >> is_alpha
    isNumber(val=is_alpha) ~> ia
    [] >> opts
    push(arr=opts, val=digit) ~> opts
    push(arr=opts, val=alpha) ~> opts
    get(arr=opts, idx=ia) ~> out
}

func from_hex(str) {
    past(str) ~> A1
    upper(str=A1) ~> A1
    len(val=A1) ~> L
    L / 2 >> pairs
    range(n=pairs) ~> IDX
    F(IDX) {
        now * 2 >> pos
        slice(str=A1, from=pos, to=pos+1) ~> hi_ch
        slice(str=A1, from=pos+1, to=pos+2) ~> lo_ch
        hex_char_to_num(ch=hi_ch) ~> hi
        hex_char_to_num(ch=lo_ch) ~> lo
        hi * 16 >> hi16
        hi16 + lo >> code
        fromChar(val=code) ~> now
    }
    join(arr=IDX, sep="") ~> out
}


func to_base64(str) {
    past(str) ~> A1
    chars(str=A1) ~> ch
    len(val=ch) ~> L
    "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/" >> alpha
    chars(str=alpha) ~> alpha_arr
    range_step(from=0, to=L, step=3) ~> starts
    F(starts) {
        get(arr=ch, idx=now) ~> c1
        charCode(str=c1) ~> b1
        now + 1 >> i2
        now + 2 >> i3
        L - i2 >> d2
        clamp(val=d2, lo=0, hi=1) ~> has2
        L - i3 >> d3
        clamp(val=d3, lo=0, hi=1) ~> has3
        get(arr=ch, idx=i2) ~> c2r
        charCode(str=c2r) ~> b2r
        [] >> b2o
        push(arr=b2o, val=0) ~> b2o
        push(arr=b2o, val=b2r) ~> b2o
        get(arr=b2o, idx=has2) ~> b2
        get(arr=ch, idx=i3) ~> c3r
        charCode(str=c3r) ~> b3r
        [] >> b3o
        push(arr=b3o, val=0) ~> b3o
        push(arr=b3o, val=b3r) ~> b3o
        get(arr=b3o, idx=has3) ~> b3
        b1 / 4 >> ix1
        b1 % 4 >> r1
        r1 * 16 >> r1s
        b2 / 16 >> b2h
        r1s + b2h >> ix2
        b2 % 16 >> r2
        r2 * 4 >> r2s
        b3 / 64 >> b3h
        r2s + b3h >> ix3
        b3 % 64 >> ix4
        get(arr=alpha_arr, idx=ix1) ~> e1
        get(arr=alpha_arr, idx=ix2) ~> e2
        get(arr=alpha_arr, idx=ix3) ~> e3r
        get(arr=alpha_arr, idx=ix4) ~> e4r
        [] >> e3o
        push(arr=e3o, val="=") ~> e3o
        push(arr=e3o, val=e3r) ~> e3o
        get(arr=e3o, idx=has2) ~> e3
        [] >> e4o
        push(arr=e4o, val="=") ~> e4o
        push(arr=e4o, val=e4r) ~> e4o
        get(arr=e4o, idx=has3) ~> e4
        e1 + e2 + e3 + e4 >> now
    }
    join(arr=starts, sep="") ~> out
}

func isNumber(val) {
    past(val) ~> A1
    toString(val=A1) ~> s
    regex_match(str=s, pat="^-?[0-9]+\.?[0-9]*$") ~> out
}



func isString(val) {
    past(val) ~> A1
    isNumber(val=A1) ~> n
    isArray(val=A1) ~> a
    n + a >> na
    clamp(val=na, lo=0, hi=1) ~> na1
    1 - na1 >> out
}
