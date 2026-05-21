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
ip_num + 1 >> next_ip
"" + next_ip >> next_ip_s
get(arr=instrs, idx=ip_num) ~> instr
_trim_c(str=instr) ~> instr
"HALT" >> safe_instr
Gate ip_num (< total) >> safe_instr
instr >> safe_instr
write_file_t(path="vm_ip.txt", content=next_ip_s) ~> ok1
write_file_t(path="vm_instr.txt", content=safe_instr) ~> ok2
indexOf(str=safe_instr, sub="HALT") ~> halt_pos
0 >> is_halt
Gate halt_pos (== 0) >> is_halt
"" + is_halt >> halt_s
write_file_t(path="vm_halt.txt", content=halt_s) ~> ok3
[T+]
show shall(safe_instr)
