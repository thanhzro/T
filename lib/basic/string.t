[T-]


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

func toString(val) {
    past(val) ~> A1
    "{A1}" >> out
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

func str_chars(str) {
    past(str) ~> S
    chars(str=S) ~> out
}

func char_code(str) {
    past(str) ~> S
    charCode(str=S) ~> out
}

func from_char(n) {
    past(n) ~> N
    fromChar(val=N) ~> out
}

func str_index(str, sub) {
    past(str) ~> S
    past(sub) ~> SUB
    indexOf(str=S, sub=SUB) ~> out
}

func str_slice(str, lo, hi) {
    past(str) ~> S
    past(lo) ~> Lo
    past(hi) ~> Hi
    slice(str=S, from=Lo, to=Hi) ~> out
}
