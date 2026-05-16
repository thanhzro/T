
#pragma once
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
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
void register_all_natives(VM *vm) {
    TFunc*f;
    {TFunc*f2=&vm->funcs[vm->func_count++];strcpy(f2->name,"arr_filter_starts");f2->is_native=4;f2->native_v=nat_filter_starts;f2->param_count=2;strcpy(f2->params[0],"arr");strcpy(f2->params[1],"prefix");}
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
    f=&vm->funcs[vm->func_count++];
    strcpy(f->name,"len"); f->is_native=3; f->native_m=nat_len_mix;
    f->param_count=1; strcpy(f->params[0],"val");
    f=&vm->funcs[vm->func_count++];
    f->param_count=2; strcpy(f->params[0],"str"); strcpy(f->params[1],"sub");
    f=&vm->funcs[vm->func_count++];
    f->param_count=2; strcpy(f->params[0],"str"); strcpy(f->params[1],"sub");
    f=&vm->funcs[vm->func_count++];
    strcpy(f->name,"push"); f->is_native=4; f->native_v=nat_push_val;
    f->param_count=2; strcpy(f->params[0],"arr"); strcpy(f->params[1],"val");
    f=&vm->funcs[vm->func_count++];
    strcpy(f->name,"get"); f->is_native=4; f->native_v=nat_get_val;
    REG_S1("md5",nat_md5_s,"str")
    REG_S1("sha256",nat_sha256_s,"str")
    REG_S1("md5",nat_md5_s,"str")
    REG_S1("sha256",nat_sha256_s,"str")
    REG_S1("md5",nat_md5_s,"str")
    REG_S1("sha256",nat_sha256_s,"str")
    REG_S1("md5",nat_md5_s,"str")
    REG_S1("sha256",nat_sha256_s,"str")
    f->param_count=2; strcpy(f->params[0],"arr"); strcpy(f->params[1],"idx");
    f=&vm->funcs[vm->func_count++];
    f=&vm->funcs[vm->func_count++];
    f->param_count=1; strcpy(f->params[0],"val");
    f=&vm->funcs[vm->func_count++];
    f=&vm->funcs[vm->func_count++];
    f=&vm->funcs[vm->func_count++];
    f->param_count=2; strcpy(f->params[0],"str"); strcpy(f->params[1],"sub");

    {TFunc*f2=&vm->funcs[vm->func_count++];strcpy(f2->name,"file_read");f2->is_native=4;f2->native_v=nat_file_read;f2->param_count=1;strcpy(f2->params[0],"path");}
    {TFunc*f2=&vm->funcs[vm->func_count++];strcpy(f2->name,"toNumber");f2->is_native=3;f2->native_m=nat_toNumber_mix;f2->param_count=1;strcpy(f2->params[0],"val");}
    #undef REG1
    #undef REG2
    #undef REG_S1
    #undef REG_S2
}
