[T-]

[T0]
"func add2(a, b) {" >> h1
"  a + b >> out" >> l1
"}" >> cl
"func mul2(a, b) {" >> h2
"  a * b >> out" >> l2

[T+]
write("lib/generated/math_gen.t") shall(h1)
write("lib/generated/math_gen.t") shall(l1)
write("lib/generated/math_gen.t") shall(cl)
write("lib/generated/math_gen.t") shall(h2)
write("lib/generated/math_gen.t") shall(l2)
write("lib/generated/math_gen.t") shall(cl)
show shall(h1, h2)
