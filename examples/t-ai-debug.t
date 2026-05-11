[T-]
import "lib/basic/std.t"
import "lib/intermediate/string2.t"

func debug_suggest(error_msg) {
    past(error_msg) ~> E
    contains(str=E, sub="non-void") ~> is_noreturn
    contains(str=E, sub="segmentation") ~> is_segfault
    contains(str=E, sub="undeclared") ~> is_undecl
    contains(str=E, sub="redefinition") ~> is_redef
    contains(str=E, sub="no such file") ~> is_nofile
    contains(str=E, sub="too many arguments") ~> is_args
    contains(str=E, sub="implicit") ~> is_implicit
    "FIX: add 'return value;' to all code paths" >> r1
    "FIX: use calloc() instead of stack allocation" >> r2
    "FIX: add function declaration before main()" >> r3
    "FIX: remove duplicate definition" >> r4
    "FIX: check #include path" >> r5
    "FIX: check function signature - wrong arg count" >> r6
    "FIX: add forward declaration" >> r7
    "INFO: unknown error - check syntax" >> r0
    [] >> opts
    push(arr=opts, val=r0) ~> opts
    push(arr=opts, val=r1) ~> opts
    get(arr=opts, idx=is_noreturn) ~> s1
    [] >> o2
    push(arr=o2, val=s1) ~> o2
    push(arr=o2, val=r2) ~> o2
    get(arr=o2, idx=is_segfault) ~> s2
    [] >> o3
    push(arr=o3, val=s2) ~> o3
    push(arr=o3, val=r3) ~> o3
    get(arr=o3, idx=is_implicit) ~> s3
    [] >> o4
    push(arr=o4, val=s3) ~> o4
    push(arr=o4, val=r4) ~> o4
    get(arr=o4, idx=is_redef) ~> s4
    [] >> o5
    push(arr=o5, val=s4) ~> o5
    push(arr=o5, val=r6) ~> o5
    get(arr=o5, idx=is_args) ~> out
}

[T0]
debug_suggest(error_msg="non-void function does not return") ~> O1
debug_suggest(error_msg="segmentation fault core dumped") ~> O2
debug_suggest(error_msg="implicit function declaration") ~> O3
debug_suggest(error_msg="redefinition of main") ~> O4
debug_suggest(error_msg="too many arguments to function") ~> O5

[T+]
show shall(O1, O2, O3, O4, O5)
