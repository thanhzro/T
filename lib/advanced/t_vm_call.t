[T-]
import "lib/basic/std.t"
[T0]
file_read(path="vm_instr.txt") ~> instr
file_read(path="vm_frame.txt") ~> vm_frm
_trim_c(str=instr) ~> instr
_trim_c(str=vm_frm) ~> vm_frm
slice(str=instr, from=5, to=99) ~> call_part
_trim_c(str=call_part) ~> call_part
indexOf(str=call_part, sub=" ") ~> sp
slice(str=call_part, from=0, to=sp) ~> fname
sp + 1 >> argc_start
len(val=call_part) ~> cp_len
slice(str=call_part, from=argc_start, to=cp_len) ~> argc_str
"CALL:" + fname >> c1
c1 + "(" >> c2
c2 + argc_str >> c3
c3 + ")" >> call_result
vm_frm + "|" >> frm2
frm2 + call_result >> new_frm
write_file_t(path="vm_frame.txt", content=new_frm) ~> ok1
[T+]
show shall(call_result)
