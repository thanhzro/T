
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "t_bytecode.h"

void compile_expr(Chunk *c, const char *expr);
void compile_line(Chunk *chunk, const char *line);

void compile_expr(Chunk *c, const char *expr) {
    char *end;
    double val = strtod(expr, &end);
    if(end != expr) {
        int idx = chunk_add_num(c, val);
        chunk_write(c, OP_PUSH_NUM); chunk_write(c, idx);
        return;
    }
    int idx = chunk_add_str(c, expr);
    chunk_write(c, OP_LOAD); chunk_write(c, idx);
}

void compile_line(Chunk *chunk, const char *line) {
    char buf[256]; strncpy(buf, line, 255);
    char *p = buf; while(*p==' ')p++;
    if(*p==0||*p=='#') return;

    if(strncmp(p,"show ",5)==0){
        compile_expr(chunk,p+5);
        chunk_write(chunk,OP_SHOW); return;
    }

    if(strncmp(p,"Gate ",5)==0){
        char *lp=strchr(p,'('), *rp=strchr(p,')');
        char *arr=strstr(p,">>");
        printf("DEBUG Gate: lp=%p rp=%p arr=%p\n",(void*)lp,(void*)rp,(void*)arr);
        if(lp&&rp&&arr){
            char tmp[64]; strncpy(tmp,p+5,lp-p-5); tmp[lp-p-5]=0;
            char *v=tmp; while(*v==' ')v++;
            int vl=strlen(v); while(vl>0&&v[vl-1]==' ')v[--vl]=0;
            char inside[64]; strncpy(inside,lp+1,rp-lp-1); inside[rp-lp-1]=0;
            char op_str[8],val_str[64];
            sscanf(inside,"%s %s",op_str,val_str);
            char *tgt=arr+2; while(*tgt==' ')tgt++;
            printf("DEBUG: var=[%s] op=[%s] val=[%s] target=[%s]\n",v,op_str,val_str,tgt);
            int iv=chunk_add_str(chunk,v);
            chunk_write(chunk,OP_LOAD); chunk_write(chunk,iv);
            double dval=atof(val_str);
            int iv2=chunk_add_num(chunk,dval);
            chunk_write(chunk,OP_PUSH_NUM); chunk_write(chunk,iv2);
            if(strcmp(op_str,">")==0) chunk_write(chunk,OP_GT);
            chunk_write(chunk,OP_JUMP_IF_0); chunk_write(chunk,2);
            int it=chunk_add_str(chunk,tgt);
            int i1=chunk_add_num(chunk,1);
            chunk_write(chunk,OP_PUSH_NUM); chunk_write(chunk,i1);
            chunk_write(chunk,OP_STORE); chunk_write(chunk,it);
        }
        return;
    }

    char *arrow=strstr(buf,">>");
    if(arrow){
        *arrow=0; char *target=arrow+2;
        while(*target==' ')target++;
        char *expr=buf; while(*expr==' ')expr++;
        int elen=strlen(expr);
        while(elen>0&&expr[elen-1]==' ')expr[--elen]=0;
        char a[64],b[64]; char op='+';
        if(sscanf(expr,"%s %c %s",a,&op,b)==3){
            compile_expr(chunk,a);
            compile_expr(chunk,b);
            switch(op){
                case '+':chunk_write(chunk,OP_ADD);break;
                case '-':chunk_write(chunk,OP_SUB);break;
                case '*':chunk_write(chunk,OP_MUL);break;
                case '/':chunk_write(chunk,OP_DIV);break;
            }
        } else { compile_expr(chunk,expr); }
        int idx=chunk_add_str(chunk,target);
        chunk_write(chunk,OP_STORE); chunk_write(chunk,idx);
    }
}

int main() {
    const char *prog[] = {
        "10 + 0 >> x",
        "Gate x (> 5) >> passed",
        "show passed"
    };
    Chunk c={0}; VM *vm=calloc(1,sizeof(VM)); vm->chunk=&c;
    for(int i=0;i<3;i++) compile_line(&c, prog[i]);
    chunk_write(&c, OP_HALT);
    printf("Gate compiler (expect 1): ");
    run(vm); free(vm);
    return 0;
}
