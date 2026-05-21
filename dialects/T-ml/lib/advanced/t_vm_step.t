[T-]
import "lib/basic/std.t"

[T0]
file_read(path="vm_ip.txt") ~> ip_str
toNumber(val=ip_str) ~> ip_num
file_read(path="vm_program.txt") ~> prog
fromChar(code=10) ~> nl
split(str=prog, sep=nl) ~> instrs
get(arr=instrs, idx=ip_num) ~> instr
file_read(path="vm_stack.txt") ~> vm_stk
file_read(path="vm_frame.txt") ~> vm_frm
ip_num + 1 >> next_ip
"" + next_ip >> next_ip_s
write_file_t(path="vm_ip.txt", content=next_ip_s) ~> ok1
write_file_t(path="vm_instr.txt", content=instr) ~> ok2
indexOf(str=instr, sub="HALT") ~> halt_pos
0 >> is_halt
Gate halt_pos (== 0) >> is_halt
"" + is_halt >> halt_s
write_file_t(path="vm_halt.txt", content=halt_s) ~> ok3
indexOf(str=instr, sub="LOAD ") ~> load_pos
0 >> is_load
Gate load_pos (== 0) >> is_load
indexOf(str=instr, sub="STORE ") ~> store_pos
0 >> is_store
Gate store_pos (== 0) >> is_store
slice(str=instr, from=5, to=99) ~> load_var
_trim_c(str=load_var) ~> load_var
0 >> stk_empty
Gate vm_stk (== "") >> stk_empty
load_var >> pushed
vm_stk + "," >> stk_with_sep
stk_with_sep + load_var >> pushed_with_sep
Gate stk_empty (== 1) >> vm_stk
pushed >> vm_stk
Gate is_load (== 1) >> vm_stk
pushed_with_sep >> vm_stk
slice(str=instr, from=6, to=99) ~> store_var
_trim_c(str=store_var) ~> store_var
indexOf(str=vm_stk, sub=",") ~> sep_pos
0 >> has_sep
Gate sep_pos (> -1) >> has_sep
len(val=vm_stk) ~> stk_len
sep_pos + 1 >> val_start
slice(str=vm_stk, from=val_start, to=stk_len) ~> top_val
Gate has_sep (== 0) >> top_val
vm_stk >> top_val
slice(str=vm_stk, from=0, to=sep_pos) ~> rest_stk
Gate has_sep (== 0) >> rest_stk
"" >> rest_stk
vm_frm + store_var >> frm2
frm2 + "=" >> frm3
frm3 + top_val >> new_frm
Gate is_store (== 1) >> vm_stk
rest_stk >> vm_stk
Gate is_store (== 1) >> vm_frm
new_frm >> vm_frm
write_file_t(path="vm_stack.txt", content=vm_stk) ~> ok4
write_file_t(path="vm_frame.txt", content=vm_frm) ~> ok5

[T+]
show shall(instr)
