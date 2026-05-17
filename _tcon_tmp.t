[T-]
import "lib/basic/std.t"
instr = "LOAD x"
stk = ""
[T0]
indexOf(str=instr, sub="LOAD ") ~> load_pos
0 >> is_load
Gate load_pos (== 0) >> is_load
slice(str=instr, from=5, to=99) ~> load_var
_trim_c(str=load_var) ~> load_var
load_var >> new_stack
Gate is_load (== 1) >> stk
new_stack >> stk
[T+]
show shall(is_load)
show shall(load_var)
show shall(new_stack)
show shall(stk)
