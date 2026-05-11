
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "t_compile_lib.h"

int main(){
    /* Build [1,2,3,4,5] array then F(arr){now*2} */
    Chunk c={0}; VM *vm=calloc(1,sizeof(VM)); vm->chunk=&c;
    register_all_natives(vm);

    /* arr = [1,2,3,4,5] via PUSH_ARR */
    for(int i=1;i<=5;i++){
        int idx=chunk_add_num(&c,i);
        chunk_write(&c,OP_PUSH_NUM); chunk_write(&c,idx);
    }
    chunk_write(&c,OP_PUSH_ARR); chunk_write(&c,5);
    int iarr=chunk_add_str(&c,"arr");
    chunk_write(&c,OP_STORE); chunk_write(&c,iarr);

    /* F(arr) { now * 2 >> now; show now } */
    const char *lines[]={
        "F(arr) {",
        "now * 2 >> result",
        "show result",
        "}"
    };
    compile_program(&c, lines, 4);
    /* remove extra HALT from compile_program - already added */

    printf("F([1..5]) now*2 (expect 2,4,6,8,10):\n");
    run(vm); free(vm);
    return 0;
}
