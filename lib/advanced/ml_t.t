[T-]
func dot_product(a, b) {
    past(a) ~> _a
    past(b) ~> _b
    len(val=_a) ~> _n
    range(n=_n) ~> _idx
    0 >> _sum
    F(_idx) {
        get(arr=_a, idx=idx) ~> _ax
        get(arr=_b, idx=idx) ~> _bx
        _ax * _bx >> _prod
        _sum + _prod >> _sum
    }
    _sum >> out
}

func vec_add(a, b) {
    past(a) ~> _a
    past(b) ~> _b
    len(val=_a) ~> _n
    range(n=_n) ~> _idx
    [] >> _result
    F(_idx) {
        get(arr=_a, idx=idx) ~> _ax
        get(arr=_b, idx=idx) ~> _bx
        _ax + _bx >> _s
        push(arr=_result, val=_s) ~> _result
    }
    _result >> out
}

func vec_scale(a, s) {
    past(a) ~> _a
    past(s) ~> _s
    [] >> _result
    F(_a) {
        now * _s >> _v
        push(arr=_result, val=_v) ~> _result
    }
    _result >> out
}

func sigmoid(x) {
    past(x) ~> _x
    0 - _x >> _negx
    exp(val=_negx) ~> _ex
    1 + _ex >> _denom
    1 / _denom >> out
}

func relu(x) {
    past(x) ~> _x
    0 >> _r
    Gate _x (> 0) >> _r
    _x * _r >> _pos
    0 - _x >> _negx
    Gate _negx (> 0) >> _r2
    0 >> _zero
    _r2 * _zero >> _n2
    _pos + _n2 >> out
}
