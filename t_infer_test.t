[T-]
import "lib/basic/std.t"
import "lib/advanced/ml_t.t"
emb = [0.0279,-0.0950,-0.0450,-0.0554,0.0473,0.0353,0.0784,-0.0826,-0.0156,-0.0940,-0.0563,0.0011,-0.0947,-0.0602,0.0300,0.0090,-0.0559,0.0179,0.0619,-0.0987,0.0612,0.0396,-0.0319,-0.0689,0.0914,-0.0327,-0.0815,-0.0807,0.0695,0.0207,0.0614,0.0459,0.0072,0.0946,-0.0243,0.0104,0.0659,0.0237,0.0723,0.0155,0.0409,-0.0908,-0.0544,-0.0421,-0.0840,-0.0534,-0.0798,-0.0444,0.0271,-0.0270,-0.0260,-0.0581,-0.0466,0.0873,0.0296,0.0218,-0.0658,0.0458,-0.0673,-0.0241,0.0979,0.0280,0.0114,0.0369]
edim = 8
wmat = [0.175861,-0.305688,-0.286563,-0.389311,0.155110,0.119286,0.256937,-0.191414,0.094100,-0.046300,0.038900,-0.026100,0.103600,-0.010300,-0.058800,-0.063300,0.015300,-0.059300,0.021100,0.099500,-0.025100,-0.070200,0.124400,0.002400,-0.102300,-0.113200,-0.097600,0.031900,0.073000,-0.019500,-0.109100,-0.029600,0.124000,0.007300,0.117800,0.090200,-0.122100,0.055200,0.045400,0.009200,-0.058300,0.035200,-0.097100,-0.016300,-0.011600,0.113500,0.094000,-0.059200,0.000100,-0.080300,0.103200,0.092600,-0.050400,0.034700,0.027200,-0.086800,0.065600,0.009800,0.069700,0.007600,-0.124900,-0.044000,-0.120100,0.107300]
wsz = 8
xid0 = 0
xid1 = 1
xid2 = 2
xid3 = 3
xid4 = 4
xid5 = 5
xid6 = 6
xid7 = 7
[T0]
embed_n(cid=xid0, tbl=emb, dim=edim) ~> ev0
mat_mmv(src=wmat, sz=wsz, inp=ev0) ~> pp0
softmax_n(arr=pp0) ~> prob0
argmax_n(arr=prob0) ~> pred0
embed_n(cid=xid1, tbl=emb, dim=edim) ~> ev1
mat_mmv(src=wmat, sz=wsz, inp=ev1) ~> pp1
softmax_n(arr=pp1) ~> prob1
argmax_n(arr=prob1) ~> pred1
embed_n(cid=xid2, tbl=emb, dim=edim) ~> ev2
mat_mmv(src=wmat, sz=wsz, inp=ev2) ~> pp2
softmax_n(arr=pp2) ~> prob2
argmax_n(arr=prob2) ~> pred2
embed_n(cid=xid3, tbl=emb, dim=edim) ~> ev3
mat_mmv(src=wmat, sz=wsz, inp=ev3) ~> pp3
softmax_n(arr=pp3) ~> prob3
argmax_n(arr=prob3) ~> pred3
embed_n(cid=xid4, tbl=emb, dim=edim) ~> ev4
mat_mmv(src=wmat, sz=wsz, inp=ev4) ~> pp4
softmax_n(arr=pp4) ~> prob4
argmax_n(arr=prob4) ~> pred4
embed_n(cid=xid5, tbl=emb, dim=edim) ~> ev5
mat_mmv(src=wmat, sz=wsz, inp=ev5) ~> pp5
softmax_n(arr=pp5) ~> prob5
argmax_n(arr=prob5) ~> pred5
embed_n(cid=xid6, tbl=emb, dim=edim) ~> ev6
mat_mmv(src=wmat, sz=wsz, inp=ev6) ~> pp6
softmax_n(arr=pp6) ~> prob6
argmax_n(arr=prob6) ~> pred6
embed_n(cid=xid7, tbl=emb, dim=edim) ~> ev7
mat_mmv(src=wmat, sz=wsz, inp=ev7) ~> pp7
softmax_n(arr=pp7) ~> prob7
argmax_n(arr=prob7) ~> pred7
[T+]
show shall(pred0)
show shall(pred1)
show shall(pred2)
show shall(pred3)
show shall(pred4)
show shall(pred5)
show shall(pred6)
show shall(pred7)