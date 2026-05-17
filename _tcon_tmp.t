[T-]
import "lib/basic/std.t"
[T0]
file_read(path="vm_instr.txt") ~> instr
_trim_c(str=instr) ~> instr
len(val=instr) ~> instr_len
slice(str=instr, from=6, to=99) ~> store_var
_trim_c(str=store_var) ~> store_var
[T+]
show shall(instr)
show shall(instr_len)
show shall(store_var)
