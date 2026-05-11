
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "t_bytecode.h"

int main() {
    Chunk c = {0};
    int n3 = chunk_add_num(&c, 3);
    int n4 = chunk_add_num(&c, 4);
    chunk_write(&c, OP_PUSH_NUM); chunk_write(&c, n3);
    chunk_write(&c, OP_PUSH_NUM); chunk_write(&c, n4);
    chunk_write(&c, OP_ADD);
    int sx = chunk_add_str(&c, "x");
    chunk_write(&c, OP_STORE); chunk_write(&c, sx);
    int sx2 = chunk_add_str(&c, "x");
    chunk_write(&c, OP_LOAD); chunk_write(&c, sx2);
    chunk_write(&c, OP_SHOW);
    chunk_write(&c, OP_HALT);

    VM *vm = calloc(1, sizeof(VM));
    vm->chunk = &c;
    printf("VM size: %zu bytes\n", sizeof(VM));
    run(vm);
    free(vm);
    return 0;
}
