[T-]

func mat_rows(m) {
    past(m) ~> M
    len(val=M) ~> out
}

func mat_cols(m) {
    past(m) ~> M
    first(arr=M) ~> row
    len(val=row) ~> out
}

func mat_get(m, i, j) {
    past(m) ~> M
    past(i) ~> I
    past(j) ~> J
    get(arr=M, idx=I) ~> row
    get(arr=row, idx=J) ~> out
}




func softmax(arr) {
    past(arr) ~> A
    max_arr(arr=A) ~> mx
    F(A) {
        now - mx >> sv
        exp_e(val=sv) ~> ev
        ev >> now
    }
    sum(arr=A) ~> total
    F(A) {
        now / total >> now
    }
    A >> out
}

func cosine_sim(a, b) {
    past(a) ~> A
    past(b) ~> B
    dot_product(a=A, b=B) ~> dot
    F(A) { now * now >> now }
    sum(arr=A) ~> sq_a
    sqrt_n(val=sq_a) ~> na
    F(B) { now * now >> now }
    sum(arr=B) ~> sq_b
    sqrt_n(val=sq_b) ~> nb
    na * nb >> denom
    safe_div(a=dot, b=denom) ~> out
}
