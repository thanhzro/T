
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




double nat_sqrt_c(BVal *stack, int argc){
    if(argc<1) return 0;
    return sqrt(stack[0].num);
}
double nat_floor_c(BVal *stack, int argc){
    if(argc<1) return 0;
    return floor(stack[0].num);
}
double nat_pow_c(BVal *stack, int argc){
    if(argc<2) return 0;
    return pow(stack[0].num, stack[1].num);
}
double nat_round_c(BVal *stack, int argc){
    if(argc<1) return 0;
    return round(stack[0].num);
}
double nat_ceil_c(BVal *stack, int argc){
    if(argc<1) return 0;
    return ceil(stack[0].num);
}


double nat_indexOf_n(BVal *stack, int argc){
    if(argc<2||!stack[0].str||!stack[1].str) return -1;
    char *pos=strstr(stack[0].str,stack[1].str);
    if(!pos) return -1;
    return (double)(pos-stack[0].str);
}
char* nat_indexOf_s(char**a,int n){
    if(n<2||!a[0]||!a[1]) return strdup("-1");
    char *pos=strstr(a[0],a[1]);
    if(!pos) return strdup("-1");
    char buf[32]; snprintf(buf,31,"%d",(int)(pos-a[0]));
    return strdup(buf);
}

double nat_max2_c(BVal *stack, int argc){
    if(argc<2) return 0;
    return stack[0].num > stack[1].num ? stack[0].num : stack[1].num;
}
double nat_min2_c(BVal *stack, int argc){
    if(argc<2) return 0;
    return stack[0].num < stack[1].num ? stack[0].num : stack[1].num;
}

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

void nat_reverse_c(BVal *stack, int argc, BVal *out){
    if(argc<1||stack[0].type!=VT_ARR){if(argc>0)*out=stack[0];return;}
    int n=stack[0].arr_len;
    BVal *arr=(BVal*)calloc(n,sizeof(BVal));
    for(int i=0;i<n;i++) arr[i]=stack[0].arr[n-1-i];
    out->type=VT_ARR; out->arr=arr; out->arr_len=n;
}

char* nat_join_s(char**a,int n){
    /* a[0]=arr_as_str is not right - need BVal version */
    return strdup("");
}
void nat_join_val(BVal *stack, int argc, BVal *out){
    if(argc<1||stack[0].type!=VT_ARR){out->type=VT_STR;out->str=strdup("");return;}
    char *sep=argc>1&&stack[1].str?stack[1].str:"";
    int seplen=strlen(sep);
    int total=0;
    for(int i=0;i<stack[0].arr_len;i++){
        if(stack[0].arr[i].str) total+=strlen(stack[0].arr[i].str);
        if(i<stack[0].arr_len-1) total+=seplen;
    }
    char *r=calloc(total+1,1); int pos=0;
    for(int i=0;i<stack[0].arr_len;i++){
        if(stack[0].arr[i].str){int l=strlen(stack[0].arr[i].str);memcpy(r+pos,stack[0].arr[i].str,l);pos+=l;}
        if(i<stack[0].arr_len-1){memcpy(r+pos,sep,seplen);pos+=seplen;}
    }
    out->type=VT_STR; out->str=r;
}

double nat_safe_div_auto(BVal *stack, int argc){
    if(argc<1) return 0;
    if(argc<2||stack[1].num==0) return 0;
    return stack[0].num/stack[1].num;
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
void nat_first_val(BVal *stack, int argc, BVal *out){
    if(argc<1||stack[0].type!=VT_ARR||stack[0].arr_len==0) return;
    *out=stack[0].arr[0];
}
void nat_last_val(BVal *stack, int argc, BVal *out){
    if(argc<1||stack[0].type!=VT_ARR||stack[0].arr_len==0) return;
    *out=stack[0].arr[stack[0].arr_len-1];
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

double nat_min_arr_c(BVal *stack, int argc){
    if(argc<1||stack[0].type!=VT_ARR||stack[0].arr_len==0) return 0;
    double m=stack[0].arr[0].num;
    for(int i=1;i<stack[0].arr_len;i++) if(stack[0].arr[i].num<m) m=stack[0].arr[i].num;
    return m;
}
double nat_max_arr_c(BVal *stack, int argc){
    if(argc<1||stack[0].type!=VT_ARR||stack[0].arr_len==0) return 0;
    double m=stack[0].arr[0].num;
    for(int i=1;i<stack[0].arr_len;i++) if(stack[0].arr[i].num>m) m=stack[0].arr[i].num;
    return m;
}
double nat_all_arr_c(BVal *stack, int argc){
    if(argc<1||stack[0].type!=VT_ARR) return 0;
    for(int i=0;i<stack[0].arr_len;i++) if(stack[0].arr[i].num==0) return 0;
    return 1;
}

double nat_is_error_c(BVal *stack, int argc){
    if(argc<1) return 0;
    if(stack[0].type!=VT_STR||!stack[0].str) return 0;
    return stack[0].str[0]=='!'?1:0;
}

char* nat_lower_auto(char**a,int n){
    if(n<1||!a[0]) return strdup("");
    char *r=strdup(a[0]);
    for(int i=0;r[i];i++) r[i]=tolower((unsigned char)r[i]);
    return r;
}

void nat_range_step(BVal *stack, int argc, BVal *out){
    double from=argc>0?stack[0].num:0;
    double to=argc>1?stack[1].num:0;
    double step=argc>2?stack[2].num:1;
    if(step==0){out->type=VT_ARR;out->arr_len=0;return;}
    int n=(int)((to-from)/step);
    if(n<0)n=0;
    BVal *arr=(BVal*)calloc(n,sizeof(BVal));
    for(int i=0;i<n;i++){
        arr[i].type=VT_NUM;
        arr[i].num=from+i*step;
    }
    out->type=VT_ARR; out->arr=arr; out->arr_len=n;
}

void nat_range_c(BVal *stack, int argc, BVal *out){
    if(argc<1) return;
    int n=(int)stack[0].num;
    if(n<0)n=0;
    BVal *arr=(BVal*)calloc(n,sizeof(BVal));
    for(int i=0;i<n;i++){
        arr[i].type=VT_NUM;
        arr[i].num=i;
    }
    out->type=VT_ARR; out->arr=arr; out->arr_len=n;
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

double nat_arr_len_mix(BVal *stack, int argc){
    if(argc<1) return 0;
    if(stack[0].type==VT_ARR) return stack[0].arr_len;
    if(stack[0].type==VT_STR) return stack[0].str?strlen(stack[0].str):0;
    return 0;
}
double nat_toNumber_mix(BVal *stack, int argc){
    if(argc<1) return 0;
    if(stack[0].type==VT_NUM) return stack[0].num;
    if(stack[0].str) return atof(stack[0].str);
    return 0;
}
double nat_isNumber_mix(BVal *stack, int argc){
    if(argc<1) return 0;
    return stack[0].type==VT_NUM?1:0;
}
double nat_isString_mix(BVal *stack, int argc){
    if(argc<1) return 0;
    return stack[0].type==VT_STR?1:0;
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
char* nat_concat(char**a,int n){
    char buf[4096];
    snprintf(buf,sizeof(buf),"%s%s",a[0],a[1]);
    return strdup(buf);
}

double nat_write_mix(BVal *stack, int argc){
    if(argc<2) return 0;
    const char *content = stack[0].type==VT_STR ? (stack[0].str?stack[0].str:"") : "";
    const char *fname   = stack[1].type==VT_STR ? (stack[1].str?stack[1].str:"") : "";
    if(!fname||!fname[0]) return 0;
    FILE *dbg=fopen("debug_write.txt","a"); if(dbg){fprintf(dbg,"content=[%s] fname=[%s]\n",content,fname);fclose(dbg);}
    char wcmd[4096];
    snprintf(wcmd,sizeof(wcmd),"echo '%s' >> '%s'",content,fname);
    int wr=system(wcmd);
    return wr==0?1:0;
}


char* nat_exec_s(char**a,int n){
    if(n<1||!a[0]) return strdup("");
    FILE *p=popen(a[0],"r");
    if(!p) return strdup("");
    char *buf=(char*)malloc(8192);
    int total=0,rd;
    while((rd=fread(buf+total,1,8191-total,p))>0) total+=rd;
    buf[total]=0; pclose(p);
    while(total>0&&(buf[total-1]==10||buf[total-1]==13)) buf[--total]=0;
    char *result=strdup(buf); free(buf);
    return result;
}




double nat_line_count(BVal *stack, int argc){
    if(argc<1||!stack[0].str) return 0;
    char *s=stack[0].str; int n=0;
    for(int i=0;s[i];i++) if(s[i]==10) n++;
    if(s[0]&&s[strlen(s)-1]!=10) n++;
    return n;
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







void nat_reverse_unified(BVal *stack, int argc, BVal *out){
    if(argc<1){out->type=VT_NUM;out->num=0;return;}
    if(stack[0].type==VT_ARR){
    } else {
        /* string reverse */
        const char *s=stack[0].str?stack[0].str:"";
        int l=strlen(s);
        char *r=(char*)malloc(l+1); r[l]=0;
        for(int i=0;i<l;i++) r[i]=s[l-1-i];
        out->type=VT_STR; out->str=r;
    }
}
void register_all_natives(VM *vm) {
    TFunc *f;
    #define REG_S1(nm, fn, p0) \
        f=&vm->funcs[vm->func_count++]; \
        strcpy(f->name,nm); f->is_native=2; f->native_s=fn; \
        f->param_count=1; strcpy(f->params[0],p0);
    #define REG_S2(nm, fn, p0, p1) \
        f=&vm->funcs[vm->func_count++]; \
        strcpy(f->name,nm); f->is_native=2; f->native_s=fn; \
        f->param_count=2; strcpy(f->params[0],p0); strcpy(f->params[1],p1);
    #define REG1(nm, fn, p0) \
        f=&vm->funcs[vm->func_count++]; \
        strcpy(f->name,nm); f->is_native=1; f->native=fn; \
        f->param_count=1; strcpy(f->params[0],p0);
    #define REG2(nm, fn, p0, p1) \
        f=&vm->funcs[vm->func_count++]; \
        strcpy(f->name,nm); f->is_native=1; f->native=fn; \
        f->param_count=2; strcpy(f->params[0],p0); strcpy(f->params[1],p1);

    /* Range - returns string encoded array */
    REG_S1("range_bc", nat_range_s, "n")
    REG_S1("upper", nat_upper, "str")
    REG_S1("lower", nat_lower, "str")
    REG_S1("trim",  nat_trim,  "str")
    REG_S2("concat",nat_concat,"a","b")
    REG_S1("exec_bc",nat_exec_s,"cmd")
    f=&vm->funcs[vm->func_count++];
    strcpy(f->name,"line_count"); f->is_native=3; f->native_m=nat_line_count;
    f->param_count=1; strcpy(f->params[0],"str");
    /* past(x) = identity - returns x as-is */
    f=&vm->funcs[vm->func_count++];
    f->param_count=1; strcpy(f->params[0],"val");
    /* toString - special: returns string from any type */
    f=&vm->funcs[vm->func_count++];
    strcpy(f->name,"toString"); f->is_native=2; f->native_s=NULL;
    f->param_count=1; strcpy(f->params[0],"val");
    f=&vm->funcs[vm->func_count++];
    strcpy(f->name,"write_file_t"); f->is_native=3; f->native_m=nat_write_mix;
    f->param_count=2; strcpy(f->params[0],"content"); strcpy(f->params[1],"fname");
    {TFunc*f2=&vm->funcs[vm->func_count++];strcpy(f2->name,"indexOf");f2->is_native=3;f2->native_m=nat_indexOf_n;f2->param_count=2;strcpy(f2->params[0],"str");strcpy(f2->params[1],"sub");}
    {TFunc*f2=&vm->funcs[vm->func_count++];strcpy(f2->name,"max");f2->is_native=3;f2->native_m=nat_max2_c;f2->param_count=2;strcpy(f2->params[0],"a");strcpy(f2->params[1],"b");}
    {TFunc*f2=&vm->funcs[vm->func_count++];strcpy(f2->name,"min");f2->is_native=3;f2->native_m=nat_min2_c;f2->param_count=2;strcpy(f2->params[0],"a");strcpy(f2->params[1],"b");}
    {TFunc*f2=&vm->funcs[vm->func_count++];strcpy(f2->name,"max2");f2->is_native=3;f2->native_m=nat_max2_c;f2->param_count=2;strcpy(f2->params[0],"a");strcpy(f2->params[1],"b");}
    {TFunc*f2=&vm->funcs[vm->func_count++];strcpy(f2->name,"min2");f2->is_native=3;f2->native_m=nat_min2_c;f2->param_count=2;strcpy(f2->params[0],"a");strcpy(f2->params[1],"b");}
    {TFunc*f2=&vm->funcs[vm->func_count++];strcpy(f2->name,"slice");f2->is_native=4;f2->native_v=nat_slice_val;f2->param_count=3;strcpy(f2->params[0],"str");strcpy(f2->params[1],"from");strcpy(f2->params[2],"to");}
    {TFunc*f2=&vm->funcs[vm->func_count++];strcpy(f2->name,"chars");f2->is_native=4;f2->native_v=nat_chars_val;f2->param_count=1;strcpy(f2->params[0],"str");}
    {TFunc*f2=&vm->funcs[vm->func_count++];strcpy(f2->name,"join");f2->is_native=4;f2->native_v=nat_join_val;f2->param_count=2;strcpy(f2->params[0],"arr");strcpy(f2->params[1],"sep");}
    {TFunc*f2=&vm->funcs[vm->func_count++];strcpy(f2->name,"safe_div");f2->is_native=3;f2->native_m=nat_safe_div_auto;f2->param_count=2;;strcpy(f2->params[0],"a");strcpy(f2->params[1],"b");}
    REG_S1("tcon_query",nat_tcon_query,"query")
    {TFunc*f2=&vm->funcs[vm->func_count++];strcpy(f2->name,"split");f2->is_native=4;f2->native_v=nat_split_val;f2->param_count=2;strcpy(f2->params[0],"str");strcpy(f2->params[1],"sep");}
    {TFunc*f2=&vm->funcs[vm->func_count++];strcpy(f2->name,"first");f2->is_native=4;f2->native_v=nat_first_val;f2->param_count=1;strcpy(f2->params[0],"arr");}
    {TFunc*f2=&vm->funcs[vm->func_count++];strcpy(f2->name,"last");f2->is_native=4;f2->native_v=nat_last_val;f2->param_count=1;strcpy(f2->params[0],"arr");}
    {TFunc*f2=&vm->funcs[vm->func_count++];strcpy(f2->name,"sort");f2->is_native=4;f2->native_v=nat_sort_c;f2->param_count=1;strcpy(f2->params[0],"arr");}
    {TFunc*f2=&vm->funcs[vm->func_count++];strcpy(f2->name,"sort_asc");f2->is_native=4;f2->native_v=nat_sort_c;f2->param_count=1;strcpy(f2->params[0],"arr");}
    {TFunc*f2=&vm->funcs[vm->func_count++];strcpy(f2->name,"min_arr");f2->is_native=3;f2->native_m=nat_min_arr_c;f2->param_count=1;strcpy(f2->params[0],"arr");}
    {TFunc*f2=&vm->funcs[vm->func_count++];strcpy(f2->name,"max_arr");f2->is_native=3;f2->native_m=nat_max_arr_c;f2->param_count=1;strcpy(f2->params[0],"arr");}
    {TFunc*f2=&vm->funcs[vm->func_count++];strcpy(f2->name,"all_arr");f2->is_native=3;f2->native_m=nat_all_arr_c;f2->param_count=1;strcpy(f2->params[0],"arr");}
    {TFunc*f2=&vm->funcs[vm->func_count++];strcpy(f2->name,"is_error");f2->is_native=3;f2->native_m=nat_is_error_c;f2->param_count=1;strcpy(f2->params[0],"val");}
    {TFunc*f2=&vm->funcs[vm->func_count++];strcpy(f2->name,"lower");f2->is_native=2;f2->native_s=nat_lower_auto;f2->param_count=1;;strcpy(f2->params[0],"str");}
    {TFunc*f2=&vm->funcs[vm->func_count++];strcpy(f2->name,"range_step");f2->is_native=4;f2->native_v=nat_range_step;f2->param_count=3;strcpy(f2->params[0],"from");strcpy(f2->params[1],"to");strcpy(f2->params[2],"step");}
    {TFunc*f2=&vm->funcs[vm->func_count++];strcpy(f2->name,"range");f2->is_native=4;f2->native_v=nat_range_c;f2->param_count=1;strcpy(f2->params[0],"n");}
    {TFunc*f=&vm->funcs[vm->func_count++];strcpy(f->name,"reverse");f->is_native=4;f->native_v=nat_reverse_c;f->param_count=1;strcpy(f->params[0],"arr");}
    {TFunc*f2=&vm->funcs[vm->func_count++];strcpy(f2->name,"floor");f2->is_native=3;f2->native_m=nat_floor_c;f2->param_count=1;strcpy(f2->params[0],"val");}
    {TFunc*f2=&vm->funcs[vm->func_count++];strcpy(f2->name,"round");f2->is_native=3;f2->native_m=nat_round_c;f2->param_count=1;strcpy(f2->params[0],"val");}
    {TFunc*f2=&vm->funcs[vm->func_count++];strcpy(f2->name,"ceil");f2->is_native=3;f2->native_m=nat_ceil_c;f2->param_count=1;strcpy(f2->params[0],"val");}
    {TFunc*f2=&vm->funcs[vm->func_count++];strcpy(f2->name,"pow");f2->is_native=3;f2->native_m=nat_pow_c;f2->param_count=2;strcpy(f2->params[0],"base");strcpy(f2->params[1],"exp");}
    {TFunc*f2=&vm->funcs[vm->func_count++];strcpy(f2->name,"sqrt");f2->is_native=3;f2->native_m=nat_sqrt_c;f2->param_count=1;strcpy(f2->params[0],"val");}
    {TFunc*f2=&vm->funcs[vm->func_count++];strcpy(f2->name,"sqrt_n");f2->is_native=3;f2->native_m=nat_sqrt_c;f2->param_count=1;strcpy(f2->params[0],"val");}
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
    strcpy(f->name,"arr_len"); f->is_native=3; f->native_m=nat_arr_len_mix;
    f->param_count=1; strcpy(f->params[0],"arr");
    f=&vm->funcs[vm->func_count++];
    f->param_count=1; strcpy(f->params[0],"val");
    f=&vm->funcs[vm->func_count++];
    strcpy(f->name,"isNumber"); f->is_native=3; f->native_m=nat_isNumber_mix;
    f->param_count=1; strcpy(f->params[0],"val");
    f=&vm->funcs[vm->func_count++];
    strcpy(f->name,"isString"); f->is_native=3; f->native_m=nat_isString_mix;
    f->param_count=1; strcpy(f->params[0],"val");
    f=&vm->funcs[vm->func_count++];
    f->param_count=2; strcpy(f->params[0],"str"); strcpy(f->params[1],"sub");

    #undef REG1
    #undef REG2
    #undef REG_S1
    #undef REG_S2
}
