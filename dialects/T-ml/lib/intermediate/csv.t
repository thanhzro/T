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

func csv_to_arr(path) {
    past(path) ~> P
    exec(cmd="cat " + P) ~> raw
    split(str=raw, sep="\n") ~> lines
    pop(arr=lines) ~> out
}

func csv_col_names(path) {
    past(path) ~> P
    exec(cmd="head -1 " + P + " | tr -d '\\n'") ~> header
    split(str=header, sep=",") ~> out
}

func csv_row_count(path) {
    past(path) ~> P
    exec(cmd="wc -l < " + P) ~> raw
    trim(str=raw) ~> n
    toNumber(val=n) ~> total
    total - 1 >> out
}

func csv_get_val(path, row, col) {
    past(path) ~> P
    past(row) ~> R
    past(col) ~> C
    toString(val=R) ~> rs
    toString(val=C) ~> cs
    write_file(path="csv_tmp.sh", content="awk -F, NR==" + rs + " {print $" + cs + "} " + P) ~> tmp
    exec(cmd="sh csv_tmp.sh") ~> raw
    trim(str=raw) ~> out
}

func csv_max_col(path, col) {
    past(path) ~> P
    past(col) ~> C
    toString(val=C) ~> cs
    write_file(path="csv_get.sh", content="tail -n +2 " + P + " | cut -d, -f" + cs + " | sort -n | tail -1") ~> tmp
    exec(cmd="sh csv_get.sh") ~> raw
    trim(str=raw) ~> out
}

func csv_min_col(path, col) {
    past(path) ~> P
    past(col) ~> C
    toString(val=C) ~> cs
    write_file(path="csv_get.sh", content="tail -n +2 " + P + " | cut -d, -f" + cs + " | sort -n | head -1") ~> tmp
    exec(cmd="sh csv_get.sh") ~> raw
    trim(str=raw) ~> out
}

func csv_sum_col(path, col) {
    past(path) ~> P
    past(col) ~> C
    toString(val=C) ~> cs
    write_file(path="csv_get.sh", content="tail -n +2 " + P + " | cut -d, -f" + cs + " | paste -sd+ | bc") ~> tmp
    exec(cmd="sh csv_get.sh") ~> raw
    trim(str=raw) ~> n
    toNumber(val=n) ~> out
}
