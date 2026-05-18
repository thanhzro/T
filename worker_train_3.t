[T-]
import "lib/basic/std.t"
import "lib/advanced/ml_t.t"
emb = [0.0279,-0.0950,-0.0450,-0.0554,0.0473,0.0353,0.0784,-0.0826,-0.0156,-0.0940,-0.0563,0.0011,-0.0947,-0.0602,0.0300,0.0090,-0.0559,0.0179,0.0619,-0.0987,0.0612,0.0396,-0.0319,-0.0689,0.0914,-0.0327,-0.0815,-0.0807,0.0695,0.0207,0.0614,0.0459,0.0072,0.0946,-0.0243,0.0104,0.0659,0.0237,0.0723,0.0155,0.0409,-0.0908,-0.0544,-0.0421,-0.0840,-0.0534,-0.0798,-0.0444,0.0271,-0.0270,-0.0260,-0.0581,-0.0466,0.0873,0.0296,0.0218,-0.0658,0.0458,-0.0673,-0.0241,0.0979,0.0280,0.0114,0.0369]
edim = 8
wmat = [0.175861,-0.305688,-0.286563,-0.389311,0.155110,0.119286,0.256937,-0.191414,0.094100,-0.046300,0.038900,-0.026100,0.103600,-0.010300,-0.058800,-0.063300,0.015300,-0.059300,0.021100,0.099500,-0.025100,-0.070200,0.124400,0.002400,-0.102300,-0.113200,-0.097600,0.031900,0.073000,-0.019500,-0.109100,-0.029600,0.124000,0.007300,0.117800,0.090200,-0.122100,0.055200,0.045400,0.009200,-0.058300,0.035200,-0.097100,-0.016300,-0.011600,0.113500,0.094000,-0.059200,0.000100,-0.080300,0.103200,0.092600,-0.050400,0.034700,0.027200,-0.086800,0.065600,0.009800,0.069700,0.007600,-0.124900,-0.044000,-0.120100,0.107300]
wsz = 8
lr = 0.003
xid0 = 0
tv0 = [0,1,0,0,0,0,0,0]
xid1 = 0
tv1 = [1,0,0,0,0,0,0,0]
xid2 = 2
tv2 = [1,0,0,0,0,0,0,0]
xid3 = 0
tv3 = [1,0,0,0,0,0,0,0]
xid4 = 1
tv4 = [1,0,0,0,0,0,0,0]
xid5 = 0
tv5 = [1,0,0,0,0,0,0,0]
xid6 = 0
tv6 = [0,0,0,0,1,0,0,0]
xid7 = 6
tv7 = [0,0,0,0,0,0,1,0]
xid8 = 1
tv8 = [0,0,1,0,0,0,0,0]
xid9 = 0
tv9 = [1,0,0,0,0,0,0,0]
xid10 = 0
tv10 = [1,0,0,0,0,0,0,0]
xid11 = 2
tv11 = [1,0,0,0,0,0,0,0]
xid12 = 0
tv12 = [1,0,0,0,0,0,0,0]
xid13 = 1
tv13 = [0,0,0,0,1,0,0,0]
xid14 = 0
tv14 = [1,0,0,0,0,0,0,0]
xid15 = 0
tv15 = [1,0,0,0,0,0,0,0]
xid16 = 0
tv16 = [1,0,0,0,0,0,0,0]
xid17 = 0
tv17 = [0,0,0,0,0,1,0,0]
xid18 = 0
tv18 = [1,0,0,0,0,0,0,0]
xid19 = 0
tv19 = [1,0,0,0,0,0,0,0]
xid20 = 0
tv20 = [0,0,0,0,0,0,1,0]
xid21 = 2
tv21 = [0,0,1,0,0,0,0,0]
xid22 = 0
tv22 = [1,0,0,0,0,0,0,0]
xid23 = 0
tv23 = [1,0,0,0,0,0,0,0]
xid24 = 0
tv24 = [0,0,0,0,0,0,1,0]
xid25 = 0
tv25 = [1,0,0,0,0,0,0,0]
xid26 = 0
tv26 = [0,0,1,0,0,0,0,0]
xid27 = 0
tv27 = [1,0,0,0,0,0,0,0]
xid28 = 0
tv28 = [1,0,0,0,0,0,0,0]
xid29 = 0
tv29 = [1,0,0,0,0,0,0,0]
xid30 = 1
tv30 = [1,0,0,0,0,0,0,0]
xid31 = 0
tv31 = [1,0,0,0,0,0,0,0]
xid32 = 0
tv32 = [0,0,0,1,0,0,0,0]
xid33 = 5
tv33 = [1,0,0,0,0,0,0,0]
xid34 = 0
tv34 = [1,0,0,0,0,0,0,0]
xid35 = 0
tv35 = [1,0,0,0,0,0,0,0]
xid36 = 0
tv36 = [1,0,0,0,0,0,0,0]
xid37 = 0
tv37 = [1,0,0,0,0,0,0,0]
xid38 = 0
tv38 = [1,0,0,0,0,0,0,0]
xid39 = 0
tv39 = [0,0,0,1,0,0,0,0]
[T0]
embed_n(cid=xid0, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv0) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid1, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv1) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid2, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv2) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid3, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv3) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid4, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv4) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid5, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv5) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid6, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv6) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid7, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv7) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid8, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv8) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid9, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv9) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid10, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv10) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid11, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv11) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid12, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv12) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid13, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv13) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid14, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv14) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid15, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv15) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid16, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv16) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid17, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv17) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid18, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv18) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid19, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv19) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid20, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv20) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid21, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv21) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid22, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv22) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid23, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv23) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid24, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv24) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid25, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv25) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid26, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv26) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid27, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv27) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid28, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv28) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid29, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv29) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid30, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv30) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid31, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv31) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid32, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv32) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid33, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv33) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid34, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv34) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid35, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv35) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid36, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv36) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid37, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv37) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid38, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv38) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid39, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv39) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
join(arr=wmat, sep=",") ~> wstr
write_file_t(path="weights_3.txt", content=wstr) ~> ok
[T+]
show shall(ls)