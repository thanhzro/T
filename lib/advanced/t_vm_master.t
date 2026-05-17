[T-]
import "lib/basic/std.t"
flist = ["lib/advanced/t_vm_dispatch.t"]
[T0]
file_read(path="vm_halt.txt") ~> halt_s
_trim_c(str=halt_s) ~> halt_s
file_read(path="vm_instr.txt") ~> instr
_trim_c(str=instr) ~> instr
indexOf(str=instr, sub="LOAD ") ~> is_load
indexOf(str=instr, sub="STORE ") ~> is_store
0 >> run_load
Gate is_load (== 0) >> run_load
0 >> run_store
Gate is_store (== 0) >> run_store
par_spawn(files=flist) ~> d1
[T+]
show shall(instr)
