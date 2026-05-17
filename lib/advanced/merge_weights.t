[T-]
import "lib/basic/std.t"
sep = ","
[T0]
file_read(path="weights_0.txt") ~> w0_str
file_read(path="weights_1.txt") ~> w1_str
file_read(path="weights_2.txt") ~> w2_str
file_read(path="weights_3.txt") ~> w3_str
split(str=w0_str, sep=sep) ~> w0
split(str=w1_str, sep=sep) ~> w1
split(str=w2_str, sep=sep) ~> w2
split(str=w3_str, sep=sep) ~> w3
get(arr=w0, idx=0) ~> a0
get(arr=w1, idx=0) ~> b0
get(arr=w2, idx=0) ~> c0
get(arr=w3, idx=0) ~> d0
toNumber(val=a0) ~> a0n
toNumber(val=b0) ~> b0n
toNumber(val=c0) ~> c0n
toNumber(val=d0) ~> d0n
a0n + b0n >> sum0
sum0 + c0n >> sum0
sum0 + d0n >> sum0
sum0 / 4 >> avg0
"" + avg0 >> avg0_str
write_file_t(path="merged_weights.txt", content=avg0_str) ~> ok
[T+]
show shall(avg0)
