[T-]

func csv_read(path) {
    past(path) ~> P
    exec(cmd="cat " + P) ~> raw
    split(str=raw, sep="\n") ~> out
}

func csv_get_col(row, idx) {
    past(row) ~> R
    past(idx) ~> I
    split(str=R, sep=",") ~> cols
    get(arr=cols, idx=I) ~> out
}

func csv_col_count(row) {
    past(row) ~> R
    split(str=R, sep=",") ~> cols
    len(val=cols) ~> out
}

func csv_filter_col(path, col_idx, val) {
    past(path) ~> P
    past(col_idx) ~> CI
    past(val) ~> V
    csv_read(path=P) ~> rows
    F(rows) {
        csv_get_col(row=now, idx=CI) ~> cv
        Gate cv (== V) >> match
        isNumber(val=match) ~> ok
        [] >> opts
        push(arr=opts, val="") ~> opts
        push(arr=opts, val=now) ~> opts
        get(arr=opts, idx=ok) ~> now
    }
    F(rows) {
        Gate now (== "") >> skip
        isNumber(val=skip) ~> s
        1 - s >> k
        Gate k (== 1) >> O1
        isNumber(val=O1) ~> now
    }
    rows >> out
}
