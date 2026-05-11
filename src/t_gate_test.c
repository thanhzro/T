
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "t_bytecode.h"

int main() {
    /* Manual: x=10; if x>5: passed=1; show passed */
    Chunk c={0}; VM *vm=calloc(1,sizeof(VM)); vm->chunk=&c;
    
    int i10=chunk_add_num(&c,10);
    int i5=chunk_add_num(&c,5);
    int i1=chunk_add_num(&c,1);
    int ix=chunk_add_str(&c,"x");
    int ip=chunk_add_str(&c,"passed");
    
    /* x = 10 */
    chunk_write(&c,OP_PUSH_NUM); chunk_write(&c,i10);
    chunk_write(&c,OP_STORE); chunk_write(&c,ix);
    /* LOAD x, PUSH 5, GT → 1 */
    chunk_write(&c,OP_LOAD); chunk_write(&c,ix);
    chunk_write(&c,OP_PUSH_NUM); chunk_write(&c,i5);
    chunk_write(&c,OP_GT);
    /* JUMP_IF_0 skip 2 bytes */
    chunk_write(&c,OP_JUMP_IF_0); chunk_write(&c,2);
    /* passed = 1 */
    chunk_write(&c,OP_PUSH_NUM); chunk_write(&c,i1);
    chunk_write(&c,OP_STORE); chunk_write(&c,ip);
    /* show passed */
    chunk_write(&c,OP_LOAD); chunk_write(&c,ip);
    chunk_write(&c,OP_SHOW);
    chunk_write(&c,OP_HALT);
    
    printf("Gate manual (expect 1): ");
    run(vm); free(vm);
    return 0;
}
