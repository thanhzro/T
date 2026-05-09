[T-]
import "lib/basic/std.t"
import "lib/intermediate/array.t"
import "lib/advanced/format.t"

func eval_result(got, expected) {
    past(got) ~> G
    past(expected) ~> E
    str_eq(a=G, b=E) ~> score
    [] >> opts
    push(arr=opts, val="FAIL got=" + G + " exp=" + E) ~> opts
    push(arr=opts, val="PASS " + G) ~> opts
    get(arr=opts, idx=score) ~> out
}

func eval_batch(results, expecteds) {
    past(results) ~> R
    past(expecteds) ~> E
    zip_with(a=R, b=E) ~> pairs
    F(pairs) {
        get(arr=now, idx=0) ~> got
        get(arr=now, idx=1) ~> exp
        str_eq(a=got, b=exp) ~> now
    }
    sum(arr=pairs) ~> passed
    len(val=R) ~> total
    passed / total >> ratio
    ratio * 100 >> pct
    format_number(val=pct, decimals=1) ~> pct_str
    toString(val=passed) ~> ps
    toString(val=total) ~> ts
    ps + "/" + ts + " (" + pct_str + "%)" >> out
}

[T0]
eval_result(got="55", expected="55") ~> O1
eval_result(got="HELLO", expected="HELLO") ~> O2
eval_result(got="wrong", expected="right") ~> O3

["55", "HELLO", "6"] >> results
["55", "HELLO", "6"] >> expecteds
eval_batch(results=results, expecteds=expecteds) ~> O4

[T+]
show shall(O1, O2, O3, O4)
