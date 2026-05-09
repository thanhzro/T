[T-]
import "lib/basic/std.t"
import "lib/intermediate/string2.t"

func suggest_fix(issue, context) {
    past(issue) ~> I
    past(context) ~> C
    contains(str=I, sub="no return") ~> is_ret
    contains(str=I, sub="loop no gate") ~> is_loop
    contains(str=I, sub="uses exec") ~> is_exec
    contains(str=I, sub="no param") ~> is_param
    "FIX: add '>> out' at end of function" >> ret_fix
    "FIX: add 'Gate done_var (== 1) >> done' inside loop" >> loop_fix
    "FIX: consider T-pure alternative to exec" >> exec_fix
    "FIX: add 'past(param) ~> VAR' at start" >> param_fix
    "OK: no issues detected" >> ok_msg
    [] >> opts
    push(arr=opts, val=ok_msg) ~> opts
    push(arr=opts, val=ret_fix) ~> opts
    get(arr=opts, idx=is_ret) ~> r1
    [] >> opts2
    push(arr=opts2, val=r1) ~> opts2
    push(arr=opts2, val=loop_fix) ~> opts2
    get(arr=opts2, idx=is_loop) ~> r2
    [] >> opts3
    push(arr=opts3, val=r2) ~> opts3
    push(arr=opts3, val=exec_fix) ~> opts3
    get(arr=opts3, idx=is_exec) ~> out
}

[T0]
suggest_fix(issue="WARN: no return", context="math func") ~> O1
suggest_fix(issue="WARN: loop no gate", context="loop func") ~> O2
suggest_fix(issue="INFO: uses exec", context="io func") ~> O3
suggest_fix(issue="ok", context="clean func") ~> O4

[T+]
show shall(O1, O2, O3, O4)
