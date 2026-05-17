[T-]
import "lib/basic/std.t"
msg_val = "worker 3 alive"
out_path = "worker_3_done.txt"
[T0]
write_file_t(path=out_path, content=msg_val) ~> ok
[T+]
show shall(ok)
