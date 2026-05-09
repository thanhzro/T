[T-]

func str_split_lines(str) {
    past(str) ~> S
    split(str=S, sep="\n") ~> out
}

func str_join_lines(arr) {
    past(arr) ~> A
    join(arr=A, sep="\n") ~> out
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
