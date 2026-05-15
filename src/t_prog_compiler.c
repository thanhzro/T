
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "t_signal.h"
#include "t_bytecode.h"
#include "t_natives.h"
#include <math.h>

#include <sys/socket.h>
#include <sys/un.h>
#include <sys/wait.h>
#include <pthread.h>
#include <unistd.h>

#define TCON_SOCKET "/data/data/com.termux/files/home/t-lang/tbc_server.sock"


/* File cache for server mode */
#define MAX_CACHE 32
static struct { char path[256]; char *content; int len; } _file_cache[MAX_CACHE];
static int _cache_count = 0;

static char* cache_get(const char *path) {
    for(int i=0;i<_cache_count;i++)
        if(strcmp(_file_cache[i].path,path)==0) return _file_cache[i].content;
    return NULL;
}
static void cache_set(const char *path, const char *content, int len) {
    if(_cache_count>=MAX_CACHE) return;
    strncpy(_file_cache[_cache_count].path,path,255);
    _file_cache[_cache_count].content=strdup(content);
    _file_cache[_cache_count].len=len;
    _cache_count++;
}

int run_file(const char *path);
void* handle_client(void *arg){
    int cli = *(int*)arg; free(arg);
    char path[512] = {0};
    read(cli, path, 511);
    int old_stdout = dup(1);
    dup2(cli, 1);
    run_file(path);
    fflush(stdout);
    dup2(old_stdout, 1);
    close(old_stdout);
    close(cli);
    return NULL;
}
void run_server() {
    int srv = socket(AF_UNIX, SOCK_STREAM, 0);
    struct sockaddr_un addr = {0};
    addr.sun_family = AF_UNIX;
    strcpy(addr.sun_path, TCON_SOCKET);
    unlink(TCON_SOCKET);
    bind(srv, (struct sockaddr*)&addr, sizeof(addr));
    listen(srv, 10);
    /* Preload common libs into cache */
    {
        const char *preload[] = {"lib/basic/std.t","lib/basic/math.t","lib/basic/string.t","lib/basic/array.t"};
        for(int pi=0;pi<4;pi++){
            FILE*pf=fopen(preload[pi],"r");
            if(!pf) continue;
            fseek(pf,0,SEEK_END); long sz=ftell(pf); fseek(pf,0,SEEK_SET);
            char*buf=malloc(sz+1); fread(buf,1,sz,pf); buf[sz]=0; fclose(pf);
            cache_set(preload[pi],buf,sz); free(buf);
        }
        fprintf(stderr,"Preloaded %d lib files\n",_cache_count);
    }
    fprintf(stderr, "T con server ready: %s\n", TCON_SOCKET);
    
    while(1) {
        int cli = accept(srv, NULL, NULL);
        if(cli < 0) continue;
        /* Handle in new thread - no fork overhead */
        int *cli_ptr = malloc(sizeof(int));
        *cli_ptr = cli;
        pthread_t tid;
        pthread_create(&tid, NULL, handle_client, cli_ptr);
        pthread_detach(tid);
    }
}


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
        case '%': chunk_write(c,OP_MOD); break;
    }
    int idx=chunk_add_str(c,target);
    chunk_write(c,OP_STORE); chunk_write(c,idx);
}

void compile_line(Chunk *chunk, const char *line) {
    char buf[256]; strncpy(buf, line, 255); buf[255]=0;
    char *p = buf;
    while(*p == ' ') p++;
    if(*p == 0 || *p == '#') return;


    /* a != b >> var */
    char *neq = strstr(p, "!=");
    char *arr_neq = strstr(p, ">>");
    if(neq && arr_neq && neq < arr_neq && !strchr(p,'(')) {
        char lhs[64]={0}; strncpy(lhs,p,neq-p);
        char *lt=lhs+strlen(lhs)-1; while(lt>lhs&&*lt==' ')*lt--=0;
        char rhs[64]={0}; char *rs=neq+2; while(*rs==' ')rs++;
        /* trim rhs - only up to >> */
        char *rhs_end = arr_neq;
        while(rhs_end > rs && *(rhs_end-1)==' ') rhs_end--;
        strncpy(rhs, rs, rhs_end-rs);
        rhs[rhs_end-rs]=0;
        char *tgt=arr_neq+2; while(*tgt==' ')tgt++;
        compile_expr(chunk,lhs);
        compile_expr(chunk,rhs);
        chunk_write(chunk,OP_NEQ);
        int it=chunk_add_str(chunk,tgt);
        chunk_write(chunk,OP_STORE); chunk_write(chunk,it);
        return;
    }
    /* show X */
    /* return X */
    if(strncmp(p, "return ", 7) == 0) {
        compile_expr(chunk, p+7);
        chunk_write(chunk, OP_RETURN);
        return;
    }
    if(strncmp(p, "show_named ", 11) == 0) {
        /* push var name as string first, then value */
        char *vn=p+11; while(*vn==" "[0])vn++;
        int isn=chunk_add_str(chunk,vn);
        chunk_write(chunk,OP_PUSH_STR); chunk_write(chunk,isn);
        compile_expr(chunk, vn);
        chunk_write(chunk, OP_SHOW);
        return;
    }
    if(strncmp(p, "show ", 5) == 0) {
        compile_expr(chunk, p+5);
        chunk_write(chunk, OP_SHOW);
        return;
    }

    /* write("file") shall(var) */
    if(strncmp(p, "write(", 6) == 0) {
        char *lp=p+6, *rp=strchr(lp,41);
        char *sh=strstr(p,"shall(");
        if(lp&&rp&&sh) {
            char fn[128]={0}; strncpy(fn,lp,rp-lp);
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
            /* past("file.t") = read file content */
            if(vn[0]==34){
                /* string literal = file path */
                char fname[64]={0}; strncpy(fname,vn+1,strlen(vn)-2);
                int ifr=chunk_add_str(chunk,"file_read");
                int ipath=chunk_add_str(chunk,fname);
                chunk_write(chunk,OP_PUSH_STR); chunk_write(chunk,ipath);
                chunk_write(chunk,OP_CALL); chunk_write(chunk,ifr); chunk_write(chunk,1);
            } else {
                /* variable name = load from frame */
                compile_expr(chunk,vn);
            }
            int it=chunk_add_str(chunk,tgt);
            chunk_write(chunk,OP_STORE); chunk_write(chunk,it);
        }
        return;
    }

    

    /* arr[i] ~> target */
    {
        char *tilde_ai = strstr(p, "~>");
        char *lb=strchr(p,'['), *rb=lb?strchr(lb,']'):NULL;
        if(tilde_ai && lb && rb && lb < tilde_ai && !strchr(p,'(')) {
            char arrname[64]={0}; strncpy(arrname,p,lb-p);
            int al=strlen(arrname); while(al>0&&arrname[al-1]==' ')arrname[--al]=0;
            char idxstr[64]={0}; strncpy(idxstr,lb+1,rb-lb-1);
            char *target=tilde_ai+2; while(*target==' ')target++;
            int iget=chunk_add_str(chunk,"get");
            int iarr=chunk_add_str(chunk,arrname);
            chunk_write(chunk,OP_LOAD); chunk_write(chunk,iarr);
            char *iend; double ival=strtod(idxstr,&iend);
            if(iend!=idxstr&&*iend==0){
                int iidx=chunk_add_num(chunk,ival);
                chunk_write(chunk,OP_PUSH_NUM); chunk_write(chunk,iidx);
            } else {
                int iidx=chunk_add_str(chunk,idxstr);
                chunk_write(chunk,OP_LOAD); chunk_write(chunk,iidx);
            }
            chunk_write(chunk,OP_CALL); chunk_write(chunk,iget); chunk_write(chunk,2);
            int it=chunk_add_str(chunk,target);
            chunk_write(chunk,OP_STORE); chunk_write(chunk,it);
            return;
        }
    }
    /* func(args) ~> target */
    char *tilde = strstr(p, "~>");
    /* arr[i] ~> target - array index access */
    if(tilde && !strchr(p,'(')) {
        char *lb=strchr(p,'['), *rb=strchr(p,']');
        if(lb && rb && lb < tilde) {
            char arrname[64]={0}; strncpy(arrname,p,lb-p);
            char *an=arrname+strlen(arrname)-1;
            while(an>arrname&&*an==' ')*an--=0;
            char idxstr[64]={0}; strncpy(idxstr,lb+1,rb-lb-1);
            char *target=tilde+2; while(*target==' ')target++;
            int iget=chunk_add_str(chunk,"get");
            int iarr=chunk_add_str(chunk,arrname);
            chunk_write(chunk,OP_LOAD); chunk_write(chunk,iarr);
            char *iend; double ival=strtod(idxstr,&iend);
            if(iend!=idxstr&&*iend==0){
                int iidx=chunk_add_num(chunk,ival);
                chunk_write(chunk,OP_PUSH_NUM); chunk_write(chunk,iidx);
            } else {
                int iidx=chunk_add_str(chunk,idxstr);
                chunk_write(chunk,OP_LOAD); chunk_write(chunk,iidx);
            }
            chunk_write(chunk,OP_CALL); chunk_write(chunk,iget); chunk_write(chunk,2);
            int it=chunk_add_str(chunk,target);
            chunk_write(chunk,OP_STORE); chunk_write(chunk,it);
            return;
        }
    }
    if(tilde && strchr(p, '(')) {
        char *tp=tilde; *tp=0;
        char *target=tp+2; while(*target==' ')target++;
        char *lp=strchr(p,'('); char *rp=strrchr(p,')');
        if(lp&&rp){
            char fname[64]; strncpy(fname,p,lp-p); fname[lp-p]=0;
            char *fn=fname; while(*fn==' ')fn++;
            char args[256]; strncpy(args,lp+1,rp-lp-1); args[rp-lp-1]=0;
            int argc=0;
            /* bracket-aware arg split */
            char *ap=args;
            while(*ap){
                while(*ap==' ')ap++;
                if(!*ap) break;
                /* find next comma not inside [] */
                char tok2[256]={0}; int ti=0; int depth=0;
                while(*ap && !((*ap==','&&depth==0))){
                    if(*ap=='[')depth++;
                    else if(*ap==']')depth--;
                    tok2[ti++]=*ap++;
                }
                if(*ap==',') ap++;
                /* trim trailing space */
                while(ti>0&&tok2[ti-1]==' ')tok2[--ti]=0;
                if(!tok2[0]) continue;
                char *eq=strchr(tok2,'=');
                if(eq){ char *val=eq+1; while(*val==' ')val++;
                    compile_expr(chunk,val); argc++;
                } else {
                    compile_expr(chunk,tok2); argc++;
                }
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
            char op_str[8]={0},val_str[64]={0};
            sscanf(inside,"%7s",op_str);
            /* parse val_str - handle quoted strings with spaces */
            char *_vp=inside+strlen(op_str); while(*_vp==' ')_vp++;
            if(*_vp==34){ /* quoted string */
                _vp++; int _vi=0;
                while(*_vp && !(*_vp==34) && _vi<63) val_str[_vi++]=*_vp++;
                val_str[_vi]=0;
            } else {
                sscanf(_vp,"%63s",val_str);
            }
            char *tgt=arr+2; while(*tgt==' ')tgt++;
            int iv=chunk_add_str(chunk,v);
            chunk_write(chunk,OP_LOAD); chunk_write(chunk,iv);
            if(strcmp(op_str,"is_num")==0){chunk_write(chunk,OP_TYPE_NUM);}
            else if(strcmp(op_str,"is_str")==0){chunk_write(chunk,OP_TYPE_STR);}
            else if(strcmp(op_str,"is_arr")==0){chunk_write(chunk,OP_TYPE_ARR);}
            else {
                /* Check if val came from quoted string literal */
                char *_raw_vp=inside+strlen(op_str); while(*_raw_vp==' ')_raw_vp++;
                int _is_str_lit=(*_raw_vp==34);
                char *_end2; double dval=strtod(val_str,&_end2);
                if(_is_str_lit){
                    int iv3=chunk_add_str(chunk,val_str);
                    chunk_write(chunk,OP_PUSH_STR); chunk_write(chunk,iv3);
                } else if(_end2==val_str||*_end2!=0){
                    int iv3=chunk_add_str(chunk,val_str);
                    chunk_write(chunk,OP_LOAD); chunk_write(chunk,iv3);
                } else {
                    int iv2=chunk_add_num(chunk,dval);
                    chunk_write(chunk,OP_PUSH_NUM); chunk_write(chunk,iv2);
                }
                if(strcmp(op_str,">")==0)  chunk_write(chunk,OP_GT);
                else if(strcmp(op_str,"<")==0)  chunk_write(chunk,OP_LT);
                else if(strcmp(op_str,"==")==0) chunk_write(chunk,OP_EQ);
                else if(strcmp(op_str,">=")==0) chunk_write(chunk,OP_GE);
                else if(strcmp(op_str,"<=")==0) chunk_write(chunk,OP_LE);
                else if(strcmp(op_str,"!=")==0) chunk_write(chunk,OP_NEQ);
            }
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
            case '%': chunk_write(chunk,OP_MOD); break;
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
    while(fgets(buf,sizeof(buf),f) && *count<4096){
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
    
    char **lines = calloc(4096, sizeof(char*));
    int count = 0;
    char buf[256];
    
    int section=0; /* 0=T-, 1=T0, 2=T+ */
    while(fgets(buf, sizeof(buf), f) && count < 4096) {
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
                /* split by comma - respect quoted strings */
                char *p2=inner; int in_q=0;
                char tok2[256]; int ti=0;
                while(*p2){
                    if(*p2=='"') in_q=!in_q;
                    if(*p2==','&&!in_q){
                        tok2[ti]=0;
                        char *t2=tok2; while(*t2==' ')t2++;
                        int tl2=strlen(t2); while(tl2>0&&t2[tl2-1]==' ')t2[--tl2]=0;
                        if(tl2>0){char line[256];snprintf(line,255,"show_named %s",t2);lines[count++]=strdup(line);}
                        ti=0; p2++; continue;
                    }
                    tok2[ti++]=*p2++; if(ti>254)ti=254;
                }
                tok2[ti]=0;
                char *t2=tok2; while(*t2==' ')t2++;
                int tl2=strlen(t2); while(tl2>0&&t2[tl2-1]==' ')t2[--tl2]=0;
                if(tl2>0){char line[256];snprintf(line,255,"show_named %s",t2);lines[count++]=strdup(line);}
            } else if(strncmp(buf,"show ",5)==0){
                lines[count++]=strdup(buf);
            } else if(strncmp(buf,"write(",6)==0 || strncmp(buf,"append(",7)==0){
                lines[count++]=strdup(buf);
            } else {
                fprintf(stderr,"T+ warning: ignored: %s\n",buf);
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
            /* Outside func: only var=literal (no logic, no execution) */
            char *arr2=strstr(buf,">>");
            char *tilde2=strstr(buf,"~>");
            if(!arr2&&!tilde2&&strchr(buf,'=')&&!strchr(buf,'(')){
                char *eq2=strchr(buf,'=');
                char vname[64]={0}; strncpy(vname,buf,eq2-buf);
                char *vt=vname+strlen(vname)-1; while(vt>vname&&*vt==' ')*vt--=0;
                char val2[256]={0}; strcpy(val2,eq2+1);
                char *vp=val2; while(*vp==' ')vp++;
                /* T- only allows literals: numbers, strings, arrays */
                int is_literal = (vp[0]=='"' || vp[0]=='[' || (vp[0]>=-'0'&&vp[0]<='9') || vp[0]=='-');
                if(is_literal){
                    char nl2[320]; snprintf(nl2,319,"%s >> %s",vp,vname);
                    lines[count++]=strdup(nl2);
                } else {
                    fprintf(stderr,"T- error: '%s' is not a literal - T- only allows literal values\n",vp);
                }
            }
        }
    }
    fclose(f);
    
    Chunk chunk = {0};
    VM *vm = calloc(1, sizeof(VM));
    vm->funcs=calloc(256,sizeof(TFunc)); vm->func_capacity=256;
    vm->chunk = &chunk;
    /* _g_vm=vm; */ _g_current_file=path;
    register_all_natives(vm);
    compile_program(vm, &chunk, (const char**)lines, count);
    run(vm);
    free(vm);
    for(int i=0;i<count;i++) free(lines[i]);
    return 0;
}

/* Compile full T program from lines array */
/* Compile a T function body into a TFunc */
void compile_f_block(Chunk *chunk, const char *arr_var, const char **body, int body_count) {
    /* Detect Gate filter: body[0] = "Gate now (op val) >> target" */
    int is_gate_filter = 0;
    char gate_tgt[64] = {0};
    char gate_op[8] = {0};
    double gate_val = 0;
    char gate_val_str[64] = {0};
    int gate_is_str_lit = 0;
    const char *_bg=body[0]; while(*_bg==' '||*_bg=='\t')_bg++;
    if(body_count==1 && strncmp(_bg,"Gate ",5)==0) {
        const char *p=_bg;
        char *lp=strchr(p,'('),*rp=strchr(p,')'),*arr=strstr(p,">>");
        if(lp&&rp&&arr) {
            char inside[64]; strncpy(inside,lp+1,rp-lp-1); inside[rp-lp-1]=0;
            char val_str[64]={0};
            sscanf(inside,"%s",gate_op);
            char *_gvp=inside+strlen(gate_op); while(*_gvp==' ')_gvp++;
            if(*_gvp==34){gate_is_str_lit=1;_gvp++;int _gi=0;while(*_gvp&&*_gvp!=34&&_gi<63)val_str[_gi++]=*_gvp++;val_str[_gi]=0;strncpy(gate_val_str,val_str,63);}
            else{sscanf(_gvp,"%63s",val_str);}
            gate_val=atof(val_str);
            char *tgt=arr+2; while(*tgt==' ')tgt++;
            strncpy(gate_tgt,tgt,63);
            /* trim trailing spaces */
            int gl=strlen(gate_tgt);
            while(gl>0&&(gate_tgt[gl-1]==' '||gate_tgt[gl-1]=='\n'||gate_tgt[gl-1]=='\r'))gate_tgt[--gl]=0;
            is_gate_filter=1;
        }
    }
    if(is_gate_filter) {
        /* Initialize target as empty array */
        int itgt=chunk_add_str(chunk,gate_tgt);
        chunk_write(chunk,OP_PUSH_ARR); chunk_write(chunk,0); /* empty array */
        chunk_write(chunk,OP_STORE); chunk_write(chunk,itgt);
        /* Load array and start iter */
        int iarr=chunk_add_str(chunk,arr_var);
        chunk_write(chunk,OP_LOAD); chunk_write(chunk,iarr);
        int inow=chunk_add_str(chunk,"now");
        chunk_write(chunk,OP_ITER_START); chunk_write(chunk,inow);
        int body_start=chunk->count;
        /* Compile condition */
        int inow2=chunk_add_str(chunk,"now");
        chunk_write(chunk,OP_LOAD); chunk_write(chunk,inow2);
        if(strcmp(gate_op,"is_num")==0){chunk_write(chunk,OP_TYPE_NUM);}
        else if(strcmp(gate_op,"is_str")==0){chunk_write(chunk,OP_TYPE_STR);}
        else if(strcmp(gate_op,"is_arr")==0){chunk_write(chunk,OP_TYPE_ARR);}
        else {
        if(gate_is_str_lit){
            int iv2=chunk_add_str(chunk,gate_val_str);
            chunk_write(chunk,OP_PUSH_STR); chunk_write(chunk,iv2);
        } else {
            int iv2=chunk_add_num(chunk,gate_val);
            chunk_write(chunk,OP_PUSH_NUM); chunk_write(chunk,iv2);
        }
        if(strcmp(gate_op,">")==0)  chunk_write(chunk,OP_GT);
        else if(strcmp(gate_op,"<")==0)  chunk_write(chunk,OP_LT);
        else if(strcmp(gate_op,"==")==0) chunk_write(chunk,OP_EQ);
        else if(strcmp(gate_op,"!=")==0) chunk_write(chunk,OP_NEQ);
        else if(strcmp(gate_op,">=")==0) chunk_write(chunk,OP_GE);
        else if(strcmp(gate_op,"<=")==0) chunk_write(chunk,OP_LE);
        }
        /* Jump over push if false */
        chunk_write(chunk,OP_JUMP_IF_0); chunk_write(chunk,9);
        /* push(arr=target, val=now) */
        int ipush=chunk_add_str(chunk,"push");
        int itgt2=chunk_add_str(chunk,gate_tgt);
        chunk_write(chunk,OP_LOAD); chunk_write(chunk,itgt2); /* arr */
        int inow3=chunk_add_str(chunk,"now");
        chunk_write(chunk,OP_LOAD); chunk_write(chunk,inow3); /* val */
        chunk_write(chunk,OP_CALL); chunk_write(chunk,ipush); chunk_write(chunk,2);
        chunk_write(chunk,OP_STORE); chunk_write(chunk,itgt2);
        /* ITER_NEXT */
        chunk_write(chunk,OP_ITER_NEXT);
        chunk_write(chunk,inow);
        chunk_write(chunk,(uint8_t)body_start);
        return;
    }
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
    if(vm->func_count>=vm->func_capacity){vm->func_capacity*=2;vm->funcs=realloc(vm->funcs,vm->func_capacity*sizeof(TFunc));memset(&vm->funcs[vm->func_count],0,(vm->func_capacity/2)*sizeof(TFunc));}
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
        const char *_bl=bl; while(*_bl==' '||*_bl=='\t')_bl++;
        if(strncmp(_bl,"F(",2)==0 && strchr(_bl,'{')){
            char fv[64]={0};
            char *lp2=strchr(_bl,'('),*rp2=strchr(_bl,')');
            if(lp2&&rp2){strncpy(fv,lp2+1,rp2-lp2-1);}
            bi++;
            const char **fb=calloc(128,sizeof(char*)); int fc=0;
            while(bi<body_count){
            const char*_bt=body[bi]; while(*_bt==' '||*_bt=='\t')_bt++; if(_bt[0]=='}') break;
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
    /* Find last assigned var in body - that is the return value */
    const char *_retvar = "out"; /* fallback */
    for(int _ri=body_count-1;_ri>=0;_ri--){
        const char *_rl=body[_ri];
        const char *_rr=strstr(_rl,">>");
        const char *_rt=strstr(_rl,"~>");
        const char *_ra=_rr?_rr:_rt;
        if(_ra){
            const char *_rv=_ra+2; while(*_rv==' ')_rv++;
            if(*_rv && !strchr(_rv,'(') && !strchr(_rv,')')){
                _retvar=_rv;
                break;
            }
        }
    }
    int iout = chunk_add_str(&f->chunk, _retvar);
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
            const char **body=calloc(512,sizeof(char*)); int bc=0; int bdepth=1;
            while(i<n&&bdepth>0){
                const char*_tp=lines[i]; while(*_tp==' '||*_tp=='\t')_tp++;
                int _ll=(int)strlen(lines[i]);
                while(_ll>0&&(lines[i][_ll-1]==' '||lines[i][_ll-1]=='\t'))_ll--;
                if(_ll>0&&lines[i][_ll-1]=='{')bdepth++;
                if(_tp[0]=='}')bdepth--;
                if(bdepth>0&&lines[i][0]!=0&&bc<255)body[bc++]=lines[i];
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
            const char **body=calloc(256,sizeof(char*)); int bc=0; int bdepth=1;
            while(i<n&&bdepth>0){
                const char*_tp=lines[i]; while(*_tp==' '||*_tp=='\t')_tp++;
                int _ll=(int)strlen(lines[i]);
                while(_ll>0&&(lines[i][_ll-1]==' '||lines[i][_ll-1]=='\t'))_ll--;
                if(_ll>0&&lines[i][_ll-1]=='{')bdepth++;
                if(_tp[0]=='}')bdepth--;
                if(bdepth>0&&lines[i][0]!=0&&bc<255)body[bc++]=lines[i];
                i++;
            }
            /* i now past closing } */
            compile_f_block(c,arr_var,body,bc);
            continue;
        } else {
            compile_line(c,lines[i]); i++;
        }
    }
    chunk_write(c,OP_HALT);
}

int _g_trace=0;
int main(int argc, char *argv[]) {
    register_signals();
    if(argc > 1) {
        if(strcmp(argv[1],"--server")==0){run_server();return 0;}
        if(argc > 2 && strcmp(argv[2],"--trace")==0) _g_trace=1;
        run_file(argv[1]);
        return 0;
    }
    return 0;
}