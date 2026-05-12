[T-]
import "lib/basic/std.t"

[T0]
exec(cmd="grep -n 'compile_f_block' src/t_prog_compiler.c | grep -v 'continue' | head -5") ~> r1
exec(cmd="grep -n 'nat_len_mix' src/t_natives.h | head -3") ~> r2
exec(cmd="grep -rn 'func ' lib/basic/ | grep -v 'past\|return\|#' | wc -l") ~> func_count
exec(cmd="grep -rn 'func ' lib/basic/ | grep -v 'past\|return\|#' | grep -v 'sort\|split\|join\|range\|unique\|len\|reverse' | head -10") ~> missing_check

[T+]
show shall(r1, r2, func_count, missing_check)
