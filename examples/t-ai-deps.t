[T-]
import "lib/basic/std.t"
import "lib/intermediate/string2.t"

func extract_calls(code) {
    past(code) ~> C
    contains(str=C, sub="past(") ~> has_past
    contains(str=C, sub="exec(") ~> has_exec
    contains(str=C, sub="push(") ~> has_push
    contains(str=C, sub="join(") ~> has_join
    contains(str=C, sub="split(") ~> has_split
    contains(str=C, sub="get(") ~> has_get
    contains(str=C, sub="len(") ~> has_len
    contains(str=C, sub="sort(") ~> has_sort
    [] >> deps
    Gate has_exec (== 1) >> d1
    isNumber(val=d1) ~> id1
    [] >> o1
    push(arr=o1, val=deps) ~> o1
    push(arr=o1, val="exec") ~> o1
    get(arr=o1, idx=id1) ~> deps
    Gate has_push (== 1) >> d2
    isNumber(val=d2) ~> id2
    [] >> o2
    push(arr=o2, val=deps) ~> o2
    push(arr=o2, val="push") ~> o2
    get(arr=o2, idx=id2) ~> deps
    Gate has_sort (== 1) >> d3
    isNumber(val=d3) ~> id3
    [] >> o3
    push(arr=o3, val=deps) ~> o3
    push(arr=o3, val="sort") ~> o3
    get(arr=o3, idx=id3) ~> deps
    Gate has_join (== 1) >> d4
    isNumber(val=d4) ~> id4
    [] >> o4
    push(arr=o4, val=deps) ~> o4
    push(arr=o4, val="join") ~> o4
    get(arr=o4, idx=id4) ~> deps
    isString(val=deps) ~> is_str
    [] >> result
    push(arr=result, val="[C builtins: none]") ~> result
    push(arr=result, val="[C builtins: " + deps + "]") ~> result
    get(arr=result, idx=is_str) ~> out
}

[T0]
extract_calls(code="func sort_asc(arr) { past(arr)~>A; sort(arr=A)~>out }") ~> O1
extract_calls(code="func http_get(url) { past(url)~>U; exec(cmd=U)~>out }") ~> O2
extract_calls(code="func join_push(a,b) { push(arr=a,val=b)~>r; join(arr=r,sep=,)~>out }") ~> O3

[T+]
show shall(O1, O2, O3)
