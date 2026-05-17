[T-]
import "lib/basic/std.t"
[T0]
file_read(path="vm_instr.txt") ~> instr
file_read(path="vm_stack.txt") ~> vm_stk
file_read(path="vm_frame.txt") ~> vm_frm
_trim_c(str=vm_stk) ~> vm_stk
_trim_c(str=vm_frm) ~> vm_frm
slice(str=instr, from=6, to=99) ~> store_var
_trim_c(str=store_var) ~> store_var
indexOf(str=vm_stk, sub="|") ~> sep
len(val=vm_stk) ~> stk_len
slice(str=vm_stk, from=0, to=sep) ~> top_val
Gate sep (== -1) >> top_val
vm_stk >> top_val
sep + 1 >> rest_start
slice(str=vm_stk, from=rest_start, to=stk_len) ~> rest_stk
Gate sep (== -1) >> rest_stk
"" >> rest_stk
store_var + "=" >> frm2
frm2 + top_val >> new_entry
vm_frm + "|" >> frm3
frm3 + new_entry >> appended
Gate vm_frm (== "") >> appended
new_entry >> appended
write_file_t(path="vm_stack.txt", content=rest_stk) ~> ok1
write_file_t(path="vm_frame.txt", content=appended) ~> ok2
[T+]
show shall(new_entry)
