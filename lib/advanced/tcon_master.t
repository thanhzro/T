[T-]
import "lib/basic/std.t"
goal = "fix OP_PUSH_NUM 2-byte index"
[T0]
spawn_file(fpath="lib/advanced/worker_analyze.t") ~> r0
spawn_file(fpath="lib/advanced/worker_fix_vm.t") ~> r1
spawn_file(fpath="lib/advanced/worker_fix_compiler.t") ~> r2
spawn_file(fpath="lib/advanced/worker_test.t") ~> r3
[T+]
show shall(r0)
show shall(r1)
show shall(r2)
show shall(r3)
