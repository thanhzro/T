[T-]
import "lib/basic/std.t"
[T0]
file_read(path="vm_instr.txt") ~> instr
file_read(path="vm_stack.txt") ~> vm_stk
_trim_c(str=vm_stk) ~> vm_stk
slice(str=instr, from=5, to=99) ~> load_var
_trim_c(str=load_var) ~> load_var
vm_stk + "|" >> s2
s2 + load_var >> s3
Gate vm_stk (== "") >> s3
load_var >> s3
write_file_t(path="vm_stack.txt", content=s3) ~> ok
[T+]
show shall(s3)
