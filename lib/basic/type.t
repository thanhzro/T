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
