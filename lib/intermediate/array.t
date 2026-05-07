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
        range(n=actual_n) ~> rng
        F(rng) {
            i + now >> real_idx
            get(arr=A1, idx=real_idx) ~> now
        }
        push_arr(arr=result, sub=rng) ~> result
        i + N >> i
        Gate i (>= L) >> done
    }
    result >> out
}
