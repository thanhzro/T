[T-]

func table_header(cols) {
    past(cols) ~> C
    join(arr=C, sep=" | ") ~> row
    len(val=row) ~> n
    range(n=n) ~> idx
    F(idx) { "-" >> now }
    join(arr=idx, sep="") ~> line
    row + "\n" + line >> out
}

func table_row(cols) {
    past(cols) ~> C
    join(arr=C, sep=" | ") ~> out
}

func table_render(headers, rows) {
    past(headers) ~> H
    past(rows) ~> R
    table_header(cols=H) ~> head
    F(R) {
        table_row(cols=now) ~> now
    }
    join(arr=R, sep="\n") ~> body
    head + "\n" + body >> out
}
