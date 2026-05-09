[T-]


func isNumber(val) {
    past(val) ~> A1
    toString(val=A1) ~> s
    regex_match(str=s, pat="^-?[0-9]+\.?[0-9]*$") ~> out
}

func isString(val) {
    past(val) ~> A1
    isNumber(val=A1) ~> n
    isArray(val=A1) ~> a
    n + a >> na
    clamp(val=na, lo=0, hi=1) ~> na1
    1 - na1 >> out
}

func to_num(val) {
    past(val) ~> V
    toNumber(val=V) ~> out
}

func is_arr(val) {
    past(val) ~> V
    isArray(val=V) ~> out
}





func is_error(val) {
    past(val) ~> V
    isString(val=V) ~> is_str
    Gate is_str (== 1) >> O1
    isNumber(val=O1) ~> ok
    [] >> opts
    push(arr=opts, val=0) ~> opts
    indexOf(str=V, sub="!") ~> idx
    Gate idx (== 0) >> is_err
    isNumber(val=is_err) ~> ie
    push(arr=opts, val=ie) ~> opts
    get(arr=opts, idx=ok) ~> out
}

func unwrap(val, default) {
    past(val) ~> V
    past(default) ~> D
    is_error(val=V) ~> err
    [] >> opts
    push(arr=opts, val=V) ~> opts
    push(arr=opts, val=D) ~> opts
    get(arr=opts, idx=err) ~> out
}
