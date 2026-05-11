
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "t_natives.h"

int main(){
    VM *vm=calloc(1,sizeof(VM));
    register_all_natives(vm);
    printf("Registered %d native functions\n", vm->func_count);

    Chunk c={0}; vm->chunk=&c;
    int im=chunk_add_num(&c,-16);
    int iabs=chunk_add_str(&c,"abs");
    int isqrt=chunk_add_str(&c,"sqrt");
    int iO1=chunk_add_str(&c,"O1");
    int iO2=chunk_add_str(&c,"O2");

    chunk_write(&c,OP_PUSH_NUM); chunk_write(&c,im);
    chunk_write(&c,OP_CALL); chunk_write(&c,iabs); chunk_write(&c,1);
    chunk_write(&c,OP_STORE); chunk_write(&c,iO1);
    chunk_write(&c,OP_LOAD); chunk_write(&c,iO1);
    chunk_write(&c,OP_CALL); chunk_write(&c,isqrt); chunk_write(&c,1);
    chunk_write(&c,OP_STORE); chunk_write(&c,iO2);
    chunk_write(&c,OP_LOAD); chunk_write(&c,iO2);
    chunk_write(&c,OP_SHOW);
    chunk_write(&c,OP_HALT);

    printf("sqrt(abs(-16)) expect 4: ");
    run(vm); free(vm);
    return 0;
}
