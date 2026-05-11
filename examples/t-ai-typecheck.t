[T-]
import "lib/basic/std.t"
import "lib/intermediate/string2.t"

func typecheck(func_name, arg_name, arg_val) {
    past(func_name) ~> FN
    past(arg_name) ~> AN
    past(arg_val) ~> AV
    contains(str=FN, sub="str") ~> expects_str
    contains(str=FN, sub="arr") ~> expects_arr
    contains(str=FN, sub="num") ~> expects_num
    contains(str=FN, sub="is_") ~> expects_any
    isNumber(val=AV) ~> got_num
    isArray(val=AV) ~> got_arr
    isString(val=AV) ~> got_str
    expects_str * got_num >> str_num_conflict
    expects_arr * got_num >> arr_num_conflict
    str_num_conflict + arr_num_conflict >> conflict
    clamp(val=conflict, lo=0, hi=1) ~> has_conflict
    "OK: " + FN + "(" + AN + ") type matches" >> ok_msg
    "WARN: " + FN + " expects string but got number for " + AN >> warn_msg
    [] >> opts
    push(arr=opts, val=ok_msg) ~> opts
    push(arr=opts, val=warn_msg) ~> opts
    get(arr=opts, idx=has_conflict) ~> out
}

[T0]
typecheck(func_name="str_reverse", arg_name="str", arg_val="hello") ~> O1
typecheck(func_name="str_upper", arg_name="str", arg_val=42) ~> O2
typecheck(func_name="arr_sort", arg_name="arr", arg_val=99) ~> O3
typecheck(func_name="is_prime", arg_name="n", arg_val=17) ~> O4

[T+]
show shall(O1, O2, O3, O4)
