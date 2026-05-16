[T-]
import "lib/basic/std.t"
[T0]
write_file_t(path="test_write.txt", content="hello world") ~> ok
[T+]
show shall(ok)
