[T-]

func parse_csv_rows(rows) {
    past(rows) ~> A1
    F(A1) {
        split(str=now, sep=",") ~> now
    }
    A1 >> out
}
