[T-]
import "lib/basic/std.t"

[T0]
file_read(path="vm_ip.txt") ~> ip_str
toNumber(val=ip_str) ~> ip
file_read(path="vm_program.txt") ~> prog
fromChar(code=10) ~> nl
split(str=prog, sep=nl) ~> instrs
get(arr=instrs, idx=ip) ~> instr
ip + 1 >> next_ip
"" + next_ip >> next_ip_str
write_file_t(path="vm_ip.txt", content=next_ip_str) ~> ok2
write_file_t(path="vm_instr.txt", content=instr) ~> ok1
indexOf(str=instr, sub="HALT") ~> halt_pos
0 >> is_halt
Gate halt_pos (== 0) >> is_halt
"" + is_halt >> halt_str
write_file_t(path="vm_halt.txt", content=halt_str) ~> ok3

[T+]
show shall(instr)
