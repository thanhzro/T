[T-]
import "lib/basic/std.t"
import "lib/intermediate/string2.t"

func suggest_test(name, params) {
    past(name) ~> N
    past(params) ~> P
    contains(str=N, sub="str") ~> is_str
    contains(str=N, sub="arr") ~> is_arr
    contains(str=N, sub="is_") ~> is_bool
    contains(str=N, sub="num") ~> is_num
    Gate is_bool (== 1) >> O1
    isNumber(val=O1) ~> bool_fn
    "run_t(B, '" + N + "(" + P + ") ~> O1', 1)  # bool" >> bool_test
    "run_t(B, '" + N + "(" + P + ") ~> O1', ???)" >> generic_test
    [] >> opts
    push(arr=opts, val=generic_test) ~> opts
    push(arr=opts, val=bool_test) ~> opts
    get(arr=opts, idx=bool_fn) ~> out
}

[T0]
suggest_test(name="is_prime", params="n=7") ~> O1
suggest_test(name="str_reverse", params="str=hello") ~> O2
suggest_test(name="gcd", params="a=12, b=8") ~> O3

[T+]
show shall(O1, O2, O3)
