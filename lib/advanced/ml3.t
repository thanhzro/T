[T-]

func linear_regression(x_arr, y_arr) {
    past(x_arr) ~> X
    past(y_arr) ~> Y
    len(val=X) ~> n
    sum(arr=X) ~> sx
    sum(arr=Y) ~> sy
    sx / n >> mx
    sy / n >> my
    zip_with(a=X, b=Y) ~> pairs
    F(pairs) {
        get(arr=now, idx=0) ~> xi
        get(arr=now, idx=1) ~> yi
        xi - mx >> dx
        yi - my >> dy
        dx * dy >> now
    }
    sum(arr=pairs) ~> cov
    F(X) {
        now - mx >> dx
        dx * dx >> now
    }
    sum(arr=X) ~> var_x
    cov / var_x >> slope
    my - slope * mx >> intercept
    [] >> result
    push(arr=result, val=slope) ~> result
    push(arr=result, val=intercept) ~> result
    result >> out
}

func predict(slope, intercept, x) {
    past(slope) ~> S
    past(intercept) ~> I
    past(x) ~> X
    S * X >> sx
    sx + I >> out
}

func mse(predicted, actual) {
    past(predicted) ~> P
    past(actual) ~> A
    zip_with(a=P, b=A) ~> pairs
    F(pairs) {
        get(arr=now, idx=0) ~> p
        get(arr=now, idx=1) ~> a
        p - a >> diff
        diff * diff >> now
    }
    avg(arr=pairs) ~> out
}

func accuracy(predicted, actual) {
    past(predicted) ~> P
    past(actual) ~> A
    zip_with(a=P, b=A) ~> pairs
    F(pairs) {
        get(arr=now, idx=0) ~> p
        get(arr=now, idx=1) ~> a
        str_eq(a=toString(val=p), b=toString(val=a)) ~> now
    }
    sum(arr=pairs) ~> correct
    len(val=P) ~> total
    correct / total >> out
}

func one_hot(idx, size) {
    past(idx) ~> I
    past(size) ~> S
    floor(val=S) ~> si
    range(n=si) ~> arr
    F(arr) {
        Gate now (== I) >> match
        isNumber(val=match) ~> now
    }
    arr >> out
}
