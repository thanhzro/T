[T-]
import "lib/basic/std.t"
[T0]
file_read(path="vm_instr.txt") ~> instr
file_read(path="vm_stack.txt") ~> vm_stk
_trim_c(str=vm_stk) ~> vm_stk
indexOf(str=vm_stk, sub="|") ~> sep
sep + 1 >> rest_start
len(val=vm_stk) ~> stk_len
slice(str=vm_stk, from=0, to=sep) ~> top_val
slice(str=vm_stk, from=rest_start, to=stk_len) ~> rest_stk
toNumber(val=top_val) ~> top_num
0 >> should_jump
Gate top_num (== 0) >> should_jump
write_file_t(path="vm_stack.txt", content=rest_stk) ~> ok1
Gate should_jump (== 1) >> should_jump
write_file_t(path="vm_instr.txt", content="HALT") ~> ok2
write_file_t(path="vm_halt.txt", content="1") ~> ok3
[T+]
show shall(should_jump)
