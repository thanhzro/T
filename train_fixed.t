[T-]
import "lib/basic/std.t"
import "lib/advanced/ml_t.t"
emb = [0.0857,0.0690,-0.0677,-0.1170,-0.0461,-0.0581,-0.0723,0.1107,0.0941,-0.0463,0.0389,-0.0261,0.1036,-0.0103,-0.0588,-0.0633,0.0153,-0.0593,0.0211,0.0995,-0.0251,-0.0702,0.1244,0.0024,-0.1023,-0.1132,-0.0976,0.0319,0.0730,-0.0195,-0.1091,-0.0296,0.1240,0.0073,0.1178,0.0902,-0.1221,0.0552,0.0454,0.0092,-0.0583,0.0352,-0.0971,-0.0163,-0.0116,0.1135,0.0940,-0.0592,0.0001,-0.0803,0.1032,0.0926,-0.0504,0.0347,0.0272,-0.0868,0.0656,0.0098,0.0697,0.0076,-0.1249,-0.0440,-0.1201,0.1073]
edim = 8
wmat = [0.0880056,-0.0916001,-0.0696116,-0.117595,0.012759,0.0126646,0.0484236,-0.0428529,-0.0598019,-0.147774,-0.0425981,0.0528273,-0.094148,-0.0486288,0.0721823,-0.0396656,-0.104105,-0.00299514,0.10035,-0.0801424,0.0974283,0.072043,-0.0103837,-0.129095,0.1669,0.00364875,-0.14738,-0.176011,0.0611225,-0.0103809,0.0331216,0.126466,-0.00626794,0.108145,-0.022296,0.0305704,0.0931776,0.0393832,0.104031,0.000612849,0.0318075,-0.126759,-0.0569143,-0.0298697,-0.092132,-0.0543672,-0.0827199,-0.0792457,0.0921199,0.0153161,-0.0825963,-0.155548,-0.0870553,0.0690963,-0.0114103,0.10365,-0.12653,0.0238141,-0.0530897,0.0270325,0.148739,0.0644209,0.0522568,-0.00990113]
wsz = 8
lr = 0.005
nrows = 8
ncols = 8
xid0 = 0
tv0 = [1,0,0,0,0,0,0,0]
xid1 = 7
tv1 = [1,0,0,0,0,0,0,0]
xid2 = 0
tv2 = [1,0,0,0,0,0,0,0]
xid3 = 0
tv3 = [0,0,0,1,0,0,0,0]
xid4 = 0
tv4 = [0,0,0,0,0,1,0,0]
xid5 = 0
tv5 = [1,0,0,0,0,0,0,0]
xid6 = 0
tv6 = [1,0,0,0,0,0,0,0]
xid7 = 0
tv7 = [0,0,0,0,1,0,0,0]
xid8 = 6
tv8 = [1,0,0,0,0,0,0,0]
xid9 = 0
tv9 = [0,0,0,0,0,1,0,0]
xid10 = 0
tv10 = [1,0,0,0,0,0,0,0]
xid11 = 0
tv11 = [1,0,0,0,0,0,0,0]
xid12 = 0
tv12 = [1,0,0,0,0,0,0,0]
xid13 = 0
tv13 = [0,0,1,0,0,0,0,0]
xid14 = 0
tv14 = [0,0,1,0,0,0,0,0]
xid15 = 2
tv15 = [1,0,0,0,0,0,0,0]
xid16 = 0
tv16 = [1,0,0,0,0,0,0,0]
xid17 = 7
tv17 = [0,0,0,1,0,0,0,0]
xid18 = 0
tv18 = [0,0,1,0,0,0,0,0]
xid19 = 0
tv19 = [1,0,0,0,0,0,0,0]
xid20 = 7
tv20 = [0,0,0,1,0,0,0,0]
xid21 = 0
tv21 = [1,0,0,0,0,0,0,0]
xid22 = 0
tv22 = [1,0,0,0,0,0,0,0]
xid23 = 0
tv23 = [1,0,0,0,0,0,0,0]
xid24 = 6
tv24 = [1,0,0,0,0,0,0,0]
xid25 = 0
tv25 = [0,0,1,0,0,0,0,0]
xid26 = 0
tv26 = [0,0,0,0,0,0,0,1]
xid27 = 0
tv27 = [1,0,0,0,0,0,0,0]
xid28 = 5
tv28 = [1,0,0,0,0,0,0,0]
xid29 = 0
tv29 = [0,0,1,0,0,0,0,0]
[T0]
embed_n(cid=xid0, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
softmax_n(arr=pp) ~> prob
vec_sub(a=prob, b=tv0) ~> gg
dot_product(a=gg, b=gg) ~> ls
outer_update(mat=wmat, err=gg, inp=ev, lr=lr, rows=nrows, cols=ncols) ~> wmat
embed_n(cid=xid1, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
softmax_n(arr=pp) ~> prob
vec_sub(a=prob, b=tv1) ~> gg
dot_product(a=gg, b=gg) ~> ls
outer_update(mat=wmat, err=gg, inp=ev, lr=lr, rows=nrows, cols=ncols) ~> wmat
embed_n(cid=xid2, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
softmax_n(arr=pp) ~> prob
vec_sub(a=prob, b=tv2) ~> gg
dot_product(a=gg, b=gg) ~> ls
outer_update(mat=wmat, err=gg, inp=ev, lr=lr, rows=nrows, cols=ncols) ~> wmat
embed_n(cid=xid3, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
softmax_n(arr=pp) ~> prob
vec_sub(a=prob, b=tv3) ~> gg
dot_product(a=gg, b=gg) ~> ls
outer_update(mat=wmat, err=gg, inp=ev, lr=lr, rows=nrows, cols=ncols) ~> wmat
embed_n(cid=xid4, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
softmax_n(arr=pp) ~> prob
vec_sub(a=prob, b=tv4) ~> gg
dot_product(a=gg, b=gg) ~> ls
outer_update(mat=wmat, err=gg, inp=ev, lr=lr, rows=nrows, cols=ncols) ~> wmat
embed_n(cid=xid5, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
softmax_n(arr=pp) ~> prob
vec_sub(a=prob, b=tv5) ~> gg
dot_product(a=gg, b=gg) ~> ls
outer_update(mat=wmat, err=gg, inp=ev, lr=lr, rows=nrows, cols=ncols) ~> wmat
embed_n(cid=xid6, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
softmax_n(arr=pp) ~> prob
vec_sub(a=prob, b=tv6) ~> gg
dot_product(a=gg, b=gg) ~> ls
outer_update(mat=wmat, err=gg, inp=ev, lr=lr, rows=nrows, cols=ncols) ~> wmat
embed_n(cid=xid7, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
softmax_n(arr=pp) ~> prob
vec_sub(a=prob, b=tv7) ~> gg
dot_product(a=gg, b=gg) ~> ls
outer_update(mat=wmat, err=gg, inp=ev, lr=lr, rows=nrows, cols=ncols) ~> wmat
embed_n(cid=xid8, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
softmax_n(arr=pp) ~> prob
vec_sub(a=prob, b=tv8) ~> gg
dot_product(a=gg, b=gg) ~> ls
outer_update(mat=wmat, err=gg, inp=ev, lr=lr, rows=nrows, cols=ncols) ~> wmat
embed_n(cid=xid9, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
softmax_n(arr=pp) ~> prob
vec_sub(a=prob, b=tv9) ~> gg
dot_product(a=gg, b=gg) ~> ls
outer_update(mat=wmat, err=gg, inp=ev, lr=lr, rows=nrows, cols=ncols) ~> wmat
embed_n(cid=xid10, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
softmax_n(arr=pp) ~> prob
vec_sub(a=prob, b=tv10) ~> gg
dot_product(a=gg, b=gg) ~> ls
outer_update(mat=wmat, err=gg, inp=ev, lr=lr, rows=nrows, cols=ncols) ~> wmat
embed_n(cid=xid11, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
softmax_n(arr=pp) ~> prob
vec_sub(a=prob, b=tv11) ~> gg
dot_product(a=gg, b=gg) ~> ls
outer_update(mat=wmat, err=gg, inp=ev, lr=lr, rows=nrows, cols=ncols) ~> wmat
embed_n(cid=xid12, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
softmax_n(arr=pp) ~> prob
vec_sub(a=prob, b=tv12) ~> gg
dot_product(a=gg, b=gg) ~> ls
outer_update(mat=wmat, err=gg, inp=ev, lr=lr, rows=nrows, cols=ncols) ~> wmat
embed_n(cid=xid13, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
softmax_n(arr=pp) ~> prob
vec_sub(a=prob, b=tv13) ~> gg
dot_product(a=gg, b=gg) ~> ls
outer_update(mat=wmat, err=gg, inp=ev, lr=lr, rows=nrows, cols=ncols) ~> wmat
embed_n(cid=xid14, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
softmax_n(arr=pp) ~> prob
vec_sub(a=prob, b=tv14) ~> gg
dot_product(a=gg, b=gg) ~> ls
outer_update(mat=wmat, err=gg, inp=ev, lr=lr, rows=nrows, cols=ncols) ~> wmat
embed_n(cid=xid15, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
softmax_n(arr=pp) ~> prob
vec_sub(a=prob, b=tv15) ~> gg
dot_product(a=gg, b=gg) ~> ls
outer_update(mat=wmat, err=gg, inp=ev, lr=lr, rows=nrows, cols=ncols) ~> wmat
embed_n(cid=xid16, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
softmax_n(arr=pp) ~> prob
vec_sub(a=prob, b=tv16) ~> gg
dot_product(a=gg, b=gg) ~> ls
outer_update(mat=wmat, err=gg, inp=ev, lr=lr, rows=nrows, cols=ncols) ~> wmat
embed_n(cid=xid17, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
softmax_n(arr=pp) ~> prob
vec_sub(a=prob, b=tv17) ~> gg
dot_product(a=gg, b=gg) ~> ls
outer_update(mat=wmat, err=gg, inp=ev, lr=lr, rows=nrows, cols=ncols) ~> wmat
embed_n(cid=xid18, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
softmax_n(arr=pp) ~> prob
vec_sub(a=prob, b=tv18) ~> gg
dot_product(a=gg, b=gg) ~> ls
outer_update(mat=wmat, err=gg, inp=ev, lr=lr, rows=nrows, cols=ncols) ~> wmat
embed_n(cid=xid19, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
softmax_n(arr=pp) ~> prob
vec_sub(a=prob, b=tv19) ~> gg
dot_product(a=gg, b=gg) ~> ls
outer_update(mat=wmat, err=gg, inp=ev, lr=lr, rows=nrows, cols=ncols) ~> wmat
embed_n(cid=xid20, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
softmax_n(arr=pp) ~> prob
vec_sub(a=prob, b=tv20) ~> gg
dot_product(a=gg, b=gg) ~> ls
outer_update(mat=wmat, err=gg, inp=ev, lr=lr, rows=nrows, cols=ncols) ~> wmat
embed_n(cid=xid21, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
softmax_n(arr=pp) ~> prob
vec_sub(a=prob, b=tv21) ~> gg
dot_product(a=gg, b=gg) ~> ls
outer_update(mat=wmat, err=gg, inp=ev, lr=lr, rows=nrows, cols=ncols) ~> wmat
embed_n(cid=xid22, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
softmax_n(arr=pp) ~> prob
vec_sub(a=prob, b=tv22) ~> gg
dot_product(a=gg, b=gg) ~> ls
outer_update(mat=wmat, err=gg, inp=ev, lr=lr, rows=nrows, cols=ncols) ~> wmat
embed_n(cid=xid23, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
softmax_n(arr=pp) ~> prob
vec_sub(a=prob, b=tv23) ~> gg
dot_product(a=gg, b=gg) ~> ls
outer_update(mat=wmat, err=gg, inp=ev, lr=lr, rows=nrows, cols=ncols) ~> wmat
embed_n(cid=xid24, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
softmax_n(arr=pp) ~> prob
vec_sub(a=prob, b=tv24) ~> gg
dot_product(a=gg, b=gg) ~> ls
outer_update(mat=wmat, err=gg, inp=ev, lr=lr, rows=nrows, cols=ncols) ~> wmat
embed_n(cid=xid25, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
softmax_n(arr=pp) ~> prob
vec_sub(a=prob, b=tv25) ~> gg
dot_product(a=gg, b=gg) ~> ls
outer_update(mat=wmat, err=gg, inp=ev, lr=lr, rows=nrows, cols=ncols) ~> wmat
embed_n(cid=xid26, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
softmax_n(arr=pp) ~> prob
vec_sub(a=prob, b=tv26) ~> gg
dot_product(a=gg, b=gg) ~> ls
outer_update(mat=wmat, err=gg, inp=ev, lr=lr, rows=nrows, cols=ncols) ~> wmat
embed_n(cid=xid27, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
softmax_n(arr=pp) ~> prob
vec_sub(a=prob, b=tv27) ~> gg
dot_product(a=gg, b=gg) ~> ls
outer_update(mat=wmat, err=gg, inp=ev, lr=lr, rows=nrows, cols=ncols) ~> wmat
embed_n(cid=xid28, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
softmax_n(arr=pp) ~> prob
vec_sub(a=prob, b=tv28) ~> gg
dot_product(a=gg, b=gg) ~> ls
outer_update(mat=wmat, err=gg, inp=ev, lr=lr, rows=nrows, cols=ncols) ~> wmat
embed_n(cid=xid29, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
softmax_n(arr=pp) ~> prob
vec_sub(a=prob, b=tv29) ~> gg
dot_product(a=gg, b=gg) ~> ls
outer_update(mat=wmat, err=gg, inp=ev, lr=lr, rows=nrows, cols=ncols) ~> wmat
join(arr=wmat, sep=",") ~> wstr
write_file_t(path="tcon_weights.txt", content=wstr) ~> ok
[T+]
show shall(ls)