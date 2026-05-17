[T-]
import "lib/basic/std.t"
msg_val = "worker 2 reporting"
out_path = "worker_2_done.txt"
[T0]
write_file_t(path=out_path, content=msg_val) ~> ok
[T+]
show shall(ok)
