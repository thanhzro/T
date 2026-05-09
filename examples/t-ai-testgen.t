[T-]
import "lib/basic/std.t"

func suggest_test(name, params) {
    past(name) ~> N
    past(params) ~> P
    contains(str=N, sub="is_") ~> c1
    contains(str=N, sub="has") ~> c2
    c1 + c2 >> bool_score
    clamp(val=bool_score, lo=0, hi=1) ~> is_bool
    contains(str=N, sub="gcd") ~> d1
    contains(str=N, sub="lcm") ~> d2
    contains(str=N, sub="fib") ~> d3
    contains(str=N, sub="fact") ~> d4
    contains(str=N, sub="pow") ~> d5
    contains(str=N, sub="sum") ~> d6
    contains(str=N, sub="avg") ~> d7
    contains(str=N, sub="count") ~> d8
    d1 + d2 + d3 + d4 + d5 + d6 + d7 + d8 >> num_score
    clamp(val=num_score, lo=0, hi=1) ~> is_num
    contains(str=N, sub="upper") ~> s1
    contains(str=N, sub="lower") ~> s2
    contains(str=N, sub="reverse") ~> s3
    contains(str=N, sub="trim") ~> s4
    contains(str=N, sub="replace") ~> s5
    s1 + s2 + s3 + s4 + s5 >> str_score
    clamp(val=str_score, lo=0, hi=1) ~> is_str
    "run_t(B, '" + N + "(" + P + ") ~> O1', 1)" >> bool_line
    "run_t(B, '" + N + "(" + P + ") ~> O1', ???_num)" >> num_line
    "run_t(B, '" + N + "(" + P + ") ~> O1', ???_str)" >> str_line
    "run_t(B, '" + N + "(" + P + ") ~> O1', ???)" >> generic_line
    [] >> opts
    push(arr=opts, val=bool_line) ~> opts
    push(arr=opts, val=num_line) ~> opts
    push(arr=opts, val=str_line) ~> opts
    push(arr=opts, val=generic_line) ~> opts
    3 >> idx
    [] >> o1
    push(arr=o1, val=idx) ~> o1
    push(arr=o1, val=2) ~> o1
    get(arr=o1, idx=is_str) ~> idx
    [] >> o2
    push(arr=o2, val=idx) ~> o2
    push(arr=o2, val=1) ~> o2
    get(arr=o2, idx=is_num) ~> idx
    [] >> o3
    push(arr=o3, val=idx) ~> o3
    push(arr=o3, val=0) ~> o3
    get(arr=o3, idx=is_bool) ~> idx
    get(arr=opts, idx=idx) ~> out
}

[T0]
suggest_test(name="is_prime", params="n=17") ~> O1
suggest_test(name="is_palindrome", params="str=racecar") ~> O2
suggest_test(name="gcd", params="a=48, b=18") ~> O3
suggest_test(name="fibonacci", params="n=10") ~> O4
suggest_test(name="upper", params="str=hello") ~> O5
suggest_test(name="avg", params="arr=[1,2,3]") ~> O6
suggest_test(name="str_count", params="str=hello, sub=l") ~> O7

[T+]
show shall(O1, O2, O3, O4, O5, O6, O7)
