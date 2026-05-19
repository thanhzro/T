[T-]
import "lib/basic/std.t"
script = "with open('src/t_bytecode.h') as f:\n    c=f.read()\nold='case OP_PUSH_NUM:{int i=vm->chunk->code[vm->ip++];push(vm,make_num(vm->chunk->num_consts[i]));break;}'\nnew_s='case OP_PUSH_NUM:{int i=(vm->chunk->code[vm->ip]<<8)|vm->chunk->code[vm->ip+1];vm->ip+=2;push(vm,make_num(vm->chunk->num_consts[i]));break;}'\nif old in c:\n    open('src/t_bytecode.h','w').write(c.replace(old,new_s))\n    print('VM_FIXED')\nelse:\n    print('VM_ALREADY_FIXED')\n"
[T0]
write_file_t(path="wfvm.py", content=script) ~> ok
shell_exec(cmd="python3 wfvm.py") ~> result
trim(str=result) ~> result
[T+]
shall(result)
