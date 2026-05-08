[T-]


func first(arr) {
    past(arr) ~> P1
    get(arr=P1, idx=0) ~> out
}

func last(arr) {
    past(arr) ~> P1
    len(val=P1) ~> L1
    L1 - 1 >> L2
    get(arr=P1, idx=L2) ~> out
}

func reverse(arr) {
    past(arr) ~> A1
    len(val=A1) ~> L1
    range(n=L1) ~> O1
    F(O1) {
        L1 - 1 - idx >> O4
        get(arr=A1, idx=O4) ~> now
    }
    O1 >> out
}

func count(arr, val) {
    past(arr) ~> A1
    past(val) ~> A2
    F(A1) {
        Gate now (== A2) >> O1
    }
    len(val=O1) ~> out
}

func unique(arr) {
    past(arr) ~> A1
    sort(arr=A1) ~> A2
    F(A2) {
        idx - 1 >> prev_idx
        get(arr=A2, idx=prev_idx) ~> prev
        Gate idx (== 0) || now (!= prev) >> O1
    }
    O1 >> out
}

func zip(a, b) {
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

func flatten(arr) {
    past(arr) ~> A1
    [] >> result
    F(A1) {
        isArray(val=now) ~> is_arr
        Gate is_arr (== 1) >> O1
    }
    F(O1) {
        F(now) {
            push(arr=result, val=now) ~> result
        }
    }
    result >> out
}

func pop(arr) {
    past(arr) ~> A1
    len(val=A1) ~> L
    L - 1 >> n
    slice_arr(arr=A1, from=0, to=n) ~> out
}

func range(n) {
    past(n) ~> N
    range_step(from=0, to=N, step=1) ~> out
}

func groupBy(arr) {
    past(arr) ~> A1
    sort(arr=A1) ~> sorted
    len(val=sorted) ~> L
    [] >> result
    [] >> cur_group
    "__NONE__" >> prev_str
    0 >> i
    loop {
        Gate i (>= L) >> done
        get(arr=sorted, idx=i) ~> cur
        toString(val=cur) ~> cur_str
        indexOf(str=cur_str, sub=prev_str) ~> si1
        indexOf(str=prev_str, sub=cur_str) ~> si2
        si1 + si2 >> samesum
        Gate samesum (== 0) >> is_same
        isNumber(val=is_same) ~> is_s
        Gate is_s (== 0) >> should_flush
        isNumber(val=should_flush) ~> sf
        len(val=cur_group) ~> glen
        Gate glen (== 0) >> is_empty
        isNumber(val=is_empty) ~> ie
        1 - ie >> not_empty
        sf * not_empty >> do_flush
        push_arr(arr=result, sub=cur_group) ~> result2
        [] >> empty
        [] >> r_opts
        push(arr=r_opts, val=result) ~> r_opts
        push(arr=r_opts, val=result2) ~> r_opts
        get(arr=r_opts, idx=do_flush) ~> result
        [] >> cg_opts
        push(arr=cg_opts, val=cur_group) ~> cg_opts
        push(arr=cg_opts, val=empty) ~> cg_opts
        get(arr=cg_opts, idx=do_flush) ~> cur_group
        push(arr=cur_group, val=cur) ~> cur_group
        cur_str >> prev_str
        i + 1 >> i
    }
    push_arr(arr=result, sub=cur_group) ~> result
    result >> out
}

func sort_asc(arr) {
    past(arr) ~> A
    sort(arr=A) ~> out
}

func sort_desc(arr) {
    past(arr) ~> A
    sort(arr=A) ~> s
    reverse(arr=s) ~> out
}

func arr_is_empty(arr) {
    past(arr) ~> A
    len(val=A) ~> n
    Gate n (== 0) >> O1
    isNumber(val=O1) ~> out
}

func sort_asc(arr) {
    past(arr) ~> A
    sort(arr=A) ~> out
}

func sort_desc(arr) {
    past(arr) ~> A
    sort(arr=A) ~> s
    reverse(arr=s) ~> out
}

func arr_is_empty(arr) {
    past(arr) ~> A
    len(val=A) ~> n
    Gate n (== 0) >> O1
    isNumber(val=O1) ~> out
}

func arr_push(arr, val) {
    past(arr) ~> A
    past(val) ~> V
    push(arr=A, val=V) ~> out
}

func arr_slice(arr, lo, hi) {
    past(arr) ~> A
    past(lo) ~> Lo
    past(hi) ~> Hi
    slice_arr(arr=A, from=Lo, to=Hi) ~> out
}

func arr_join(arr, sep) {
    past(arr) ~> A
    past(sep) ~> S
    join(arr=A, sep=S) ~> out
}

func arr_concat(a, b) {
    past(a) ~> A
    past(b) ~> B
    push_arr(arr=A, sub=B) ~> out
}

func arr_range(from, to, step) {
    past(from) ~> FR
    past(to) ~> TO
    past(step) ~> ST
    range_step(from=FR, to=TO, step=ST) ~> out
}
