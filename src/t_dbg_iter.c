
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "t_compile_lib.h"

int main(){
    Chunk c={0}; VM *vm=calloc(1,sizeof(VM)); vm->chunk=&c;
    register_all_natives(vm);

    /* arr = [1,2,3] */
    for(int i=1;i<=3;i++){
        int idx=chunk_add_num(&c,i);
        chunk_write(&c,OP_PUSH_NUM); chunk_write(&c,idx);
    }
    chunk_write(&c,OP_PUSH_ARR); chunk_write(&c,3);
    int iarr=chunk_add_str(&c,"arr");
    chunk_write(&c,OP_STORE); chunk_write(&c,iarr);

    /* Manual ITER: load arr, ITER_START, body, ITER_NEXT */
    chunk_write(&c,OP_LOAD); chunk_write(&c,iarr);
    int inow=chunk_add_str(&c,"now");
    chunk_write(&c,OP_ITER_START); chunk_write(&c,inow);
    int body_start=c.count;
    /* body: show now */
    chunk_write(&c,OP_LOAD); chunk_write(&c,inow);
    chunk_write(&c,OP_SHOW);
    chunk_write(&c,OP_ITER_NEXT);
    chunk_write(&c,inow);
    chunk_write(&c,body_start);
    chunk_write(&c,OP_HALT);

    printf("F([1,2,3]) show now (expect 1,2,3):\n");
    run(vm); free(vm);
    return 0;
}
