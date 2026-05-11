
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include "t_bytecode.h"

double native_abs(double *args, int argc)   { return fabs(args[0]); }
double native_sqrt(double *args, int argc)  { return sqrt(args[0]); }
double native_floor(double *args, int argc) { return floor(args[0]); }

void register_natives(VM *vm) {
    TFunc *f;
    f=&vm->funcs[vm->func_count++];
    strcpy(f->name,"abs"); f->is_native=1; f->native=native_abs;
    strcpy(f->params[0],"val"); f->param_count=1;

    f=&vm->funcs[vm->func_count++];
    strcpy(f->name,"sqrt"); f->is_native=1; f->native=native_sqrt;
    strcpy(f->params[0],"val"); f->param_count=1;

    f=&vm->funcs[vm->func_count++];
    strcpy(f->name,"floor"); f->is_native=1; f->native=native_floor;
    strcpy(f->params[0],"val"); f->param_count=1;
}

void compile_expr(Chunk *c, const char *expr);
void compile_line(Chunk *chunk, const char *line);

void compile_expr(Chunk *c, const char *expr) {
    char *end; double val=strtod(expr,&end);
    if(end!=expr){int idx=chunk_add_num(c,val);chunk_write(c,OP_PUSH_NUM);chunk_write(c,idx);return;}
    int idx=chunk_add_str(c,expr);chunk_write(c,OP_LOAD);chunk_write(c,idx);
}

void compile_line(Chunk *chunk, const char *line) {
    char buf[256]; strncpy(buf,line,255);
    char *p=buf; while(*p==' ')p++;
    if(*p==0||*p=='#') return;
    if(strncmp(p,"show ",5)==0){ compile_expr(chunk,p+5); chunk_write(chunk,OP_SHOW); return; }
    char *tilde=strstr(p,"~>");
    if(tilde&&strchr(p,'(')){
        char *tp=tilde; *tp=0;
        char *target=tp+2; while(*target==' ')target++;
        char *lp=strchr(p,'('); char *rp=strrchr(p,')');
        if(lp&&rp){
            char fname[64]; strncpy(fname,p,lp-p); fname[lp-p]=0;
            char *fn=fname; while(*fn==' ')fn++;
            char args[128]; strncpy(args,lp+1,rp-lp-1); args[rp-lp-1]=0;
            char *eq=strchr(args,'=');
            if(eq){ char *val=eq+1; while(*val==' ')val++;
                compile_expr(chunk,val);
                int ifn=chunk_add_str(chunk,fn);
                chunk_write(chunk,OP_CALL); chunk_write(chunk,ifn); chunk_write(chunk,1);
                int it=chunk_add_str(chunk,target);
                chunk_write(chunk,OP_STORE); chunk_write(chunk,it);
            }
        }
        return;
    }
    char *arrow=strstr(buf,">>");
    if(arrow){
        *arrow=0; char *target=arrow+2; while(*target==' ')target++;
        char *expr=buf; while(*expr==' ')expr++;
        int elen=strlen(expr); while(elen>0&&expr[elen-1]==' ')expr[--elen]=0;
        char a[64],b[64]; char op='+';
        if(sscanf(expr,"%s %c %s",a,&op,b)==3){
            compile_expr(chunk,a); compile_expr(chunk,b);
            switch(op){case '+':chunk_write(chunk,OP_ADD);break;case '-':chunk_write(chunk,OP_SUB);break;case '*':chunk_write(chunk,OP_MUL);break;case '/':chunk_write(chunk,OP_DIV);break;}
        } else compile_expr(chunk,expr);
        int idx=chunk_add_str(chunk,target);
        chunk_write(chunk,OP_STORE); chunk_write(chunk,idx);
    }
}

int main() {
    const char *prog[] = {
        "abs(val=-9) ~> O1",
        "sqrt(val=16) ~> O2",
        "floor(val=3.7) ~> O3",
        "show O1",
        "show O2",
        "show O3"
    };
    Chunk c={0}; VM *vm=calloc(1,sizeof(VM)); vm->chunk=&c;
    register_natives(vm);
    for(int i=0;i<6;i++) compile_line(&c,prog[i]);
    chunk_write(&c,OP_HALT);
    printf("Native funcs (expect 9, 4, 3):\n");
    run(vm); free(vm);
    return 0;
}
