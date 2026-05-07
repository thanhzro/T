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
