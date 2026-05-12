[T-]

func chunk(arr, n) {
    past(arr) ~> A1
    past(n) ~> N
    len(val=A1) ~> L
    range_step(from=0, to=L, step=N) ~> starts
    F(starts) {
        now >> idx
        idx + N >> end
        min(a=end, b=L) ~> real_end
        slice_arr(arr=A1, from=idx, to=real_end) ~> now
    }
    starts >> out
}
[T-]


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
        now >> idx
        idx + N >> end
        slice_arr(arr=A1, from=idx, to=end) ~> now
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
    [] >> result
    F(tail) {
        push(arr=result, val=now) ~> result
    }
    F(head) {
        push(arr=result, val=now) ~> result
    }
    result >> out
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

func arr_sum_col(arr, idx) {
    past(arr) ~> A
    past(idx) ~> I
    F(A) {
        get(arr=now, idx=I) ~> val
        val >> now
    }
    sum(arr=A) ~> out
}

func arr_max_col(arr, idx) {
    past(arr) ~> A
    past(idx) ~> I
    F(A) {
        get(arr=now, idx=I) ~> val
        val >> now
    }
    max_arr(arr=A) ~> out
}

func arr_count_if(arr, val) {
    past(arr) ~> A
    past(val) ~> V
    join(arr=A, sep=",") ~> joined
    toString(val=V) ~> vs
    split(str=joined, sep=vs) ~> parts
    len(val=parts) ~> n
    n - 1 >> out
}

func arr_index_of(arr, val) {
    past(arr) ~> A
    past(val) ~> V
    0 >> result
    0 >> found
    loop {
        len(val=A) ~> n
        Gate result (>= n) >> done
        get(arr=A, idx=result) ~> cur
        Gate cur (== V) >> matched
        isNumber(val=matched) ~> is_match
        Gate is_match (== 1) >> done
        result + 1 >> result
    }
    result >> out
}

func arr_zip_map(a, b) {
    past(a) ~> A
    past(b) ~> B
    zip_with(a=A, b=B) ~> pairs
    F(pairs) {
        get(arr=now, idx=0) ~> x
        get(arr=now, idx=1) ~> y
        x + y >> now
    }
    pairs >> out
}










func arr_union(a, b) {
    past(a) ~> A
    past(b) ~> B
    arr_concat(a=A, b=B) ~> combined
    unique(arr=combined) ~> out
}



func arr_sum_range(arr, from, to) {
    past(arr) ~> A
    past(from) ~> Fr
    past(to) ~> To
    slice_arr(arr=A, from=Fr, to=To) ~> sub
    sum(arr=sub) ~> out
}

func arr_swap(arr, i, j) {
    past(arr) ~> A
    past(i) ~> I
    past(j) ~> J
    get(arr=A, idx=I) ~> vi
    get(arr=A, idx=J) ~> vj
    len(val=A) ~> n
    range(n=n) ~> idx
    F(idx) {
        Gate now (== I) >> is_i
        isNumber(val=is_i) ~> ii
        Gate now (== J) >> is_j
        isNumber(val=is_j) ~> ij
        [] >> opts
        get(arr=A, idx=now) ~> orig
        push(arr=opts, val=orig) ~> opts
        push(arr=opts, val=vj) ~> opts
        get(arr=opts, idx=ii) ~> r1
        [] >> opts2
        push(arr=opts2, val=r1) ~> opts2
        push(arr=opts2, val=vi) ~> opts2
        get(arr=opts2, idx=ij) ~> now
    }
    idx >> out
}

func arr_head(arr, n) {
    past(arr) ~> A
    past(n) ~> N
    slice_arr(arr=A, from=0, to=N) ~> out
}

func arr_tail(arr, n) {
    past(arr) ~> A
    past(n) ~> N
    len(val=A) ~> L
    L - N >> start
    slice_arr(arr=A, from=start, to=L) ~> out
}

func arr_fill(val, n) {
    past(val) ~> V
    past(n) ~> N
    floor(val=N) ~> ni
    range(n=ni) ~> idx
    F(idx) { V >> now }
    idx >> out
}

func arr_step(from, to, step) {
    past(from) ~> Fr
    past(to) ~> To
    past(step) ~> St
    range_step(from=Fr, to=To, step=St) ~> out
}

func arr_flatten_once(arr) {
    past(arr) ~> A
    [] >> result
    F(A) {
        flatten(arr=now) ~> flat
        arr_concat(a=result, b=flat) ~> result
        result >> now
    }
    last(arr=A) ~> out
}
