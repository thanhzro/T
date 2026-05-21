[T-]
import "lib/basic/std.t"
import "lib/advanced/ml_t.t"
wr0 = [0.05, -0.03, 0.02, 0.01]
wr1 = [0.01, 0.05, -0.02, 0.03]
wr2 = [-0.02, 0.01, 0.05, -0.01]
wr3 = [0.03, -0.02, 0.01, 0.05]
bv = [0, 0, 0, 0]
lr = 0.01
chunk_id = "CHUNK_ID"
[T0]
file_read(path=chunk_id) ~> chunk_data
len(val=chunk_data) ~> chunk_len
write_file_t(path="worker_CHUNK_ID_done.txt", content=chunk_data) ~> ok
[T+]
show shall(chunk_len)
