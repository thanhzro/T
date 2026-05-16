[T-]
import "lib/basic/std.t"
msg = "worker1 alive"
pth = "worker1_done.txt"
[T0]
write_file_t(path=pth, content=msg) ~> ok
[T+]
