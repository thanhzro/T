[T-]
import "lib/generated/math_gen.t"
import "lib/basic/std.t"

func run_test(result, expected, fname) {
past(result) ~> R
past(expected) ~> E
past(fname) ~> N
R - E >> diff
abs(val=diff) ~> err
Gate err (== 0) >> ok
"PASS: " + N >> pass_msg
"FAIL: " + N >> fail_msg
[] >> msgs
push(arr=msgs, val=fail_msg) ~> msgs
push(arr=msgs, val=pass_msg) ~> msgs
get(arr=msgs, idx=ok) ~> out
}

[T0]
add2(a=5, b=3) ~> r1
mul2(a=4, b=4) ~> r2
run_test(result=r1, expected=8, fname="add2") ~> T1
run_test(result=r2, expected=16, fname="mul2") ~> T2
run_test(result=r1, expected=99, fname="add2_wrong") ~> T3

[T+]
show shall(T1, T2, T3)
