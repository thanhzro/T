
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "t_bytecode.h"
#include "t_natives.h"
#include <math.h>

/* Forward declarations */
void compile_expr(Chunk *c, const char *expr) {
    if(expr[0] == 34) {
        char buf[256]; strncpy(buf, expr+1, 255);
        int l=strlen(buf); if(l>0&&buf[l-1]==34) buf[l-1]=0;
        int idx=chunk_add_str(c, buf);
        chunk_write(c, OP_PUSH_STR); chunk_write(c, idx);
        return;
    }
    char *end;
    double val = strtod(expr, &end);
    if(end != expr && *end == 0) {
        int idx = chunk_add_num(c, val);
        chunk_write(c, OP_PUSH_NUM); chunk_write(c, idx);
        return;
    }
    int idx = chunk_add_str(c, expr);
    chunk_write(c, OP_LOAD); chunk_write(c, idx);
}

void compile_assign(Chunk *c, const char *a, char op, const char *b, const char *target) {
    compile_expr(c, a); compile_expr(c, b);
    switch(op){
        case '+': chunk_write(c,OP_ADD); break;
        case '-': chunk_write(c,OP_SUB); break;
        case '*': chunk_write(c,OP_MUL); break;
        case '/': chunk_write(c,OP_DIV); break;
    }
    int idx=chunk_add_str(c,target);
    chunk_write(c,OP_STORE); chunk_write(c,idx);
}

void compile_line(Chunk *chunk, const char *line) {
    char buf[256]; strncpy(buf, line, 255); buf[255]=0;
    char *p = buf;
    while(*p == ' ') p++;
    if(*p == 0 || *p == '#') return;

    /* show X */
    if(strncmp(p, "show ", 5) == 0) {
        compile_expr(chunk, p+5);
        chunk_write(chunk, OP_SHOW);
        return;
    }

    /* write("file") shall(var) */
    if(strncmp(p, "write(", 6) == 0) {
        char *lp=strchr(p,40), *rp=strchr(p,41);
        char *sh=strstr(p,"shall(");
        if(lp&&rp&&sh) {
            char fn[128]={0}; strncpy(fn,lp+1,rp-lp-1);
            if(fn[0]==34){memmove(fn,fn+1,strlen(fn));int fl=strlen(fn);if(fl>0&&fn[fl-1]==34)fn[fl-1]=0;}
            char vn[64]={0}; char *vs=sh+6, *ve=strrchr(vs,41);
            if(ve){strncpy(vn,vs,ve-vs);vn[ve-vs]=0;}
            compile_expr(chunk,vn);
            int ifn2=chunk_add_str(chunk,fn);
            chunk_write(chunk,OP_PUSH_STR); chunk_write(chunk,ifn2);
            int iw2=chunk_add_str(chunk,"write_file_t");
            chunk_write(chunk,OP_CALL); chunk_write(chunk,iw2); chunk_write(chunk,2);
        }
        return;
    }

    /* func(args) ~> target */
    char *tilde = strstr(p, "~>");
    if(tilde && strchr(p, '(')) {
        char *tp=tilde; *tp=0;
        char *target=tp+2; while(*target==' ')target++;
        char *lp=strchr(p,'('); char *rp=strrchr(p,')');
        if(lp&&rp){
            char fname[64]; strncpy(fname,p,lp-p); fname[lp-p]=0;
            char *fn=fname; while(*fn==' ')fn++;
            char args[256]; strncpy(args,lp+1,rp-lp-1); args[rp-lp-1]=0;
            int argc=0;
            char *tok=strtok(args,",");
            while(tok){
                while(*tok==' ')tok++;
                char *eq=strchr(tok,'=');
                if(eq){ char *val=eq+1; while(*val==' ')val++;
                    compile_expr(chunk,val); argc++;
                }
                tok=strtok(NULL,",");
            }
            int ifn=chunk_add_str(chunk,fn);
            chunk_write(chunk,OP_CALL); chunk_write(chunk,ifn); chunk_write(chunk,argc);
            int it=chunk_add_str(chunk,target);
            chunk_write(chunk,OP_STORE); chunk_write(chunk,it);
        }
        return;
    }

    /* Gate x (op val) >> target */
    if(strncmp(p, "Gate ", 5) == 0) {
        char *lp=strchr(p,'('), *rp=strchr(p,')'), *arr=strstr(p,">>");
        if(lp&&rp&&arr) {
            char tmp[64]; strncpy(tmp,p+5,lp-p-5); tmp[lp-p-5]=0;
            char *v=tmp; while(*v==' ')v++;
            int vl=strlen(v); while(vl>0&&v[vl-1]==' ')v[--vl]=0;
            char inside[64]; strncpy(inside,lp+1,rp-lp-1); inside[rp-lp-1]=0;
            char op_str[8],val_str[64];
            sscanf(inside,"%s %s",op_str,val_str);
            char *tgt=arr+2; while(*tgt==' ')tgt++;
            int iv=chunk_add_str(chunk,v);
            chunk_write(chunk,OP_LOAD); chunk_write(chunk,iv);
            double dval=atof(val_str);
            int iv2=chunk_add_num(chunk,dval);
            chunk_write(chunk,OP_PUSH_NUM); chunk_write(chunk,iv2);
            if(strcmp(op_str,">")==0)  chunk_write(chunk,OP_GT);
            else if(strcmp(op_str,"<")==0)  chunk_write(chunk,OP_LT);
            else if(strcmp(op_str,"==")==0) chunk_write(chunk,OP_EQ);
            else if(strcmp(op_str,">=")==0) chunk_write(chunk,OP_GE);
            else if(strcmp(op_str,"<=")==0) chunk_write(chunk,OP_LE);
            chunk_write(chunk,OP_JUMP_IF_0); chunk_write(chunk,4);
            int i1g=chunk_add_num(chunk,1);
            chunk_write(chunk,OP_PUSH_NUM); chunk_write(chunk,i1g);
            int it=chunk_add_str(chunk,tgt);
            chunk_write(chunk,OP_STORE); chunk_write(chunk,it);
        }
        return;
    }

    /* A op B >> target */
    char *arrow = strstr(buf, ">>");
    if(arrow) {
        *arrow=0;
        char *target=arrow+2; while(*target==' ')target++;
        char *expr=buf; while(*expr==' ')expr++;
        int elen=strlen(expr);
        while(elen>0&&expr[elen-1]==' ')expr[--elen]=0;
        char a[64],b[64]; char op='+';
        /* String literal - check for concat first */
        if(expr[0]==34) {
            /* Find closing quote */
            char *cq=strchr(expr+1,34);
            if(cq && strncmp(cq+1," + ",3)==0){
                /* "string" + var pattern */
                compile_expr(chunk,expr);
                compile_expr(chunk,cq+4);
                chunk_write(chunk,OP_CONCAT);
            } else {
                compile_expr(chunk,expr);
            }
            int it3=chunk_add_str(chunk,target);
            chunk_write(chunk,OP_STORE); chunk_write(chunk,it3);
            return;
        }
        /* var + "string" concat */
        char *plus_q=strstr(expr," + ");
        if(plus_q&&plus_q[3]==34) {
            strncpy(a,expr,plus_q-expr); a[plus_q-expr]=0;
            char *av=a; while(*av==' ')av++;
            int al=strlen(av); while(al>0&&av[al-1]==' ')av[--al]=0;
            char *bv=plus_q+3;
            compile_expr(chunk,av);
            compile_expr(chunk,bv);
            chunk_write(chunk,OP_CONCAT);
            int it4=chunk_add_str(chunk,target);
            chunk_write(chunk,OP_STORE); chunk_write(chunk,it4);
            return;
        }
        if(sscanf(expr,"%s %c %s",a,&op,b)==3) {
            compile_expr(chunk,a);
            compile_expr(chunk,b);
            switch(op){
                case '+': chunk_write(chunk,OP_ADD); break;
                case '-': chunk_write(chunk,OP_SUB); break;
                case '*': chunk_write(chunk,OP_MUL); break;
                case '/': chunk_write(chunk,OP_DIV); break;
            }
        } else {
            compile_expr(chunk,expr);
        }
        int idx=chunk_add_str(chunk,target);
        chunk_write(chunk,OP_STORE); chunk_write(chunk,idx);
    }
}

void compile_program(Chunk *c, const char *lines[], int n);

/* Read and compile a .t file */
int run_file(const char *path) {
    FILE *f = fopen(path, "r");
    if(!f){
 return 1; }
    
    char *lines[1024];
    int count = 0;
    char buf[256];
    
    int section=0; /* 0=T-, 1=T0, 2=T+ */
    while(fgets(buf, sizeof(buf), f) && count < 1024) {
        int len = strlen(buf);
        if(len > 0 && buf[len-1] == '\n') buf[len-1] = 0;
        if(strncmp(buf,"[T-]",4)==0){section=0;continue;}
        if(strncmp(buf,"[T0]",4)==0){section=1;continue;}
        if(strncmp(buf,"[T+]",4)==0){section=2;continue;}
        if(strncmp(buf,"import",6)==0) continue;
        if(buf[0]==0||buf[0]=='#') continue;
        /* T+: show shall(X) → show X */
        if(section==2){
            if(strncmp(buf,"show shall(",11)==0){
                /* parse multi-arg: show shall(O1, O2, O3) */
                char inner[512]; strncpy(inner,buf+11,511);
                int l=strlen(inner); if(l>0&&inner[l-1]==')')inner[l-1]=0;
                /* split by comma and emit show for each */
                char *tok=strtok(inner,",");
                while(tok){
                    while(*tok==' ')tok++;
                    int tl=strlen(tok);
                    while(tl>0&&tok[tl-1]==' ')tok[--tl]=0;
                    char line[256]; snprintf(line,255,"show %s",tok);
                    lines[count++]=strdup(line);
                    tok=strtok(NULL,",");
                }
            } else if(strncmp(buf,"show ",5)==0){
                lines[count++]=strdup(buf);
            } else {
 }
            if(strncmp(buf,"write(",6)==0){
                lines[count++]=strdup(buf);
            } else if(strncmp(buf,"append(",7)==0){
                lines[count++]=strdup(buf);
            }
            continue;
        }
        /* T0: processing only */
        if(section==1) lines[count++]=strdup(buf);
        /* T-: static literals only */
        if(section==0){
            /* allow: literal >> var (no function calls, no ~>) */
            char *arr=strstr(buf,">>");
            char *tilde=strstr(buf,"~>");
            if(arr && !tilde && !strchr(buf,'(')){
                /* no function calls, just literals */
                lines[count++]=strdup(buf);
            }
        }
    }
    fclose(f);
    
    Chunk chunk = {0};
    VM *vm = calloc(1, sizeof(VM));
    vm->chunk = &chunk;
    register_all_natives(vm);
    compile_program(&chunk, (const char**)lines, count);
    run(vm);
    free(vm);
    for(int i=0;i<count;i++) free(lines[i]);
    return 0;
}

/* Compile full T program from lines array */
void compile_program(Chunk *c, const char *lines[], int n) {
    for(int i=0;i<n;i++)
        compile_line(c, lines[i]);
    chunk_write(c, OP_HALT);
}

int main(int argc, char *argv[]) {
    if(argc > 1) {
        run_file(argv[1]);
        return 0;
    }
    /* Test: full T-like program */
    const char *program[] = {
        "10 + 5 >> x",
        "x * 2 >> y",
        "y - 3 >> result",
        "show result"
    };

    Chunk c = {0};
    VM *vm = calloc(1, sizeof(VM));
    vm->chunk = &c;

    compile_program(&c, program, 4);

    printf("Program test (expect 27): ");
    run(vm);
    free(vm);

    /* Test 2: multi-show */
    const char *prog2[] = {
        "5 * 5 >> sq",
        "sq + 1 >> result",
        "show sq",
        "show result"
    };
    Chunk c2={0}; VM *vm2=calloc(1,sizeof(VM)); vm2->chunk=&c2;
    compile_program(&c2, prog2, 4);
    printf("Multi-show test (expect 25, 26):\n");
    run(vm2); free(vm2);

    /* Test file runner */
    printf("File runner test:\n");
    /* pre-register test function "double(val)" */
    extern int run_file_with_setup(const char *path, VM *setup_vm);
    
    /* inline test with registered func */
    {
        Chunk fn={0};
        int iv=chunk_add_str(&fn,"val");
        int i2=chunk_add_num(&fn,2);
        chunk_write(&fn,OP_LOAD); chunk_write(&fn,iv);
        chunk_write(&fn,OP_PUSH_NUM); chunk_write(&fn,i2);
        chunk_write(&fn,OP_MUL);
        chunk_write(&fn,OP_RETURN);

        Chunk main={0};
        VM *vm=calloc(1,sizeof(VM)); vm->chunk=&main;
        TFunc *f=&vm->funcs[vm->func_count++];
        strcpy(f->name,"double"); f->chunk=fn;
        strcpy(f->params[0],"val"); f->param_count=1;

        const char *prog[]={
            "3 + 4 >> x",
            "double(val=x) ~> result",
            "show result"
        };
        for(int i=0;i<3;i++) compile_line(&main,prog[i]);
        chunk_write(&main,OP_HALT);
        printf("~> call test (expect 14): ");
        run(vm); free(vm);
    }
    printf("File _bc_test.t:\n");
    run_file("_bc_test.t");
    return 0;
}
