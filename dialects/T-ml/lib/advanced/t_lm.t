[T-]
import "lib/basic/std.t"
import "lib/advanced/ml_t.t"

func encode_char(c) {
    charCode(str=c) ~> _code
    _code >> out
}

func one_hot_4(idx) {
    past(idx) ~> _i
    0 >> _v0
    0 >> _v1
    0 >> _v2
    0 >> _v3
    Gate _i (== 0) >> _v0
    1 >> _v0t
    _v0t * _v0 >> _v0
    Gate _i (== 1) >> _v1
    1 >> _v1t
    _v1t * _v1 >> _v1
    Gate _i (== 2) >> _v2
    1 >> _v2t
    _v2t * _v2 >> _v2
    Gate _i (== 3) >> _v3
    1 >> _v3t
    _v3t * _v3 >> _v3
    [] >> _vec
    push(arr=_vec, val=_v0) ~> _vec
    push(arr=_vec, val=_v1) ~> _vec
    push(arr=_vec, val=_v2) ~> _vec
    push(arr=_vec, val=_v3) ~> _vec
    _vec >> out
}
