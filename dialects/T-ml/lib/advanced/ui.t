[T-]

func table_print(arr) {
    past(arr) ~> A
    F(A) {
        join(arr=now, sep=" | ") ~> row
        row >> now
    }
    join(arr=A, sep="
") ~> out
}

func progress_bar(val, total, width) {
    past(val) ~> V
    past(total) ~> T
    past(width) ~> W
    V / T >> ratio
    ratio * W >> filled
    floor(val=filled) ~> nfill
    W - nfill >> nempty
    range(n=nfill) ~> fi
    F(fi) { "#" >> now }
    join(arr=fi, sep="") ~> bar_fill
    range(n=nempty) ~> ei
    F(ei) { "-" >> now }
    join(arr=ei, sep="") ~> bar_empty
    percent(val=V, total=T) ~> pct
    format_number(val=pct, decimals=1) ~> pct_str
    "[" + bar_fill + bar_empty + "] " + pct_str + "%" >> out
}
