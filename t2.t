[T-]
import "lib/basic/std.t"
[T0]
file_read(path="t2.t.input") ~> received
write_file_t(path="t2_result.txt", content=received) ~> ok
[T+]
show shall(received)
