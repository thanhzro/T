[T-]
import "lib/basic/std.t"
import "lib/intermediate/string2.t"

func gen_math_func(name, op) {
    past(name) ~> N
    past(op) ~> O
    "func " + N >> l1
    l1 + "(a, b) {" >> header
    "past(a) ~> A" >> l2
    "past(b) ~> B" >> l3
    "A " + O >> l4
    l4 + " B >> out" >> body
    "}" >> footer
    header >> out
}

[T0]
gen_math_func(name="add2", op="+") ~> F1
gen_math_func(name="sub2", op="-") ~> F2
gen_math_func(name="mul2", op="*") ~> F3
gen_math_func(name="div2", op="/") ~> F4

[T+]
write("lib/generated/math_gen.t") shall(F1)
write("lib/generated/math_gen.t") shall(F2)
write("lib/generated/math_gen.t") shall(F3)
write("lib/generated/math_gen.t") shall(F4)
show shall(F1, F2, F3, F4)
