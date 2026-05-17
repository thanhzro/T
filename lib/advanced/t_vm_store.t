[T-]
import "lib/basic/std.t"
[T0]
file_read(path="vm_instr.txt") ~> instr
file_read(path="vm_stack.txt") ~> vm_stk
file_read(path="vm_frame.txt") ~> vm_frm
_trim_c(str=instr) ~> instr
_trim_c(str=vm_stk) ~> vm_stk
_trim_c(str=vm_frm) ~> vm_frm
slice(str=instr, from=6, to=99) ~> store_var
_trim_c(str=store_var) ~> store_var
indexOf(str=vm_stk, sub="|") ~> sep
len(val=vm_stk) ~> stk_len
sep + 1 >> rest_start
slice(str=vm_stk, from=0, to=sep) ~> top_val
slice(str=vm_stk, from=rest_start, to=stk_len) ~> rest_stk
store_var + "=" >> frm2
frm2 + top_val >> new_entry
len(val=vm_frm) ~> frm_len
0 >> frm_empty
Gate frm_len (== 0) >> frm_empty
new_entry >> appended
vm_frm + "|" >> frm3
frm3 + new_entry >> appended2
Gate frm_empty (== 0) >> appended
appended2 >> appended
write_file_t(path="vm_stack.txt", content=rest_stk) ~> ok1
write_file_t(path="vm_frame.txt", content=appended) ~> ok2
[T+]
show shall(new_entry)
