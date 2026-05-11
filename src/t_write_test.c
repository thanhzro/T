
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "t_natives.h"

int main(){
    VM *vm=calloc(1,sizeof(VM));
    register_all_natives(vm);
    
    /* Find write_file_t */
    TFunc *fn=NULL;
    for(int i=0;i<vm->func_count;i++)
        if(strcmp(vm->funcs[i].name,"write_file_t")==0){fn=&vm->funcs[i];break;}
    
    if(!fn){puts("write_file_t NOT FOUND");return 1;}
    printf("found: is_native=%d\n",fn->is_native);
    
    /* Test direct call */
    BVal args[2];
    args[0].type=VT_STR; args[0].str=strdup("test content"); args[0].num=0; args[0].arr=NULL; args[0].arr_len=0;
    args[1].type=VT_STR; args[1].str=strdup("test_out.txt"); args[1].num=0; args[1].arr=NULL; args[1].arr_len=0;
    double r=fn->native_m(args,2);
    printf("result=%g\n",r);
    free(vm);
    return 0;
}
