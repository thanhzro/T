[T-]
import "lib/basic/std.t"
flatmat = [1, 0, 0, 0, 0, 2, 0, 0, 0, 0, 3, 0, 0, 0, 0, 4]
xvec = [1, 1, 1, 1]
[T0]
mat_mmv(src=flatmat, sz=4, inp=xvec) ~> out
[T+]
show shall(out)
