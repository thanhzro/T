[T-]
import "lib/basic/std.t"
import "lib/intermediate/string2.t"

func score_file(hits) {
    past(hits) ~> H
    contains(str=H, sub="BVal") ~> b
    contains(str=H, sub="pop(vm)") ~> p
    contains(str=H, sub="iter_arr") ~> it
    contains(str=H, sub="frame_set") ~> fs
    contains(str=H, sub="push(vm") ~> pv
    b * p >> r1
    b * it >> r2
    r1 * 3 >> w1
    r2 * 2 >> w2
    fs * 1 >> w3
    pv * 1 >> w4
    w1 + w2 >> t1
    t1 + w3 >> t2
    t2 + w4 >> total
    clamp(val=total, lo=0, hi=9) ~> score
    toString(val=score) ~> sc
    "Score=" + sc >> out
}

[T0]
exec(cmd="grep -c 'BVal.*pop\|pop.*BVal' src/t_bytecode.h") ~> c1
exec(cmd="grep -c 'BVal.*pop\|pop.*BVal' src/t_vm.c 2>/dev/null") ~> c2
exec(cmd="grep -rn 'BVal v = pop\|= pop(vm)' src/ 2>/dev/null") ~> danger_lines
score_file(hits=danger_lines) ~> O1
len(val=danger_lines) ~> dl
toString(val=dl) ~> dls

[T+]
show shall(O1, danger_lines)
