[T-]
import "lib/basic/std.t"

[T0]
exec(cmd="echo '[T-]\nimport \"lib/basic/math.t\"\nnums=[3,1,4,1,5]\n[T0]\nsum(arr=nums) ~> r\n[T+]\nshow shall(r)' > _tmp.t && ./t _tmp.t 2>/dev/null") ~> ref_sum
exec(cmd="./t_bc _tmp.t 2>/dev/null") ~> bc_sum
exec(cmd="echo '[T-]\nimport \"lib/basic/math.t\"\nnums=[3,1,4,1,5]\n[T0]\navg(arr=nums) ~> r\n[T+]\nshow shall(r)' > _tmp.t && ./t _tmp.t 2>/dev/null") ~> ref_avg
exec(cmd="./t_bc _tmp.t 2>/dev/null") ~> bc_avg
exec(cmd="echo '[T-]\nimport \"lib/basic/math.t\"\n[T0]\npow(base=2, exp=10) ~> r\n[T+]\nshow shall(r)' > _tmp.t && ./t _tmp.t 2>/dev/null") ~> ref_pow
exec(cmd="./t_bc _tmp.t 2>/dev/null") ~> bc_pow

[T+]
show shall(ref_sum, bc_sum, ref_avg, bc_avg, ref_pow, bc_pow)
