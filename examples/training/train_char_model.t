[T-]
import "lib/basic/std.t"
import "lib/advanced/ml_t.t"
emb = [0.0279, -0.0950, -0.0450, -0.0554, 0.0473, 0.0353, 0.0784, -0.0826, -0.0156, -0.0940, -0.0563, 0.0011, -0.0947, -0.0602, 0.0300, 0.0090, -0.0559, 0.0179, 0.0619, -0.0987, 0.0612, 0.0396, -0.0319, -0.0689, 0.0914, -0.0327, -0.0815, -0.0807, 0.0695, 0.0207, 0.0614, 0.0459, 0.0072, 0.0946, -0.0243, 0.0104, 0.0659, 0.0237, 0.0723, 0.0155, 0.0409, -0.0908, -0.0544, -0.0421, -0.0840, -0.0534, -0.0798, -0.0444, 0.0271, -0.0270, -0.0260, -0.0581, -0.0466, 0.0873, 0.0296, 0.0218, -0.0658, 0.0458, -0.0673, -0.0241, 0.0979, 0.0280, 0.0114, 0.0369]
edim = 8
wmat = [0.0857, 0.0690, -0.0677, -0.1170, -0.0461, -0.0581, -0.0723, 0.1107, 0.0941, -0.0463, 0.0389, -0.0261, 0.1036, -0.0103, -0.0588, -0.0633, 0.0153, -0.0593, 0.0211, 0.0995, -0.0251, -0.0702, 0.1244, 0.0024, -0.1023, -0.1132, -0.0976, 0.0319, 0.0730, -0.0195, -0.1091, -0.0296, 0.1240, 0.0073, 0.1178, 0.0902, -0.1221, 0.0552, 0.0454, 0.0092, -0.0583, 0.0352, -0.0971, -0.0163, -0.0116, 0.1135, 0.0940, -0.0592, 0.0001, -0.0803, 0.1032, 0.0926, -0.0504, 0.0347, 0.0272, -0.0868, 0.0656, 0.0098, 0.0697, 0.0076, -0.1249, -0.0440, -0.1201, 0.1073]
wsz = 8
lr = 0.05
xid0 = 0
tv0 = [1, 0, 0, 0, 0, 0, 0, 0]
xid1 = 7
tv1 = [1, 0, 0, 0, 0, 0, 0, 0]
xid2 = 0
tv2 = [1, 0, 0, 0, 0, 0, 0, 0]
xid3 = 0
tv3 = [0, 0, 0, 1, 0, 0, 0, 0]
xid4 = 0
tv4 = [0, 0, 0, 0, 0, 1, 0, 0]
xid5 = 0
tv5 = [1, 0, 0, 0, 0, 0, 0, 0]
xid6 = 0
tv6 = [1, 0, 0, 0, 0, 0, 0, 0]
xid7 = 0
tv7 = [0, 0, 0, 0, 1, 0, 0, 0]
xid8 = 6
tv8 = [1, 0, 0, 0, 0, 0, 0, 0]
xid9 = 0
tv9 = [0, 0, 0, 0, 0, 1, 0, 0]
xid10 = 0
tv10 = [1, 0, 0, 0, 0, 0, 0, 0]
xid11 = 0
tv11 = [1, 0, 0, 0, 0, 0, 0, 0]
xid12 = 0
tv12 = [1, 0, 0, 0, 0, 0, 0, 0]
xid13 = 0
tv13 = [0, 0, 1, 0, 0, 0, 0, 0]
xid14 = 0
tv14 = [0, 0, 1, 0, 0, 0, 0, 0]
xid15 = 2
tv15 = [1, 0, 0, 0, 0, 0, 0, 0]
xid16 = 0
tv16 = [1, 0, 0, 0, 0, 0, 0, 0]
xid17 = 7
tv17 = [0, 0, 0, 1, 0, 0, 0, 0]
xid18 = 0
tv18 = [0, 0, 1, 0, 0, 0, 0, 0]
xid19 = 0
tv19 = [1, 0, 0, 0, 0, 0, 0, 0]
xid20 = 7
tv20 = [0, 0, 0, 1, 0, 0, 0, 0]
xid21 = 0
tv21 = [1, 0, 0, 0, 0, 0, 0, 0]
xid22 = 0
tv22 = [1, 0, 0, 0, 0, 0, 0, 0]
xid23 = 0
tv23 = [1, 0, 0, 0, 0, 0, 0, 0]
xid24 = 6
tv24 = [1, 0, 0, 0, 0, 0, 0, 0]
xid25 = 0
tv25 = [0, 0, 1, 0, 0, 0, 0, 0]
xid26 = 0
tv26 = [0, 0, 0, 0, 0, 0, 0, 1]
xid27 = 0
tv27 = [1, 0, 0, 0, 0, 0, 0, 0]
xid28 = 5
tv28 = [1, 0, 0, 0, 0, 0, 0, 0]
xid29 = 0
tv29 = [0, 0, 1, 0, 0, 0, 0, 0]
xid30 = 5
tv30 = [0, 0, 0, 1, 0, 0, 0, 0]
xid31 = 2
tv31 = [1, 0, 0, 0, 0, 0, 0, 0]
xid32 = 0
tv32 = [0, 0, 0, 0, 0, 1, 0, 0]
xid33 = 2
tv33 = [1, 0, 0, 0, 0, 0, 0, 0]
xid34 = 0
tv34 = [1, 0, 0, 0, 0, 0, 0, 0]
xid35 = 0
tv35 = [0, 0, 1, 0, 0, 0, 0, 0]
xid36 = 2
tv36 = [1, 0, 0, 0, 0, 0, 0, 0]
xid37 = 0
tv37 = [1, 0, 0, 0, 0, 0, 0, 0]
xid38 = 0
tv38 = [1, 0, 0, 0, 0, 0, 0, 0]
xid39 = 0
tv39 = [0, 0, 0, 0, 0, 0, 1, 0]
xid40 = 0
tv40 = [1, 0, 0, 0, 0, 0, 0, 0]
xid41 = 0
tv41 = [1, 0, 0, 0, 0, 0, 0, 0]
xid42 = 0
tv42 = [0, 0, 0, 0, 0, 0, 1, 0]
xid43 = 0
tv43 = [0, 0, 0, 0, 0, 0, 1, 0]
xid44 = 7
tv44 = [0, 0, 0, 1, 0, 0, 0, 0]
xid45 = 0
tv45 = [1, 0, 0, 0, 0, 0, 0, 0]
xid46 = 0
tv46 = [0, 0, 0, 0, 0, 0, 0, 1]
xid47 = 0
tv47 = [1, 0, 0, 0, 0, 0, 0, 0]
xid48 = 0
tv48 = [1, 0, 0, 0, 0, 0, 0, 0]
xid49 = 0
tv49 = [1, 0, 0, 0, 0, 0, 0, 0]
xid50 = 0
tv50 = [0, 0, 0, 0, 0, 1, 0, 0]
xid51 = 2
tv51 = [1, 0, 0, 0, 0, 0, 0, 0]
xid52 = 0
tv52 = [1, 0, 0, 0, 0, 0, 0, 0]
xid53 = 0
tv53 = [1, 0, 0, 0, 0, 0, 0, 0]
xid54 = 0
tv54 = [0, 0, 1, 0, 0, 0, 0, 0]
xid55 = 0
tv55 = [1, 0, 0, 0, 0, 0, 0, 0]
xid56 = 4
tv56 = [1, 0, 0, 0, 0, 0, 0, 0]
xid57 = 0
tv57 = [0, 0, 0, 0, 0, 0, 0, 1]
xid58 = 0
tv58 = [1, 0, 0, 0, 0, 0, 0, 0]
xid59 = 2
tv59 = [1, 0, 0, 0, 0, 0, 0, 0]
xid60 = 0
tv60 = [0, 0, 0, 0, 0, 1, 0, 0]
xid61 = 2
tv61 = [1, 0, 0, 0, 0, 0, 0, 0]
xid62 = 0
tv62 = [1, 0, 0, 0, 0, 0, 0, 0]
xid63 = 2
tv63 = [1, 0, 0, 0, 0, 0, 0, 0]
xid64 = 0
tv64 = [1, 0, 0, 0, 0, 0, 0, 0]
xid65 = 7
tv65 = [0, 0, 0, 1, 0, 0, 0, 0]
xid66 = 1
tv66 = [1, 0, 0, 0, 0, 0, 0, 0]
xid67 = 0
tv67 = [1, 0, 0, 0, 0, 0, 0, 0]
xid68 = 0
tv68 = [1, 0, 0, 0, 0, 0, 0, 0]
xid69 = 6
tv69 = [1, 0, 0, 0, 0, 0, 0, 0]
xid70 = 0
tv70 = [1, 0, 0, 0, 0, 0, 0, 0]
xid71 = 5
tv71 = [0, 0, 0, 1, 0, 0, 0, 0]
xid72 = 4
tv72 = [0, 1, 0, 0, 0, 0, 0, 0]
xid73 = 2
tv73 = [1, 0, 0, 0, 0, 0, 0, 0]
xid74 = 0
tv74 = [0, 0, 0, 0, 0, 0, 1, 0]
xid75 = 0
tv75 = [1, 0, 0, 0, 0, 0, 0, 0]
xid76 = 0
tv76 = [1, 0, 0, 0, 0, 0, 0, 0]
xid77 = 0
tv77 = [1, 0, 0, 0, 0, 0, 0, 0]
xid78 = 0
tv78 = [0, 1, 0, 0, 0, 0, 0, 0]
xid79 = 0
tv79 = [1, 0, 0, 0, 0, 0, 0, 0]
xid80 = 0
tv80 = [1, 0, 0, 0, 0, 0, 0, 0]
xid81 = 1
tv81 = [1, 0, 0, 0, 0, 0, 0, 0]
xid82 = 6
tv82 = [1, 0, 0, 0, 0, 0, 0, 0]
xid83 = 0
tv83 = [1, 0, 0, 0, 0, 0, 0, 0]
xid84 = 0
tv84 = [1, 0, 0, 0, 0, 0, 0, 0]
xid85 = 0
tv85 = [1, 0, 0, 0, 0, 0, 0, 0]
xid86 = 1
tv86 = [1, 0, 0, 0, 0, 0, 0, 0]
xid87 = 3
tv87 = [0, 0, 1, 0, 0, 0, 0, 0]
xid88 = 0
tv88 = [0, 1, 0, 0, 0, 0, 0, 0]
xid89 = 0
tv89 = [1, 0, 0, 0, 0, 0, 0, 0]
xid90 = 3
tv90 = [1, 0, 0, 0, 0, 0, 0, 0]
xid91 = 0
tv91 = [1, 0, 0, 0, 0, 0, 0, 0]
xid92 = 0
tv92 = [1, 0, 0, 0, 0, 0, 0, 0]
xid93 = 5
tv93 = [1, 0, 0, 0, 0, 0, 0, 0]
xid94 = 3
tv94 = [1, 0, 0, 0, 0, 0, 0, 0]
xid95 = 1
tv95 = [1, 0, 0, 0, 0, 0, 0, 0]
xid96 = 0
tv96 = [1, 0, 0, 0, 0, 0, 0, 0]
xid97 = 4
tv97 = [1, 0, 0, 0, 0, 0, 0, 0]
xid98 = 0
tv98 = [1, 0, 0, 0, 0, 0, 0, 0]
xid99 = 0
tv99 = [0, 0, 0, 0, 1, 0, 0, 0]
xid100 = 0
tv100 = [1, 0, 0, 0, 0, 0, 0, 0]
xid101 = 0
tv101 = [1, 0, 0, 0, 0, 0, 0, 0]
xid102 = 0
tv102 = [0, 0, 0, 0, 0, 0, 1, 0]
xid103 = 0
tv103 = [1, 0, 0, 0, 0, 0, 0, 0]
xid104 = 0
tv104 = [1, 0, 0, 0, 0, 0, 0, 0]
xid105 = 7
tv105 = [1, 0, 0, 0, 0, 0, 0, 0]
xid106 = 3
tv106 = [0, 1, 0, 0, 0, 0, 0, 0]
xid107 = 4
tv107 = [1, 0, 0, 0, 0, 0, 0, 0]
xid108 = 0
tv108 = [1, 0, 0, 0, 0, 0, 0, 0]
xid109 = 4
tv109 = [1, 0, 0, 0, 0, 0, 0, 0]
xid110 = 0
tv110 = [1, 0, 0, 0, 0, 0, 0, 0]
xid111 = 0
tv111 = [1, 0, 0, 0, 0, 0, 0, 0]
xid112 = 0
tv112 = [1, 0, 0, 0, 0, 0, 0, 0]
xid113 = 0
tv113 = [1, 0, 0, 0, 0, 0, 0, 0]
xid114 = 0
tv114 = [1, 0, 0, 0, 0, 0, 0, 0]
xid115 = 0
tv115 = [1, 0, 0, 0, 0, 0, 0, 0]
xid116 = 0
tv116 = [1, 0, 0, 0, 0, 0, 0, 0]
xid117 = 1
tv117 = [0, 0, 1, 0, 0, 0, 0, 0]
xid118 = 0
tv118 = [1, 0, 0, 0, 0, 0, 0, 0]
xid119 = 3
tv119 = [0, 1, 0, 0, 0, 0, 0, 0]
xid120 = 0
tv120 = [1, 0, 0, 0, 0, 0, 0, 0]
xid121 = 0
tv121 = [1, 0, 0, 0, 0, 0, 0, 0]
xid122 = 0
tv122 = [1, 0, 0, 0, 0, 0, 0, 0]
xid123 = 2
tv123 = [1, 0, 0, 0, 0, 0, 0, 0]
xid124 = 0
tv124 = [1, 0, 0, 0, 0, 0, 0, 0]
xid125 = 0
tv125 = [1, 0, 0, 0, 0, 0, 0, 0]
xid126 = 0
tv126 = [1, 0, 0, 0, 0, 0, 0, 0]
xid127 = 0
tv127 = [1, 0, 0, 0, 0, 0, 0, 0]
xid128 = 0
tv128 = [1, 0, 0, 0, 0, 0, 0, 0]
xid129 = 7
tv129 = [1, 0, 0, 0, 0, 0, 0, 0]
xid130 = 7
tv130 = [0, 0, 0, 0, 1, 0, 0, 0]
xid131 = 0
tv131 = [1, 0, 0, 0, 0, 0, 0, 0]
xid132 = 0
tv132 = [1, 0, 0, 0, 0, 0, 0, 0]
xid133 = 0
tv133 = [1, 0, 0, 0, 0, 0, 0, 0]
xid134 = 0
tv134 = [1, 0, 0, 0, 0, 0, 0, 0]
xid135 = 0
tv135 = [1, 0, 0, 0, 0, 0, 0, 0]
xid136 = 0
tv136 = [1, 0, 0, 0, 0, 0, 0, 0]
xid137 = 0
tv137 = [0, 0, 1, 0, 0, 0, 0, 0]
xid138 = 0
tv138 = [1, 0, 0, 0, 0, 0, 0, 0]
xid139 = 5
tv139 = [0, 0, 0, 0, 1, 0, 0, 0]
xid140 = 0
tv140 = [1, 0, 0, 0, 0, 0, 0, 0]
xid141 = 0
tv141 = [1, 0, 0, 0, 0, 0, 0, 0]
xid142 = 2
tv142 = [1, 0, 0, 0, 0, 0, 0, 0]
xid143 = 5
tv143 = [0, 0, 0, 1, 0, 0, 0, 0]
xid144 = 7
tv144 = [1, 0, 0, 0, 0, 0, 0, 0]
xid145 = 3
tv145 = [0, 1, 0, 0, 0, 0, 0, 0]
xid146 = 2
tv146 = [1, 0, 0, 0, 0, 0, 0, 0]
xid147 = 0
tv147 = [0, 0, 1, 0, 0, 0, 0, 0]
xid148 = 0
tv148 = [1, 0, 0, 0, 0, 0, 0, 0]
xid149 = 0
tv149 = [1, 0, 0, 0, 0, 0, 0, 0]
xid150 = 0
tv150 = [1, 0, 0, 0, 0, 0, 0, 0]
xid151 = 0
tv151 = [1, 0, 0, 0, 0, 0, 0, 0]
xid152 = 0
tv152 = [1, 0, 0, 0, 0, 0, 0, 0]
xid153 = 4
tv153 = [0, 0, 0, 0, 0, 0, 0, 1]
xid154 = 0
tv154 = [1, 0, 0, 0, 0, 0, 0, 0]
xid155 = 0
tv155 = [1, 0, 0, 0, 0, 0, 0, 0]
xid156 = 0
tv156 = [1, 0, 0, 0, 0, 0, 0, 0]
xid157 = 0
tv157 = [1, 0, 0, 0, 0, 0, 0, 0]
xid158 = 0
tv158 = [0, 1, 0, 0, 0, 0, 0, 0]
xid159 = 0
tv159 = [1, 0, 0, 0, 0, 0, 0, 0]
xid160 = 6
tv160 = [0, 0, 0, 0, 0, 0, 1, 0]
xid161 = 0
tv161 = [0, 0, 0, 0, 0, 0, 1, 0]
xid162 = 0
tv162 = [1, 0, 0, 0, 0, 0, 0, 0]
xid163 = 7
tv163 = [1, 0, 0, 0, 0, 0, 0, 0]
xid164 = 0
tv164 = [1, 0, 0, 0, 0, 0, 0, 0]
xid165 = 0
tv165 = [1, 0, 0, 0, 0, 0, 0, 0]
xid166 = 1
tv166 = [1, 0, 0, 0, 0, 0, 0, 0]
xid167 = 0
tv167 = [1, 0, 0, 0, 0, 0, 0, 0]
xid168 = 0
tv168 = [1, 0, 0, 0, 0, 0, 0, 0]
xid169 = 0
tv169 = [1, 0, 0, 0, 0, 0, 0, 0]
xid170 = 0
tv170 = [0, 1, 0, 0, 0, 0, 0, 0]
xid171 = 0
tv171 = [1, 0, 0, 0, 0, 0, 0, 0]
xid172 = 4
tv172 = [0, 0, 0, 0, 1, 0, 0, 0]
xid173 = 0
tv173 = [0, 0, 0, 1, 0, 0, 0, 0]
xid174 = 0
tv174 = [1, 0, 0, 0, 0, 0, 0, 0]
xid175 = 0
tv175 = [1, 0, 0, 0, 0, 0, 0, 0]
xid176 = 0
tv176 = [1, 0, 0, 0, 0, 0, 0, 0]
xid177 = 0
tv177 = [1, 0, 0, 0, 0, 0, 0, 0]
xid178 = 0
tv178 = [0, 0, 1, 0, 0, 0, 0, 0]
xid179 = 0
tv179 = [1, 0, 0, 0, 0, 0, 0, 0]
xid180 = 0
tv180 = [1, 0, 0, 0, 0, 0, 0, 0]
xid181 = 0
tv181 = [1, 0, 0, 0, 0, 0, 0, 0]
xid182 = 0
tv182 = [1, 0, 0, 0, 0, 0, 0, 0]
xid183 = 0
tv183 = [1, 0, 0, 0, 0, 0, 0, 0]
xid184 = 4
tv184 = [0, 0, 0, 0, 0, 0, 0, 1]
xid185 = 0
tv185 = [1, 0, 0, 0, 0, 0, 0, 0]
xid186 = 0
tv186 = [1, 0, 0, 0, 0, 0, 0, 0]
xid187 = 1
tv187 = [1, 0, 0, 0, 0, 0, 0, 0]
xid188 = 0
tv188 = [0, 0, 0, 0, 0, 0, 1, 0]
xid189 = 0
tv189 = [1, 0, 0, 0, 0, 0, 0, 0]
xid190 = 0
tv190 = [0, 0, 0, 0, 0, 1, 0, 0]
xid191 = 0
tv191 = [1, 0, 0, 0, 0, 0, 0, 0]
xid192 = 0
tv192 = [0, 0, 0, 0, 0, 0, 1, 0]
xid193 = 0
tv193 = [1, 0, 0, 0, 0, 0, 0, 0]
xid194 = 4
tv194 = [1, 0, 0, 0, 0, 0, 0, 0]
xid195 = 0
tv195 = [1, 0, 0, 0, 0, 0, 0, 0]
xid196 = 0
tv196 = [1, 0, 0, 0, 0, 0, 0, 0]
xid197 = 0
tv197 = [1, 0, 0, 0, 0, 0, 0, 0]
xid198 = 2
tv198 = [1, 0, 0, 0, 0, 0, 0, 0]
xid199 = 2
tv199 = [1, 0, 0, 0, 0, 0, 0, 0]
xid200 = 6
tv200 = [1, 0, 0, 0, 0, 0, 0, 0]
xid201 = 4
tv201 = [1, 0, 0, 0, 0, 0, 0, 0]
xid202 = 3
tv202 = [0, 1, 0, 0, 0, 0, 0, 0]
xid203 = 0
tv203 = [0, 0, 0, 0, 0, 0, 0, 1]
xid204 = 0
tv204 = [0, 0, 1, 0, 0, 0, 0, 0]
xid205 = 0
tv205 = [1, 0, 0, 0, 0, 0, 0, 0]
xid206 = 0
tv206 = [0, 0, 0, 0, 0, 0, 0, 1]
xid207 = 3
tv207 = [1, 0, 0, 0, 0, 0, 0, 0]
xid208 = 0
tv208 = [1, 0, 0, 0, 0, 0, 0, 0]
xid209 = 0
tv209 = [0, 0, 0, 1, 0, 0, 0, 0]
xid210 = 0
tv210 = [1, 0, 0, 0, 0, 0, 0, 0]
xid211 = 0
tv211 = [1, 0, 0, 0, 0, 0, 0, 0]
xid212 = 0
tv212 = [1, 0, 0, 0, 0, 0, 0, 0]
xid213 = 6
tv213 = [1, 0, 0, 0, 0, 0, 0, 0]
xid214 = 0
tv214 = [1, 0, 0, 0, 0, 0, 0, 0]
xid215 = 2
tv215 = [0, 0, 1, 0, 0, 0, 0, 0]
xid216 = 0
tv216 = [1, 0, 0, 0, 0, 0, 0, 0]
xid217 = 0
tv217 = [0, 0, 1, 0, 0, 0, 0, 0]
xid218 = 0
tv218 = [1, 0, 0, 0, 0, 0, 0, 0]
xid219 = 5
tv219 = [1, 0, 0, 0, 0, 0, 0, 0]
xid220 = 0
tv220 = [0, 0, 0, 0, 0, 0, 0, 1]
xid221 = 6
tv221 = [1, 0, 0, 0, 0, 0, 0, 0]
xid222 = 0
tv222 = [1, 0, 0, 0, 0, 0, 0, 0]
xid223 = 0
tv223 = [0, 0, 0, 0, 1, 0, 0, 0]
xid224 = 0
tv224 = [0, 0, 0, 0, 1, 0, 0, 0]
xid225 = 0
tv225 = [0, 0, 1, 0, 0, 0, 0, 0]
xid226 = 3
tv226 = [0, 1, 0, 0, 0, 0, 0, 0]
xid227 = 0
tv227 = [1, 0, 0, 0, 0, 0, 0, 0]
xid228 = 6
tv228 = [0, 0, 0, 0, 0, 0, 1, 0]
xid229 = 2
tv229 = [1, 0, 0, 0, 0, 0, 0, 0]
xid230 = 0
tv230 = [1, 0, 0, 0, 0, 0, 0, 0]
xid231 = 0
tv231 = [1, 0, 0, 0, 0, 0, 0, 0]
xid232 = 0
tv232 = [1, 0, 0, 0, 0, 0, 0, 0]
xid233 = 0
tv233 = [1, 0, 0, 0, 0, 0, 0, 0]
xid234 = 0
tv234 = [1, 0, 0, 0, 0, 0, 0, 0]
xid235 = 5
tv235 = [1, 0, 0, 0, 0, 0, 0, 0]
xid236 = 0
tv236 = [0, 0, 0, 0, 0, 1, 0, 0]
xid237 = 3
tv237 = [0, 1, 0, 0, 0, 0, 0, 0]
xid238 = 0
tv238 = [1, 0, 0, 0, 0, 0, 0, 0]
xid239 = 0
tv239 = [1, 0, 0, 0, 0, 0, 0, 0]
xid240 = 0
tv240 = [1, 0, 0, 0, 0, 0, 0, 0]
xid241 = 0
tv241 = [1, 0, 0, 0, 0, 0, 0, 0]
xid242 = 0
tv242 = [1, 0, 0, 0, 0, 0, 0, 0]
xid243 = 1
tv243 = [1, 0, 0, 0, 0, 0, 0, 0]
xid244 = 6
tv244 = [1, 0, 0, 0, 0, 0, 0, 0]
xid245 = 6
tv245 = [1, 0, 0, 0, 0, 0, 0, 0]
xid246 = 0
tv246 = [0, 1, 0, 0, 0, 0, 0, 0]
xid247 = 0
tv247 = [1, 0, 0, 0, 0, 0, 0, 0]
xid248 = 0
tv248 = [1, 0, 0, 0, 0, 0, 0, 0]
xid249 = 0
tv249 = [0, 0, 0, 0, 0, 1, 0, 0]
xid250 = 0
tv250 = [1, 0, 0, 0, 0, 0, 0, 0]
xid251 = 0
tv251 = [0, 0, 0, 0, 0, 1, 0, 0]
xid252 = 0
tv252 = [1, 0, 0, 0, 0, 0, 0, 0]
xid253 = 0
tv253 = [0, 0, 0, 0, 0, 1, 0, 0]
xid254 = 0
tv254 = [1, 0, 0, 0, 0, 0, 0, 0]
xid255 = 5
tv255 = [1, 0, 0, 0, 0, 0, 0, 0]
xid256 = 0
tv256 = [1, 0, 0, 0, 0, 0, 0, 0]
xid257 = 0
tv257 = [1, 0, 0, 0, 0, 0, 0, 0]
xid258 = 0
tv258 = [0, 0, 0, 0, 0, 0, 1, 0]
xid259 = 2
tv259 = [0, 0, 1, 0, 0, 0, 0, 0]
xid260 = 0
tv260 = [1, 0, 0, 0, 0, 0, 0, 0]
xid261 = 0
tv261 = [1, 0, 0, 0, 0, 0, 0, 0]
xid262 = 2
tv262 = [1, 0, 0, 0, 0, 0, 0, 0]
xid263 = 3
tv263 = [1, 0, 0, 0, 0, 0, 0, 0]
xid264 = 2
tv264 = [1, 0, 0, 0, 0, 0, 0, 0]
xid265 = 5
tv265 = [1, 0, 0, 0, 0, 0, 0, 0]
xid266 = 0
tv266 = [1, 0, 0, 0, 0, 0, 0, 0]
xid267 = 0
tv267 = [1, 0, 0, 0, 0, 0, 0, 0]
xid268 = 0
tv268 = [0, 0, 0, 0, 0, 1, 0, 0]
xid269 = 0
tv269 = [0, 0, 0, 0, 0, 0, 1, 0]
xid270 = 5
tv270 = [1, 0, 0, 0, 0, 0, 0, 0]
xid271 = 0
tv271 = [0, 0, 1, 0, 0, 0, 0, 0]
xid272 = 3
tv272 = [0, 0, 0, 0, 0, 1, 0, 0]
xid273 = 2
tv273 = [1, 0, 0, 0, 0, 0, 0, 0]
xid274 = 0
tv274 = [1, 0, 0, 0, 0, 0, 0, 0]
xid275 = 0
tv275 = [1, 0, 0, 0, 0, 0, 0, 0]
xid276 = 0
tv276 = [1, 0, 0, 0, 0, 0, 0, 0]
xid277 = 2
tv277 = [0, 0, 1, 0, 0, 0, 0, 0]
xid278 = 2
tv278 = [1, 0, 0, 0, 0, 0, 0, 0]
xid279 = 0
tv279 = [0, 1, 0, 0, 0, 0, 0, 0]
xid280 = 0
tv280 = [1, 0, 0, 0, 0, 0, 0, 0]
xid281 = 0
tv281 = [1, 0, 0, 0, 0, 0, 0, 0]
xid282 = 0
tv282 = [1, 0, 0, 0, 0, 0, 0, 0]
xid283 = 2
tv283 = [1, 0, 0, 0, 0, 0, 0, 0]
xid284 = 0
tv284 = [1, 0, 0, 0, 0, 0, 0, 0]
xid285 = 0
tv285 = [0, 0, 0, 0, 1, 0, 0, 0]
xid286 = 0
tv286 = [1, 0, 0, 0, 0, 0, 0, 0]
xid287 = 0
tv287 = [1, 0, 0, 0, 0, 0, 0, 0]
xid288 = 0
tv288 = [1, 0, 0, 0, 0, 0, 0, 0]
xid289 = 6
tv289 = [1, 0, 0, 0, 0, 0, 0, 0]
xid290 = 0
tv290 = [1, 0, 0, 0, 0, 0, 0, 0]
xid291 = 0
tv291 = [1, 0, 0, 0, 0, 0, 0, 0]
xid292 = 0
tv292 = [1, 0, 0, 0, 0, 0, 0, 0]
xid293 = 0
tv293 = [1, 0, 0, 0, 0, 0, 0, 0]
xid294 = 2
tv294 = [1, 0, 0, 0, 0, 0, 0, 0]
xid295 = 0
tv295 = [1, 0, 0, 0, 0, 0, 0, 0]
xid296 = 0
tv296 = [0, 0, 1, 0, 0, 0, 0, 0]
xid297 = 1
tv297 = [1, 0, 0, 0, 0, 0, 0, 0]
xid298 = 0
tv298 = [1, 0, 0, 0, 0, 0, 0, 0]
xid299 = 2
tv299 = [1, 0, 0, 0, 0, 0, 0, 0]
xid300 = 3
tv300 = [0, 1, 0, 0, 0, 0, 0, 0]
xid301 = 4
tv301 = [1, 0, 0, 0, 0, 0, 0, 0]
xid302 = 0
tv302 = [1, 0, 0, 0, 0, 0, 0, 0]
xid303 = 0
tv303 = [1, 0, 0, 0, 0, 0, 0, 0]
xid304 = 3
tv304 = [0, 1, 0, 0, 0, 0, 0, 0]
xid305 = 0
tv305 = [0, 1, 0, 0, 0, 0, 0, 0]
xid306 = 7
tv306 = [0, 1, 0, 0, 0, 0, 0, 0]
xid307 = 0
tv307 = [1, 0, 0, 0, 0, 0, 0, 0]
xid308 = 0
tv308 = [1, 0, 0, 0, 0, 0, 0, 0]
xid309 = 0
tv309 = [1, 0, 0, 0, 0, 0, 0, 0]
xid310 = 0
tv310 = [0, 1, 0, 0, 0, 0, 0, 0]
xid311 = 0
tv311 = [1, 0, 0, 0, 0, 0, 0, 0]
xid312 = 0
tv312 = [1, 0, 0, 0, 0, 0, 0, 0]
xid313 = 0
tv313 = [0, 0, 0, 1, 0, 0, 0, 0]
xid314 = 1
tv314 = [1, 0, 0, 0, 0, 0, 0, 0]
xid315 = 7
tv315 = [1, 0, 0, 0, 0, 0, 0, 0]
xid316 = 0
tv316 = [1, 0, 0, 0, 0, 0, 0, 0]
xid317 = 0
tv317 = [1, 0, 0, 0, 0, 0, 0, 0]
xid318 = 6
tv318 = [1, 0, 0, 0, 0, 0, 0, 0]
xid319 = 0
tv319 = [1, 0, 0, 0, 0, 0, 0, 0]
xid320 = 5
tv320 = [0, 0, 0, 1, 0, 0, 0, 0]
xid321 = 0
tv321 = [1, 0, 0, 0, 0, 0, 0, 0]
xid322 = 0
tv322 = [1, 0, 0, 0, 0, 0, 0, 0]
xid323 = 0
tv323 = [1, 0, 0, 0, 0, 0, 0, 0]
xid324 = 0
tv324 = [1, 0, 0, 0, 0, 0, 0, 0]
xid325 = 0
tv325 = [1, 0, 0, 0, 0, 0, 0, 0]
xid326 = 0
tv326 = [1, 0, 0, 0, 0, 0, 0, 0]
xid327 = 0
tv327 = [1, 0, 0, 0, 0, 0, 0, 0]
xid328 = 0
tv328 = [1, 0, 0, 0, 0, 0, 0, 0]
xid329 = 0
tv329 = [0, 0, 0, 0, 0, 0, 0, 1]
xid330 = 7
tv330 = [1, 0, 0, 0, 0, 0, 0, 0]
xid331 = 0
tv331 = [1, 0, 0, 0, 0, 0, 0, 0]
xid332 = 0
tv332 = [1, 0, 0, 0, 0, 0, 0, 0]
xid333 = 4
tv333 = [0, 0, 0, 0, 0, 0, 0, 1]
xid334 = 3
tv334 = [1, 0, 0, 0, 0, 0, 0, 0]
xid335 = 0
tv335 = [1, 0, 0, 0, 0, 0, 0, 0]
xid336 = 6
tv336 = [1, 0, 0, 0, 0, 0, 0, 0]
xid337 = 0
tv337 = [0, 0, 0, 0, 0, 0, 1, 0]
xid338 = 4
tv338 = [1, 0, 0, 0, 0, 0, 0, 0]
xid339 = 0
tv339 = [0, 0, 0, 0, 0, 1, 0, 0]
xid340 = 3
tv340 = [0, 1, 0, 0, 0, 0, 0, 0]
xid341 = 0
tv341 = [0, 0, 1, 0, 0, 0, 0, 0]
xid342 = 0
tv342 = [0, 0, 0, 0, 0, 0, 0, 1]
xid343 = 1
tv343 = [0, 0, 0, 0, 1, 0, 0, 0]
xid344 = 5
tv344 = [1, 0, 0, 0, 0, 0, 0, 0]
xid345 = 0
tv345 = [1, 0, 0, 0, 0, 0, 0, 0]
xid346 = 0
tv346 = [1, 0, 0, 0, 0, 0, 0, 0]
xid347 = 0
tv347 = [1, 0, 0, 0, 0, 0, 0, 0]
xid348 = 0
tv348 = [1, 0, 0, 0, 0, 0, 0, 0]
xid349 = 3
tv349 = [0, 1, 0, 0, 0, 0, 0, 0]
xid350 = 0
tv350 = [1, 0, 0, 0, 0, 0, 0, 0]
xid351 = 0
tv351 = [0, 0, 0, 0, 0, 0, 0, 1]
xid352 = 0
tv352 = [1, 0, 0, 0, 0, 0, 0, 0]
xid353 = 3
tv353 = [0, 1, 0, 0, 0, 0, 0, 0]
xid354 = 3
tv354 = [0, 1, 0, 0, 0, 0, 0, 0]
xid355 = 0
tv355 = [1, 0, 0, 0, 0, 0, 0, 0]
xid356 = 0
tv356 = [1, 0, 0, 0, 0, 0, 0, 0]
xid357 = 0
tv357 = [1, 0, 0, 0, 0, 0, 0, 0]
xid358 = 1
tv358 = [1, 0, 0, 0, 0, 0, 0, 0]
xid359 = 0
tv359 = [1, 0, 0, 0, 0, 0, 0, 0]
xid360 = 0
tv360 = [0, 0, 0, 0, 0, 1, 0, 0]
xid361 = 0
tv361 = [1, 0, 0, 0, 0, 0, 0, 0]
xid362 = 0
tv362 = [1, 0, 0, 0, 0, 0, 0, 0]
xid363 = 0
tv363 = [1, 0, 0, 0, 0, 0, 0, 0]
xid364 = 0
tv364 = [1, 0, 0, 0, 0, 0, 0, 0]
xid365 = 7
tv365 = [1, 0, 0, 0, 0, 0, 0, 0]
xid366 = 0
tv366 = [1, 0, 0, 0, 0, 0, 0, 0]
xid367 = 0
tv367 = [1, 0, 0, 0, 0, 0, 0, 0]
xid368 = 0
tv368 = [1, 0, 0, 0, 0, 0, 0, 0]
xid369 = 7
tv369 = [1, 0, 0, 0, 0, 0, 0, 0]
xid370 = 6
tv370 = [1, 0, 0, 0, 0, 0, 0, 0]
xid371 = 0
tv371 = [0, 0, 1, 0, 0, 0, 0, 0]
xid372 = 0
tv372 = [1, 0, 0, 0, 0, 0, 0, 0]
xid373 = 3
tv373 = [1, 0, 0, 0, 0, 0, 0, 0]
xid374 = 2
tv374 = [1, 0, 0, 0, 0, 0, 0, 0]
xid375 = 0
tv375 = [1, 0, 0, 0, 0, 0, 0, 0]
xid376 = 6
tv376 = [0, 0, 0, 0, 0, 0, 1, 0]
xid377 = 1
tv377 = [0, 0, 1, 0, 0, 0, 0, 0]
xid378 = 7
tv378 = [1, 0, 0, 0, 0, 0, 0, 0]
xid379 = 0
tv379 = [1, 0, 0, 0, 0, 0, 0, 0]
xid380 = 0
tv380 = [1, 0, 0, 0, 0, 0, 0, 0]
xid381 = 0
tv381 = [1, 0, 0, 0, 0, 0, 0, 0]
xid382 = 0
tv382 = [1, 0, 0, 0, 0, 0, 0, 0]
xid383 = 0
tv383 = [1, 0, 0, 0, 0, 0, 0, 0]
xid384 = 0
tv384 = [1, 0, 0, 0, 0, 0, 0, 0]
xid385 = 4
tv385 = [0, 0, 0, 1, 0, 0, 0, 0]
xid386 = 4
tv386 = [0, 0, 0, 0, 1, 0, 0, 0]
xid387 = 0
tv387 = [1, 0, 0, 0, 0, 0, 0, 0]
xid388 = 4
tv388 = [1, 0, 0, 0, 0, 0, 0, 0]
xid389 = 0
tv389 = [1, 0, 0, 0, 0, 0, 0, 0]
xid390 = 6
tv390 = [0, 0, 0, 0, 0, 0, 1, 0]
xid391 = 0
tv391 = [0, 0, 0, 0, 0, 1, 0, 0]
xid392 = 2
tv392 = [1, 0, 0, 0, 0, 0, 0, 0]
xid393 = 0
tv393 = [1, 0, 0, 0, 0, 0, 0, 0]
xid394 = 4
tv394 = [1, 0, 0, 0, 0, 0, 0, 0]
xid395 = 0
tv395 = [1, 0, 0, 0, 0, 0, 0, 0]
xid396 = 6
tv396 = [1, 0, 0, 0, 0, 0, 0, 0]
xid397 = 5
tv397 = [1, 0, 0, 0, 0, 0, 0, 0]
xid398 = 0
tv398 = [1, 0, 0, 0, 0, 0, 0, 0]
xid399 = 0
tv399 = [0, 0, 0, 0, 1, 0, 0, 0]
xid400 = 4
tv400 = [0, 0, 0, 0, 0, 0, 0, 1]
xid401 = 0
tv401 = [1, 0, 0, 0, 0, 0, 0, 0]
xid402 = 0
tv402 = [0, 1, 0, 0, 0, 0, 0, 0]
xid403 = 4
tv403 = [1, 0, 0, 0, 0, 0, 0, 0]
xid404 = 1
tv404 = [0, 0, 0, 0, 0, 0, 0, 1]
xid405 = 0
tv405 = [0, 0, 0, 0, 1, 0, 0, 0]
xid406 = 0
tv406 = [1, 0, 0, 0, 0, 0, 0, 0]
xid407 = 7
tv407 = [1, 0, 0, 0, 0, 0, 0, 0]
xid408 = 0
tv408 = [1, 0, 0, 0, 0, 0, 0, 0]
xid409 = 1
tv409 = [0, 0, 0, 0, 0, 0, 0, 1]
xid410 = 3
tv410 = [1, 0, 0, 0, 0, 0, 0, 0]
xid411 = 0
tv411 = [1, 0, 0, 0, 0, 0, 0, 0]
xid412 = 6
tv412 = [1, 0, 0, 0, 0, 0, 0, 0]
xid413 = 3
tv413 = [1, 0, 0, 0, 0, 0, 0, 0]
xid414 = 7
tv414 = [0, 0, 0, 1, 0, 0, 0, 0]
xid415 = 0
tv415 = [1, 0, 0, 0, 0, 0, 0, 0]
xid416 = 0
tv416 = [1, 0, 0, 0, 0, 0, 0, 0]
xid417 = 0
tv417 = [1, 0, 0, 0, 0, 0, 0, 0]
xid418 = 0
tv418 = [0, 0, 1, 0, 0, 0, 0, 0]
xid419 = 0
tv419 = [1, 0, 0, 0, 0, 0, 0, 0]
xid420 = 0
tv420 = [1, 0, 0, 0, 0, 0, 0, 0]
xid421 = 0
tv421 = [1, 0, 0, 0, 0, 0, 0, 0]
xid422 = 0
tv422 = [1, 0, 0, 0, 0, 0, 0, 0]
xid423 = 0
tv423 = [1, 0, 0, 0, 0, 0, 0, 0]
xid424 = 0
tv424 = [1, 0, 0, 0, 0, 0, 0, 0]
xid425 = 0
tv425 = [1, 0, 0, 0, 0, 0, 0, 0]
xid426 = 0
tv426 = [1, 0, 0, 0, 0, 0, 0, 0]
xid427 = 0
tv427 = [1, 0, 0, 0, 0, 0, 0, 0]
xid428 = 7
tv428 = [1, 0, 0, 0, 0, 0, 0, 0]
xid429 = 0
tv429 = [0, 0, 0, 1, 0, 0, 0, 0]
xid430 = 2
tv430 = [1, 0, 0, 0, 0, 0, 0, 0]
xid431 = 3
tv431 = [0, 1, 0, 0, 0, 0, 0, 0]
xid432 = 5
tv432 = [1, 0, 0, 0, 0, 0, 0, 0]
xid433 = 0
tv433 = [1, 0, 0, 0, 0, 0, 0, 0]
xid434 = 4
tv434 = [0, 0, 0, 0, 1, 0, 0, 0]
xid435 = 4
tv435 = [1, 0, 0, 0, 0, 0, 0, 0]
xid436 = 0
tv436 = [0, 0, 0, 0, 0, 1, 0, 0]
xid437 = 0
tv437 = [1, 0, 0, 0, 0, 0, 0, 0]
xid438 = 4
tv438 = [0, 0, 0, 0, 1, 0, 0, 0]
xid439 = 5
tv439 = [0, 0, 0, 0, 1, 0, 0, 0]
xid440 = 0
tv440 = [1, 0, 0, 0, 0, 0, 0, 0]
xid441 = 0
tv441 = [1, 0, 0, 0, 0, 0, 0, 0]
xid442 = 4
tv442 = [1, 0, 0, 0, 0, 0, 0, 0]
xid443 = 0
tv443 = [1, 0, 0, 0, 0, 0, 0, 0]
xid444 = 0
tv444 = [1, 0, 0, 0, 0, 0, 0, 0]
xid445 = 0
tv445 = [1, 0, 0, 0, 0, 0, 0, 0]
xid446 = 0
tv446 = [0, 0, 0, 0, 1, 0, 0, 0]
xid447 = 0
tv447 = [1, 0, 0, 0, 0, 0, 0, 0]
xid448 = 3
tv448 = [0, 0, 0, 0, 0, 0, 0, 1]
xid449 = 7
tv449 = [1, 0, 0, 0, 0, 0, 0, 0]
xid450 = 0
tv450 = [1, 0, 0, 0, 0, 0, 0, 0]
xid451 = 0
tv451 = [1, 0, 0, 0, 0, 0, 0, 0]
xid452 = 0
tv452 = [0, 0, 0, 0, 0, 0, 1, 0]
xid453 = 0
tv453 = [1, 0, 0, 0, 0, 0, 0, 0]
xid454 = 4
tv454 = [1, 0, 0, 0, 0, 0, 0, 0]
xid455 = 0
tv455 = [1, 0, 0, 0, 0, 0, 0, 0]
xid456 = 0
tv456 = [1, 0, 0, 0, 0, 0, 0, 0]
xid457 = 0
tv457 = [1, 0, 0, 0, 0, 0, 0, 0]
xid458 = 0
tv458 = [0, 0, 0, 0, 0, 0, 1, 0]
xid459 = 4
tv459 = [0, 0, 0, 0, 1, 0, 0, 0]
xid460 = 0
tv460 = [0, 0, 0, 0, 0, 0, 1, 0]
xid461 = 1
tv461 = [0, 0, 0, 1, 0, 0, 0, 0]
xid462 = 1
tv462 = [0, 0, 0, 1, 0, 0, 0, 0]
xid463 = 5
tv463 = [1, 0, 0, 0, 0, 0, 0, 0]
xid464 = 6
tv464 = [1, 0, 0, 0, 0, 0, 0, 0]
xid465 = 0
tv465 = [0, 0, 1, 0, 0, 0, 0, 0]
xid466 = 0
tv466 = [1, 0, 0, 0, 0, 0, 0, 0]
xid467 = 0
tv467 = [1, 0, 0, 0, 0, 0, 0, 0]
xid468 = 4
tv468 = [1, 0, 0, 0, 0, 0, 0, 0]
xid469 = 0
tv469 = [1, 0, 0, 0, 0, 0, 0, 0]
xid470 = 7
tv470 = [0, 0, 0, 1, 0, 0, 0, 0]
xid471 = 1
tv471 = [1, 0, 0, 0, 0, 0, 0, 0]
xid472 = 0
tv472 = [1, 0, 0, 0, 0, 0, 0, 0]
xid473 = 0
tv473 = [1, 0, 0, 0, 0, 0, 0, 0]
xid474 = 6
tv474 = [1, 0, 0, 0, 0, 0, 0, 0]
xid475 = 0
tv475 = [1, 0, 0, 0, 0, 0, 0, 0]
xid476 = 0
tv476 = [1, 0, 0, 0, 0, 0, 0, 0]
xid477 = 0
tv477 = [1, 0, 0, 0, 0, 0, 0, 0]
xid478 = 1
tv478 = [0, 0, 0, 0, 1, 0, 0, 0]
xid479 = 0
tv479 = [1, 0, 0, 0, 0, 0, 0, 0]
xid480 = 4
tv480 = [0, 0, 0, 0, 0, 1, 0, 0]
xid481 = 0
tv481 = [1, 0, 0, 0, 0, 0, 0, 0]
xid482 = 0
tv482 = [1, 0, 0, 0, 0, 0, 0, 0]
xid483 = 0
tv483 = [1, 0, 0, 0, 0, 0, 0, 0]
xid484 = 0
tv484 = [1, 0, 0, 0, 0, 0, 0, 0]
xid485 = 0
tv485 = [1, 0, 0, 0, 0, 0, 0, 0]
xid486 = 0
tv486 = [0, 0, 1, 0, 0, 0, 0, 0]
xid487 = 0
tv487 = [0, 0, 0, 0, 0, 0, 1, 0]
xid488 = 0
tv488 = [1, 0, 0, 0, 0, 0, 0, 0]
xid489 = 0
tv489 = [1, 0, 0, 0, 0, 0, 0, 0]
xid490 = 3
tv490 = [1, 0, 0, 0, 0, 0, 0, 0]
xid491 = 0
tv491 = [1, 0, 0, 0, 0, 0, 0, 0]
xid492 = 0
tv492 = [1, 0, 0, 0, 0, 0, 0, 0]
xid493 = 3
tv493 = [1, 0, 0, 0, 0, 0, 0, 0]
xid494 = 0
tv494 = [0, 0, 0, 0, 1, 0, 0, 0]
xid495 = 0
tv495 = [1, 0, 0, 0, 0, 0, 0, 0]
xid496 = 0
tv496 = [1, 0, 0, 0, 0, 0, 0, 0]
xid497 = 7
tv497 = [1, 0, 0, 0, 0, 0, 0, 0]
xid498 = 0
tv498 = [1, 0, 0, 0, 0, 0, 0, 0]
xid499 = 0
tv499 = [1, 0, 0, 0, 0, 0, 0, 0]
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
embed_n(cid=xid100, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv100) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid101, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv101) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid102, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv102) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid103, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv103) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid104, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv104) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid105, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv105) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid106, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv106) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid107, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv107) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid108, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv108) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid109, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv109) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid110, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv110) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid111, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv111) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid112, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv112) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid113, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv113) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid114, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv114) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid115, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv115) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid116, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv116) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid117, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv117) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid118, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv118) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid119, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv119) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid120, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv120) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid121, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv121) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid122, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv122) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid123, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv123) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid124, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv124) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid125, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv125) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid126, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv126) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid127, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv127) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid128, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv128) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid129, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv129) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid130, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv130) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid131, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv131) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid132, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv132) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid133, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv133) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid134, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv134) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid135, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv135) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid136, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv136) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid137, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv137) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid138, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv138) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid139, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv139) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid140, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv140) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid141, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv141) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid142, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv142) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid143, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv143) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid144, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv144) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid145, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv145) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid146, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv146) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid147, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv147) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid148, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv148) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid149, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv149) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid150, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv150) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid151, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv151) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid152, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv152) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid153, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv153) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid154, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv154) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid155, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv155) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid156, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv156) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid157, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv157) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid158, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv158) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid159, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv159) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid160, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv160) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid161, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv161) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid162, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv162) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid163, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv163) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid164, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv164) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid165, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv165) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid166, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv166) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid167, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv167) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid168, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv168) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid169, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv169) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid170, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv170) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid171, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv171) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid172, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv172) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid173, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv173) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid174, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv174) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid175, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv175) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid176, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv176) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid177, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv177) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid178, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv178) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid179, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv179) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid180, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv180) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid181, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv181) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid182, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv182) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid183, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv183) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid184, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv184) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid185, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv185) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid186, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv186) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid187, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv187) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid188, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv188) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid189, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv189) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid190, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv190) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid191, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv191) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid192, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv192) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid193, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv193) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid194, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv194) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid195, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv195) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid196, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv196) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid197, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv197) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid198, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv198) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid199, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv199) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid200, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv200) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid201, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv201) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid202, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv202) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid203, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv203) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid204, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv204) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid205, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv205) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid206, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv206) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid207, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv207) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid208, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv208) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid209, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv209) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid210, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv210) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid211, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv211) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid212, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv212) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid213, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv213) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid214, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv214) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid215, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv215) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid216, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv216) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid217, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv217) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid218, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv218) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid219, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv219) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid220, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv220) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid221, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv221) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid222, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv222) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid223, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv223) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid224, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv224) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid225, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv225) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid226, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv226) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid227, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv227) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid228, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv228) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid229, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv229) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid230, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv230) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid231, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv231) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid232, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv232) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid233, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv233) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid234, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv234) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid235, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv235) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid236, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv236) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid237, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv237) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid238, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv238) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid239, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv239) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid240, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv240) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid241, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv241) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid242, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv242) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid243, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv243) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid244, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv244) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid245, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv245) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid246, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv246) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid247, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv247) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid248, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv248) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid249, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv249) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid250, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv250) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid251, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv251) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid252, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv252) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid253, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv253) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid254, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv254) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid255, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv255) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid256, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv256) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid257, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv257) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid258, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv258) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid259, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv259) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid260, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv260) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid261, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv261) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid262, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv262) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid263, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv263) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid264, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv264) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid265, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv265) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid266, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv266) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid267, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv267) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid268, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv268) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid269, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv269) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid270, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv270) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid271, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv271) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid272, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv272) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid273, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv273) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid274, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv274) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid275, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv275) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid276, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv276) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid277, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv277) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid278, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv278) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid279, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv279) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid280, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv280) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid281, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv281) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid282, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv282) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid283, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv283) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid284, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv284) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid285, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv285) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid286, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv286) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid287, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv287) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid288, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv288) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid289, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv289) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid290, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv290) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid291, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv291) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid292, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv292) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid293, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv293) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid294, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv294) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid295, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv295) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid296, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv296) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid297, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv297) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid298, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv298) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid299, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv299) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid300, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv300) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid301, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv301) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid302, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv302) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid303, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv303) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid304, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv304) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid305, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv305) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid306, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv306) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid307, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv307) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid308, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv308) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid309, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv309) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid310, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv310) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid311, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv311) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid312, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv312) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid313, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv313) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid314, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv314) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid315, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv315) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid316, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv316) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid317, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv317) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid318, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv318) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid319, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv319) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid320, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv320) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid321, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv321) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid322, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv322) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid323, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv323) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid324, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv324) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid325, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv325) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid326, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv326) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid327, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv327) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid328, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv328) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid329, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv329) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid330, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv330) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid331, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv331) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid332, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv332) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid333, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv333) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid334, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv334) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid335, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv335) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid336, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv336) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid337, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv337) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid338, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv338) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid339, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv339) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid340, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv340) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid341, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv341) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid342, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv342) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid343, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv343) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid344, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv344) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid345, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv345) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid346, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv346) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid347, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv347) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid348, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv348) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid349, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv349) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid350, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv350) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid351, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv351) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid352, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv352) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid353, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv353) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid354, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv354) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid355, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv355) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid356, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv356) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid357, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv357) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid358, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv358) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid359, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv359) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid360, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv360) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid361, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv361) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid362, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv362) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid363, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv363) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid364, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv364) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid365, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv365) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid366, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv366) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid367, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv367) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid368, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv368) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid369, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv369) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid370, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv370) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid371, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv371) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid372, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv372) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid373, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv373) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid374, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv374) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid375, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv375) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid376, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv376) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid377, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv377) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid378, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv378) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid379, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv379) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid380, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv380) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid381, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv381) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid382, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv382) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid383, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv383) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid384, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv384) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid385, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv385) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid386, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv386) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid387, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv387) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid388, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv388) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid389, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv389) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid390, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv390) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid391, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv391) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid392, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv392) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid393, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv393) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid394, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv394) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid395, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv395) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid396, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv396) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid397, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv397) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid398, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv398) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid399, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv399) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid400, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv400) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid401, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv401) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid402, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv402) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid403, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv403) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid404, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv404) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid405, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv405) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid406, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv406) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid407, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv407) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid408, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv408) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid409, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv409) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid410, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv410) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid411, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv411) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid412, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv412) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid413, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv413) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid414, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv414) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid415, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv415) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid416, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv416) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid417, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv417) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid418, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv418) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid419, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv419) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid420, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv420) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid421, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv421) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid422, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv422) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid423, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv423) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid424, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv424) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid425, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv425) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid426, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv426) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid427, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv427) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid428, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv428) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid429, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv429) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid430, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv430) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid431, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv431) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid432, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv432) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid433, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv433) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid434, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv434) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid435, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv435) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid436, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv436) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid437, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv437) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid438, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv438) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid439, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv439) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid440, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv440) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid441, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv441) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid442, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv442) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid443, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv443) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid444, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv444) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid445, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv445) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid446, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv446) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid447, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv447) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid448, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv448) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid449, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv449) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid450, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv450) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid451, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv451) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid452, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv452) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid453, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv453) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid454, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv454) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid455, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv455) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid456, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv456) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid457, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv457) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid458, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv458) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid459, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv459) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid460, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv460) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid461, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv461) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid462, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv462) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid463, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv463) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid464, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv464) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid465, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv465) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid466, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv466) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid467, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv467) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid468, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv468) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid469, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv469) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid470, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv470) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid471, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv471) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid472, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv472) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid473, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv473) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid474, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv474) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid475, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv475) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid476, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv476) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid477, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv477) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid478, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv478) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid479, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv479) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid480, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv480) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid481, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv481) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid482, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv482) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid483, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv483) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid484, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv484) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid485, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv485) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid486, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv486) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid487, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv487) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid488, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv488) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid489, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv489) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid490, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv490) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid491, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv491) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid492, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv492) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid493, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv493) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid494, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv494) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid495, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv495) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid496, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv496) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid497, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv497) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid498, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv498) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
embed_n(cid=xid499, tbl=emb, dim=edim) ~> ev
mat_mmv(src=wmat, sz=wsz, inp=ev) ~> pp
vec_sub(a=pp, b=tv499) ~> gg
dot_product(a=gg, b=gg) ~> ls
get(arr=gg, idx=0) ~> gs
vec_scale(a=ev, s=gs) ~> rg
mat_update_flat(mat=wmat, grad=rg, lrv=lr) ~> wmat
join(arr=wmat, sep=",") ~> wstr
write_file_t(path="tcon_weights.txt", content=wstr) ~> ok
join(arr=emb, sep=",") ~> estr
write_file_t(path="tcon_emb.txt", content=estr) ~> ok2
[T+]
show shall(ls)