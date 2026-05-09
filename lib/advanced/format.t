[T-]

func format_number(val, decimals) {
    past(val) ~> V
    past(decimals) ~> D
    pow(base=10, exp=D) ~> factor
    V * factor >> shifted
    round(val=shifted) ~> rounded
    rounded / factor >> result
    toString(val=result) ~> out
}

func format_currency(val, symbol) {
    past(val) ~> V
    past(symbol) ~> S
    format_number(val=V, decimals=2) ~> num
    S + num >> out
}

func format_percent(val) {
    past(val) ~> V
    V * 100 >> pct
    format_number(val=pct, decimals=1) ~> num
    num + "%" >> out
}

func format_bytes(bytes) {
    past(bytes) ~> B
    format_number(val=B, decimals=0) ~> bs
    1024 >> kb
    1048576 >> mb
    B / kb >> kv
    format_number(val=kv, decimals=1) ~> ks
    B / mb >> mv
    format_number(val=mv, decimals=1) ~> ms
    Gate B (>= mb) >> is_mb
    isNumber(val=is_mb) ~> im
    Gate B (>= kb) >> is_kb
    isNumber(val=is_kb) ~> ik
    [] >> opts
    push(arr=opts, val=bs + "B") ~> opts
    push(arr=opts, val=ks + "KB") ~> opts
    push(arr=opts, val=ms + "MB") ~> opts
    ik + im >> level
    clamp(val=level, lo=0, hi=2) ~> lvl
    get(arr=opts, idx=lvl) ~> out
}
