
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "t_bytecode.h"

typedef struct { int count; int idx; } TIter;
TIter iter_stack[16];
int iter_top = 0;

void run_iter(VM *vm) {
    for(;;) {
        uint8_t op = vm->chunk->code[vm->ip++];
        switch(op) {
            case OP_PUSH_NUM:{int i=vm->chunk->code[vm->ip++];push(vm,make_num(vm->chunk->num_consts[i]));break;}
            case OP_LOAD:{int i=vm->chunk->code[vm->ip++];BVal fg;frame_get(&vm->frame,vm->chunk->str_consts[i],&fg);push(vm,fg);break;}
            case OP_MUL:{BVal b=pop(vm);BVal a=pop(vm);push(vm,make_num(a.num*b.num));break;}
            case OP_SHOW:{BVal v=pop(vm);printf("%g\n",v.num);break;}
            case OP_HALT:return;
            case OP_ITER_START:{
                BVal arr=pop(vm);
                TIter*it=&iter_stack[iter_top++];
                it->count=(int)arr.num; it->idx=0;
                int inow=vm->chunk->code[vm->ip++];
                frame_set(&vm->frame,vm->chunk->str_consts[inow],make_num(0));
                break;
            }
            case OP_ITER_NEXT:{
                TIter*it=&iter_stack[iter_top-1];
                it->idx++;
                int inow=vm->chunk->code[vm->ip++];
                int body_start=vm->chunk->code[vm->ip++];
                if(it->idx>=it->count){iter_top--;}
                else{
                    frame_set(&vm->frame,vm->chunk->str_consts[inow],make_num(it->idx));
                    vm->ip=body_start;
                }
                break;
            }
            default:return;
        }
    }
}

int main() {
    Chunk c={0};
    int i5=chunk_add_num(&c,5);
    int i2=chunk_add_num(&c,2);
    int inow=chunk_add_str(&c,"now");
    chunk_write(&c,OP_PUSH_NUM); chunk_write(&c,i5);
    chunk_write(&c,OP_ITER_START); chunk_write(&c,inow);
    int body=c.count;
    chunk_write(&c,OP_LOAD); chunk_write(&c,inow);
    chunk_write(&c,OP_PUSH_NUM); chunk_write(&c,i2);
    chunk_write(&c,OP_MUL);
    chunk_write(&c,OP_SHOW);
    chunk_write(&c,OP_ITER_NEXT); chunk_write(&c,inow); chunk_write(&c,body);
    chunk_write(&c,OP_HALT);
    VM*vm=calloc(1,sizeof(VM));
    vm->chunk=&c;
    printf("F([0..4]) now*2 (expect 0,2,4,6,8):\n");
    run_iter(vm);
    free(vm);
    return 0;
}
