[T-]
import "lib/basic/std.t"
msg_val = "WORKER_MSG"
out_path = "WORKER_PATH"
[T0]
write_file_t(path=out_path, content=msg_val) ~> ok
[T+]
show shall(ok)
