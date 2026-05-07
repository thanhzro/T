[T-]

func chunk(arr, n) {
    past(arr) ~> A1
    past(n) ~> N
    len(val=A1) ~> L
    [] >> result
    0 >> i
    loop {
        L - i >> remaining
        min(a=N, b=remaining) ~> actual_n
        i + actual_n >> end
        slice_arr(arr=A1, from=i, to=end) ~> sub
        push_arr(arr=result, sub=sub) ~> result
        i + N >> i
        Gate i (>= L) >> done
    }
    result >> out
}
