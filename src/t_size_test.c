
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include "t_bytecode.h"

BVal native_abs(BVal *args, int argc) {
    return make_num(fabs(args[0].num));
}

int main() {
    printf("sizeof(TFunc)=%zu\n", sizeof(TFunc));
    printf("sizeof(Chunk)=%zu\n", sizeof(Chunk));
    printf("offsetof native=%zu\n", __builtin_offsetof(TFunc, native));
    printf("offsetof chunk=%zu\n", __builtin_offsetof(TFunc, chunk));
    printf("sizeof(VM)=%zu\n", sizeof(VM));
    
    VM *vm = calloc(1, sizeof(VM));
    TFunc *f = &vm->funcs[0];
    strcpy(f->name, "abs");
    f->is_native = 1;
    f->native = native_abs;
    f->param_count = 1;
    strcpy(f->params[0], "val");
    
    printf("f->is_native=%d\n", f->is_native);
    printf("f->native=%p\n", (void*)f->native);
    printf("native_abs=%p\n", (void*)native_abs);
    
    BVal args[1];
    args[0] = make_num(-9);
    BVal result = f->native(args, 1);
    printf("abs(-9)=%g\n", result.num);
    
    free(vm);
    return 0;
}
