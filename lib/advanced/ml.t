[T-]

func mat_rows(m) {
    past(m) ~> M
    len(val=M) ~> out
}

func mat_cols(m) {
    past(m) ~> M
    first(arr=M) ~> row
    len(val=row) ~> out
}

func mat_get(m, i, j) {
    past(m) ~> M
    past(i) ~> I
    past(j) ~> J
    get(arr=M, idx=I) ~> row
    get(arr=row, idx=J) ~> out
}

func mat_add(a, b) {
    past(a) ~> A
    past(b) ~> B
    mat_rows(m=A) ~> rows
    mat_cols(m=A) ~> cols
    range(n=rows) ~> ri
    F(ri) {
        get(arr=A, idx=now) ~> ra
        get(arr=B, idx=now) ~> rb
        zip_with(a=ra, b=rb) ~> pairs
        F(pairs) {
            get(arr=now, idx=0) ~> x
            get(arr=now, idx=1) ~> y
            x + y >> now
        }
        pairs >> now
    }
    ri >> out
}
