
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "t_bytecode.h"

int main() {
    Chunk c={0}; 
    VM *vm=calloc(1,sizeof(VM)); 
    vm->chunk=&c;
    int i9=chunk_add_num(&c,-9);
    chunk_write(&c,OP_PUSH_NUM); chunk_write(&c,i9);
    chunk_write(&c,OP_SHOW);
    chunk_write(&c,OP_HALT);
    printf("expect -9: ");
    run(vm); free(vm);
    return 0;
}
