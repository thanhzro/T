[T-]
import "lib/basic/std.t"

[T0]
exec(cmd="wc -l src/*.c src/*.h") ~> sizes
exec(cmd="grep -c 'nat_.*(' src/t_natives.h") ~> native_count
exec(cmd="grep -c '^func ' lib/basic/*.t lib/intermediate/*.t lib/advanced/*.t 2>/dev/null | tail -1") ~> t_func_count
exec(cmd="grep -c 'if(!strcmp' src/t_vm.c") ~> vm_builtins

[T+]
show shall(sizes, native_count, t_func_count, vm_builtins)
