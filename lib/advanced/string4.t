[T-]

func str_split_lines(str) {
    past(str) ~> S
    split(str=S, sep="\n") ~> out
}

func str_join_lines(arr) {
    past(arr) ~> A
    join(arr=A, sep="\n") ~> out
}

func str_wrap(str, width) {
    past(str) ~> S
    past(width) ~> W
    toString(val=W) ~> ws
    shell_escape(str=S) ~> esc
    write_file(path="wrap_tmp.sh", content="echo " + esc + " | fold -s -w " + ws) ~> tmp
    exec(cmd="sh wrap_tmp.sh") ~> out
}

func str_center(str, width) {
    past(str) ~> S
    past(width) ~> W
    len(val=S) ~> slen
    W - slen >> pad_total
    pad_total / 2 >> pad_left
    W - slen - pad_left >> pad_right
    range(n=pad_left) ~> li
    F(li) { " " >> now }
    join(arr=li, sep="") ~> lpad
    range(n=pad_right) ~> ri
    F(ri) { " " >> now }
    join(arr=ri, sep="") ~> rpad
    lpad + S + rpad >> out
}

func str_lines_count(str) {
    past(str) ~> S
    split(str=S, sep="\n") ~> lines
    len(val=lines) ~> out
}
