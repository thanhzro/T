[T-]
import "lib/basic/std.t"

[T0]
exec(cmd="grep 'if(!strcmp' src/t_vm.c | grep -o '\"[a-z_]*\"' | tr -d '\"' | sort > _vm_builtins.txt && grep 'strcpy.*name' src/t_natives.h | grep -o '\"[a-z_]*\"' | tr -d '\"' | sort > _native_names.txt && comm -12 _vm_builtins.txt _native_names.txt") ~> already_ported
exec(cmd="wc -l _vm_builtins.txt _native_names.txt") ~> counts

[T+]
show shall(counts, already_ported)
