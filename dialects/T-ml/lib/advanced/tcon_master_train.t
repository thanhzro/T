[T-]
import "lib/basic/std.t"
worker_list = ["tcon_worker_0.t", "tcon_worker_1.t", "tcon_worker_2.t", "tcon_worker_3.t"]
[T0]
spawn_file(fpath="tcon_worker_0.t") ~> r0
spawn_file(fpath="tcon_worker_1.t") ~> r1
spawn_file(fpath="tcon_worker_2.t") ~> r2
spawn_file(fpath="tcon_worker_3.t") ~> r3
[T+]
show shall(r0)
show shall(r1)
show shall(r2)
show shall(r3)
