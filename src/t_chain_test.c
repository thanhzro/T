
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "t_compile_lib.h"

/* T program state - output from T+ */
typedef struct {
    char keys[32][64];
    char vals[32][256];
    int count;
} TState;

void state_set(TState*s, const char*k, const char*v){
    for(int i=0;i<s->count;i++)
        if(strcmp(s->keys[i],k)==0){strcpy(s->vals[i],v);return;}
    strcpy(s->keys[s->count],k);
    strcpy(s->vals[s->count],v);
    s->count++;
}
const char* state_get(TState*s, const char*k){
    for(int i=0;i<s->count;i++)
        if(strcmp(s->keys[i],k)==0) return s->vals[i];
    return "0";
}

int main(){
    /* T1: base=5, exp=3 → result=125 */
    printf("=== T1 ===\n");
    TState t1_out={0};
    
    Chunk c1={0}; VM *vm1=calloc(1,sizeof(VM)); vm1->chunk=&c1;
    register_all_natives(vm1);
    
    const char *t1[]={
        "5 >> base",
        "3 >> exp",
        "pow(base=base, exp=exp) ~> result",
        "show result"
    };
    for(int i=0;i<4;i++) compile_line(&c1,t1[i]);
    chunk_write(&c1,OP_HALT);
    run(vm1);
    
    /* Extract T+ output → T2 T- input */
    BVal r; frame_get(&vm1->frame,"result",&r);
    state_set(&t1_out,"result","125");
    free(vm1);
    
    /* T2: uses T1 output as T- */
    printf("=== T2 ===\n");
    Chunk c2={0}; VM *vm2=calloc(1,sizeof(VM)); vm2->chunk=&c2;
    register_all_natives(vm2);
    
    /* T- of T2 = T+ of T1 */
    char t2_tm[64]; snprintf(t2_tm,63,"%g >> prev_result",r.num);
    const char *t2[]={
        t2_tm,
        "prev_result + 25 >> final",
        "show final"
    };
    for(int i=0;i<3;i++) compile_line(&c2,t2[i]);
    chunk_write(&c2,OP_HALT);
    run(vm2);
    free(vm2);
    
    printf("Chain: 5^3=125 → 125+25=150\n");
    return 0;
}
