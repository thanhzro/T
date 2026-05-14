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
    range(n=0) ~> _steps
    F(_steps) {
        slice(str=A1, from=start, to=start+1) ~> ch
        start + 1 >> start
        0 >> done
        Gate ch (!= " ") >> done
    }
    start - 1 >> real_start
    slice(str=A1, from=real_start, to=L) ~> out
}

func rstrip(str) {
    past(str) ~> A1
    len(val=A1) ~> L
    L - 1 >> rend
    range(n=0) ~> _steps
    F(_steps) {
        slice(str=A1, from=rend, to=rend+1) ~> ch2
        rend - 1 >> rend
        0 >> done
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

func slugify(str) {
    past(str) ~> A1
    lower(str=A1) ~> lo
    replace(str=lo, old=" ", new="-") ~> out
}

func is_numeric(str) {
    past(str) ~> A1
    regex_match(str=A1, pat="^[0-9.]+$") ~> out
}

func str_split_words(str) {
    past(str) ~> S
    trim(str=S) ~> t
    split(str=t, sep=" ") ~> out
}

func is_palindrome(str) {
    past(str) ~> S
    lower(str=S) ~> lo
    str_reverse(str=lo) ~> rev
    contains(str=lo, sub=rev) ~> c1
    len(val=lo) ~> l1
    len(val=rev) ~> l2
    Gate l1 (== l2) >> eq
    isNumber(val=eq) ~> l_eq
    c1 * l_eq >> out
}

func str_pad_center(str, width) {
    past(str) ~> S
    past(width) ~> W
    len(val=S) ~> slen
    W - slen >> pad_total
    pad_total / 2 >> pl
    floor(val=pl) ~> pad_left
    W - slen - pad_left >> pad_right
    range(n=pad_left) ~> li
    F(li) { " " >> now }
    join(arr=li, sep="") ~> lpad
    range(n=pad_right) ~> ri
    F(ri) { " " >> now }
    join(arr=ri, sep="") ~> rpad
    lpad + S + rpad >> out
}




func regex_split(str, pat) {
    past(str) ~> S
    past(pat) ~> P
    shell_escape(str=S) ~> esc
    write_file(path="rsplit_tmp.sh", content="echo " + esc + " | grep -oP " + P) ~> tmp
    exec(cmd="sh rsplit_tmp.sh") ~> raw
    split(str=raw, sep="\n") ~> parts
    pop(arr=parts) ~> out
}

func str_remove(str, sub) {
    past(str) ~> S
    past(sub) ~> P
    split(str=S, sep=P) ~> parts
    join(arr=parts, sep="") ~> out
}

func str_normalize(str) {
    past(str) ~> S
    trim(str=S) ~> t
    lower(str=t) ~> lo
    shell_escape(str=lo) ~> esc
    exec(cmd="echo " + esc + " | tr -s ' '") ~> raw
    trim(str=raw) ~> out
}

func str_title_case(str) {
    past(str) ~> S
    split(str=S, sep=" ") ~> words
    F(words) {
        capitalize(str=now) ~> now
    }
    join(arr=words, sep=" ") ~> out
}

func str_count_words(str) {
    past(str) ~> S
    trim(str=S) ~> t
    split(str=t, sep=" ") ~> words
    len(val=words) ~> out
}

func str_longest_word(str) {
    past(str) ~> S
    split(str=S, sep=" ") ~> words
    F(words) {
        len(val=now) ~> now
    }
    max_arr(arr=words) ~> out
}

func str_common_prefix(a, b) {
    past(a) ~> A
    past(b) ~> B
    len(val=A) ~> la
    len(val=B) ~> lb
    min2(a=la, b=lb) ~> mn
    0 >> i
    "" >> prefix
    range(n=0) ~> _steps
    F(_steps) {
        0 >> done
        Gate i (>= mn) >> done
        slice(str=A, from=i, to=i+1) ~> ca
        slice(str=B, from=i, to=i+1) ~> cb
        indexOf(str=ca, sub=cb) ~> same
        Gate same (== 0) >> match
        isNumber(val=match) ~> im
        Gate im (== 0) >> done
        prefix + ca >> prefix
        i + 1 >> i
    }
    prefix >> out
}
