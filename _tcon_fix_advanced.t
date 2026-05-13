[T-]
import "lib/basic/std.t"

[T0]
exec(cmd="diff <(./t tests/advanced.t 2>/dev/null) <(./t_bc tests/advanced.t 2>/dev/null)") ~> diff_out
exec(cmd="./t tests/advanced.t 2>/dev/null | wc -l") ~> t_lines
exec(cmd="./t_bc tests/advanced.t 2>/dev/null | wc -l") ~> tbc_lines

[T+]
show shall(diff_out, t_lines, tbc_lines)
