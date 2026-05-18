[T-]
import "lib/basic/std.t"
import "lib/advanced/ml_t.t"
emb = [0.0857,0.0690,-0.0677,-0.1170,-0.0461,-0.0581,-0.0723,0.1107,0.0941,-0.0463,0.0389,-0.0261,0.1036,-0.0103,-0.0588,-0.0633,0.0153,-0.0593,0.0211,0.0995,-0.0251,-0.0702,0.1244,0.0024,-0.1023,-0.1132,-0.0976,0.0319,0.0730,-0.0195,-0.1091,-0.0296,0.1240,0.0073,0.1178,0.0902,-0.1221,0.0552,0.0454,0.0092,-0.0583,0.0352,-0.0971,-0.0163,-0.0116,0.1135,0.0940,-0.0592,0.0001,-0.0803,0.1032,0.0926,-0.0504,0.0347,0.0272,-0.0868,0.0656,0.0098,0.0697,0.0076,-0.1249,-0.0440,-0.1201,0.1073]
edim = 8
wmat = [0.034682,-0.118829,-0.057025,-0.069563,0.059155,0.043891,0.097343,-0.102913,-0.020844,-0.118485,-0.069343,0.003015,-0.117821,-0.074399,0.038773,0.009613,-0.071501,0.021211,0.078558,-0.121336,0.077211,0.050573,-0.038413,-0.088013,0.113205,-0.041582,-0.101043,-0.099428,0.087339,0.026630,0.077859,0.056141,0.008637,0.118124,-0.030141,0.013511,0.082502,0.029902,0.090925,0.018854,0.050360,-0.114111,-0.066915,-0.051326,-0.105297,-0.066307,-0.099259,-0.056191,0.036862,-0.031218,-0.034947,-0.076765,-0.060039,0.107180,0.034637,0.031277,-0.082772,0.056427,-0.083185,-0.028927,0.123331,0.035645,0.014923,0.044688]
wsz = 8
lr = 0.005
nrows = 8
ncols = 8
xid0 = 0
tv0 = [1,0,0,0,0,0,0,0]
xid1 = 0
tv1 = [1,0,0,0,0,0,0,0]
xid2 = 0
tv2 = [1,0,0,0,0,0,0,0]
xid3 = 0
tv3 = [1,0,0,0,0,0,0,0]
xid4 = 0
tv4 = [1,0,0,0,0,0,0,0]
xid5 = 0
tv5 = [1,0,0,0,0,0,0,0]
xid6 = 0
tv6 = [0,0,0,0,0,1,0,0]
xid7 = 0
tv7 = [1,0,0,0,0,0,0,0]
xid8 = 0
tv8 = [1,0,0,0,0,0,0,0]
xid9 = 0
tv9 = [1,0,0,0,0,0,0,0]
xid10 = 0
tv10 = [1,0,0,0,0,0,0,0]
xid11 = 0
tv11 = [1,0,0,0,0,0,0,0]
xid12 = 3
tv12 = [0,0,0,0,1,0,0,0]
xid13 = 0
tv13 = [1,0,0,0,0,0,0,0]
xid14 = 0
tv14 = [1,0,0,0,0,0,0,0]
xid15 = 0
tv15 = [0,0,0,0,0,1,0,0]
xid16 = 0
tv16 = [1,0,0,0,0,0,0,0]
xid17 = 0
tv17 = [0,0,0,0,1,0,0,0]
xid18 = 0
tv18 = [1,0,0,0,0,0,0,0]
xid19 = 0
tv19 = [1,0,0,0,0,0,0,0]
xid20 = 0
tv20 = [1,0,0,0,0,0,0,0]
xid21 = 0
tv21 = [1,0,0,0,0,0,0,0]
xid22 = 0
tv22 = [0,0,0,0,0,1,0,0]
xid23 = 0
tv23 = [1,0,0,0,0,0,0,0]
xid24 = 0
tv24 = [1,0,0,0,0,0,0,0]
xid25 = 0
tv25 = [1,0,0,0,0,0,0,0]
xid26 = 0
tv26 = [1,0,0,0,0,0,0,0]
xid27 = 3
tv27 = [1,0,0,0,0,0,0,0]
xid28 = 4
tv28 = [0,0,0,0,1,0,0,0]
xid29 = 0
tv29 = [0,0,0,0,0,0,1,0]
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
write_file_t(path="weights_1.txt", content=wstr) ~> ok
[T+]
show shall(ls)