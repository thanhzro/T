[T-]
import "lib/basic/std.t"
[T0]
shell_exec(cmd="python3 -c 'import re; c=open(\"src/t_bytecode.h\").read(); old=\"case OP_PUSH_NUM:{int i=vm->chunk->code[vm->ip++];push(vm,make_num(vm->chunk->num_consts[i]));break;}\"; new=\"case OP_PUSH_NUM:{int i=(vm->chunk->code[vm->ip]<<8)|vm->chunk->code[vm->ip+1];vm->ip+=2;push(vm,make_num(vm->chunk->num_consts[i]));break;}\"; print(\"VM_FIXED\" if old in c else \"VM_ALREADY_FIXED\"); open(\"src/t_bytecode.h\",\"w\").write(c.replace(old,new)) if old in c else None'") ~> result
[T+]
show shall(result)
