[T-]

func chunk(arr, n) {
    past(arr) ~> A1
    past(n) ~> N
    len(val=A1) ~> L
    range_step(from=0, to=L, step=N) ~> starts
    F(starts) {
        now + N >> end
        min(a=end, b=L) ~> real_end
        slice_arr(arr=A1, from=now, to=real_end) ~> now
    }
    starts >> out
}
[T-]

func groupBy(arr) {
    past(arr) ~> A1
    sort(arr=A1) ~> A2
    len(val=A2) ~> L
    [] >> result
    0 >> i
    loop {
        get(arr=A2, idx=i) ~> cur_key
        i >> group_start
        loop {
            get(arr=A2, idx=i) ~> cur
            i + 1 >> i
            Gate cur (!= cur_key) >> done2
            Gate i (>= L) >> done2
        }
        i - 1 >> group_end
        slice_arr(arr=A2, from=group_start, to=group_end) ~> group
        push_arr(arr=result, sub=group) ~> result
        Gate i (>= L) >> done
    }
    result >> out
}
[T-]


func take(arr, n) {
    past(arr) ~> A1
    past(n) ~> N
    slice_arr(arr=A1, from=0, to=N) ~> out
}

func drop(arr, n) {
    past(arr) ~> A1
    past(n) ~> N
    len(val=A1) ~> L
    slice_arr(arr=A1, from=N, to=L) ~> out
}

func zip_with(a, b) {
    past(a) ~> A1
    past(b) ~> A2
    len(val=A1) ~> L1
    len(val=A2) ~> L2
    min(a=L1, b=L2) ~> L
    range(n=L) ~> IDX
    F(IDX) {
        get(arr=A1, idx=now) ~> v1
        get(arr=A2, idx=now) ~> v2
        [] >> pair
        push(arr=pair, val=v1) ~> pair
        push(arr=pair, val=v2) ~> pair
        pair >> now
    }
    IDX >> out
}

func flatten_deep(arr) {
    past(arr) ~> A1
    flatten(arr=A1) ~> O1
    flatten(arr=O1) ~> O2
    flatten(arr=O2) ~> O3
    flatten(arr=O3) ~> out
}

func sliding_window(arr, n) {
    past(arr) ~> A1
    past(n) ~> N
    len(val=A1) ~> L
    L - N >> count
    count + 1 >> total
    range(n=total) ~> IDX
    F(IDX) {
        now + N >> end
        slice_arr(arr=A1, from=now, to=end) ~> now
    }
    IDX >> out
}

func rotate(arr, n) {
    past(arr) ~> A1
    past(n) ~> N
    len(val=A1) ~> L
    N % L >> r
    drop(arr=A1, n=r) ~> tail
    take(arr=A1, n=r) ~> head
    flatten(arr=[tail, head]) ~> out
}

func partition(arr, val) {
    past(arr) ~> A1
    past(val) ~> V
    F(A1) {
        Gate now (<= V) >> O1
    }
    F(A1) {
        Gate now (> V) >> O2
    }
    [] >> result
    push_arr(arr=result, sub=O1) ~> result
    push_arr(arr=result, sub=O2) ~> result
    result >> out
}


func zip_longest(a, b, fill) {
    past(a) ~> A1
    past(b) ~> A2
    past(fill) ~> F1
    len(val=A1) ~> L1
    len(val=A2) ~> L2
    max(a=L1, b=L2) ~> L
    range(n=L) ~> IDX
    F(IDX) {
        now + 1 >> nxt
        nxt - L1 >> d1
        clamp(val=d1, lo=0, hi=1) ~> ob1
        1 - ob1 >> ib1
        nxt - L2 >> d2
        clamp(val=d2, lo=0, hi=1) ~> ob2
        1 - ob2 >> ib2
        get(arr=A1, idx=now) ~> v1
        get(arr=A2, idx=now) ~> v2
        [] >> p1
        push(arr=p1, val=F1) ~> p1
        push(arr=p1, val=v1) ~> p1
        get(arr=p1, idx=ib1) ~> rv1
        [] >> p2
        push(arr=p2, val=F1) ~> p2
        push(arr=p2, val=v2) ~> p2
        get(arr=p2, idx=ib2) ~> rv2
        [] >> pair
        push(arr=pair, val=rv1) ~> pair
        push(arr=pair, val=rv2) ~> pair
        pair >> now
    }
    IDX >> out
}

func path_join(a, b) {
    past(a) ~> A
    past(b) ~> B
    A + "/" + B >> out
}

func path_basename(path) {
    past(path) ~> A
    split(str=A, sep="/") ~> parts
    last(arr=parts) ~> out
}

func path_dirname(path) {
    past(path) ~> A
    split(str=A, sep="/") ~> parts
    len(val=parts) ~> L
    L - 1 >> n
    take(arr=parts, n=n) ~> head
    join(arr=head, sep="/") ~> out
}

func path_ext(path) {
    past(path) ~> A
    split(str=A, sep=".") ~> parts
    last(arr=parts) ~> ext
    "." + ext >> out
}
