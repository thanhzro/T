[T-]
import "lib/basic/std.t"
import "lib/advanced/ml_t.t"
emb = [0.0279, -0.0950, -0.0450, -0.0554, 0.0473, 0.0353, 0.0784, -0.0826, -0.0156, -0.0940, -0.0563, 0.0011, -0.0947, -0.0602, 0.0300, 0.0090, -0.0559, 0.0179, 0.0619, -0.0987, 0.0612, 0.0396, -0.0319, -0.0689, 0.0914, -0.0327, -0.0815, -0.0807, 0.0695, 0.0207, 0.0614, 0.0459, 0.0072, 0.0946, -0.0243, 0.0104, 0.0659, 0.0237, 0.0723, 0.0155, 0.0409, -0.0908, -0.0544, -0.0421, -0.0840, -0.0534, -0.0798, -0.0444, 0.0271, -0.0270, -0.0260, -0.0581, -0.0466, 0.0873, 0.0296, 0.0218, -0.0658, 0.0458, -0.0673, -0.0241, 0.0979, 0.0280, 0.0114, 0.0369, 0.0686, 0.0552, -0.0542, -0.0936, -0.0369, -0.0465, -0.0578, 0.0886, 0.0753, -0.0371, 0.0311, -0.0209, 0.0829, -0.0082, -0.0470, -0.0507, 0.0123, -0.0475, 0.0169, 0.0796, -0.0201, -0.0561, 0.0995, 0.0019, -0.0818, -0.0906, -0.0781, 0.0255, 0.0584, -0.0156, -0.0873, -0.0237, 0.0992, 0.0058, 0.0942, 0.0722, -0.0977, 0.0441, 0.0363, 0.0074, -0.0466, 0.0282, -0.0777, -0.0130, -0.0093, 0.0908, 0.0752, -0.0473, 0.0001, -0.0643, 0.0825, 0.0741, -0.0403, 0.0278, 0.0218, -0.0694, 0.0525, 0.0079, 0.0557, 0.0061, -0.0999, -0.0352, -0.0961, 0.0858, 0.0757, 0.0663, -0.0385, -0.0884, 0.0756, 0.0894, -0.0829, -0.0028, -0.0862, 0.0521, 0.0532, -0.0743, -0.0049, 0.0100, -0.0470, 0.0745, -0.0154, -0.0576, 0.0079, 0.0460, -0.0598, -0.0377, 0.0990, 0.0300, -0.0124, 0.0035, -0.0758, -0.0551, -0.0324, 0.0177, -0.0540, -0.0560, -0.0858, 0.0262, -0.0542, 0.0811, 0.0719, -0.0858, -0.0524, 0.0338, -0.0572, -0.0735, 0.0871, 0.0142, -0.0055, 0.0569, 0.0615, -0.0619, -0.0806, -0.0138, -0.0153, -0.0066, 0.0458, 0.0347, 0.0968, -0.0803, -0.0195, -0.0321, 0.0723, -0.0503, -0.0620, -0.0103, -0.0156, -0.0443, -0.0500, 0.0847, -0.0114, 0.0723, 0.0101, -0.0899, 0.0999, 0.0672, 0.0938, 0.0853, 0.0697, -0.0667, -0.0029, -0.0573, -0.0198, -0.0883, -0.0242, 0.0971, -0.0470, 0.0568, -0.0090, -0.0154, 0.0915, 0.0991, 0.0112, 0.0437, -0.0690, -0.0407, 0.0937, 0.0158, 0.0084, 0.0496, -0.0886, 0.0168, 0.0006, 0.0705, -0.0685, 0.0922, -0.0840, -0.0628, 0.0190, 0.0350, -0.0530, -0.0760, 0.0781, -0.0508, 0.0189, 0.0239, -0.0162, 0.0167, 0.0046, 0.0869, -0.0591, 0.0432, -0.0523, -0.0208, 0.0343, -0.0400, -0.0368, 0.0504, -0.0855, -0.0083, 0.0997, 0.0992]
edim = 8
wmat = [-0.1067, -0.0717, -0.0587, 0.1083, 0.0952, 0.0948, -0.0326, -0.0856, 0.0834, 0.0509, 0.0279, 0.1218, 0.0385, -0.1230, 0.0793, -0.0502, 0.0408, 0.1097, -0.0914, -0.0961, -0.0982, 0.0133, -0.0569, 0.0262, 0.0544, -0.0741, 0.0336, -0.0590, -0.0029, 0.1013, 0.0865, -0.1019, -0.0191, -0.0558, -0.1241, 0.0678, 0.0343, -0.0595, 0.0603, 0.0129, -0.0181, -0.1226, -0.1062, 0.0958, 0.1010, 0.0114, 0.0836, 0.0206, -0.0880, -0.0931, -0.0479, 0.0997, 0.0740, 0.0902, 0.0997, -0.0725, -0.0626, -0.0993, 0.0700, 0.0960, -0.0234, 0.0302, -0.0864, 0.1075]
wsz = 8
lr = 0.01
xid0 = 0
tv0 = [0, 0, 1, 0, 0, 0, 0, 0]
xid1 = 7
tv1 = [0, 0, 0, 0, 1, 0, 0, 0]
xid2 = 0
tv2 = [0, 0, 0, 0, 0, 1, 0, 0]
xid3 = 0
tv3 = [0, 0, 0, 0, 1, 0, 0, 0]
xid4 = 10
tv4 = [1, 0, 0, 0, 0, 0, 0, 0]
xid5 = 0
tv5 = [1, 0, 0, 0, 0, 0, 0, 0]
xid6 = 0
tv6 = [1, 0, 0, 0, 0, 0, 0, 0]
xid7 = 0
tv7 = [0, 0, 0, 0, 0, 1, 0, 0]
xid8 = 6
tv8 = [0, 0, 1, 0, 0, 0, 0, 0]
xid9 = 13
tv9 = [0, 0, 1, 0, 0, 0, 0, 0]
xid10 = 0
tv10 = [0, 1, 0, 0, 0, 0, 0, 0]
xid11 = 0
tv11 = [0, 0, 1, 0, 0, 0, 0, 0]
xid12 = 0
tv12 = [1, 0, 0, 0, 0, 0, 0, 0]
xid13 = 27
tv13 = [1, 0, 0, 0, 0, 0, 0, 0]
xid14 = 31
tv14 = [0, 0, 0, 1, 0, 0, 0, 0]
xid15 = 2
tv15 = [1, 0, 0, 0, 0, 0, 0, 0]
xid16 = 0
tv16 = [0, 0, 0, 1, 0, 0, 0, 0]
xid17 = 7
tv17 = [0, 1, 0, 0, 0, 0, 0, 0]
xid18 = 0
tv18 = [1, 0, 0, 0, 0, 0, 0, 0]
xid19 = 0
tv19 = [1, 0, 0, 0, 0, 0, 0, 0]
xid20 = 7
tv20 = [0, 1, 0, 0, 0, 0, 0, 0]
xid21 = 0
tv21 = [0, 0, 0, 1, 0, 0, 0, 0]
xid22 = 8
tv22 = [0, 1, 0, 0, 0, 0, 0, 0]
xid23 = 0
tv23 = [1, 0, 0, 0, 0, 0, 0, 0]
xid24 = 6
tv24 = [1, 0, 0, 0, 0, 0, 0, 0]
xid25 = 0
tv25 = [1, 0, 0, 0, 0, 0, 0, 0]
xid26 = 29
tv26 = [0, 0, 0, 0, 0, 1, 0, 0]
xid27 = 13
tv27 = [0, 1, 0, 0, 0, 0, 0, 0]
xid28 = 5
tv28 = [0, 1, 0, 0, 0, 0, 0, 0]
xid29 = 31
tv29 = [0, 0, 0, 1, 0, 0, 0, 0]
xid30 = 5
tv30 = [0, 0, 0, 0, 0, 1, 0, 0]
xid31 = 2
tv31 = [0, 0, 0, 0, 0, 0, 0, 1]
xid32 = 13
tv32 = [0, 0, 0, 1, 0, 0, 0, 0]
xid33 = 2
tv33 = [0, 0, 1, 0, 0, 0, 0, 0]
xid34 = 0
tv34 = [0, 0, 0, 0, 0, 0, 0, 1]
xid35 = 0
tv35 = [1, 0, 0, 0, 0, 0, 0, 0]
xid36 = 2
tv36 = [0, 0, 1, 0, 0, 0, 0, 0]
xid37 = 28
tv37 = [0, 0, 0, 0, 1, 0, 0, 0]
xid38 = 9
tv38 = [1, 0, 0, 0, 0, 0, 0, 0]
xid39 = 17
tv39 = [0, 0, 0, 1, 0, 0, 0, 0]
xid40 = 10
tv40 = [0, 0, 0, 0, 0, 0, 0, 1]
xid41 = 11
tv41 = [0, 0, 0, 1, 0, 0, 0, 0]
xid42 = 8
tv42 = [0, 0, 0, 1, 0, 0, 0, 0]
xid43 = 0
tv43 = [1, 0, 0, 0, 0, 0, 0, 0]
xid44 = 7
tv44 = [0, 1, 0, 0, 0, 0, 0, 0]
xid45 = 8
tv45 = [0, 1, 0, 0, 0, 0, 0, 0]
xid46 = 29
tv46 = [0, 0, 0, 0, 0, 1, 0, 0]
xid47 = 24
tv47 = [1, 0, 0, 0, 0, 0, 0, 0]
xid48 = 16
tv48 = [0, 1, 0, 0, 0, 0, 0, 0]
xid49 = 0
tv49 = [0, 1, 0, 0, 0, 0, 0, 0]
xid50 = 28
tv50 = [0, 0, 0, 0, 0, 1, 0, 0]
xid51 = 2
tv51 = [1, 0, 0, 0, 0, 0, 0, 0]
xid52 = 11
tv52 = [1, 0, 0, 0, 0, 0, 0, 0]
xid53 = 0
tv53 = [1, 0, 0, 0, 0, 0, 0, 0]
xid54 = 29
tv54 = [1, 0, 0, 0, 0, 0, 0, 0]
xid55 = 14
tv55 = [0, 0, 0, 1, 0, 0, 0, 0]
xid56 = 4
tv56 = [0, 1, 0, 0, 0, 0, 0, 0]
xid57 = 26
tv57 = [1, 0, 0, 0, 0, 0, 0, 0]
xid58 = 19
tv58 = [0, 0, 0, 0, 0, 1, 0, 0]
xid59 = 2
tv59 = [1, 0, 0, 0, 0, 0, 0, 0]
xid60 = 13
tv60 = [1, 0, 0, 0, 0, 0, 0, 0]
xid61 = 2
tv61 = [0, 0, 0, 0, 0, 0, 0, 1]
xid62 = 0
tv62 = [0, 0, 0, 0, 1, 0, 0, 0]
xid63 = 2
tv63 = [1, 0, 0, 0, 0, 0, 0, 0]
xid64 = 9
tv64 = [1, 0, 0, 0, 0, 0, 0, 0]
xid65 = 7
tv65 = [0, 0, 0, 0, 0, 1, 0, 0]
xid66 = 1
tv66 = [0, 0, 0, 0, 0, 1, 0, 0]
xid67 = 0
tv67 = [0, 0, 1, 0, 0, 0, 0, 0]
xid68 = 0
tv68 = [1, 0, 0, 0, 0, 0, 0, 0]
xid69 = 6
tv69 = [0, 0, 0, 0, 1, 0, 0, 0]
xid70 = 0
tv70 = [1, 0, 0, 0, 0, 0, 0, 0]
xid71 = 5
tv71 = [1, 0, 0, 0, 0, 0, 0, 0]
xid72 = 4
tv72 = [0, 0, 0, 0, 0, 1, 0, 0]
xid73 = 2
tv73 = [1, 0, 0, 0, 0, 0, 0, 0]
xid74 = 17
tv74 = [0, 0, 0, 1, 0, 0, 0, 0]
xid75 = 0
tv75 = [0, 0, 0, 0, 1, 0, 0, 0]
xid76 = 0
tv76 = [1, 0, 0, 0, 0, 0, 0, 0]
xid77 = 0
tv77 = [0, 0, 0, 0, 0, 0, 1, 0]
xid78 = 19
tv78 = [0, 0, 1, 0, 0, 0, 0, 0]
xid79 = 13
tv79 = [0, 0, 0, 0, 0, 0, 1, 0]
xid80 = 0
tv80 = [0, 0, 0, 0, 0, 0, 1, 0]
xid81 = 1
tv81 = [0, 0, 0, 0, 1, 0, 0, 0]
xid82 = 6
tv82 = [0, 0, 0, 1, 0, 0, 0, 0]
xid83 = 22
tv83 = [0, 0, 0, 0, 1, 0, 0, 0]
xid84 = 28
tv84 = [0, 0, 0, 1, 0, 0, 0, 0]
xid85 = 0
tv85 = [1, 0, 0, 0, 0, 0, 0, 0]
xid86 = 1
tv86 = [0, 1, 0, 0, 0, 0, 0, 0]
xid87 = 3
tv87 = [1, 0, 0, 0, 0, 0, 0, 0]
xid88 = 0
tv88 = [0, 0, 1, 0, 0, 0, 0, 0]
xid89 = 0
tv89 = [1, 0, 0, 0, 0, 0, 0, 0]
xid90 = 3
tv90 = [1, 0, 0, 0, 0, 0, 0, 0]
xid91 = 21
tv91 = [0, 0, 0, 1, 0, 0, 0, 0]
xid92 = 26
tv92 = [0, 0, 0, 0, 0, 0, 1, 0]
xid93 = 5
tv93 = [1, 0, 0, 0, 0, 0, 0, 0]
xid94 = 3
tv94 = [1, 0, 0, 0, 0, 0, 0, 0]
xid95 = 1
tv95 = [0, 0, 0, 0, 0, 0, 0, 1]
xid96 = 0
tv96 = [1, 0, 0, 0, 0, 0, 0, 0]
xid97 = 4
tv97 = [0, 0, 0, 1, 0, 0, 0, 0]
xid98 = 0
tv98 = [0, 0, 0, 0, 0, 0, 0, 1]
xid99 = 16
tv99 = [0, 1, 0, 0, 0, 0, 0, 0]
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
embed_n(cid=xid40, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv40) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid41, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv41) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid42, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv42) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid43, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv43) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid44, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv44) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid45, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv45) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid46, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv46) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid47, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv47) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid48, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv48) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid49, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv49) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid50, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv50) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid51, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv51) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid52, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv52) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid53, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv53) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid54, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv54) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid55, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv55) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid56, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv56) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid57, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv57) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid58, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv58) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid59, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv59) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid60, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv60) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid61, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv61) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid62, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv62) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid63, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv63) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid64, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv64) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid65, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv65) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid66, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv66) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid67, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv67) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid68, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv68) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid69, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv69) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid70, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv70) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid71, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv71) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid72, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv72) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid73, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv73) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid74, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv74) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid75, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv75) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid76, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv76) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid77, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv77) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid78, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv78) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid79, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv79) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid80, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv80) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid81, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv81) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid82, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv82) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid83, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv83) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid84, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv84) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid85, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv85) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid86, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv86) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid87, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv87) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid88, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv88) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid89, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv89) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid90, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv90) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid91, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv91) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid92, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv92) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid93, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv93) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid94, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv94) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid95, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv95) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid96, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv96) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid97, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv97) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid98, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv98) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid99, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv99) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
[T+]
show shall(ls)
join(arr=wmat, sep=",") ~> wstr
write_file_t(path="tcon_weights.txt", content=wstr) ~> ok
show shall(ok)