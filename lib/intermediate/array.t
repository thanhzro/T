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
