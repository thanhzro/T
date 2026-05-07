[T-]

func capitalize(str) {
    past(str) ~> A1
    slice(str=A1, from=0, to=1) ~> first
    slice(str=A1, from=1, to=999) ~> rest
    upper(str=first) ~> up
    lower(str=rest) ~> lo
    up + lo >> out
}

func count_words(str) {
    past(str) ~> A1
    split(str=A1, sep=" ") ~> words
    len(val=words) ~> out
}


func reverse_str(str) {
    past(str) ~> A1
    chars(str=A1) ~> ch
    reverse(arr=ch) ~> rev
    join(arr=rev, sep="") ~> out
}

func truncate(str, n) {
    past(str) ~> A1
    past(n) ~> N
    len(val=A1) ~> L
    slice(str=A1, from=0, to=N) ~> cut
    cut + "..." >> dotted
    L - N >> diff
    clamp(val=diff, lo=0, hi=1) ~> idx
    [] >> opts
    push(arr=opts, val=A1) ~> opts
    push(arr=opts, val=dotted) ~> opts
    get(arr=opts, idx=idx) ~> out
}
