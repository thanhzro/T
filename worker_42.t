[T-]
import "lib/basic/std.t"
msg_val = "hello from worker 42"
out_path = "worker_42_done.txt"
[T0]
write_file_t(path=out_path, content=msg_val) ~> ok
[T+]
show shall(ok)
