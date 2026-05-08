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

func str_mask(str, ch) {
    past(str) ~> S
    past(ch) ~> C
    len(val=S) ~> n
    range(n=n) ~> idx
    F(idx) { C >> now }
    join(arr=idx, sep="") ~> out
}

func str_truncate(str, n, suffix) {
    past(str) ~> S
    past(n) ~> N
    past(suffix) ~> SF
    len(val=S) ~> slen
    Gate slen (<= N) >> O1
    isNumber(val=O1) ~> short
    [] >> opts
    slice(str=S, from=0, to=N) ~> cut
    cut + SF >> long_ver
    push(arr=opts, val=long_ver) ~> opts
    push(arr=opts, val=S) ~> opts
    get(arr=opts, idx=short) ~> out
}

func str_between(str, start, end) {
    past(str) ~> S
    past(start) ~> A
    past(end) ~> B
    indexOf(str=S, sub=A) ~> si
    len(val=A) ~> al
    si + al >> from_idx
    indexOf(str=S, sub=B) ~> ei
    slice(str=S, from=from_idx, to=ei) ~> out
}
