
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include "t_bytecode.h"

double native_abs(double *args, int argc) {
    return fabs(args[0]);
}

int main() {
    Chunk c={0};
    VM *vm=calloc(1,sizeof(VM)); vm->chunk=&c;
    
    /* Register abs */
    TFunc *f=&vm->funcs[vm->func_count++];
    strcpy(f->name,"abs"); f->is_native=1; f->native=native_abs;
    strcpy(f->params[0],"val"); f->param_count=1;
    
    /* Manual: abs(val=-9) ~> O1; show O1 */
    int im9 = chunk_add_num(&c, -9);
    int iabs = chunk_add_str(&c, "abs");
    int iO1  = chunk_add_str(&c, "O1");
    
    chunk_write(&c, OP_PUSH_NUM); chunk_write(&c, im9);
    chunk_write(&c, OP_CALL); chunk_write(&c, iabs); chunk_write(&c, 1);
    chunk_write(&c, OP_STORE); chunk_write(&c, iO1);
    chunk_write(&c, OP_LOAD); chunk_write(&c, iO1);
    chunk_write(&c, OP_SHOW);
    chunk_write(&c, OP_HALT);
    
    printf("abs(-9) expect 9: ");
    run(vm);
    free(vm);
    return 0;
}
