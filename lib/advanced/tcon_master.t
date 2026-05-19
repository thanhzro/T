[T-]
import "lib/basic/std.t"
max_try = 3
[T0]
0 >> done
0 >> tries
loop {
    tries + 1 >> tries
    spawn_file(fpath="lib/advanced/worker_fix_vm.t") ~> r1
    spawn_file(fpath="lib/advanced/worker_fix_compiler.t") ~> r2
    spawn_file(fpath="lib/advanced/worker_test.t") ~> status
    Gate status (== "1") >> done
    Gate tries (>= max_try) >> done
}
[T+]
show shall(done)
show shall(tries)
show shall(status)
