[T-]
import "lib/basic/std.t"
msg = "worker2 alive"
pth = "worker2_done.txt"
[T0]
write_file_t(path=pth, content=msg) ~> ok
[T+]
