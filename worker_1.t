[T-]
import "lib/basic/std.t"
msg_val = "worker 1 reporting"
out_path = "worker_1_done.txt"
[T0]
write_file_t(path=out_path, content=msg_val) ~> ok
[T+]
show shall(ok)
