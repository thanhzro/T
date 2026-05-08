[T-]


func starts_with(str, sub) {
    past(str) ~> S
    past(sub) ~> P
    len(val=P) ~> plen
    slice(str=S, from=0, to=plen) ~> head
    indexOf(str=head, sub=P) ~> idx
    Gate idx (== 0) >> O1
    isNumber(val=O1) ~> out
}

func ends_with(str, sub) {
    past(str) ~> S
    past(sub) ~> P
    len(val=S) ~> slen
    len(val=P) ~> plen
    slen - plen >> from
    slice(str=S, from=from, to=slen) ~> tail
    indexOf(str=tail, sub=P) ~> idx
    Gate idx (== 0) >> O1
    isNumber(val=O1) ~> out
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
    Gate n (== 0) >> O1
    isNumber(val=O1) ~> out
}
