
#pragma once
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/wait.h>
#include <unistd.h>
#include <math.h>
#include "t_bytecode.h"

/* ===== NATIVE FUNCTIONS ===== */





/* Simple array encoding as comma-separated string */
char* nat_range_s(char**a,int n){
    int count=(int)atof(a[0]);
    char buf[4096]; buf[0]=0;
    for(int i=0;i<count;i++){
        char tmp[32]; snprintf(tmp,31,"%d",i);
        if(i>0) strcat(buf,",");
        strcat(buf,tmp);
    }
    return strdup(buf);
}



#include <ctype.h>

/* Mixed native: access full BVal stack */

















void nat_slice_val(BVal *stack, int argc, BVal *out){
    if(argc<1){out->type=VT_STR;out->str=strdup("");return;}
    if(stack[0].type==VT_ARR){
        int from=argc>1?(int)stack[1].num:0;
        int to=argc>2?(int)stack[2].num:stack[0].arr_len;
        if(from<0)from=0; if(to>stack[0].arr_len)to=stack[0].arr_len;
        int n=to-from; if(n<0)n=0;
        BVal*arr=(BVal*)calloc(n,sizeof(BVal));
        for(int i=0;i<n;i++) arr[i]=stack[0].arr[from+i];
        out->type=VT_ARR; out->arr=arr; out->arr_len=n;
        return;
    }
    char *s=stack[0].str?stack[0].str:"";
    int len=strlen(s);
    int from=argc>1?(int)stack[1].num:0;
    int to=argc>2?(int)stack[2].num:len;
    if(from<0)from=0; if(to>len)to=len; if(from>to)from=to;
    char *r=malloc(to-from+1);
    strncpy(r,s+from,to-from); r[to-from]=0;
    out->type=VT_STR; out->str=r;
}

void nat_chars_val(BVal *stack, int argc, BVal *out){
    if(argc<1||!stack[0].str){out->type=VT_ARR;out->arr_len=0;return;}
    char *s=stack[0].str;
    int n=strlen(s);
    BVal *arr=(BVal*)calloc(n,sizeof(BVal));
    for(int i=0;i<n;i++){
        arr[i].type=VT_STR;
        char *ch=malloc(2); ch[0]=s[i]; ch[1]=0;
        arr[i].str=ch;
    }
    out->type=VT_ARR; out->arr=arr; out->arr_len=n;
}







char* nat_tcon_query(char**a,int n){
    if(n<1||!a[0]) return strdup("");
    FILE*f=fopen("ai_rules.txt","r");
    if(!f) return strdup("no rules");
    char line[512]; char best[512]={0}; int best_score=0;
    char *query=a[0];
    while(fgets(line,511,f)){
        int score=0; char *p=line;
        // count matching words
        char qtmp[512]; strcpy(qtmp,query);
        char *tok=strtok(qtmp," ");
        while(tok){
            if(strlen(tok)>2 && strcasestr(line,tok)) score++;
            tok=strtok(NULL," ");
        }
        if(score>best_score){best_score=score;strncpy(best,line,511);}
    }
    fclose(f);
    if(best_score==0) return strdup("no match");
    int l=strlen(best); while(l>0&&(best[l-1]=='\n'||best[l-1]==' '))best[--l]=0;
    return strdup(best);
}

void nat_split_val(BVal *stack, int argc, BVal *out){
    if(argc<1||!stack[0].str){out->type=VT_ARR;out->arr_len=0;return;}
    char *s=strdup(stack[0].str);
    char *sep=argc>1&&stack[1].str?stack[1].str:" ";
    int seplen=strlen(sep);
    BVal *arr=(BVal*)calloc(256,sizeof(BVal)); int n=0;
    char *p=s;
    while(*p){
        char *found=strstr(p,sep);
        int len=found?found-p:strlen(p);
        arr[n].type=VT_STR;
        arr[n].str=(char*)malloc(len+1);
        strncpy(arr[n].str,p,len); arr[n].str[len]=0;
        n++; if(!found) break; p=found+seplen;
    }
    free(s);
    out->type=VT_ARR; out->arr=arr; out->arr_len=n;
}



int _cmp_bval(const void *a, const void *b){
    double da=((BVal*)a)->num, db=((BVal*)b)->num;
    if(((BVal*)a)->type==VT_STR&&((BVal*)a)->str&&
       ((BVal*)b)->type==VT_STR&&((BVal*)b)->str)
        return strcmp(((BVal*)a)->str,((BVal*)b)->str);
    return da<db?-1:da>db?1:0;
}
void nat_sort_c(BVal *stack, int argc, BVal *out){
    if(argc<1||stack[0].type!=VT_ARR) return;
    int n=stack[0].arr_len;
    BVal *arr=(BVal*)calloc(n,sizeof(BVal));
    for(int i=0;i<n;i++) arr[i]=stack[0].arr[i];
    qsort(arr,n,sizeof(BVal),_cmp_bval);
    out->type=VT_ARR; out->arr=arr; out->arr_len=n;
}









void nat_range_c(BVal *stack, int argc, BVal *out){
    /* Return number not array - VM handles as lazy counter */
    int n;
    if(argc<1) n=2147483647; /* no arg = infinite */
    else n=(int)stack[0].num; /* arg=0 means 0 iterations */
    out->type=VT_NUM; out->num=n; out->arr=NULL; out->arr_len=0;
}



void nat_file_read(BVal *stack, int argc, BVal *out){
    if(argc<1||!stack[0].str){out->type=VT_STR;out->str=strdup("");return;}
    FILE*f=fopen(stack[0].str,"r");
    if(!f){out->type=VT_STR;out->str=strdup("");return;}
    fseek(f,0,SEEK_END); long sz=ftell(f); rewind(f);
    char*buf=(char*)malloc(sz+1);
    fread(buf,1,sz,f); buf[sz]=0;
    fclose(f);
    out->type=VT_STR; out->str=buf;
}
void nat_push_val(BVal *stack, int argc, BVal *out){
    /* stack[0]=arr, stack[1]=val */
    out->type=VT_ARR; out->num=0; out->str=NULL; out->arr=NULL; out->arr_len=0;
    if(argc<2||stack[0].type!=VT_ARR) return;
    int n=stack[0].arr_len;
    BVal *newarr=(BVal*)calloc(n+1,sizeof(BVal));
    for(int i=0;i<n;i++){
        newarr[i].type=stack[0].arr[i].type;
        newarr[i].num=stack[0].arr[i].num;
        newarr[i].str=stack[0].arr[i].str?strdup(stack[0].arr[i].str):NULL;
        newarr[i].arr=stack[0].arr[i].arr;
        newarr[i].arr_len=stack[0].arr[i].arr_len;
    }
    newarr[n].type=stack[1].type;
    newarr[n].num=stack[1].num;
    newarr[n].str=stack[1].str?strdup(stack[1].str):NULL;
    newarr[n].arr=stack[1].arr;
    newarr[n].arr_len=stack[1].arr_len;
    out->arr=newarr;
    out->arr_len=n+1;
    out->num=n+1;
}

void nat_get_val(BVal *stack, int argc, BVal *out){
    out->type=VT_NUM; out->num=0; out->str=NULL; out->arr=NULL; out->arr_len=0;
    if(argc<2) return;
    if(stack[0].type==VT_ARR){
        int idx=(int)stack[1].num;
        if(idx<0||idx>=stack[0].arr_len) return;
        out->type=stack[0].arr[idx].type;
        out->num=stack[0].arr[idx].num;
        out->str=stack[0].arr[idx].str?strdup(stack[0].arr[idx].str):NULL;
        out->arr=stack[0].arr[idx].arr;
        out->arr_len=stack[0].arr[idx].arr_len;
    }
}


double nat_toNumber_mix(BVal *stack, int argc){
    if(argc<1) return 0;
    if(stack[0].type==VT_NUM) return stack[0].num;
    if(stack[0].str) return atof(stack[0].str);
    return 0;
}




typedef double (*NativeMixFn)(BVal *stack, int argc);

double nat_len_mix(BVal *stack, int argc){
    if(argc<1) return 0;
    if(stack[0].type==VT_ARR) return stack[0].arr_len;
    if(stack[0].type==VT_STR) return stack[0].str?strlen(stack[0].str):0;
    return stack[0].num;
}



char* nat_nat_replace(char**a,int n){
    char *s=a[0],*f=a[1],*r=a[2];
    int sl=strlen(s),fl=strlen(f),rl=strlen(r);
    char *buf=malloc(sl*2+256);
    char *p=buf; const char *cur=s;
    while((cur=strstr(cur,f))){
        int pre=cur-s-(p-buf-(p-buf));
        /* simple version */
        break;
    }
    free(buf);
    /* Simple replace first occurrence */
    char *found=strstr(s,f);
    if(!found) return strdup(s);
    int pre=found-s;
    char *res=malloc(pre+rl+(sl-pre-fl)+1);
    strncpy(res,s,pre);
    strcpy(res+pre,r);
    strcpy(res+pre+rl,found+fl);
    return res;
}
char* nat_split_first(char**a,int n){
    /* Return part before separator */
    char *s=a[0],*sep=a[1];
    char *found=strstr(s,sep);
    if(!found) return strdup(s);
    int l=found-s;
    char *r=malloc(l+1); strncpy(r,s,l); r[l]=0;
    return r;
}


/* String natives */

char* nat_upper(char**a,int n){
    char *s=a[0]; int len=strlen(s);
    char *r=malloc(len+1);
    for(int i=0;i<=len;i++) r[i]=toupper((unsigned char)s[i]);
    return r;
}

char* nat_lower(char**a,int n){
    char *s=a[0]; int len=strlen(s);
    char *r=malloc(len+1);
    for(int i=0;i<=len;i++) r[i]=tolower((unsigned char)s[i]);
    return r;
}
char* nat_trim(char**a,int n){
    char *s=a[0];
    while(*s==' '||*s=='\t'||*s=='\n') s++;
    char *r=strdup(s);
    int l=strlen(r);
    while(l>0&&(r[l-1]==' '||r[l-1]=='\t'||r[l-1]=='\n')) r[--l]=0;
    return r;
}












/* ===== REGISTER ALL NATIVES ===== */












char* nat_md5_s(char**a,int n){
    /* Simple MD5 stub - use exec md5sum */
    char cmd[512]; snprintf(cmd,511,"echo -n '%s' | md5sum | cut -d' ' -f1",a[0]?a[0]:"");
    FILE*fp=popen(cmd,"r"); if(!fp) return strdup("");
    char buf[64]; buf[0]=0; fgets(buf,63,fp); pclose(fp);
    int l=strlen(buf); while(l>0&&(buf[l-1]=='\n'||buf[l-1]==' '))buf[--l]=0;
    return strdup(buf);
}
char* nat_sha256_s(char**a,int n){
    char cmd[512]; snprintf(cmd,511,"echo -n '%s' | sha256sum | cut -d' ' -f1",a[0]?a[0]:"");
    FILE*fp=popen(cmd,"r"); if(!fp) return strdup("");
    char buf[128]; buf[0]=0; fgets(buf,127,fp); pclose(fp);
    int l=strlen(buf); while(l>0&&(buf[l-1]=='\n'||buf[l-1]==' '))buf[--l]=0;
    return strdup(buf);
}









void nat_charcode(BVal *stack, int argc, BVal *out){
    if(argc<1||!stack[0].str||!stack[0].str[0]){out->type=VT_NUM;out->num=0;return;}
    out->type=VT_NUM;
    out->num=(double)(unsigned char)stack[0].str[0];
}
void nat_fromchar(BVal *stack, int argc, BVal *out){
    if(argc<1){out->type=VT_STR;out->str=strdup("");return;}
    char buf[2]={(char)(int)stack[0].num,0};
    out->type=VT_STR; out->str=strdup(buf);
}

void nat_trim_v(BVal *stack, int argc, BVal *out){
    if(argc<1||!stack[0].str){out->type=VT_STR;out->str=strdup("");return;}
    char *s=stack[0].str;
    while(*s==' '||*s=='\t'||*s=='\n'||*s=='\r') s++;
    if(*s==0){out->type=VT_STR;out->str=strdup("");return;} /* all spaces */
    char *e=s+strlen(s)-1;
    while(e>s&&(*e==' '||*e=='\t'||*e=='\n'||*e=='\r')) e--;
    int n=e-s+1; if(n<0)n=0;
    char *r=malloc(n+1); strncpy(r,s,n); r[n]=0;
    out->type=VT_STR; out->str=r;
}

void nat_filter_starts(BVal *stack, int argc, BVal *out){
    if(argc<2||stack[0].type!=VT_ARR||!stack[1].str){out->type=VT_ARR;out->arr=NULL;out->arr_len=0;return;}
    BVal *arr=stack[0].arr; int n=stack[0].arr_len;
    char *pre=stack[1].str; int pl=strlen(pre);
    BVal *res=calloc(n,sizeof(BVal)); int cnt=0;
    for(int i=0;i<n;i++){
        if(arr[i].type==VT_STR&&arr[i].str&&strncmp(arr[i].str,pre,pl)==0)
            res[cnt++]=arr[i];
    }
    out->type=VT_ARR; out->arr=res; out->arr_len=cnt;
}

void nat_exp_v(BVal *stack, int argc, BVal *out){
    if(argc<1){out->type=VT_NUM;out->num=1;return;}
    out->type=VT_NUM; out->num=exp(stack[0].num);
    out->str=NULL; out->arr=NULL; out->arr_len=0;
}

void nat_sqrt_v(BVal *stack, int argc, BVal *out){
    if(argc<1){out->type=VT_NUM;out->num=0;return;}
    out->type=VT_NUM; out->num=sqrt(stack[0].num);
    out->str=NULL; out->arr=NULL; out->arr_len=0;
}

void nat_write_file(BVal *stack, int argc, BVal *out){
    if(argc<2||!stack[0].str||!stack[1].str){out->type=VT_NUM;out->num=0;return;}
    const char *path=stack[0].str;
    const char *content=stack[1].str;
    FILE *f=fopen(path,"w");
    if(!f){out->type=VT_NUM;out->num=0;return;}
    fputs(content,f);
    fclose(f);
    out->type=VT_NUM; out->num=1; out->str=NULL; out->arr=NULL; out->arr_len=0;
}

void nat_join(BVal *stack, int argc, BVal *out){
    if(argc<2||stack[0].type!=VT_ARR){out->type=VT_STR;out->str=strdup("");return;}
    BVal *arr=stack[0].arr; int n=stack[0].arr_len;
    const char *sep=stack[1].str?stack[1].str:"";
    char buf[65536]={0}; int pos=0;
    for(int i=0;i<n;i++){
        char _nbuf[64]={0};
        const char *s;
        if(arr[i].str) s=arr[i].str;
        else { snprintf(_nbuf,sizeof(_nbuf),"%g",arr[i].num); s=_nbuf; }
        int sl=strlen(s);
        if(pos+sl<65535){memcpy(buf+pos,s,sl);pos+=sl;}
        if(i<n-1){int sep_l=strlen(sep);if(pos+sep_l<65535){memcpy(buf+pos,sep,sep_l);pos+=sep_l;}}
    }
    buf[pos]=0;
    out->type=VT_STR; out->str=strdup(buf); out->arr=NULL; out->arr_len=0;
}

void nat_filter_not_starts(BVal *stack, int argc, BVal *out){
    if(argc<2||stack[0].type!=VT_ARR||!stack[1].str){out->type=VT_ARR;out->arr=NULL;out->arr_len=0;return;}
    BVal *arr=stack[0].arr; int n=stack[0].arr_len;
    char *pre=stack[1].str; int pl=strlen(pre);
    BVal *res=calloc(n,sizeof(BVal)); int cnt=0;
    for(int i=0;i<n;i++){
        if(arr[i].type==VT_STR&&arr[i].str&&(pl==0||strncmp(arr[i].str,pre,pl)!=0))
            res[cnt++]=arr[i];
    }
    out->type=VT_ARR; out->arr=res; out->arr_len=cnt;
}
static void native_mat_mmv(BVal *stack, int argc, BVal *out) {
    if(argc < 3){*out=make_num(0);return;}
    BVal mat_v = stack[0];
    BVal n_val = stack[1];
    BVal vec_v = stack[2];
    int n = (int)n_val.num;
    fprintf(stderr,"DBG n=%d mat_len=%d vec_len=%d mat[4]=%g\n",n,(int)mat_v.arr_len,(int)vec_v.arr_len,mat_v.arr_len>4?mat_v.arr[4].num:-99);
    if(n<=0||!mat_v.arr||!vec_v.arr){*out=make_arr(0);return;}
    *out = make_arr(n);
    for(int i=0;i<n;i++){
        double dot=0;
        for(int j=0;j<n;j++){
            double mv = (i*n+j < (int)mat_v.arr_len) ? mat_v.arr[i*n+j].num : 0;
            double vv = (j < (int)vec_v.arr_len) ? vec_v.arr[j].num : 0;
            dot += mv * vv;
        }
        out->arr[i] = make_num(dot);
    }
}


static void native_argmax_n(BVal *stack, int argc, BVal *out) {
    BVal arr = stack[0];
    if(!arr.arr || arr.arr_len==0){*out=make_num(0);return;}
    int best_idx=0;
    double best_val=arr.arr[0].num;
    for(int i=1;i<arr.arr_len;i++){
        if(arr.arr[i].num > best_val){
            best_val = arr.arr[i].num;
            best_idx = i;
        }
    }
    *out = make_num(best_idx);
}


static void native_softmax_n(BVal *stack, int argc, BVal *out) {
    BVal arr = stack[0];
    int n = arr.arr_len;
    if(!arr.arr || n==0){*out=make_arr(0);return;}
    double max_val = arr.arr[0].num;
    for(int i=1;i<n;i++) if(arr.arr[i].num>max_val) max_val=arr.arr[i].num;
    double sum=0;
    *out = make_arr(n);
    for(int i=0;i<n;i++){
        out->arr[i] = make_num(exp(arr.arr[i].num - max_val));
        sum += out->arr[i].num;
    }
    for(int i=0;i<n;i++) out->arr[i].num /= sum;
}

static void native_embed_n(BVal *stack, int argc, BVal *out) {
    BVal char_id = stack[0];
    BVal emb_table = stack[1];
    BVal emb_dim = stack[2];
    int id = (int)char_id.num;
    int dim = (int)emb_dim.num;
    int offset = id * dim;
    *out = make_arr(dim);
    for(int i=0;i<dim;i++){
        int idx = offset + i;
        out->arr[i] = (idx < emb_table.arr_len) ? emb_table.arr[idx] : make_num(0);
    }
}

static void native_mat_update_flat(BVal *stack, int argc, BVal *out) {
    BVal mat = stack[0];
    BVal grad = stack[1];
    BVal lr_v = stack[2];
    double lr = lr_v.num;
    int n = mat.arr_len;
    *out = make_arr(n);
    for(int i=0;i<n;i++){
        double g = (i < grad.arr_len) ? grad.arr[i].num : 0;
        out->arr[i] = make_num(mat.arr[i].num - lr * g);
    }
}


static void nat_par_spawn(BVal *stack, int argc, BVal *out) {
    BVal flist = stack[0];
    int n = (int)flist.arr_len;
    pid_t pids[256];
    for(int i=0;i<n&&i<256;i++){
        const char *path = flist.arr[i].str;
        if(!path) continue;
        pids[i] = fork();
        if(pids[i]==0){
            chdir("/data/data/com.termux/files/home/t-lang");
            execl("/data/data/com.termux/files/home/t-lang/t_bc","/data/data/com.termux/files/home/t-lang/t_bc",path,NULL);
            exit(1);
        }
    }
    for(int i=0;i<n&&i<256;i++){
        if(pids[i]>0) waitpid(pids[i],NULL,0);
    }
    *out = make_num(n);
}


static void nat_fat_arrow(BVal *stack, int argc, BVal *out) {
    BVal data = stack[0];
    BVal target = stack[1];
    if(!target.str&&target.type!=VT_STR){*out=make_num(0);return;}
    
    /* Serialize data to input file */
    char input_path[512];
    snprintf(input_path, sizeof(input_path), "%s.input", target.str);
    
    /* Convert data to string */
    char buf[65536]={0};
    if(data.type==VT_NUM){
        snprintf(buf,sizeof(buf),"%g",data.num);
    } else if(data.type==VT_STR && data.str){
        snprintf(buf,sizeof(buf),"%s",data.str);
    } else if(data.type==VT_ARR){
        int pos=0;
        pos+=snprintf(buf+pos,sizeof(buf)-pos,"[");
        for(int i=0;i<data.arr_len;i++){
            if(i>0) pos+=snprintf(buf+pos,sizeof(buf)-pos,", ");
            if(data.arr[i].type==VT_STR && data.arr[i].str)
                pos+=snprintf(buf+pos,sizeof(buf)-pos,"%s",data.arr[i].str);
            else
                pos+=snprintf(buf+pos,sizeof(buf)-pos,"%g",data.arr[i].num);
        }
        pos+=snprintf(buf+pos,sizeof(buf)-pos,"]");
    }
    
    /* Write to input file */
    FILE *f=fopen(input_path,"w");
    if(f){fprintf(f,"%s",buf);fclose(f);}
    
    /* Spawn target T con */
    char *tbc_path = "/data/data/com.termux/files/home/t-lang/t_bc";
    pid_t pid=fork();
    if(pid==0){
        chdir("/data/data/com.termux/files/home/t-lang");
        execl(tbc_path,tbc_path,target.str,NULL);
        exit(1);
    }
    if(pid>0) waitpid(pid,NULL,0);
    *out=make_num(1);
}


static void nat_compile_all(BVal *stack, int argc, BVal *out) {
    BVal lines = stack[0];
    int n = lines.arr_len;
    /* Build output array of instruction strings */
    *out = make_arr(0);
    for(int i=0;i<n;i++){
        if(!lines.arr[i].str) continue;
        const char *line = lines.arr[i].str;
        /* Skip empty lines */
        int len=strlen(line);
        int all_space=1;
        for(int j=0;j<len;j++) if(line[j]!=' '&&line[j]!='\t'){all_space=0;break;}
        if(all_space) continue;
        /* Direct C compilation of line */
        char instr[512]={0};
        /* Detect >> assign */
        char *arr_op=strstr(line," >> ");
        char *til_op=strstr(line," ~> ");
        char *gate_op=strstr(line,"Gate ");
        if(arr_op && !gate_op){
            /* x + 1 >> r → LOAD x, ADD, LOAD 1, STORE r */
            char expr[256]={0}; char tgt[64]={0};
            strncpy(expr,line,arr_op-line);
            strcpy(tgt,arr_op+4);
            /* trim */
            char *tp=tgt+strlen(tgt)-1;
            while(tp>tgt&&(*tp==' '||*tp=='\n'))tp--;tp[1]=0;
            char *ep=expr; while(*ep==' ')ep++;
            /* tokenize expr */
            char tmp[256]; strcpy(tmp,ep);
            char *tok2=strtok(tmp," ");
            while(tok2){
                if(strcmp(tok2,"+")&&strcmp(tok2,"-")&&strcmp(tok2,"*")&&strcmp(tok2,"/")){
                    out->arr=realloc(out->arr,sizeof(BVal)*(out->arr_len+1));
                    char lbuf[128]; snprintf(lbuf,sizeof(lbuf),"LOAD %s",tok2);
                    out->arr[out->arr_len++]=make_str(lbuf);
                    out->num=out->arr_len;
                }
                tok2=strtok(NULL," ");
            }
            out->arr=realloc(out->arr,sizeof(BVal)*(out->arr_len+1));
            char sbuf[128]; snprintf(sbuf,sizeof(sbuf),"STORE %s",tgt);
            out->arr[out->arr_len++]=make_str(sbuf);
            out->num=out->arr_len;
        } else if(til_op){
            /* func(args) ~> target → LOAD args, CALL func n, STORE target */
            char call[256]={0}; char tgt[64]={0};
            strncpy(call,line,til_op-line);
            strcpy(tgt,til_op+3);
            char *tp=tgt+strlen(tgt)-1;
            while(tp>tgt&&(*tp==' '||*tp=='\n'))tp--;tp[1]=0;
            char *lp=strchr(call,'('); char *rp=strrchr(call,')');
            if(lp&&rp){
                char fname[64]={0}; strncpy(fname,call,lp-call);
                char args[256]={0}; strncpy(args,lp+1,rp-lp-1);
                int argc=0;
                char *atk=strtok(args,",");
                while(atk){
                    char *eq=strchr(atk,'=');
                    char *val=eq?eq+1:atk;
                    while(*val==' ')val++;
                    out->arr=realloc(out->arr,sizeof(BVal)*(out->arr_len+1));
                    char lbuf[128]; snprintf(lbuf,sizeof(lbuf),"LOAD %s",val);
                    out->arr[out->arr_len++]=make_str(lbuf);
                    out->num=out->arr_len;
                    argc++; atk=strtok(NULL,",");
                }
                out->arr=realloc(out->arr,sizeof(BVal)*(out->arr_len+1));
                char cbuf[128]; snprintf(cbuf,sizeof(cbuf),"CALL %s %d",fname,argc);
                out->arr[out->arr_len++]=make_str(cbuf);
                out->num=out->arr_len;
                out->arr=realloc(out->arr,sizeof(BVal)*(out->arr_len+1));
                char sbuf[128]; snprintf(sbuf,sizeof(sbuf),"STORE %s",tgt);
                out->arr[out->arr_len++]=make_str(sbuf);
                out->num=out->arr_len;
            }
        } else if(gate_op){
            char *lp2=strchr(line,'('); char *rp2=strchr(line,')');
            char *arr2=strstr(line," >> ");
            if(lp2&&rp2&&arr2){
                char var[64]={0}; strncpy(var,line+5,lp2-line-5);
                char *vp=var+strlen(var)-1; while(vp>var&&*vp==' ')vp--;vp[1]=0;
                char cond[64]={0}; strncpy(cond,lp2+1,rp2-lp2-1);
                char tgt2[64]={0}; strcpy(tgt2,arr2+4);
                char *tp2=tgt2+strlen(tgt2)-1;
                while(tp2>tgt2&&(*tp2==' '||*tp2=='\n'))tp2--;tp2[1]=0;
                out->arr=realloc(out->arr,sizeof(BVal)*(out->arr_len+1));
                char b1[128]; snprintf(b1,sizeof(b1),"LOAD %s",var);
                out->arr[out->arr_len++]=make_str(b1); out->num=out->arr_len;
                out->arr=realloc(out->arr,sizeof(BVal)*(out->arr_len+1));
                char b2[128]; snprintf(b2,sizeof(b2),"LOAD %s",cond);
                out->arr[out->arr_len++]=make_str(b2); out->num=out->arr_len;
                out->arr=realloc(out->arr,sizeof(BVal)*(out->arr_len+1));
                out->arr[out->arr_len++]=make_str("JUMP_IF_0 END"); out->num=out->arr_len;
                out->arr=realloc(out->arr,sizeof(BVal)*(out->arr_len+1));
                char b3[128]; snprintf(b3,sizeof(b3),"STORE %s",tgt2);
                out->arr[out->arr_len++]=make_str(b3); out->num=out->arr_len;
            }
        }
    }
}


static void nat_spawn_file(BVal *stack, int argc, BVal *out) {
    BVal path = stack[0];
    if(!path.str){*out=make_num(0);return;}
    pid_t pid = fork();
    if(pid==0){
        chdir("/data/data/com.termux/files/home/t-lang");
        execl("/data/data/com.termux/files/home/t-lang/t_bc",
              "/data/data/com.termux/files/home/t-lang/t_bc",
              path.str, NULL);
        exit(1);
    }
    if(pid>0) waitpid(pid,NULL,0);
    *out=make_num(1);
}


static void nat_outer_update(BVal *stack, int argc, BVal *out) {
    /* outer_update(mat, err, inp, lr, rows, cols) */
    if(argc < 6) { *out = make_num(0); return; }
    BVal mat = stack[0];
    BVal err = stack[1];
    BVal inp = stack[2];
    double lr  = stack[3].num;
    int rows   = (int)stack[4].num;
    int cols   = (int)stack[5].num;
    if(!mat.arr || !err.arr || !inp.arr) { *out = make_num(0); return; }
    /* Create new matrix */
    BVal *res = calloc(rows*cols, sizeof(BVal));
    for(int i = 0; i < rows; i++) {
        double ei = (i < err.arr_len) ? err.arr[i].num : 0.0;
        for(int j = 0; j < cols; j++) {
            double wij = (i*cols+j < mat.arr_len) ? mat.arr[i*cols+j].num : 0.0;
            double xj  = (j < inp.arr_len) ? inp.arr[j].num : 0.0;
            res[i*cols+j].type = VT_NUM;
            res[i*cols+j].num  = wij - lr * ei * xj;
        }
    }
    out->type = VT_ARR;
    out->arr = res;
    out->arr_len = rows*cols;
    out->num = rows*cols;
}

void register_all_natives(VM *vm) {
    TFunc*f;
    {TFunc*f2=&vm->funcs[vm->func_count++];strcpy(f2->name,"arr_filter_not_starts");f2->is_native=4;f2->native_v=nat_filter_not_starts;f2->param_count=2;strcpy(f2->params[0],"arr");strcpy(f2->params[1],"prefix");}
    {TFunc*f2=&vm->funcs[vm->func_count++];strcpy(f2->name,"arr_filter_starts");f2->is_native=4;f2->native_v=nat_filter_starts;f2->param_count=2;strcpy(f2->params[0],"arr");strcpy(f2->params[1],"prefix");}
    {TFunc*f2=&vm->funcs[vm->func_count++];strcpy(f2->name,"join");f2->is_native=4;f2->native_v=nat_join;f2->param_count=2;strcpy(f2->params[0],"arr");strcpy(f2->params[1],"sep");}
    {TFunc*f2=&vm->funcs[vm->func_count++];strcpy(f2->name,"write_file_t");f2->is_native=4;f2->native_v=nat_write_file;f2->param_count=2;strcpy(f2->params[0],"path");strcpy(f2->params[1],"content");}
    {TFunc*f2=&vm->funcs[vm->func_count++];strcpy(f2->name,"sqrt");f2->is_native=4;f2->native_v=nat_sqrt_v;f2->param_count=1;strcpy(f2->params[0],"val");}
    {TFunc*f2=&vm->funcs[vm->func_count++];strcpy(f2->name,"exp");f2->is_native=4;f2->native_v=nat_exp_v;f2->param_count=1;strcpy(f2->params[0],"val");}
    {TFunc*f2=&vm->funcs[vm->func_count++];strcpy(f2->name,"_trim_c");f2->is_native=4;f2->native_v=nat_trim_v;f2->param_count=1;strcpy(f2->params[0],"str");}
    {TFunc*f2=&vm->funcs[vm->func_count++];strcpy(f2->name,"charCode");f2->is_native=4;f2->native_v=nat_charcode;f2->param_count=1;strcpy(f2->params[0],"str");}
    {TFunc*f2=&vm->funcs[vm->func_count++];strcpy(f2->name,"fromChar");f2->is_native=4;f2->native_v=nat_fromchar;f2->param_count=1;strcpy(f2->params[0],"val");}
    #define REG_S1(_nm,fn,p0) {TFunc*_rf=&vm->funcs[vm->func_count++];strcpy(_rf->name,_nm);_rf->is_native=2;_rf->native_s=fn;_rf->param_count=1;strcpy(_rf->params[0],p0);}
    #define REG_S2(_nm,fn,p0,p1) {TFunc*_rf=&vm->funcs[vm->func_count++];strcpy(_rf->name,_nm);_rf->is_native=2;_rf->native_s=fn;_rf->param_count=2;strcpy(_rf->params[0],p0);strcpy(_rf->params[1],p1);}
    {TFunc*f2=&vm->funcs[vm->func_count++];strcpy(f2->name,"slice");f2->is_native=4;f2->native_v=nat_slice_val;f2->param_count=3;strcpy(f2->params[0],"str");strcpy(f2->params[1],"from");strcpy(f2->params[2],"to");}
    {TFunc*f2=&vm->funcs[vm->func_count++];strcpy(f2->name,"chars");f2->is_native=4;f2->native_v=nat_chars_val;f2->param_count=1;strcpy(f2->params[0],"str");}
    REG_S1("tcon_query",nat_tcon_query,"query")
    {TFunc*f2=&vm->funcs[vm->func_count++];strcpy(f2->name,"split");f2->is_native=4;f2->native_v=nat_split_val;f2->param_count=2;strcpy(f2->params[0],"str");strcpy(f2->params[1],"sep");}
    {TFunc*f2=&vm->funcs[vm->func_count++];strcpy(f2->name,"sort");f2->is_native=4;f2->native_v=nat_sort_c;f2->param_count=1;strcpy(f2->params[0],"arr");}
    {TFunc*f2=&vm->funcs[vm->func_count++];strcpy(f2->name,"range");f2->is_native=4;f2->native_v=nat_range_c;f2->param_count=1;strcpy(f2->params[0],"n");}
    REG_S2("replace_first", nat_nat_replace, "str","from")
    REG_S2("split_first", nat_split_first, "str","sep")
    /* Mixed natives */
    {TFunc*f2=&vm->funcs[vm->func_count++];strcpy(f2->name,"outer_update");f2->is_native=4;f2->native_v=nat_outer_update;f2->param_count=6;strcpy(f2->params[0],"mat");strcpy(f2->params[1],"err");strcpy(f2->params[2],"inp");strcpy(f2->params[3],"lr");strcpy(f2->params[4],"rows");strcpy(f2->params[5],"cols");}
    {TFunc*f2=&vm->funcs[vm->func_count++];strcpy(f2->name,"spawn_file");f2->is_native=4;f2->native_v=nat_spawn_file;f2->param_count=1;strcpy(f2->params[0],"fpath");}
    {TFunc*f2=&vm->funcs[vm->func_count++];strcpy(f2->name,"compile_all");f2->is_native=4;f2->native_v=nat_compile_all;f2->param_count=1;strcpy(f2->params[0],"lines");}
    {TFunc*f2=&vm->funcs[vm->func_count++];strcpy(f2->name,"fat_arrow");f2->is_native=4;f2->native_v=nat_fat_arrow;f2->param_count=2;strcpy(f2->params[0],"data");strcpy(f2->params[1],"dest");}
    {TFunc*f2=&vm->funcs[vm->func_count++];strcpy(f2->name,"par_spawn");f2->is_native=4;f2->native_v=nat_par_spawn;f2->param_count=1;strcpy(f2->params[0],"files");}
    {TFunc*f2=&vm->funcs[vm->func_count++];strcpy(f2->name,"lower");f2->is_native=2;f2->native_s=nat_lower;f2->param_count=1;strcpy(f2->params[0],"str");}
    {TFunc*f2=&vm->funcs[vm->func_count++];strcpy(f2->name,"upper");f2->is_native=2;f2->native_s=nat_upper;f2->param_count=1;strcpy(f2->params[0],"str");}

    {TFunc*f2=&vm->funcs[vm->func_count++];strcpy(f2->name,"softmax_n");f2->is_native=4;f2->native_v=native_softmax_n;f2->param_count=1;strcpy(f2->params[0],"arr");}
    {TFunc*f2=&vm->funcs[vm->func_count++];strcpy(f2->name,"embed_n");f2->is_native=4;f2->native_v=native_embed_n;f2->param_count=3;strcpy(f2->params[0],"cid");strcpy(f2->params[1],"tbl");strcpy(f2->params[2],"dim");}
    {TFunc*f2=&vm->funcs[vm->func_count++];strcpy(f2->name,"mat_update_flat");f2->is_native=4;f2->native_v=native_mat_update_flat;f2->param_count=3;strcpy(f2->params[0],"mat");strcpy(f2->params[1],"grad");strcpy(f2->params[2],"lrv");}

    {TFunc*f2=&vm->funcs[vm->func_count++];strcpy(f2->name,"argmax_n");f2->is_native=4;f2->native_v=native_argmax_n;f2->param_count=1;strcpy(f2->params[0],"arr");}
    {TFunc*f2=&vm->funcs[vm->func_count++];strcpy(f2->name,"mat_mmv");f2->is_native=4;f2->native_v=native_mat_mmv;f2->param_count=3;strcpy(f2->params[0],"src");strcpy(f2->params[1],"sz");strcpy(f2->params[2],"inp");}
    f=&vm->funcs[vm->func_count++];
    strcpy(f->name,"len"); f->is_native=3; f->native_m=nat_len_mix;
    f->param_count=1; strcpy(f->params[0],"val");
    f=&vm->funcs[vm->func_count++];
    strcpy(f->name,"push"); f->is_native=4; f->native_v=nat_push_val;
    f->param_count=2; strcpy(f->params[0],"arr"); strcpy(f->params[1],"val");
    f=&vm->funcs[vm->func_count++];
    strcpy(f->name,"get"); f->is_native=4; f->native_v=nat_get_val;
    REG_S1("md5",nat_md5_s,"str")
    REG_S1("sha256",nat_sha256_s,"str")
    f->param_count=2; strcpy(f->params[0],"arr"); strcpy(f->params[1],"idx");
    f=&vm->funcs[vm->func_count++];
    f=&vm->funcs[vm->func_count++];
    f=&vm->funcs[vm->func_count++];

    {TFunc*f2=&vm->funcs[vm->func_count++];strcpy(f2->name,"file_read");f2->is_native=4;f2->native_v=nat_file_read;f2->param_count=1;strcpy(f2->params[0],"path");}
    {TFunc*f2=&vm->funcs[vm->func_count++];strcpy(f2->name,"toNumber");f2->is_native=3;f2->native_m=nat_toNumber_mix;f2->param_count=1;strcpy(f2->params[0],"val");}
    #undef REG1
    #undef REG2
    #undef REG_S1
    #undef REG_S2
}


