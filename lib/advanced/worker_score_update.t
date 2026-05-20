[T-]
import "lib/basic/std.t"
[T0]
shell_exec(cmd="cat scores/worker_test.score 2>/dev/null || echo 0") ~> score
trim(str=score) ~> score
toNumber(val=score) ~> score_num
spawn_file(fpath="lib/advanced/worker_test.t") ~> status
Gate status (== 1) >> passed
0 >> failed
Gate status (== 0) >> failed
score_num + 1 >> new_score_pass
score_num - 1 >> new_score_fail
[] >> opts
push(arr=opts, val=new_score_fail) ~> opts
push(arr=opts, val=new_score_pass) ~> opts
get(arr=opts, idx=passed) ~> new_score
toString(val=new_score) ~> score_str
write_file_t(path="scores/worker_test.score", content=score_str) ~> ok
[T+]
show shall(new_score)
show shall(status)
