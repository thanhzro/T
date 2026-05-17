[T-]
import "lib/basic/std.t"
[T0]
file_read(path="vm_instr.txt") ~> instr
file_read(path="vm_stack.txt") ~> vm_stk
file_read(path="vm_frame.txt") ~> vm_frm
_trim_c(str=instr) ~> instr
_trim_c(str=vm_stk) ~> vm_stk
_trim_c(str=vm_frm) ~> vm_frm
slice(str=instr, from=5, to=99) ~> call_part
_trim_c(str=call_part) ~> call_part
indexOf(str=call_part, sub=" ") ~> sp
slice(str=call_part, from=0, to=sp) ~> fname
sp + 1 >> argc_start
len(val=call_part) ~> cp_len
slice(str=call_part, from=argc_start, to=cp_len) ~> argc_str
toNumber(val=argc_str) ~> argc_num
"CALL:" + fname >> call_entry
call_entry + "(" >> call_entry2
call_entry2 + argc_str >> call_entry3
call_entry3 + ")" >> call_result
vm_frm + "|" >> frm2
frm2 + call_result >> new_frm
"RESULT_" + fname >> result_key
result_key + "=called" >> result_entry
vm_stk + "|" >> stk2
stk2 + result_entry >> new_stk
write_file_t(path="vm_frame.txt", content=new_frm) ~> ok1
write_file_t(path="vm_stack.txt", content=new_stk) ~> ok2
[T+]
show shall(call_result)
