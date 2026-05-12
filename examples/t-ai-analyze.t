[T-]
import "lib/basic/std.t"

func check_status(test_out) {
past(test_out) ~> T
contains(str=T, sub="FAIL: 0") ~> all_pass
contains(str=T, sub="FAIL") ~> has_fail
"STABLE: all tests passing" >> msg_ok
"UNSTABLE: tests failing - need fix" >> msg_fail
[] >> opts
push(arr=opts, val=msg_ok) ~> opts
push(arr=opts, val=msg_fail) ~> opts
get(arr=opts, idx=has_fail) ~> out
}

[T0]
exec_bc(cmd="python3 check_runtime.py 2>&1 | tail -3") ~> test_out
exec_bc(cmd="./t_bc tests/sumavg.t 2>/dev/null | md5sum") ~> sumavg_hash
exec_bc(cmd="./t tests/sumavg.t 2>/dev/null | md5sum") ~> sumavg_ref
check_status(test_out=test_out) ~> status

[T+]
show shall(status, sumavg_hash, sumavg_ref)
