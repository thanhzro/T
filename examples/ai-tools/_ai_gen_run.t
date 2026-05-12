[T-]
"square" >> fname
5 >> input

[T0]
"func " + fname >> h1
h1 + "(n) { n * n >> out }" >> funcdef

[T+]
show shall(funcdef)
write("_gen.t") shall(funcdef)
