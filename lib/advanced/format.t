[T-]

func format_number(val, decimals) {
    past(val) ~> V
    past(decimals) ~> D
    toString(val=D) ~> ds
    toString(val=V) ~> vs
    "printf '%." + ds + "f' " + vs >> cmd
    exec(cmd=cmd) ~> raw
    trim(str=raw) ~> out
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
    toString(val=B) ~> bs
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
