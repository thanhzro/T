
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "t_signal.h"
#include "t_bytecode.h"
#include "t_natives.h"
#include <math.h>

/* Forward declarations */

static char* find_arrow(char *s) {
    int in_str = 0;
    for(int i=0; s[i]; i++) {
        if(s[i]=='"') in_str=!in_str;
        if(!in_str && s[i]=='>' && s[i+1]=='>') return s+i;
    }
    return NULL;
}

void compile_expr(Chunk *c, const char *expr) {
    /* Empty array literal [] */
    if(expr[0]=='['){
        char _inner[256]={0};
        char *_rb=strchr(expr,']');
        if(_rb) strncpy(_inner,expr+1,_rb-expr-1);
        int _cnt=0;
        char _tmp[256]; strcpy(_tmp,_inner);
        char *_tok=strtok(_tmp,",");
        while(_tok){
            while(*_tok==' ')_tok++;
            if(*_tok){compile_expr(c,_tok);_cnt++;}
            _tok=strtok(NULL,",");
        }
        chunk_write(c,OP_PUSH_ARR); chunk_write(c,_cnt);
        return;
    }
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
    /* return X */
    if(strncmp(p, "return ", 7) == 0) {
        compile_expr(chunk, p+7);
        chunk_write(chunk, OP_RETURN);
        return;
    }
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

    /* past(x) ~> y = identity: just LOAD x STORE y */
    if(strncmp(p,"past(",5)==0){
        char *tilde2=strstr(p,"~>");
        if(tilde2){
            char *rp=strchr(p,')');
            char vn[64]={0}; strncpy(vn,p+5,rp-p-5);
            char *tgt=tilde2+2; while(*tgt==' ')tgt++;
            compile_expr(chunk,vn);
            int it=chunk_add_str(chunk,tgt);
            chunk_write(chunk,OP_STORE); chunk_write(chunk,it);
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
                } else if(*tok){
                    /* no = : treat as positional arg */
                    compile_expr(chunk,tok); argc++;
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
    char *arrow = find_arrow(buf);
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
                /* "string" + var: extract just the string part */
                char strpart[256]={0};
                strncpy(strpart,expr,cq-expr+1);
                compile_expr(chunk,strpart);
                compile_expr(chunk,cq+4);
                chunk_write(chunk,OP_CONCAT);
            } else {
                compile_expr(chunk,expr);
            }
            int it3=chunk_add_str(chunk,target);
            chunk_write(chunk,OP_STORE); chunk_write(chunk,it3);
            return;
        }
        /* var + var or var + "string" concat */
        char *plus_q=strstr(expr," + ");
        if(plus_q) {
            /* Check if right side is string literal */
            int rhs_is_str = (plus_q[3]==34);
            /* Always try concat for + - runtime will handle type */
            strncpy(a,expr,plus_q-expr); a[plus_q-expr]=0;
            char *av=a; while(*av==' ')av++;
            int al=strlen(av); while(al>0&&av[al-1]==' ')av[--al]=0;
            char *bv=plus_q+3;
            while(*bv==' ')bv++;
            compile_expr(chunk,av);
            compile_expr(chunk,bv);
            /* Use CONCAT for strings, ADD for numbers */
            /* Check if either side starts with letter (variable) or quote */
            int av_is_var = (av[0]>='a'&&av[0]<='z')||(av[0]>='A'&&av[0]<='Z');
            int bv_is_str = (bv[0]==34);
            if(bv_is_str||rhs_is_str)
                chunk_write(chunk,OP_CONCAT);
            else
                chunk_write(chunk,OP_ADD);
            int it4=chunk_add_str(chunk,target);
            chunk_write(chunk,OP_STORE); chunk_write(chunk,it4);
            return;
        }
        if(0&&plus_q&&plus_q[3]==34) {
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
        if(expr[0]=='['){
            compile_expr(chunk,expr);
            int _ia=chunk_add_str(chunk,target);
            chunk_write(chunk,OP_STORE);chunk_write(chunk,_ia);
            return;
        } else if(sscanf(expr,"%s %c %s",a,&op,b)==3) {
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

void compile_program(VM *vm, Chunk *c, const char *lines[], int n);

/* Read and compile a .t file */

static void load_lines(const char *path, char **lines, int *count){
    FILE *f=fopen(path,"r");
    if(!f) return;
    char buf[256];
    while(fgets(buf,sizeof(buf),f) && *count<1024){
        int l=strlen(buf); if(l>0&&buf[l-1]==10)buf[l-1]=0;
        if(strncmp(buf,"[T-]",4)==0||strncmp(buf,"[T0]",4)==0||strncmp(buf,"[T+]",4)==0) continue;
        if(buf[0]==0) continue;
        if(strncmp(buf,"import",6)==0){
            char ip[256]={0};
            char *q1=strchr(buf,'"'),*q2=q1?strchr(q1+1,'"'):NULL;
            if(q1&&q2){strncpy(ip,q1+1,q2-q1-1);}
            if(ip[0]) load_lines(ip,lines,count);
            continue;
        }
        lines[(*count)++]=strdup(buf);
    }
    fclose(f);
}

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
        if(strncmp(buf,"import",6)==0){
            char ipath[256]={0};
            char *q1=strchr(buf,'"'), *q2=q1?strchr(q1+1,'"'):NULL;
            if(q1&&q2){ strncpy(ipath,q1+1,q2-q1-1); }
            if(ipath[0]) load_lines(ipath, lines, &count);
            continue;
        }
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
        /* T-: static data + func definitions */
        if(section==0){
            /* Track if inside func block */
            static int in_func=0;
            if(strncmp(buf,"func ",5)==0) in_func=1;
            if(buf[0]=='}') in_func=0;
            if(in_func || buf[0]=='}'){
                lines[count++]=strdup(buf); continue;
            }
            /* Outside func: only literal >> var OR var=value */
            char *arr2=strstr(buf,">>");
            char *tilde2=strstr(buf,"~>");
            if(arr2 && !tilde2 && !strchr(buf,'(')){
                lines[count++]=strdup(buf);
            } else if(!arr2&&!tilde2&&strchr(buf,'=')&&!strchr(buf,'(')){
                char *eq2=strchr(buf,'=');
                char vname[64]={0}; strncpy(vname,buf,eq2-buf);
                char *vt=vname+strlen(vname)-1; while(vt>vname&&*vt==' ')*vt--=0;
                char val2[256]={0}; strcpy(val2,eq2+1);
                char *vp=val2; while(*vp==' ')vp++;
                char nl2[320]; snprintf(nl2,319,"%s >> %s",vp,vname);
                lines[count++]=strdup(nl2);
            }
        }
    }
    fclose(f);
    
    Chunk chunk = {0};
    VM *vm = calloc(1, sizeof(VM));
    vm->chunk = &chunk;
    register_all_natives(vm);
 for(int _i=0;_i<count;_i++)
    compile_program(vm, &chunk, (const char**)lines, count);
    run(vm);
    free(vm);
    for(int i=0;i<count;i++) free(lines[i]);
    return 0;
}

/* Compile full T program from lines array */
/* Compile a T function body into a TFunc */
void compile_f_block(Chunk *chunk, const char *arr_var, const char **body, int body_count) {
    int iarr = chunk_add_str(chunk, arr_var);
    chunk_write(chunk, OP_LOAD); chunk_write(chunk, iarr);
    int inow = chunk_add_str(chunk, "now");
    chunk_write(chunk, OP_ITER_START); chunk_write(chunk, inow);
    int body_start = chunk->count;
    for(int i=0;i<body_count;i++)
        compile_line(chunk, body[i]);
    chunk_write(chunk, OP_ITER_NEXT);
    chunk_write(chunk, inow);
    chunk_write(chunk, (uint8_t)body_start);
}

void compile_func(VM *vm, const char *name, const char **params, int nparams,
                  const char **body, int body_count) {
    TFunc *f = &vm->funcs[vm->func_count++];
    strcpy(f->name, name);
    f->param_count = nparams;
    for(int i=0;i<nparams;i++) strcpy(f->params[i], params[i]);
    f->is_native = 0;
    /* Compile body into f->chunk - handle F() blocks */
    memset(&f->chunk, 0, sizeof(Chunk));
    int bi=0;
    while(bi<body_count){
        const char *bl=body[bi];
        if(strncmp(bl,"F(",2)==0 && strchr(bl,'{')){
            char fv[64]={0};
            char *lp2=strchr(bl,'('),*rp2=strchr(bl,')');
            if(lp2&&rp2){strncpy(fv,lp2+1,rp2-lp2-1);}
            bi++;
            const char *fb[64]; int fc=0;
            while(bi<body_count && body[bi][0]!='}'){
                if(body[bi][0]!=0) fb[fc++]=body[bi];
                bi++;
            }
            if(bi<body_count) bi++; /* skip } */
            compile_f_block(&f->chunk,fv,fb,fc);
        } else {
            compile_line(&f->chunk, bl);
            bi++;
        }
    }
    /* Add RETURN at end */
    /* Load "out" variable and return */
    int iout = chunk_add_str(&f->chunk, "out");
    chunk_write(&f->chunk, OP_LOAD); chunk_write(&f->chunk, iout);
    chunk_write(&f->chunk, OP_RETURN);
    {FILE*_cd=fopen("chunk_dbg.txt","w");if(_cd){fprintf(_cd,"func=%s bc=%d cc=%d\n",name,body_count,f->chunk.count);fclose(_cd);}}
}

void compile_program(VM *vm, Chunk *c, const char *lines[], int n) {
    int i=0;
    while(i<n){
        const char *line=lines[i];
        if(strncmp(line,"func ",5)==0 && strchr(line,'(')){
            char fname[64]={0};
            char *lp=strchr(line,'('), *rp=strchr(line,')');
            if(lp) strncpy(fname,line+5,lp-line-5);
            char pbuf[256]={0};
            if(lp&&rp) strncpy(pbuf,lp+1,rp-lp-1);
            const char *params[8]; int nparams=0;
            char ptoks[8][64]; char tmp[256]; strcpy(tmp,pbuf);
            char *pt=strtok(tmp,",");
            while(pt&&nparams<8){
                while(*pt==' ')pt++;
                int pl=strlen(pt); while(pl>0&&pt[pl-1]==' ')pt[--pl]=0;
                strcpy(ptoks[nparams],pt); params[nparams]=ptoks[nparams]; nparams++;
                pt=strtok(NULL,",");
            }
            i++;
            const char *body[128]; int bc=0; int bdepth=1;
            while(i<n&&bdepth>0){
                if(strchr(lines[i],'{'))bdepth++;
                if(lines[i][0]=='}')bdepth--;
                if(bdepth>0&&lines[i][0]!=0)body[bc++]=lines[i];
                i++;
            }
            /* i now past closing } */
            compile_func(vm,fname,params,nparams,body,bc);
            continue;
        }
        if(strncmp(line,"F(",2)==0 && strchr(line,'{')){
            char arr_var[64]={0};
            char *lp=strchr(line,'('); char *rp=strchr(line,')');
            if(lp&&rp){strncpy(arr_var,lp+1,rp-lp-1);arr_var[rp-lp-1]=0;}
            i++;
            const char *body[64]; int bc=0; int bdepth=1;
            while(i<n&&bdepth>0){
                if(strchr(lines[i],'{'))bdepth++;
                if(lines[i][0]=='}')bdepth--;
                if(bdepth>0&&lines[i][0]!=0)body[bc++]=lines[i];
                i++;
            }
            /* i now past closing } */
            compile_f_block(c,arr_var,body,bc);
        } else {
            compile_line(c,lines[i]); i++;
        }
    }
    chunk_write(c,OP_HALT);
}

int main(int argc, char *argv[]) {
    register_signals();
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

    compile_program(vm, &c, program, 4);

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
    compile_program(vm2, &c2, (const char**)prog2, 4);
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
