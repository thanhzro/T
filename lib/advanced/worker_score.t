[T-]
import "lib/basic/std.t"
worker = "worker_test"
[T0]
shell_exec(cmd="cat scores/worker_test.score 2>/dev/null || echo 0") ~> score
trim(str=score) ~> score
toNumber(val=score) ~> score_num
[T+]
show shall(score_num)
