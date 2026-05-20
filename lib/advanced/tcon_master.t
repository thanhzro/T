[T-]
import "lib/basic/std.t"
max_try = 3
[T0]
0 >> done
0 >> tries
loop {
    tries + 1 >> tries
    shell_exec(cmd="cat scores/worker_fix_vm.score 2>/dev/null || echo 0") ~> s1
    shell_exec(cmd="cat scores/worker_fix_compiler.score 2>/dev/null || echo 0") ~> s2
    shell_exec(cmd="cat scores/worker_test.score 2>/dev/null || echo 0") ~> s3
    trim(str=s1) ~> s1
    trim(str=s2) ~> s2
    trim(str=s3) ~> s3
    toNumber(val=s1) ~> score1
    toNumber(val=s2) ~> score2
    toNumber(val=s3) ~> score3
    Gate score1 (>= 0) {
        spawn_file(fpath="lib/advanced/worker_fix_vm.t") ~> r1
    }
    Gate score2 (>= 0) {
        spawn_file(fpath="lib/advanced/worker_fix_compiler.t") ~> r2
    }
    Gate score3 (>= 0) {
        spawn_file(fpath="lib/advanced/worker_test.t") ~> status
    }
    spawn_file(fpath="lib/advanced/worker_analyze.t") ~> analyze
    spawn_file(fpath="lib/advanced/worker_score_update.t") ~> sc
    Gate status (== 1) >> done
    Gate tries (>= max_try) >> done
}
[T+]
show shall(done)
show shall(tries)
show shall(status)
