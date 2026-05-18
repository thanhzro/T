[T-]
import "lib/basic/std.t"
import "lib/advanced/ml_t.t"
wmat = [0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0, 1.1, 1.2, 1.3, 1.4, 1.5, 1.6,
        0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0, 1.1, 1.2, 1.3, 1.4, 1.5, 1.6]
emb = [0.5, 0.6, 0.7, 0.8, 0.5, 0.6, 0.7, 0.8,
       0.1, 0.2, 0.3, 0.4, 0.1, 0.2, 0.3, 0.4]
xs = [0, 1]
ys = [3]
lr = 0.01
nsteps = 1
edim = 4
nctx = 2
[T0]
train_loop_v2(wmat=wmat, emb=emb, xs=xs, ys=ys, lr=lr, steps=nsteps, dim=edim, ctx=nctx) ~> wmat2
join(arr=wmat2, sep=",") ~> wstr
[T+]
show shall(wstr)
