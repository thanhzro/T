[T-]
import "lib/basic/std.t"
data = [1,2,1,3,2,1]

[T0]
sort(arr=data) ~> A
F(A) {
    idx - 1 >> prev_idx
    get(arr=A, idx=prev_idx) ~> prev
    Gate idx (== 0) || now (!= prev) >> O1
}

[T+]
show shall(O1)
