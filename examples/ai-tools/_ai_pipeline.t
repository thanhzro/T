[T-]
"cube" >> fname
3 >> input

[T0]
"func " + fname >> h1
h1 + "(n) {" >> header
"  n * n >> t1" >> line1
"  t1 * n >> out" >> line2
"}" >> footer

[T+]
write("_gen_lib.t") shall(header)
write("_gen_lib.t") shall(line1)
write("_gen_lib.t") shall(line2)
write("_gen_lib.t") shall(footer)
show shall(header, line1, line2, footer)
