[T-]
import "lib/basic/std.t"
[T0]
spawn_file(fpath="worker_0.t") ~> r0
spawn_file(fpath="worker_1.t") ~> r1
spawn_file(fpath="worker_2.t") ~> r2
spawn_file(fpath="worker_3.t") ~> r3
[T+]
show shall(r0)
show shall(r1)
show shall(r2)
show shall(r3)
