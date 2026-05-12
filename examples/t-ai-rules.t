[T-]
import "lib/basic/std.t"

func check_rule(code, rule) {
    past(code) ~> C
    past(rule) ~> R
    contains(str=C, sub=R) ~> found
    "WARN: " + R >> warn_msg
    "" >> ok_msg
    [] >> opts
    push(arr=opts, val=ok_msg) ~> opts
    push(arr=opts, val=warn_msg) ~> opts
    get(arr=opts, idx=found) ~> out
}

[T0]
exec(cmd="cat src/t_prog_compiler.c | grep -c 'compile_f_block'") ~> fblock_count
exec(cmd="cat src/t_prog_compiler.c | grep -c 'continue'") ~> continue_count
exec(cmd="cat src/t_natives.h | grep -c 'VT_ARR'") ~> arr_count
exec(cmd="cat src/t_natives.h | grep -c 'range_step'") ~> range_count
exec(cmd="cat src/t_natives.h | grep -c 'nat_split'") ~> split_count
exec(cmd="date '+%Y-%m-%d %H:%M'") ~> ts

[T+]
show shall(ts, fblock_count, continue_count, arr_count, range_count, split_count)
