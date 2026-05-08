[T-]

func dot_product(a, b) {
    past(a) ~> A
    past(b) ~> B
    zip_with(a=A, b=B) ~> pairs
    F(pairs) {
        get(arr=now, idx=0) ~> x
        get(arr=now, idx=1) ~> y
        x * y >> now
    }
    sum(arr=pairs) ~> out
}

func sigmoid(x) {
    past(x) ~> X
    0 - X >> negx
    exp(val=negx) ~> ex
    1 + ex >> denom
    1 / denom >> out
}

func relu(x) {
    past(x) ~> X
    Gate X (> 0) >> O1
    isNumber(val=O1) ~> ok
    [] >> opts
    push(arr=opts, val=0) ~> opts
    push(arr=opts, val=X) ~> opts
    get(arr=opts, idx=ok) ~> out
}

func normalize(arr) {
    past(arr) ~> A
    min_arr(arr=A) ~> mn
    max_arr(arr=A) ~> mx
    mx - mn >> rng
    F(A) {
        now - mn >> num
        num / rng >> now
    }
    A >> out
}

        pairs >> now
    }
    ri >> out
}
