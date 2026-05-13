[T-]
import "lib/basic/std.t"

[T0]
exec(cmd="grep -n 'advanced' _tcon_report.sh") ~> check
exec(cmd="grep -n 'R5\|R4' _tcon_report.sh | head -5") ~> vars

[T+]
show shall(check, vars)
