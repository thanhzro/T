[T-]
import "lib/basic/std.t"
import "lib/advanced/ml_t.t"
emb = [0.0072,0.0946,-0.0243,0.0104,0.0659,0.0237,0.0723,0.0155,0.0409,-0.0908,-0.0544,-0.0421,-0.0840,-0.0534,-0.0798,-0.0444,0.0271,-0.0270,-0.0260,-0.0581,-0.0466,0.0873,0.0296,0.0218,-0.0658,0.0458,-0.0673,-0.0241,0.0979,0.0280,0.0114,0.0369,0.0686,0.0552,-0.0542,-0.0936,-0.0369,-0.0465,-0.0578,0.0886,0.0753,-0.0371,0.0311,-0.0209,0.0829,-0.0082,-0.0470,-0.0507,0.0123,-0.0475,0.0169,0.0796,-0.0201,-0.0561,0.0995,0.0019,-0.0818,-0.0906,-0.0781,0.0255,0.0584,-0.0156,-0.0873,-0.0237]
edim = 8
wr0 = [0.102193,-0.310328,-0.170970,-0.195423,0.188029,0.131773,0.296720,-0.286733]
wr1 = [-0.051256,-0.305013,-0.211257,0.004244,-0.312887,-0.205700,0.127081,0.037592]
wr2 = [-0.193825,0.091038,0.206473,-0.348288,0.238568,0.147759,-0.091163,-0.237873]
wr3 = [0.327044,-0.088428,-0.300202,-0.284674,0.267522,0.080618,0.238155,0.168131]
bv = [0,0,0,0,0,0,0,0]
lr = 0.003
xid0 = 4
tv0 = [0,1,0,0]
xid1 = 0
tv1 = [1,0,0,0]
xid2 = 6
tv2 = [1,0,0,0]
xid3 = 0
tv3 = [0,0,0,1]
xid4 = 1
tv4 = [0,0,1,0]
xid5 = 3
tv5 = [0,1,0,0]
xid6 = 0
tv6 = [0,0,1,0]
xid7 = 3
tv7 = [1,0,0,0]
xid8 = 0
tv8 = [1,0,0,0]
xid9 = 0
tv9 = [1,0,0,0]
xid10 = 2
tv10 = [1,0,0,0]
xid11 = 0
tv11 = [1,0,0,0]
xid12 = 1
tv12 = [1,0,0,0]
xid13 = 0
tv13 = [1,0,0,0]
xid14 = 3
tv14 = [0,1,0,0]
xid15 = 0
tv15 = [1,0,0,0]
xid16 = 0
tv16 = [1,0,0,0]
xid17 = 0
tv17 = [1,0,0,0]
xid18 = 0
tv18 = [1,0,0,0]
xid19 = 1
tv19 = [1,0,0,0]
xid20 = 0
tv20 = [1,0,0,0]
xid21 = 1
tv21 = [1,0,0,0]
xid22 = 0
tv22 = [1,0,0,0]
xid23 = 0
tv23 = [1,0,0,0]
xid24 = 3
tv24 = [0,1,0,0]
xid25 = 6
tv25 = [1,0,0,0]
xid26 = 3
tv26 = [1,0,0,0]
xid27 = 0
tv27 = [1,0,0,0]
xid28 = 0
tv28 = [0,0,0,1]
xid29 = 0
tv29 = [1,0,0,0]
[T0]
embed_n(cid=xid0, tbl=emb, dim=edim) ~> ev
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=ev) ~> pp
vec_sub(a=pp, b=tv0) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs0
vec_scale(a=ev, s=gs0) ~> rg0
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
get(arr=gg, idx=1) ~> gs1
vec_scale(a=ev, s=gs1) ~> rg1
sgd_update(weights=wr1, grad=rg1, lr=lr) ~> wr1
get(arr=gg, idx=2) ~> gs2
vec_scale(a=ev, s=gs2) ~> rg2
sgd_update(weights=wr2, grad=rg2, lr=lr) ~> wr2
get(arr=gg, idx=3) ~> gs3
vec_scale(a=ev, s=gs3) ~> rg3
sgd_update(weights=wr3, grad=rg3, lr=lr) ~> wr3
embed_n(cid=xid1, tbl=emb, dim=edim) ~> ev
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=ev) ~> pp
vec_sub(a=pp, b=tv1) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs0
vec_scale(a=ev, s=gs0) ~> rg0
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
get(arr=gg, idx=1) ~> gs1
vec_scale(a=ev, s=gs1) ~> rg1
sgd_update(weights=wr1, grad=rg1, lr=lr) ~> wr1
get(arr=gg, idx=2) ~> gs2
vec_scale(a=ev, s=gs2) ~> rg2
sgd_update(weights=wr2, grad=rg2, lr=lr) ~> wr2
get(arr=gg, idx=3) ~> gs3
vec_scale(a=ev, s=gs3) ~> rg3
sgd_update(weights=wr3, grad=rg3, lr=lr) ~> wr3
embed_n(cid=xid2, tbl=emb, dim=edim) ~> ev
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=ev) ~> pp
vec_sub(a=pp, b=tv2) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs0
vec_scale(a=ev, s=gs0) ~> rg0
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
get(arr=gg, idx=1) ~> gs1
vec_scale(a=ev, s=gs1) ~> rg1
sgd_update(weights=wr1, grad=rg1, lr=lr) ~> wr1
get(arr=gg, idx=2) ~> gs2
vec_scale(a=ev, s=gs2) ~> rg2
sgd_update(weights=wr2, grad=rg2, lr=lr) ~> wr2
get(arr=gg, idx=3) ~> gs3
vec_scale(a=ev, s=gs3) ~> rg3
sgd_update(weights=wr3, grad=rg3, lr=lr) ~> wr3
embed_n(cid=xid3, tbl=emb, dim=edim) ~> ev
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=ev) ~> pp
vec_sub(a=pp, b=tv3) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs0
vec_scale(a=ev, s=gs0) ~> rg0
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
get(arr=gg, idx=1) ~> gs1
vec_scale(a=ev, s=gs1) ~> rg1
sgd_update(weights=wr1, grad=rg1, lr=lr) ~> wr1
get(arr=gg, idx=2) ~> gs2
vec_scale(a=ev, s=gs2) ~> rg2
sgd_update(weights=wr2, grad=rg2, lr=lr) ~> wr2
get(arr=gg, idx=3) ~> gs3
vec_scale(a=ev, s=gs3) ~> rg3
sgd_update(weights=wr3, grad=rg3, lr=lr) ~> wr3
embed_n(cid=xid4, tbl=emb, dim=edim) ~> ev
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=ev) ~> pp
vec_sub(a=pp, b=tv4) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs0
vec_scale(a=ev, s=gs0) ~> rg0
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
get(arr=gg, idx=1) ~> gs1
vec_scale(a=ev, s=gs1) ~> rg1
sgd_update(weights=wr1, grad=rg1, lr=lr) ~> wr1
get(arr=gg, idx=2) ~> gs2
vec_scale(a=ev, s=gs2) ~> rg2
sgd_update(weights=wr2, grad=rg2, lr=lr) ~> wr2
get(arr=gg, idx=3) ~> gs3
vec_scale(a=ev, s=gs3) ~> rg3
sgd_update(weights=wr3, grad=rg3, lr=lr) ~> wr3
embed_n(cid=xid5, tbl=emb, dim=edim) ~> ev
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=ev) ~> pp
vec_sub(a=pp, b=tv5) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs0
vec_scale(a=ev, s=gs0) ~> rg0
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
get(arr=gg, idx=1) ~> gs1
vec_scale(a=ev, s=gs1) ~> rg1
sgd_update(weights=wr1, grad=rg1, lr=lr) ~> wr1
get(arr=gg, idx=2) ~> gs2
vec_scale(a=ev, s=gs2) ~> rg2
sgd_update(weights=wr2, grad=rg2, lr=lr) ~> wr2
get(arr=gg, idx=3) ~> gs3
vec_scale(a=ev, s=gs3) ~> rg3
sgd_update(weights=wr3, grad=rg3, lr=lr) ~> wr3
embed_n(cid=xid6, tbl=emb, dim=edim) ~> ev
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=ev) ~> pp
vec_sub(a=pp, b=tv6) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs0
vec_scale(a=ev, s=gs0) ~> rg0
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
get(arr=gg, idx=1) ~> gs1
vec_scale(a=ev, s=gs1) ~> rg1
sgd_update(weights=wr1, grad=rg1, lr=lr) ~> wr1
get(arr=gg, idx=2) ~> gs2
vec_scale(a=ev, s=gs2) ~> rg2
sgd_update(weights=wr2, grad=rg2, lr=lr) ~> wr2
get(arr=gg, idx=3) ~> gs3
vec_scale(a=ev, s=gs3) ~> rg3
sgd_update(weights=wr3, grad=rg3, lr=lr) ~> wr3
embed_n(cid=xid7, tbl=emb, dim=edim) ~> ev
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=ev) ~> pp
vec_sub(a=pp, b=tv7) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs0
vec_scale(a=ev, s=gs0) ~> rg0
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
get(arr=gg, idx=1) ~> gs1
vec_scale(a=ev, s=gs1) ~> rg1
sgd_update(weights=wr1, grad=rg1, lr=lr) ~> wr1
get(arr=gg, idx=2) ~> gs2
vec_scale(a=ev, s=gs2) ~> rg2
sgd_update(weights=wr2, grad=rg2, lr=lr) ~> wr2
get(arr=gg, idx=3) ~> gs3
vec_scale(a=ev, s=gs3) ~> rg3
sgd_update(weights=wr3, grad=rg3, lr=lr) ~> wr3
embed_n(cid=xid8, tbl=emb, dim=edim) ~> ev
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=ev) ~> pp
vec_sub(a=pp, b=tv8) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs0
vec_scale(a=ev, s=gs0) ~> rg0
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
get(arr=gg, idx=1) ~> gs1
vec_scale(a=ev, s=gs1) ~> rg1
sgd_update(weights=wr1, grad=rg1, lr=lr) ~> wr1
get(arr=gg, idx=2) ~> gs2
vec_scale(a=ev, s=gs2) ~> rg2
sgd_update(weights=wr2, grad=rg2, lr=lr) ~> wr2
get(arr=gg, idx=3) ~> gs3
vec_scale(a=ev, s=gs3) ~> rg3
sgd_update(weights=wr3, grad=rg3, lr=lr) ~> wr3
embed_n(cid=xid9, tbl=emb, dim=edim) ~> ev
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=ev) ~> pp
vec_sub(a=pp, b=tv9) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs0
vec_scale(a=ev, s=gs0) ~> rg0
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
get(arr=gg, idx=1) ~> gs1
vec_scale(a=ev, s=gs1) ~> rg1
sgd_update(weights=wr1, grad=rg1, lr=lr) ~> wr1
get(arr=gg, idx=2) ~> gs2
vec_scale(a=ev, s=gs2) ~> rg2
sgd_update(weights=wr2, grad=rg2, lr=lr) ~> wr2
get(arr=gg, idx=3) ~> gs3
vec_scale(a=ev, s=gs3) ~> rg3
sgd_update(weights=wr3, grad=rg3, lr=lr) ~> wr3
embed_n(cid=xid10, tbl=emb, dim=edim) ~> ev
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=ev) ~> pp
vec_sub(a=pp, b=tv10) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs0
vec_scale(a=ev, s=gs0) ~> rg0
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
get(arr=gg, idx=1) ~> gs1
vec_scale(a=ev, s=gs1) ~> rg1
sgd_update(weights=wr1, grad=rg1, lr=lr) ~> wr1
get(arr=gg, idx=2) ~> gs2
vec_scale(a=ev, s=gs2) ~> rg2
sgd_update(weights=wr2, grad=rg2, lr=lr) ~> wr2
get(arr=gg, idx=3) ~> gs3
vec_scale(a=ev, s=gs3) ~> rg3
sgd_update(weights=wr3, grad=rg3, lr=lr) ~> wr3
embed_n(cid=xid11, tbl=emb, dim=edim) ~> ev
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=ev) ~> pp
vec_sub(a=pp, b=tv11) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs0
vec_scale(a=ev, s=gs0) ~> rg0
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
get(arr=gg, idx=1) ~> gs1
vec_scale(a=ev, s=gs1) ~> rg1
sgd_update(weights=wr1, grad=rg1, lr=lr) ~> wr1
get(arr=gg, idx=2) ~> gs2
vec_scale(a=ev, s=gs2) ~> rg2
sgd_update(weights=wr2, grad=rg2, lr=lr) ~> wr2
get(arr=gg, idx=3) ~> gs3
vec_scale(a=ev, s=gs3) ~> rg3
sgd_update(weights=wr3, grad=rg3, lr=lr) ~> wr3
embed_n(cid=xid12, tbl=emb, dim=edim) ~> ev
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=ev) ~> pp
vec_sub(a=pp, b=tv12) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs0
vec_scale(a=ev, s=gs0) ~> rg0
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
get(arr=gg, idx=1) ~> gs1
vec_scale(a=ev, s=gs1) ~> rg1
sgd_update(weights=wr1, grad=rg1, lr=lr) ~> wr1
get(arr=gg, idx=2) ~> gs2
vec_scale(a=ev, s=gs2) ~> rg2
sgd_update(weights=wr2, grad=rg2, lr=lr) ~> wr2
get(arr=gg, idx=3) ~> gs3
vec_scale(a=ev, s=gs3) ~> rg3
sgd_update(weights=wr3, grad=rg3, lr=lr) ~> wr3
embed_n(cid=xid13, tbl=emb, dim=edim) ~> ev
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=ev) ~> pp
vec_sub(a=pp, b=tv13) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs0
vec_scale(a=ev, s=gs0) ~> rg0
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
get(arr=gg, idx=1) ~> gs1
vec_scale(a=ev, s=gs1) ~> rg1
sgd_update(weights=wr1, grad=rg1, lr=lr) ~> wr1
get(arr=gg, idx=2) ~> gs2
vec_scale(a=ev, s=gs2) ~> rg2
sgd_update(weights=wr2, grad=rg2, lr=lr) ~> wr2
get(arr=gg, idx=3) ~> gs3
vec_scale(a=ev, s=gs3) ~> rg3
sgd_update(weights=wr3, grad=rg3, lr=lr) ~> wr3
embed_n(cid=xid14, tbl=emb, dim=edim) ~> ev
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=ev) ~> pp
vec_sub(a=pp, b=tv14) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs0
vec_scale(a=ev, s=gs0) ~> rg0
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
get(arr=gg, idx=1) ~> gs1
vec_scale(a=ev, s=gs1) ~> rg1
sgd_update(weights=wr1, grad=rg1, lr=lr) ~> wr1
get(arr=gg, idx=2) ~> gs2
vec_scale(a=ev, s=gs2) ~> rg2
sgd_update(weights=wr2, grad=rg2, lr=lr) ~> wr2
get(arr=gg, idx=3) ~> gs3
vec_scale(a=ev, s=gs3) ~> rg3
sgd_update(weights=wr3, grad=rg3, lr=lr) ~> wr3
embed_n(cid=xid15, tbl=emb, dim=edim) ~> ev
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=ev) ~> pp
vec_sub(a=pp, b=tv15) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs0
vec_scale(a=ev, s=gs0) ~> rg0
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
get(arr=gg, idx=1) ~> gs1
vec_scale(a=ev, s=gs1) ~> rg1
sgd_update(weights=wr1, grad=rg1, lr=lr) ~> wr1
get(arr=gg, idx=2) ~> gs2
vec_scale(a=ev, s=gs2) ~> rg2
sgd_update(weights=wr2, grad=rg2, lr=lr) ~> wr2
get(arr=gg, idx=3) ~> gs3
vec_scale(a=ev, s=gs3) ~> rg3
sgd_update(weights=wr3, grad=rg3, lr=lr) ~> wr3
embed_n(cid=xid16, tbl=emb, dim=edim) ~> ev
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=ev) ~> pp
vec_sub(a=pp, b=tv16) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs0
vec_scale(a=ev, s=gs0) ~> rg0
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
get(arr=gg, idx=1) ~> gs1
vec_scale(a=ev, s=gs1) ~> rg1
sgd_update(weights=wr1, grad=rg1, lr=lr) ~> wr1
get(arr=gg, idx=2) ~> gs2
vec_scale(a=ev, s=gs2) ~> rg2
sgd_update(weights=wr2, grad=rg2, lr=lr) ~> wr2
get(arr=gg, idx=3) ~> gs3
vec_scale(a=ev, s=gs3) ~> rg3
sgd_update(weights=wr3, grad=rg3, lr=lr) ~> wr3
embed_n(cid=xid17, tbl=emb, dim=edim) ~> ev
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=ev) ~> pp
vec_sub(a=pp, b=tv17) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs0
vec_scale(a=ev, s=gs0) ~> rg0
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
get(arr=gg, idx=1) ~> gs1
vec_scale(a=ev, s=gs1) ~> rg1
sgd_update(weights=wr1, grad=rg1, lr=lr) ~> wr1
get(arr=gg, idx=2) ~> gs2
vec_scale(a=ev, s=gs2) ~> rg2
sgd_update(weights=wr2, grad=rg2, lr=lr) ~> wr2
get(arr=gg, idx=3) ~> gs3
vec_scale(a=ev, s=gs3) ~> rg3
sgd_update(weights=wr3, grad=rg3, lr=lr) ~> wr3
embed_n(cid=xid18, tbl=emb, dim=edim) ~> ev
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=ev) ~> pp
vec_sub(a=pp, b=tv18) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs0
vec_scale(a=ev, s=gs0) ~> rg0
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
get(arr=gg, idx=1) ~> gs1
vec_scale(a=ev, s=gs1) ~> rg1
sgd_update(weights=wr1, grad=rg1, lr=lr) ~> wr1
get(arr=gg, idx=2) ~> gs2
vec_scale(a=ev, s=gs2) ~> rg2
sgd_update(weights=wr2, grad=rg2, lr=lr) ~> wr2
get(arr=gg, idx=3) ~> gs3
vec_scale(a=ev, s=gs3) ~> rg3
sgd_update(weights=wr3, grad=rg3, lr=lr) ~> wr3
embed_n(cid=xid19, tbl=emb, dim=edim) ~> ev
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=ev) ~> pp
vec_sub(a=pp, b=tv19) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs0
vec_scale(a=ev, s=gs0) ~> rg0
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
get(arr=gg, idx=1) ~> gs1
vec_scale(a=ev, s=gs1) ~> rg1
sgd_update(weights=wr1, grad=rg1, lr=lr) ~> wr1
get(arr=gg, idx=2) ~> gs2
vec_scale(a=ev, s=gs2) ~> rg2
sgd_update(weights=wr2, grad=rg2, lr=lr) ~> wr2
get(arr=gg, idx=3) ~> gs3
vec_scale(a=ev, s=gs3) ~> rg3
sgd_update(weights=wr3, grad=rg3, lr=lr) ~> wr3
embed_n(cid=xid20, tbl=emb, dim=edim) ~> ev
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=ev) ~> pp
vec_sub(a=pp, b=tv20) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs0
vec_scale(a=ev, s=gs0) ~> rg0
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
get(arr=gg, idx=1) ~> gs1
vec_scale(a=ev, s=gs1) ~> rg1
sgd_update(weights=wr1, grad=rg1, lr=lr) ~> wr1
get(arr=gg, idx=2) ~> gs2
vec_scale(a=ev, s=gs2) ~> rg2
sgd_update(weights=wr2, grad=rg2, lr=lr) ~> wr2
get(arr=gg, idx=3) ~> gs3
vec_scale(a=ev, s=gs3) ~> rg3
sgd_update(weights=wr3, grad=rg3, lr=lr) ~> wr3
embed_n(cid=xid21, tbl=emb, dim=edim) ~> ev
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=ev) ~> pp
vec_sub(a=pp, b=tv21) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs0
vec_scale(a=ev, s=gs0) ~> rg0
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
get(arr=gg, idx=1) ~> gs1
vec_scale(a=ev, s=gs1) ~> rg1
sgd_update(weights=wr1, grad=rg1, lr=lr) ~> wr1
get(arr=gg, idx=2) ~> gs2
vec_scale(a=ev, s=gs2) ~> rg2
sgd_update(weights=wr2, grad=rg2, lr=lr) ~> wr2
get(arr=gg, idx=3) ~> gs3
vec_scale(a=ev, s=gs3) ~> rg3
sgd_update(weights=wr3, grad=rg3, lr=lr) ~> wr3
embed_n(cid=xid22, tbl=emb, dim=edim) ~> ev
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=ev) ~> pp
vec_sub(a=pp, b=tv22) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs0
vec_scale(a=ev, s=gs0) ~> rg0
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
get(arr=gg, idx=1) ~> gs1
vec_scale(a=ev, s=gs1) ~> rg1
sgd_update(weights=wr1, grad=rg1, lr=lr) ~> wr1
get(arr=gg, idx=2) ~> gs2
vec_scale(a=ev, s=gs2) ~> rg2
sgd_update(weights=wr2, grad=rg2, lr=lr) ~> wr2
get(arr=gg, idx=3) ~> gs3
vec_scale(a=ev, s=gs3) ~> rg3
sgd_update(weights=wr3, grad=rg3, lr=lr) ~> wr3
embed_n(cid=xid23, tbl=emb, dim=edim) ~> ev
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=ev) ~> pp
vec_sub(a=pp, b=tv23) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs0
vec_scale(a=ev, s=gs0) ~> rg0
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
get(arr=gg, idx=1) ~> gs1
vec_scale(a=ev, s=gs1) ~> rg1
sgd_update(weights=wr1, grad=rg1, lr=lr) ~> wr1
get(arr=gg, idx=2) ~> gs2
vec_scale(a=ev, s=gs2) ~> rg2
sgd_update(weights=wr2, grad=rg2, lr=lr) ~> wr2
get(arr=gg, idx=3) ~> gs3
vec_scale(a=ev, s=gs3) ~> rg3
sgd_update(weights=wr3, grad=rg3, lr=lr) ~> wr3
embed_n(cid=xid24, tbl=emb, dim=edim) ~> ev
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=ev) ~> pp
vec_sub(a=pp, b=tv24) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs0
vec_scale(a=ev, s=gs0) ~> rg0
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
get(arr=gg, idx=1) ~> gs1
vec_scale(a=ev, s=gs1) ~> rg1
sgd_update(weights=wr1, grad=rg1, lr=lr) ~> wr1
get(arr=gg, idx=2) ~> gs2
vec_scale(a=ev, s=gs2) ~> rg2
sgd_update(weights=wr2, grad=rg2, lr=lr) ~> wr2
get(arr=gg, idx=3) ~> gs3
vec_scale(a=ev, s=gs3) ~> rg3
sgd_update(weights=wr3, grad=rg3, lr=lr) ~> wr3
embed_n(cid=xid25, tbl=emb, dim=edim) ~> ev
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=ev) ~> pp
vec_sub(a=pp, b=tv25) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs0
vec_scale(a=ev, s=gs0) ~> rg0
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
get(arr=gg, idx=1) ~> gs1
vec_scale(a=ev, s=gs1) ~> rg1
sgd_update(weights=wr1, grad=rg1, lr=lr) ~> wr1
get(arr=gg, idx=2) ~> gs2
vec_scale(a=ev, s=gs2) ~> rg2
sgd_update(weights=wr2, grad=rg2, lr=lr) ~> wr2
get(arr=gg, idx=3) ~> gs3
vec_scale(a=ev, s=gs3) ~> rg3
sgd_update(weights=wr3, grad=rg3, lr=lr) ~> wr3
embed_n(cid=xid26, tbl=emb, dim=edim) ~> ev
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=ev) ~> pp
vec_sub(a=pp, b=tv26) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs0
vec_scale(a=ev, s=gs0) ~> rg0
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
get(arr=gg, idx=1) ~> gs1
vec_scale(a=ev, s=gs1) ~> rg1
sgd_update(weights=wr1, grad=rg1, lr=lr) ~> wr1
get(arr=gg, idx=2) ~> gs2
vec_scale(a=ev, s=gs2) ~> rg2
sgd_update(weights=wr2, grad=rg2, lr=lr) ~> wr2
get(arr=gg, idx=3) ~> gs3
vec_scale(a=ev, s=gs3) ~> rg3
sgd_update(weights=wr3, grad=rg3, lr=lr) ~> wr3
embed_n(cid=xid27, tbl=emb, dim=edim) ~> ev
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=ev) ~> pp
vec_sub(a=pp, b=tv27) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs0
vec_scale(a=ev, s=gs0) ~> rg0
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
get(arr=gg, idx=1) ~> gs1
vec_scale(a=ev, s=gs1) ~> rg1
sgd_update(weights=wr1, grad=rg1, lr=lr) ~> wr1
get(arr=gg, idx=2) ~> gs2
vec_scale(a=ev, s=gs2) ~> rg2
sgd_update(weights=wr2, grad=rg2, lr=lr) ~> wr2
get(arr=gg, idx=3) ~> gs3
vec_scale(a=ev, s=gs3) ~> rg3
sgd_update(weights=wr3, grad=rg3, lr=lr) ~> wr3
embed_n(cid=xid28, tbl=emb, dim=edim) ~> ev
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=ev) ~> pp
vec_sub(a=pp, b=tv28) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs0
vec_scale(a=ev, s=gs0) ~> rg0
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
get(arr=gg, idx=1) ~> gs1
vec_scale(a=ev, s=gs1) ~> rg1
sgd_update(weights=wr1, grad=rg1, lr=lr) ~> wr1
get(arr=gg, idx=2) ~> gs2
vec_scale(a=ev, s=gs2) ~> rg2
sgd_update(weights=wr2, grad=rg2, lr=lr) ~> wr2
get(arr=gg, idx=3) ~> gs3
vec_scale(a=ev, s=gs3) ~> rg3
sgd_update(weights=wr3, grad=rg3, lr=lr) ~> wr3
embed_n(cid=xid29, tbl=emb, dim=edim) ~> ev
linear_rows(r0=wr0, r1=wr1, r2=wr2, r3=wr3, bv=bv, x=ev) ~> pp
vec_sub(a=pp, b=tv29) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs0
vec_scale(a=ev, s=gs0) ~> rg0
sgd_update(weights=wr0, grad=rg0, lr=lr) ~> wr0
get(arr=gg, idx=1) ~> gs1
vec_scale(a=ev, s=gs1) ~> rg1
sgd_update(weights=wr1, grad=rg1, lr=lr) ~> wr1
get(arr=gg, idx=2) ~> gs2
vec_scale(a=ev, s=gs2) ~> rg2
sgd_update(weights=wr2, grad=rg2, lr=lr) ~> wr2
get(arr=gg, idx=3) ~> gs3
vec_scale(a=ev, s=gs3) ~> rg3
sgd_update(weights=wr3, grad=rg3, lr=lr) ~> wr3
join(arr=wr0, sep=",") ~> wstr0
write_file_t(path="wr0_3.txt", content=wstr0) ~> ok0
join(arr=wr1, sep=",") ~> wstr1
write_file_t(path="wr1_3.txt", content=wstr1) ~> ok1
join(arr=wr2, sep=",") ~> wstr2
write_file_t(path="wr2_3.txt", content=wstr2) ~> ok2
join(arr=wr3, sep=",") ~> wstr3
write_file_t(path="wr3_3.txt", content=wstr3) ~> ok3
[T+]
show shall(ls)