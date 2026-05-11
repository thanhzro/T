
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "t_bytecode.h"

int main() {
    /* Define func: double(x) { x * 2 >> out } */
    Chunk fn_chunk = {0};
    int ix = chunk_add_str(&fn_chunk, "x");
    int i2 = chunk_add_num(&fn_chunk, 2);
    chunk_write(&fn_chunk, OP_LOAD);  chunk_write(&fn_chunk, ix);
    chunk_write(&fn_chunk, OP_PUSH_NUM); chunk_write(&fn_chunk, i2);
    chunk_write(&fn_chunk, OP_MUL);
    chunk_write(&fn_chunk, OP_RETURN);

    /* Main chunk: double(5) → show */
    Chunk main_chunk = {0};
    int i5  = chunk_add_num(&main_chunk, 5);
    int ifd = chunk_add_str(&main_chunk, "double");
    chunk_write(&main_chunk, OP_PUSH_NUM); chunk_write(&main_chunk, i5);
    chunk_write(&main_chunk, OP_CALL);
    chunk_write(&main_chunk, ifd);
    chunk_write(&main_chunk, 1); /* argc=1 */
    chunk_write(&main_chunk, OP_SHOW);
    chunk_write(&main_chunk, OP_HALT);

    VM *vm = calloc(1, sizeof(VM));
    vm->chunk = &main_chunk;

    /* Register func */
    TFunc *f = &vm->funcs[vm->func_count++];
    strcpy(f->name, "double");
    f->chunk = fn_chunk;
    strcpy(f->params[0], "x");
    f->param_count = 1;

    printf("CALL test (expect 10): ");
    run(vm);
    free(vm);
    return 0;
}
