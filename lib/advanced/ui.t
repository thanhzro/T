[T-]

func progress_bar(current, total, width) {
    past(current) ~> C
    past(total) ~> T
    past(width) ~> W
    C / T >> ratio
    ratio * W >> filled_f
    floor(val=filled_f) ~> filled
    W - filled >> empty
    range(n=filled) ~> fi
    F(fi) { "#" >> now }
    join(arr=fi, sep="") ~> bar_filled
    range(n=empty) ~> ei
    F(ei) { "-" >> now }
    join(arr=ei, sep="") ~> bar_empty
    ratio * 100 >> pct
    format_number(val=pct, decimals=1) ~> pct_str
    "[" + bar_filled + bar_empty + "] " + pct_str + "%" >> out
}

func spinner(step) {
    past(step) ~> S
    [] >> frames
    push(arr=frames, val="|") ~> frames
    push(arr=frames, val="/") ~> frames
    push(arr=frames, val="-") ~> frames
    push(arr=frames, val="x") ~> frames
    floor(val=S) ~> si
    rand_int(min=0, max=3) ~> idx
    get(arr=frames, idx=idx) ~> out
}

func clear_line() {
    exec(cmd="printf '\r'") ~> out
}
