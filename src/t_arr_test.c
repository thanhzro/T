
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "t_bytecode.h"

int main(){
    Chunk c={0}; VM *vm=calloc(1,sizeof(VM)); vm->chunk=&c;
    
    /* Build array [1, 2, 3] */
    int i1=chunk_add_num(&c,1);
    int i2=chunk_add_num(&c,2);
    int i3=chunk_add_num(&c,3);
    int iarr=chunk_add_str(&c,"arr");
    
    chunk_write(&c,OP_PUSH_NUM); chunk_write(&c,i1);
    chunk_write(&c,OP_PUSH_NUM); chunk_write(&c,i2);
    chunk_write(&c,OP_PUSH_NUM); chunk_write(&c,i3);
    chunk_write(&c,OP_PUSH_ARR); chunk_write(&c,3);
    chunk_write(&c,OP_STORE); chunk_write(&c,iarr);
    
    /* Show array length */
    chunk_write(&c,OP_LOAD); chunk_write(&c,iarr);
    chunk_write(&c,OP_SHOW);
    chunk_write(&c,OP_HALT);
    
    printf("Array [1,2,3] len (expect 3): ");
    run(vm); free(vm);
    return 0;
}
