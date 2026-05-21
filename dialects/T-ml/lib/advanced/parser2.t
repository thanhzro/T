[T-]

func tokenize(str, sep) {
    past(str) ~> S
    past(sep) ~> SP
    split(str=S, sep=SP) ~> out
}

func token_count(str, sep) {
    past(str) ~> S
    past(sep) ~> SP
    tokenize(str=S, sep=SP) ~> tokens
    len(val=tokens) ~> out
}

func token_get(str, sep, idx) {
    past(str) ~> S
    past(sep) ~> SP
    past(idx) ~> I
    tokenize(str=S, sep=SP) ~> tokens
    get(arr=tokens, idx=I) ~> out
}

func token_filter(str, sep, pat) {
    past(str) ~> S
    past(sep) ~> SP
    past(pat) ~> P
    tokenize(str=S, sep=SP) ~> tokens
    F(tokens) {
        regex_match(str=now, pat=P) ~> ok
        Gate ok (== 1) >> keep
        isNumber(val=keep) ~> h
        [] >> opts
        push(arr=opts, val="") ~> opts
        push(arr=opts, val=now) ~> opts
        get(arr=opts, idx=h) ~> now
    }
    F(tokens) {
        Gate now (== "") >> skip
        isNumber(val=skip) ~> s
        1 - s >> k
        Gate k (== 1) >> O1
        isNumber(val=O1) ~> now
    }
    tokens >> out
}
