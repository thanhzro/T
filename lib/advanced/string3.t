[T-]


func starts_with(str, sub) {
    past(str) ~> S
    past(sub) ~> P
    len(val=P) ~> plen
    slice(str=S, from=0, to=plen) ~> head
    indexOf(str=head, sub=P) ~> idx
    0 >> out
    Gate idx (== 0) >> out
}

func ends_with(str, sub) {
    past(str) ~> S
    past(sub) ~> P
    len(val=S) ~> slen
    len(val=P) ~> plen
    slen - plen >> from
    slice(str=S, from=from, to=slen) ~> tail
    indexOf(str=tail, sub=P) ~> idx
    0 >> out
    Gate idx (== 0) >> out
}

func char_at(str, n) {
    past(str) ~> S
    past(n) ~> N
    N + 1 >> n1
    slice(str=S, from=N, to=n1) ~> out
}

func insert(str, pos, sub) {
    past(str) ~> S
    past(pos) ~> P
    past(sub) ~> I
    slice(str=S, from=0, to=P) ~> left
    slice(str=S, from=P, to=9999) ~> right
    left + I + right >> out
}

func remove_at(str, pos, n) {
    past(str) ~> S
    past(pos) ~> P
    past(n) ~> N
    P + N >> end
    slice(str=S, from=0, to=P) ~> left
    len(val=S) ~> slen
    slice(str=S, from=end, to=slen) ~> right
    left + right >> out
}

func count_char(str, ch) {
    past(str) ~> S
    past(ch) ~> C
    split(str=S, sep=C) ~> parts
    len(val=parts) ~> n
    n - 1 >> out
}

func is_empty(str) {
    past(str) ~> S
    len(val=S) ~> n
    0 >> out
    Gate n (== 0) >> out
}

func str_wrap(str, width) {
    past(str) ~> S
    past(width) ~> W
    split(str=S, sep=" ") ~> words
    len(val=words) ~> n
    "" >> line
    "" >> result
    0 >> i
    loop {
        Gate i (>= n) >> done
        get(arr=words, idx=i) ~> word
        len(val=line) ~> ll
        len(val=word) ~> wl
        ll + wl >> total
        Gate total (> W) >> wrap
        isNumber(val=wrap) ~> do_wrap
        [] >> opts
        push(arr=opts, val=line + " " + word) ~> opts
        push(arr=opts, val=word) ~> opts
        get(arr=opts, idx=do_wrap) ~> line
        [] >> opts2
        push(arr=opts2, val=result) ~> opts2
        push(arr=opts2, val=result + "
") ~> opts2
        get(arr=opts2, idx=do_wrap) ~> result
        i + 1 >> i
    }
    result + line >> out
}

func str_center(str, width) {
    past(str) ~> S
    past(width) ~> W
    len(val=S) ~> n
    W - n >> pad
    pad / 2 >> lpad
    floor(val=lpad) ~> lp
    W - n - lp >> rp
    range(n=lp) ~> li
    F(li) { " " >> now }
    join(arr=li, sep="") ~> ls
    range(n=rp) ~> ri
    F(ri) { " " >> now }
    join(arr=ri, sep="") ~> rs
    ls + S + rs >> out
}
