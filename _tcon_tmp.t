[T-]
import "lib/basic/std.t"
import "lib/advanced/ml_t.t"
wmat = [0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0, 1.1, 1.2, 1.3, 1.4, 1.5, 1.6]
wsz = 4
emb = [0.1, 0.2, 0.3, 0.4]
edim = 4
xid0 = 0
tv0 = [1, 0, 0, 0]
lr = 0.01
[T0]
embed_n(cid=xid0, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv0) ~> gg
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
join(arr=wmat, sep=",") ~> wstr
write_file_t(path="test_weights.txt", content=wstr) ~> saved
[T+]
show shall(saved)
show shall(wstr)
