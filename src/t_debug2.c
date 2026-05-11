
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "t_bytecode.h"

int main() {
    Frame f = {0};
    BVal v; v.type=VT_NUM; v.num=7.0; v.str=NULL;
    
    /* Manual frame_set */
    strcpy(f.keys[0], "x");
    f.vals[0].type = v.type;
    f.vals[0].num  = v.num;
    f.vals[0].str  = v.str;
    f.count = 1;
    
    printf("direct vals[0].num=%g\n", f.vals[0].num);
    
    /* Manual frame_get */
    double result = 0;
    for(int i=0;i<f.count;i++){
        if(strcmp(f.keys[i],"x")==0){
            result = f.vals[i].num;
            printf("found at i=%d num=%g\n", i, f.vals[i].num);
        }
    }
    printf("result=%g\n", result);
    return 0;
}
