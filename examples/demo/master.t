[T-]
import "lib/basic/std.t"
flist = ["worker1.t", "worker2.t"]
[T0]
par_spawn(files=flist) ~> done
file_read(path="worker1_done.txt") ~> r1
file_read(path="worker2_done.txt") ~> r2
[T+]
show shall(done)
show shall(r1)
show shall(r2)
