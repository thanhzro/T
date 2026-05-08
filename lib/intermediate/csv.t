[T-]

func parse_csv_rows(rows) {
    past(rows) ~> A1
    F(A1) {
        split(str=now, sep=",") ~> now
    }
    A1 >> out
}

func csv_header(rows) {
    past(rows) ~> A1
    first(arr=A1) ~> out
}

func csv_body(rows) {
    past(rows) ~> A1
    drop(arr=A1, n=1) ~> out
}
