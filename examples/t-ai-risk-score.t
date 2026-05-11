[T-]
import "lib/basic/std.t"
import "lib/intermediate/string2.t"

func score_line(line) {
    past(line) ~> L
    contains(str=L, sub="BVal") ~> b
    contains(str=L, sub="pop(vm)") ~> p
    contains(str=L, sub="= pop") ~> ap
    contains(str=L, sub="iter_arr") ~> it
    contains(str=L, sub="make_num") ~> mn
    contains(str=L, sub="make_str") ~> ms
    contains(str=L, sub="immediately") ~> imm
    b * p >> s1
    b * ap >> s2
    it * b >> s3
    mn + ms >> mk
    mk * (1 - imm) >> s4
    s1 * 3 >> w1
    s2 * 3 >> w2
    s3 * 2 >> w3
    s4 * 1 >> w4
    w1 + w2 >> t1
    t1 + w3 >> t2
    t2 + w4 >> total
    clamp(val=total, lo=0, hi=9) ~> score
    toString(val=score) ~> sc
    "SCORE=" + sc >> out
}

[T0]
score_line(line="BVal v = pop(vm);") ~> O1
score_line(line="BVal *v = &stack[top];") ~> O2
score_line(line="BVal x = make_num(5);") ~> O3
score_line(line="push(vm, make_num(5));") ~> O4

[T+]
show shall(O1, O2, O3, O4)
