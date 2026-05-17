[T-]
import "lib/basic/std.t"
msg_val = "worker 5 alive"
out_path = "worker_5_done.txt"
[T0]
write_file_t(path=out_path, content=msg_val) ~> ok
[T+]
show shall(ok)
