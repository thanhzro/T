[T-]
import "lib/basic/std.t"
[T0]
file_read(path="vm_instr.txt") ~> instr
file_read(path="vm_stack.txt") ~> vm_stk
_trim_c(str=vm_stk) ~> vm_stk
slice(str=instr, from=5, to=99) ~> load_var
_trim_c(str=load_var) ~> load_var
indexOf(str=vm_stk, sub="EMPTY") ~> is_sentinel
0 >> is_empty
Gate is_sentinel (== 0) >> is_empty
load_var >> s3
load_var + "|" >> s2
s2 + vm_stk >> s2_full
Gate is_empty (== 0) >> s3
s2_full >> s3
write_file_t(path="vm_stack.txt", content=s3) ~> ok
[T+]
show shall(s3)
