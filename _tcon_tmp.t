[T-]
import "lib/basic/std.t"
import "lib/advanced/t_parser.t"
src = "[T-]\nfunc add(a, b) {\na + b >> out\n}\nfunc mul(a, b) {\na * b >> out\n}\nx = 10\n[T0]\nr = 0\n[T+]\nshow shall(r)"
[T0]
get_tminus(src=src) ~> tm
[] >> tm_clean
F(tm) { Gate now (!= "") >> tm_clean }
arr_filter_starts(arr=tm_clean, prefix="func ") ~> func_defs
[] >> names
[] >> params_list
F(func_defs) {
    get_func_name(line=now) ~> _name
    get_func_params(line=now) ~> _params
    push(arr=names, val=_name) ~> names
    push(arr=params_list, val=_params) ~> params_list
}
[T+]
show shall(names)
show shall(params_list)
