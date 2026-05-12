
#pragma once
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include "t_bytecode.h"

/* ===== NATIVE FUNCTIONS ===== */
double nat_floor(double*a,int n){return floor(a[0]);}
double nat_ceil(double*a,int n){return ceil(a[0]);}
double nat_sqrt(double*a,int n){return sqrt(a[0]);}
double nat_abs(double*a,int n){return fabs(a[0]);}
double nat_log(double*a,int n){return log(a[0]);}
double nat_sin(double*a,int n){return sin(a[0]);}
double nat_cos(double*a,int n){return cos(a[0]);}
double nat_exp(double*a,int n){return exp(a[0]);}
double nat_atan(double*a,int n){return atan(a[0]);}
double nat_atan2(double*a,int n){return atan2(a[0],a[1]);}
double nat_round(double*a,int n){return round(a[0]);}
double nat_pow(double*a,int n){return pow(a[0],a[1]);}
double nat_toNumber(double*a,int n){return a[0];}
double nat_len(double*a,int n){return a[0];}
double nat_isArray(double*a,int n){return 0;}
double nat_charCode(double*a,int n){return a[0];}



double nat_clamp(double*a,int n){
    double v=a[0],lo=a[1],hi=a[2];
    if(v<lo)return lo; if(v>hi)return hi; return v;
}
double nat_between(double*a,int n){
    return a[0]>=a[1]&&a[0]<=a[2]?1:0;
}
double nat_sign(double*a,int n){
    return a[0]>0?1:(a[0]<0?-1:0);
}
double nat_lerp(double*a,int n){
    return a[0]+(a[1]-a[0])*a[2];
}
double nat_safe_div(double*a,int n){
    return a[1]==0?0:a[0]/a[1];
}
double nat_is_even(double*a,int n){return fmod(a[0],2)==0?1:0;}
double nat_is_odd(double*a,int n){return fmod(a[0],2)!=0?1:0;}


/* Simple array encoding as comma-separated string */
double nat_range_d(double*a,int n){ return a[0]; }
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

double nat_sum_s(double*a,int n){
    /* sum of array encoded as string - handle later */
    return 0;
}

double nat_max2(double*a,int n){return a[0]>a[1]?a[0]:a[1];}
double nat_min2(double*a,int n){return a[0]<a[1]?a[0]:a[1];}
double nat_mod(double*a,int n){return fmod(a[0],a[1]);}
double nat_pi(double*a,int n){return 3.14159265358979323846;}

#include <ctype.h>

/* Mixed native: access full BVal stack */



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

double nat_get_mix(BVal *stack, int argc){
    if(argc<2) return 0;
    if(stack[0].type==VT_ARR){
        int idx=(int)stack[1].num;
        if(idx<0||idx>=stack[0].arr_len) return 0;
        return stack[0].arr[idx].num;
    }
    return 0;
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

char* nat_toString_mix_s(BVal *stack, int argc){
    if(argc<1) return strdup("");
    if(stack[0].type==VT_STR) return strdup(stack[0].str?stack[0].str:"");
    char buf[64]; snprintf(buf,63,"%.15g",stack[0].num);
    return strdup(buf);
}

typedef double (*NativeMixFn)(BVal *stack, int argc);

double nat_len_mix(BVal *stack, int argc){
    if(argc<1) return 0;
    if(stack[0].type==VT_STR) return stack[0].str?strlen(stack[0].str):0;
    return stack[0].num;
}
double nat_contains_mix(BVal *stack, int argc){
    if(argc<2||stack[0].type!=VT_STR||stack[1].type!=VT_STR) return 0;
    return strstr(stack[0].str, stack[1].str)?1:0;
}
double nat_starts_mix(BVal *stack, int argc){
    if(argc<2||stack[0].type!=VT_STR||stack[1].type!=VT_STR) return 0;
    return strncmp(stack[0].str,stack[1].str,strlen(stack[1].str))==0?1:0;
}
double nat_ends_mix(BVal *stack, int argc){
    if(argc<2||stack[0].type!=VT_STR||stack[1].type!=VT_STR) return 0;
    int sl=strlen(stack[0].str),el=strlen(stack[1].str);
    if(el>sl) return 0;
    return strcmp(stack[0].str+sl-el,stack[1].str)==0?1:0;
}


char* nat_str_len(char**a,int n){
    char buf[32]; snprintf(buf,31,"%d",(int)strlen(a[0])); return strdup(buf);
}
double nat_len_n(double*a,int n){return a[0];}

char* nat_reverse(char**a,int n){
    char *s=a[0]; int l=strlen(s);
    char *r=malloc(l+1); r[l]=0;
    for(int i=0;i<l;i++) r[i]=s[l-1-i];
    return r;
}
char* nat_substr(char**a,int n){
    /* a[0]=str, numeric from/to passed as str */
    return strdup(a[0]);
}
double nat_contains(double*a,int n){return a[0];}
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

double nat_write_file(double*a,int n){return 0;}
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


char* nat_toString_s(BVal *stack, int argc){
    if(argc<1) return strdup("0");
    if(stack[0].type==VT_STR) return strdup(stack[0].str?stack[0].str:"");
    char buf[64];
    double n=stack[0].num;
    if(n==(long long)n) snprintf(buf,63,"%lld",(long long)n);
    else snprintf(buf,63,"%g",n);
    return strdup(buf);
}


double nat_line_count(BVal *stack, int argc){
    if(argc<1||!stack[0].str) return 0;
    char *s=stack[0].str; int n=0;
    for(int i=0;s[i];i++) if(s[i]==10) n++;
    if(s[0]&&s[strlen(s)-1]!=10) n++;
    return n;
}
double nat_get_line(BVal *stack, int argc){
    return 0; /* placeholder - use exec grep instead */
}

/* ===== REGISTER ALL NATIVES ===== */
void nat_sort_val(BVal *stack, int argc, BVal *out){
    if(argc<1||stack[0].type!=VT_ARR){*out=stack[0];return;}
    int n=stack[0].arr_len;
    BVal *src=(BVal*)stack[0].arr;
    BVal *arr2=(BVal*)calloc(n,sizeof(BVal));
    for(int i=0;i<n;i++) arr2[i]=src[i];
    for(int i=0;i<n-1;i++)
        for(int j=0;j<n-1-i;j++){
            int sw=arr2[j].type==VT_STR?strcmp(arr2[j].str,arr2[j+1].str)>0:arr2[j].num>arr2[j+1].num;
            if(sw){BVal t=arr2[j];arr2[j]=arr2[j+1];arr2[j+1]=t;}
        }
    out->type=VT_ARR; out->arr=arr2; out->arr_len=n;
}
void nat_reverse_arr_val(BVal *stack, int argc, BVal *out){
    if(argc<1||stack[0].type!=VT_ARR){*out=stack[0];return;}
    int n=stack[0].arr_len;
    BVal *src=(BVal*)stack[0].arr;
    BVal *arr2=(BVal*)calloc(n,sizeof(BVal));
    for(int i=0;i<n;i++) arr2[i]=src[n-1-i];
    out->type=VT_ARR; out->arr=arr2; out->arr_len=n;
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

    REG1("floor",  nat_floor,  "val")
    REG1("ceil",   nat_ceil,   "val")
    REG1("sqrt",   nat_sqrt,   "val")
    REG1("abs",    nat_abs,    "val")
    REG1("log",    nat_log,    "val")
    REG1("ln",     nat_log,    "val")
    REG1("sin",    nat_sin,    "val")
    REG1("cos",    nat_cos,    "val")
    REG1("exp_e",  nat_exp,    "val")
    REG1("atan",   nat_atan,   "val")
    REG2("atan2",  nat_atan2,  "y","x")
    REG1("round",  nat_round,  "val")
    REG2("pow",    nat_pow,    "base","exp")
    REG2("max2",   nat_max2,   "a","b")
    REG2("min2",   nat_min2,   "a","b")
    REG2("fmod",   nat_mod,    "a","b")
    REG1("pi",     nat_pi,     "x")
    REG2("safe_div", nat_safe_div, "a","b")
    REG2("is_even",  nat_is_even,  "n","x")
    REG2("is_odd",   nat_is_odd,   "n","x")
    REG2("between",  nat_between,  "val","lo")
    REG2("lerp",     nat_lerp,     "a","b")
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
    strcpy(f->name,"past"); f->is_native=3; f->native_m=nat_toNumber_mix;
    f->param_count=1; strcpy(f->params[0],"val");
    /* toString - special: returns string from any type */
    f=&vm->funcs[vm->func_count++];
    strcpy(f->name,"toString"); f->is_native=2; f->native_s=NULL;
    f->param_count=1; strcpy(f->params[0],"val");
    f->native_m=(NativeMixFn)nat_toString_s;  /* reuse field */
    f=&vm->funcs[vm->func_count++];
    strcpy(f->name,"write_file_t"); f->is_native=3; f->native_m=nat_write_mix;
    f->param_count=2; strcpy(f->params[0],"content"); strcpy(f->params[1],"fname");
    REG_S1("reverse", nat_reverse, "str")
    REG_S2("replace_first", nat_nat_replace, "str","from")
    REG_S2("split_first", nat_split_first, "str","sep")
    /* Mixed natives */
    f=&vm->funcs[vm->func_count++];
    strcpy(f->name,"len"); f->is_native=3; f->native_m=nat_len_mix;
    f->param_count=1; strcpy(f->params[0],"val");
    f=&vm->funcs[vm->func_count++];
    strcpy(f->name,"contains"); f->is_native=3; f->native_m=nat_contains_mix;
    f->param_count=2; strcpy(f->params[0],"str"); strcpy(f->params[1],"sub");
    f=&vm->funcs[vm->func_count++];
    strcpy(f->name,"str_starts"); f->is_native=3; f->native_m=nat_starts_mix;
    f->param_count=2; strcpy(f->params[0],"str"); strcpy(f->params[1],"sub");
    f=&vm->funcs[vm->func_count++];
    strcpy(f->name,"push"); f->is_native=4; f->native_v=nat_push_val;
    f->param_count=2; strcpy(f->params[0],"arr"); strcpy(f->params[1],"val");
    f=&vm->funcs[vm->func_count++];
    strcpy(f->name,"get"); f->is_native=4; f->native_v=nat_get_val;
    {TFunc*f2=&vm->funcs[vm->func_count++];strcpy(f2->name,"sort");f2->is_native=4;f2->native_v=nat_sort_val;}
    {TFunc*f2=&vm->funcs[vm->func_count++];strcpy(f2->name,"reverse_arr");f2->is_native=4;f2->native_v=nat_reverse_arr_val;}
    {TFunc*f2=&vm->funcs[vm->func_count++];strcpy(f2->name,"sort");f2->is_native=4;f2->native_v=nat_sort_val;}
    f->param_count=2; strcpy(f->params[0],"arr"); strcpy(f->params[1],"idx");
    f=&vm->funcs[vm->func_count++];
    strcpy(f->name,"arr_len"); f->is_native=3; f->native_m=nat_arr_len_mix;
    f->param_count=1; strcpy(f->params[0],"arr");
    f=&vm->funcs[vm->func_count++];
    strcpy(f->name,"toNumber"); f->is_native=3; f->native_m=nat_toNumber_mix;
    f->param_count=1; strcpy(f->params[0],"val");
    f=&vm->funcs[vm->func_count++];
    strcpy(f->name,"isNumber"); f->is_native=3; f->native_m=nat_isNumber_mix;
    f->param_count=1; strcpy(f->params[0],"val");
    f=&vm->funcs[vm->func_count++];
    strcpy(f->name,"isString"); f->is_native=3; f->native_m=nat_isString_mix;
    f->param_count=1; strcpy(f->params[0],"val");
    f=&vm->funcs[vm->func_count++];
    strcpy(f->name,"str_ends"); f->is_native=3; f->native_m=nat_ends_mix;
    f->param_count=2; strcpy(f->params[0],"str"); strcpy(f->params[1],"sub");

    #undef REG1
    #undef REG2
    #undef REG_S1
    #undef REG_S2
}
