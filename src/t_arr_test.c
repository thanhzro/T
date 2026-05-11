
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "t_natives.h"

int main(){
    Chunk c={0}; VM *vm=calloc(1,sizeof(VM)); vm->chunk=&c;
    register_all_natives(vm);

    int i1=chunk_add_num(&c,10);
    int i2=chunk_add_num(&c,20);
    int i3=chunk_add_num(&c,30);
    int iarr=chunk_add_str(&c,"arr");
    int iget=chunk_add_str(&c,"get");
    int iidx=chunk_add_num(&c,1);
    int iO1=chunk_add_str(&c,"O1");

    /* arr = [10,20,30] */
    chunk_write(&c,OP_PUSH_NUM); chunk_write(&c,i1);
    chunk_write(&c,OP_PUSH_NUM); chunk_write(&c,i2);
    chunk_write(&c,OP_PUSH_NUM); chunk_write(&c,i3);
    chunk_write(&c,OP_PUSH_ARR); chunk_write(&c,3);
    chunk_write(&c,OP_STORE); chunk_write(&c,iarr);
    /* show arr */
    chunk_write(&c,OP_LOAD); chunk_write(&c,iarr);
    chunk_write(&c,OP_SHOW);
    /* get(arr, 1) -> 20 */
    chunk_write(&c,OP_LOAD); chunk_write(&c,iarr);
    chunk_write(&c,OP_PUSH_NUM); chunk_write(&c,iidx);
    chunk_write(&c,OP_CALL); chunk_write(&c,iget); chunk_write(&c,2);
    chunk_write(&c,OP_STORE); chunk_write(&c,iO1);
    chunk_write(&c,OP_LOAD); chunk_write(&c,iO1);
    chunk_write(&c,OP_SHOW);
    chunk_write(&c,OP_HALT);

    printf("Array test:\n");
    run(vm); free(vm);
    return 0;
}
