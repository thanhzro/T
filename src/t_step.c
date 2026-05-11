
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include "t_bytecode.h"

double native_abs(double *args, int argc) {
    return fabs(args[0]);
}

int main() {
    VM *vm=calloc(1,sizeof(VM));
    
    /* Register */
    vm->funcs[0].is_native=1;
    vm->funcs[0].native=native_abs;
    vm->funcs[0].param_count=1;
    strcpy(vm->funcs[0].name,"abs");
    strcpy(vm->funcs[0].params[0],"val");
    vm->func_count=1;

    /* Find inline - no function call */
    TFunc *found=NULL;
    for(int i=0;i<vm->func_count;i++){
        printf("check i=%d name=[%s] match=%d\n",
            i, vm->funcs[i].name,
            strcmp(vm->funcs[i].name,"abs")==0);
        if(strcmp(vm->funcs[i].name,"abs")==0){
            found=&vm->funcs[i];
            printf("found addr=%p is_native=%d\n",
                (void*)found, found->is_native);
        }
    }

    if(found && found->is_native){
        double dargs[1]; dargs[0]=-9;
        double r=found->native(dargs,1);
        printf("result=%g\n",r);
    }

    free(vm);
    return 0;
}
