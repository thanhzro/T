[T-]
import "lib/basic/std.t"
[T0]
file_read(path="vm_instr.txt") ~> instr
file_read(path="vm_stack.txt") ~> vm_stk
file_read(path="vm_ip.txt") ~> ip_str
file_read(path="vm_program.txt") ~> prog
_trim_c(str=instr) ~> instr
_trim_c(str=vm_stk) ~> vm_stk
_trim_c(str=ip_str) ~> ip_str
toNumber(val=ip_str) ~> ip_num
indexOf(str=vm_stk, sub="|") ~> sep
sep + 1 >> rest_start
len(val=vm_stk) ~> stk_len
slice(str=vm_stk, from=0, to=sep) ~> top_val
slice(str=vm_stk, from=rest_start, to=stk_len) ~> rest_stk
toNumber(val=top_val) ~> top_num
fromChar(code=10) ~> nl
split(str=prog, sep=nl) ~> instrs
len(val=instrs) ~> total
indexOf(str=instr, sub=" ") ~> sp2
sp2 + 1 >> lbl_start
slice(str=instr, from=lbl_start, to=99) ~> label
_trim_c(str=label) ~> label
0 >> should_jump
Gate top_num (== 0) >> should_jump
"" + ip_num >> ip_s
write_file_t(path="vm_stack.txt", content=rest_stk) ~> ok1
Gate should_jump (== 1) >> ip_s
"999" >> ip_s
write_file_t(path="vm_ip.txt", content=ip_s) ~> ok2
[T+]
show shall(ip_s)
