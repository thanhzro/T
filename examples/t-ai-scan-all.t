[T-]
import "lib/basic/std.t"
import "lib/intermediate/string2.t"

func check_line(line, rules) {
    past(line) ~> L
    past(rules) ~> R
    contains(str=R, sub="BVal") ~> r1
    contains(str=L, sub="BVal") ~> c1
    r1 * c1 >> m1
    contains(str=R, sub="iter") ~> r2
    contains(str=L, sub="iter_arr") ~> c2
    r2 * c2 >> m2
    contains(str=R, sub="arm64") ~> r3
    contains(str=L, sub="pop(vm)") ~> c3
    r3 * c3 >> m3
    m1 + m2 >> s1
    s1 + m3 >> total
    clamp(val=total, lo=0, hi=1) ~> risk
    "WARN " + L >> warn_msg
    [] >> opts
    push(arr=opts, val="OK") ~> opts
    push(arr=opts, val=warn_msg) ~> opts
    get(arr=opts, idx=risk) ~> out
}

[T0]
exec(cmd="cat ai_rules.txt 2>/dev/null") ~> rules
trim(str=rules) ~> rules
exec(cmd="grep -n 'BVal\|iter_arr\|pop(vm)' src/t_bytecode.h | head -10") ~> scan_result
trim(str=scan_result) ~> scan_result

check_line(line="BVal v=pop(vm)", rules=rules) ~> R1
check_line(line="vm->iter_arr[0]", rules=rules) ~> R2
check_line(line="int x=vm->ip++", rules=rules) ~> R3

[T+]
show shall(R1, R2, R3)
show shall(scan_result)
