[T-]
import "lib/basic/std.t"
[T0]
file_read(path="vm_ip.txt") ~> ip_str
_trim_c(str=ip_str) ~> ip_str
toNumber(val=ip_str) ~> ip_num
file_read(path="vm_program.txt") ~> prog
fromChar(code=10) ~> nl
split(str=prog, sep=nl) ~> instrs
len(val=instrs) ~> total
get(arr=instrs, idx=ip_num) ~> instr
_trim_c(str=instr) ~> instr
ip_num + 1 >> next_ip
"" + next_ip >> next_ip_s
write_file_t(path="vm_ip.txt", content=next_ip_s) ~> ok1
write_file_t(path="vm_instr.txt", content=instr) ~> ok2
indexOf(str=instr, sub="LOAD ") ~> is_load
indexOf(str=instr, sub="STORE ") ~> is_store
indexOf(str=instr, sub="HALT") ~> is_halt
[T+]
show shall(instr)
