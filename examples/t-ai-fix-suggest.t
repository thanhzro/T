[T-]
import "lib/basic/std.t"
import "lib/intermediate/string2.t"

func suggest(code, rules) {
    past(code) ~> C
    past(rules) ~> R
    contains(str=C, sub="BVal") ~> has_bval
    contains(str=C, sub="pop(vm)") ~> has_pop
    contains(str=C, sub="iter_arr") ~> has_iter
    has_bval * has_pop >> bval_pop
    "FIX: vm->stack[--vm->top] instead of pop()" >> fix_pop
    "FIX: use _g_iter_arr[] global instead" >> fix_iter
    "OK: no fix needed" >> fix_ok
    [] >> o1
    push(arr=o1, val=fix_ok) ~> o1
    push(arr=o1, val=fix_pop) ~> o1
    get(arr=o1, idx=bval_pop) ~> r1
    [] >> o2
    push(arr=o2, val=r1) ~> o2
    push(arr=o2, val=fix_iter) ~> o2
    get(arr=o2, idx=has_iter) ~> out
}

[T0]
exec(cmd="cat ai_rules.txt 2>/dev/null") ~> rules
suggest(code="BVal v = pop(vm);", rules=rules) ~> O1
suggest(code="vm->iter_arr[top]++", rules=rules) ~> O2
suggest(code="int n = vm->ip++;", rules=rules) ~> O3

[T+]
show shall(O1, O2, O3)
