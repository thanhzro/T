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

func type_of(val) {
    past(val) ~> V
    isNumber(val=V) ~> is_num
    isArray(val=V) ~> is_arr
    is_error(val=V) ~> is_err
    isString(val=V) ~> is_str
    [] >> opts
    push(arr=opts, val="string") ~> opts
    push(arr=opts, val="number") ~> opts
    get(arr=opts, idx=is_num) ~> t1
    [] >> opts2
    push(arr=opts2, val=t1) ~> opts2
    push(arr=opts2, val="array") ~> opts2
    get(arr=opts2, idx=is_arr) ~> t2
    [] >> opts3
    push(arr=opts3, val=t2) ~> opts3
    push(arr=opts3, val="error") ~> opts3
    get(arr=opts3, idx=is_err) ~> out
}

func is_null(val) {
    past(val) ~> V
    is_error(val=V) ~> ie
    isString(val=V) ~> is_str
    len(val=V) ~> slen
    Gate slen (== 0) >> empty
    isNumber(val=empty) ~> is_empty
    is_str * is_empty >> str_empty
    ie + str_empty >> score
    clamp(val=score, lo=0, hi=1) ~> out
}

func coerce_num(val) {
    past(val) ~> V
    isNumber(val=V) ~> is_num
    toNumber(val=V) ~> n
    [] >> opts
    push(arr=opts, val=0) ~> opts
    push(arr=opts, val=n) ~> opts
    get(arr=opts, idx=is_num) ~> out
}
