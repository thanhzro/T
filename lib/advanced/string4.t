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

func str_to_num(str) {
    past(str) ~> S
    toNumber(val=S) ~> out
}

func str_from_num(num) {
    past(num) ~> N
    toString(val=N) ~> out
}

func str_hash(str) {
    past(str) ~> S
    md5(str=S) ~> out
}

func str_contains_num(str) {
    past(str) ~> S
    regex_match(str=S, pat="[0-9]") ~> out
}

func str_only_spaces(str) {
    past(str) ~> S
    trim(str=S) ~> t
    len(val=t) ~> n
    Gate n (== 0) >> O1
    isNumber(val=O1) ~> out
}
