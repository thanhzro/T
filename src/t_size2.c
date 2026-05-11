
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "t_bytecode.h"

int main() {
    VM *vm=calloc(1,sizeof(VM));
    printf("sizeof VM=%zu\n", sizeof(VM));
    printf("sizeof TFunc=%zu\n", sizeof(TFunc));
    printf("&vm->funcs[0]=%p\n", (void*)&vm->funcs[0]);
    printf("&vm->funcs[1]=%p\n", (void*)&vm->funcs[1]);
    printf("diff=%zu (expect %zu)\n", 
        (char*)&vm->funcs[1]-(char*)&vm->funcs[0],
        sizeof(TFunc));
    
    /* Set func[0] */
    TFunc *f=&vm->funcs[0];
    strcpy(f->name,"abs");
    f->is_native=1;
    vm->func_count=1;
    
    /* Find via loop */
    for(int i=0;i<vm->func_count;i++){
        printf("loop i=%d name=%s addr=%p\n", 
            i, vm->funcs[i].name, (void*)&vm->funcs[i]);
        if(strcmp(vm->funcs[i].name,"abs")==0){
            printf("found at %p\n", (void*)&vm->funcs[i]);
        }
    }
    free(vm);
    return 0;
}
