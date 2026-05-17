[T-]
import "lib/basic/std.t"
import "lib/advanced/ml_t.t"
row0 = [1, 0, 0, 0]
row1 = [0, 1, 0, 0]
xvec = [1, 1, 1, 1]
[T0]
dot_product(a=row0, b=xvec) ~> d0
dot_product(a=row1, b=xvec) ~> d1
sgd_update(weights=row0, grad=row1, lr=0.1) ~> nr
[T+]
show shall(d0)
show shall(d1)
show shall(nr)
