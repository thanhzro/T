[T-]
import "lib/basic/std.t"
[T0]
file_read(path="lib/advanced/worker_train_template.t") ~> tmpl
replace(str=tmpl, from="CHUNK_ID", to="data_chunk_0.txt") ~> w0
replace(str=tmpl, from="CHUNK_ID", to="data_chunk_1.txt") ~> w1
replace(str=tmpl, from="CHUNK_ID", to="data_chunk_2.txt") ~> w2
replace(str=tmpl, from="CHUNK_ID", to="data_chunk_3.txt") ~> w3
write_file_t(path="worker_0.t", content=w0) ~> ok0
write_file_t(path="worker_1.t", content=w1) ~> ok1
write_file_t(path="worker_2.t", content=w2) ~> ok2
write_file_t(path="worker_3.t", content=w3) ~> ok3
spawn_file(fpath="worker_0.t") ~> r0
spawn_file(fpath="worker_1.t") ~> r1
spawn_file(fpath="worker_2.t") ~> r2
spawn_file(fpath="worker_3.t") ~> r3
[T+]
show shall(r0)
show shall(r1)
show shall(r2)
show shall(r3)
