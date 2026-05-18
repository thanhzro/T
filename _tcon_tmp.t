[T-]
import "lib/basic/std.t"
import "lib/advanced/ml_t.t"
wmat = [0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0, 1.1, 1.2, 1.3, 1.4, 1.5, 1.6]
err = [0.5, -0.5, 0.3, -0.3]
inp = [0.1, 0.2, 0.3, 0.4]
lr = 0.01
nrows = 4
ncols = 4
[T0]
outer_update(mat=wmat, err=err, inp=inp, lr=lr, rows=nrows, cols=ncols) ~> wmat2
[T+]
show shall(wmat2)
