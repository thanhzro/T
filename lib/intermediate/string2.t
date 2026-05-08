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

func title(str) {
    past(str) ~> A1
    split(str=A1, sep=" ") ~> words
    F(words) {
        capitalize(str=now) ~> now
    }
    join(arr=words, sep=" ") ~> out
}

func snake_case(str) {
    past(str) ~> A1
    lower(str=A1) ~> lo
    replace(str=lo, old=" ", new="_") ~> out
}

func camel_case(str) {
    past(str) ~> A1
    split(str=A1, sep=" ") ~> words
    first(arr=words) ~> head
    lower(str=head) ~> head_lo
    drop(arr=words, n=1) ~> tail
    F(tail) {
        capitalize(str=now) ~> now
    }
    join(arr=tail, sep="") ~> tail_str
    head_lo + tail_str >> out
}

func word_wrap(str, n) {
    past(str) ~> A1
    past(n) ~> N
    split(str=A1, sep=" ") ~> words
    [] >> lines
    "" >> cur
    F(words) {
        cur + " " + now >> test
        trim(str=test) ~> test
        len(val=test) ~> tlen
        len(val=cur) ~> clen
        tlen - N >> diff
        clamp(val=diff, lo=0, hi=1) ~> over
        [] >> opts
        push(arr=opts, val=test) ~> opts
        push(arr=opts, val=now) ~> opts
        get(arr=opts, idx=over) ~> cur
    }
    push(arr=lines, val=cur) ~> lines
    lines >> out
}

func lstrip(str) {
    past(str) ~> A1
    len(val=A1) ~> L
    0 >> start
    loop {
        slice(str=A1, from=start, to=start+1) ~> ch
        start + 1 >> start
        Gate ch (!= " ") >> done
    }
    start - 1 >> real_start
    slice(str=A1, from=real_start, to=L) ~> out
}

func rstrip(str) {
    past(str) ~> A1
    len(val=A1) ~> L
    L - 1 >> rend
    loop {
        slice(str=A1, from=rend, to=rend+1) ~> ch2
        rend - 1 >> rend
        Gate ch2 (!= " ") >> done
    }
    rend + 2 >> real_end
    slice(str=A1, from=0, to=real_end) ~> out
}

func center(str, n) {
    past(str) ~> A1
    past(n) ~> N
    len(val=A1) ~> L
    N - L >> diff
    diff / 2 >> half
    padLeft(str=A1, n=L+half, ch=" ") ~> tmp
    padRight(str=tmp, n=N, ch=" ") ~> out
}
