#pragma once
/* Global iter state */
static void* _g_iter_arr[16];
static int _g_iter_is_arr[16];
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>

/* ===== OPCODES ===== */
typedef enum {
    OP_PUSH_NUM, OP_PUSH_STR, OP_PUSH_NIL, OP_PUSH_ARR,
    OP_LOAD, OP_STORE,
    OP_ADD, OP_SUB, OP_MUL, OP_DIV, OP_MOD, OP_NEG,
    OP_EQ, OP_LT, OP_GT, OP_LE, OP_GE,
    OP_JUMP, OP_JUMP_IF_0, OP_JUMP_IF_1,
    OP_CALL, OP_RETURN,
    OP_CONCAT, OP_TOSTR,
    OP_ITER_START, OP_ITER_NEXT, OP_ITER_END,
    OP_SHOW, OP_HALT
} OpCode;

/* ===== VALUE ===== */
typedef enum { VT_NUM, VT_STR, VT_ARR, VT_ERR } VType;
typedef struct BVal {
    VType type;
    double num;
    char *str;
    struct BVal *arr;
    int arr_len;
} BVal;

BVal make_num(double n){BVal v;v.type=VT_NUM;v.num=n;v.str=NULL;v.arr=NULL;v.arr_len=0;return v;}
BVal make_str(const char*s){BVal v;v.type=VT_STR;v.num=0;v.str=s?strdup(s):NULL;v.arr=NULL;v.arr_len=0;return v;}
BVal make_arr(int len){BVal v;v.type=VT_ARR;v.num=len;v.str=NULL;v.arr=len>0?(BVal*)calloc(len,sizeof(BVal)):NULL;v.arr_len=len;return v;}
void bval_free(BVal*v){if(v->str){free(v->str);v->str=NULL;}if(v->arr){free(v->arr);v->arr=NULL;}}
BVal bval_copy(BVal v){if(v.type==VT_STR&&v.str)return make_str(v.str);return v;}
BVal bval_concat(BVal a,BVal b){
    char buf[4096];
    snprintf(buf,sizeof(buf),"%s%s",a.str?a.str:"",b.str?b.str:"");
    return make_str(buf);
}
BVal bval_tostr(BVal v){
    if(v.type==VT_STR)return bval_copy(v);
    char buf[64];snprintf(buf,sizeof(buf),"%g",v.num);return make_str(buf);
}

/* ===== CHUNK ===== */
typedef struct {
    uint8_t *code; int count, capacity;
    double *num_consts; int num_count;
    char **str_consts; int str_count;
} Chunk;

void chunk_write(Chunk*c,uint8_t b){
    if(c->count>=c->capacity){c->capacity=c->capacity?c->capacity*2:8;c->code=realloc(c->code,c->capacity);}
    c->code[c->count++]=b;
}
int chunk_add_num(Chunk*c,double v){c->num_consts=realloc(c->num_consts,sizeof(double)*(c->num_count+1));c->num_consts[c->num_count]=v;return c->num_count++;}
int chunk_add_str(Chunk*c,const char*s){c->str_consts=realloc(c->str_consts,sizeof(char*)*(c->str_count+1));c->str_consts[c->str_count]=strdup(s);return c->str_count++;}

/* ===== FRAME ===== */
#define FRAME_MAX 64
typedef struct {
    char keys[FRAME_MAX][64];
    BVal vals[FRAME_MAX];
    int count;
} Frame;

void frame_set(Frame*f,const char*k,BVal*v){
    for(int i=0;i<f->count;i++){
        if(strcmp(f->keys[i],k)==0){
            f->vals[i].type=v->type; f->vals[i].num=v->num;
            f->vals[i].str=v->str; f->vals[i].arr=v->arr;
            f->vals[i].arr_len=v->arr_len; return;
        }
    }
    strcpy(f->keys[f->count],k);
    f->vals[f->count].type=v->type; f->vals[f->count].num=v->num;
    f->vals[f->count].str=v->str; f->vals[f->count].arr=v->arr;
    f->vals[f->count].arr_len=v->arr_len; f->count++;
}
void frame_get(Frame*f,const char*k,BVal*out){
    out->type=VT_NUM; out->num=0; out->str=NULL; out->arr=NULL; out->arr_len=0;
    for(int i=0;i<f->count;i++){
        if(strcmp(f->keys[i],k)==0){
            out->type=f->vals[i].type;
            out->num=f->vals[i].num;
            out->str=f->vals[i].str;
            out->arr=f->vals[i].arr;
            out->arr_len=f->vals[i].arr_len;
            return;
        }
    }
}

/* ===== FUNC REGISTRY ===== */
#define FUNC_MAX 256
typedef double (*NativeFn)(double *args, int argc);
typedef char* (*NativeStrFn)(char **sargs, int argc);
typedef double (*NativeMixFn)(BVal *stack, int argc);
/* Type 4: writes result directly to out BVal */
typedef void (*NativeValFn)(BVal *stack, int argc, BVal *out);
typedef struct TFunc {
    char name[64];
    char params[8][64];
    int param_count;
    int is_native;      /* 0=T func, 1=native num, 2=native str, 3=native mix */
    NativeFn native;
    NativeStrFn native_s;
    NativeMixFn native_m;
    NativeValFn native_v;
    Chunk chunk;
} TFunc;

/* ===== CALL FRAME ===== */
#define CALL_MAX 64
typedef struct { Frame frame; int return_ip; Chunk *return_chunk; } CallFrame;

/* ===== VM ===== */
#define STACK_MAX 256
typedef struct {
    BVal stack[STACK_MAX]; int top;
    Chunk *chunk; int ip;
    Frame frame;
    CallFrame calls[CALL_MAX]; int call_depth;
    TFunc funcs[FUNC_MAX]; int func_count;
    /* ITER stack */
    int iter_count[16];
    int iter_idx[16];
    int iter_top;

} VM;

void push(VM*vm,BVal v){
    vm->stack[vm->top].type=v.type;
    vm->stack[vm->top].num=v.num;
    vm->stack[vm->top].str=v.str;
    vm->stack[vm->top].arr=v.arr;
    vm->stack[vm->top].arr_len=v.arr_len;
    vm->top++;
}
BVal pop(VM*vm){return vm->stack[--vm->top];}

TFunc* vm_find_func(VM*vm,const char*name){
    for(int i=0;i<vm->func_count;i++)
        if(strcmp(vm->funcs[i].name,name)==0)return &vm->funcs[i];
    return NULL;
}

void run(VM*vm){
    for(;;){
        uint8_t op=vm->chunk->code[vm->ip++];
        switch(op){
            case OP_PUSH_NUM:{int i=vm->chunk->code[vm->ip++];push(vm,make_num(vm->chunk->num_consts[i]));break;}
            case OP_PUSH_STR:{int i=vm->chunk->code[vm->ip++];push(vm,make_str(vm->chunk->str_consts[i]));break;}
            case OP_LOAD:{int i=vm->chunk->code[vm->ip++];BVal _fg; frame_get(&vm->frame,vm->chunk->str_consts[i],&_fg); push(vm,_fg);break;}
            case OP_STORE:{int i=vm->chunk->code[vm->ip++];vm->top--;frame_set(&vm->frame,vm->chunk->str_consts[i],&vm->stack[vm->top]);break;}
            case OP_ADD:{
    vm->top--;
    BVal *rb=&vm->stack[vm->top];
    vm->top--;
    BVal *ra=&vm->stack[vm->top];
    if(ra->type==VT_STR||rb->type==VT_STR){
        char _ab[4096];
        const char *sa=ra->type==VT_STR&&ra->str?ra->str:"";
        const char *sb=rb->type==VT_STR&&rb->str?rb->str:"";
        snprintf(_ab,sizeof(_ab),"%s%s",sa,sb);
        vm->stack[vm->top].type=VT_STR;
        vm->stack[vm->top].num=0;
        vm->stack[vm->top].str=strdup(_ab);
        vm->stack[vm->top].arr=NULL;
        vm->stack[vm->top].arr_len=0;
    }else{
        vm->stack[vm->top].type=VT_NUM;
        vm->stack[vm->top].num=ra->num+rb->num;
        vm->stack[vm->top].str=NULL;
    }
    vm->top++;
    break;}
            case OP_SUB:{double b=vm->stack[--vm->top].num;double a=vm->stack[--vm->top].num;push(vm,make_num(a-b));break;}
            case OP_MUL:{double b=vm->stack[--vm->top].num;double a=vm->stack[--vm->top].num;push(vm,make_num(a*b));break;}
            case OP_DIV:{double b=vm->stack[--vm->top].num;double a=vm->stack[--vm->top].num;push(vm,make_num(b?a/b:0));break;}
            case OP_GT:{
    double b=vm->stack[--vm->top].num;
    double a=vm->stack[--vm->top].num;
    vm->stack[vm->top].type=VT_NUM;
    vm->stack[vm->top].num=(a>b)?1:0;
    vm->stack[vm->top].str=NULL;
    vm->stack[vm->top].arr=NULL;
    vm->stack[vm->top].arr_len=0;
    vm->top++;
    break;}
case OP_LE:{
    double b=vm->stack[--vm->top].num;
    double a=vm->stack[--vm->top].num;
    vm->stack[vm->top].type=VT_NUM;
    vm->stack[vm->top].num=(a<=b)?1:0;
    vm->stack[vm->top].str=NULL;
    vm->stack[vm->top].arr=NULL;
    vm->stack[vm->top].arr_len=0;
    vm->top++;
    break;}
case OP_GE:{
    double b=vm->stack[--vm->top].num;
    double a=vm->stack[--vm->top].num;
    vm->stack[vm->top].type=VT_NUM;
    vm->stack[vm->top].num=(a>=b)?1:0;
    vm->stack[vm->top].str=NULL;
    vm->stack[vm->top].arr=NULL;
    vm->stack[vm->top].arr_len=0;
    vm->top++;
    break;}
            case OP_LT:{
    double b=vm->stack[--vm->top].num;
    double a=vm->stack[--vm->top].num;
    vm->stack[vm->top].type=VT_NUM;
    vm->stack[vm->top].num=(a<b)?1:0;
    vm->stack[vm->top].str=NULL;
    vm->stack[vm->top].arr=NULL;
    vm->stack[vm->top].arr_len=0;
    vm->top++;
    break;}
            case OP_EQ:{
    double b=vm->stack[--vm->top].num;
    double a=vm->stack[--vm->top].num;
    vm->stack[vm->top].type=VT_NUM;
    vm->stack[vm->top].num=(a==b)?1:0;
    vm->stack[vm->top].str=NULL;
    vm->stack[vm->top].arr=NULL;
    vm->stack[vm->top].arr_len=0;
    vm->top++;
    break;}
            case OP_JUMP_IF_0:{int off=vm->chunk->code[vm->ip++];double v=vm->stack[--vm->top].num;if(v==0)vm->ip+=off;break;}
            case OP_JUMP:{int off=vm->chunk->code[vm->ip++];vm->ip+=off;break;}
            case OP_CALL:{
                int ni=vm->chunk->code[vm->ip++];
                int argc=vm->chunk->code[vm->ip++];
                const char*fname=vm->chunk->str_consts[ni];
                /* inline find - avoid vm_find_func return bug */
                TFunc*fn=NULL;
                for(int fi=0;fi<vm->func_count;fi++)
                    if(strcmp(vm->funcs[fi].name,fname)==0){fn=&vm->funcs[fi];break;}
                if(fn==NULL){
break;}
                if(fn->is_native==1){
                    int base=vm->top-argc;
                    double dargs[8];
                    for(int i=0;i<argc&&i<8;i++) dargs[i]=vm->stack[base+i].num;
                    vm->top-=argc;
                    double r=fn->native(dargs,argc);
                    vm->stack[vm->top].type=VT_NUM;
                    vm->stack[vm->top].num=r;
                    vm->stack[vm->top].str=NULL;
                    vm->top++;
                    break;
                }
                if(fn->is_native==4){
                    int base=vm->top-argc;
                    BVal out; memset(&out,0,sizeof(BVal));
                    fn->native_v(&vm->stack[base],argc,&out);
                    vm->top-=argc;
                    vm->stack[vm->top].type=out.type;
                    vm->stack[vm->top].num=out.num;
                    vm->stack[vm->top].str=out.str;
                    vm->stack[vm->top].arr=out.arr;
                    vm->stack[vm->top].arr_len=out.arr_len;
                    vm->top++;
                    break;
                }
                if(fn->is_native==3){
                    int base=vm->top-argc;
                    double r=fn->native_m(&vm->stack[base],argc);
                    vm->top-=argc;
                    vm->stack[vm->top].type=VT_NUM;
                    vm->stack[vm->top].num=r;
                    vm->stack[vm->top].str=NULL;
                    vm->top++;
                    break;
                }
                if(fn->is_native==2){
                    int base=vm->top-argc;
                    char *sargs[8];
                    for(int i=0;i<argc&&i<8;i++)
                        sargs[i]=vm->stack[base+i].str?vm->stack[base+i].str:"";
                    vm->top-=argc;
                    char *r=fn->native_s(sargs,argc);
                    vm->stack[vm->top].type=VT_STR;
                    vm->stack[vm->top].num=0;
                    vm->stack[vm->top].str=r?strdup(r):NULL;
                    vm->top++;
                    break;
                }
                CallFrame*cf=&vm->calls[vm->call_depth++];
                cf->frame=vm->frame;cf->return_ip=vm->ip;cf->return_chunk=vm->chunk;
                memset(&vm->frame,0,sizeof(Frame));
                for(int i=argc-1;i>=0;i--){
                    vm->top--;
                    if(i<fn->param_count)
                        frame_set(&vm->frame,fn->params[i],&vm->stack[vm->top]);
                }
                vm->chunk=&fn->chunk;vm->ip=0;
                break;
            }
            case OP_RETURN:{
                FILE*_rd=fopen("ret_dbg.txt","w");if(_rd){fprintf(_rd,"top=%d stack[top-1].num=%g\n",vm->top,vm->stack[vm->top-1].num);fclose(_rd);}
                vm->top--;
                int ret_top=vm->top;
                CallFrame*cf=&vm->calls[--vm->call_depth];
                vm->frame=cf->frame;vm->ip=cf->return_ip;vm->chunk=cf->return_chunk;
                vm->stack[vm->top].type=vm->stack[ret_top].type;
                vm->stack[vm->top].num=vm->stack[ret_top].num;
                vm->stack[vm->top].str=vm->stack[ret_top].str;
                vm->stack[vm->top].arr=vm->stack[ret_top].arr;
                vm->stack[vm->top].arr_len=vm->stack[ret_top].arr_len;
                vm->top++;
                break;
            }
            case OP_CONCAT:{
                int tb=--vm->top;
                int ta=--vm->top;
                char _cbuf[4096];
                snprintf(_cbuf,sizeof(_cbuf),"%s%s",
                    vm->stack[ta].str?vm->stack[ta].str:"",
                    vm->stack[tb].str?vm->stack[tb].str:"");
                vm->stack[vm->top].type=VT_STR;
                vm->stack[vm->top].num=0;
                vm->stack[vm->top].str=strdup(_cbuf);
                vm->stack[vm->top].arr=NULL;
                vm->stack[vm->top].arr_len=0;
                vm->top++;
                break;
            }
            case OP_TOSTR:{int ta=--vm->top;push(vm,bval_tostr(vm->stack[ta]));break;}
            case OP_ITER_START:{
                vm->top--;
                BVal *arr=&vm->stack[vm->top];
                int n=arr->arr_len>0?arr->arr_len:(int)arr->num;
                int inow=vm->chunk->code[vm->ip++];
                /* Store array ref */
                vm->iter_count[vm->iter_top]=n;
                vm->iter_idx[vm->iter_top]=0;
                /* Store array ptr - use iter_arr */
                /* Check by type - most reliable on ARM64 */
                int is_real_arr = (vm->stack[vm->top].type == VT_ARR);
                _g_iter_is_arr[vm->iter_top] = is_real_arr;
                _g_iter_arr[vm->iter_top] = is_real_arr ? (void*)vm->stack[vm->top].arr : NULL;

                vm->iter_top++;
                /* Set now = first element */
                if(_g_iter_is_arr[vm->iter_top-1] && n>0){
                    frame_set(&vm->frame,vm->chunk->str_consts[inow],&_g_iter_arr[vm->iter_top-1][0]);
                } else {
                    BVal _tmp=make_num(0); frame_set(&vm->frame,vm->chunk->str_consts[inow],&_tmp);
                }
                break;
            }
            case OP_ITER_NEXT:{
                int inow=vm->chunk->code[vm->ip++];
                int body=vm->chunk->code[vm->ip++];
                int top=vm->iter_top-1;
                vm->iter_idx[top]++;
                if(vm->iter_idx[top]>=vm->iter_count[top]){
                    vm->iter_top--;
                }else{
                    int idx=vm->iter_idx[top];
                    if(_g_iter_is_arr[top] && _g_iter_arr[top]){
                        /* Array iteration - use actual element value */
                        frame_set(&vm->frame,vm->chunk->str_consts[inow],&((BVal*)_g_iter_arr[top])[idx]);
                    } else {
                        /* Count iteration - use index as value */
                        BVal _ftmp=make_num((double)idx);
                        frame_set(&vm->frame,vm->chunk->str_consts[inow],&_ftmp);
                    }
                    vm->ip=body;
                }
                break;
            }
            case OP_PUSH_ARR:{
                int n=vm->chunk->code[vm->ip++];
                BVal *items=(BVal*)calloc(n,sizeof(BVal));
                for(int i=n-1;i>=0;i--){
                    vm->top--;
                    items[i].type=vm->stack[vm->top].type;
                    items[i].num=vm->stack[vm->top].num;
                    items[i].str=vm->stack[vm->top].str?strdup(vm->stack[vm->top].str):NULL;
                    items[i].arr=NULL; items[i].arr_len=0;
                }
                vm->stack[vm->top].type=VT_ARR;
                vm->stack[vm->top].num=n;
                vm->stack[vm->top].str=NULL;
                vm->stack[vm->top].arr=items;
                vm->stack[vm->top].arr_len=n;
                vm->top++;
                break;
            }
            case OP_SHOW:{
                vm->top--;
                BVal*v=&vm->stack[vm->top];
                if(v->type==VT_STR) printf("%s\n",v->str?v->str:"");
                else if(v->type==VT_ARR){
                    printf("[");
                    for(int i=0;i<v->arr_len;i++){
                        if(i>0)printf(", ");
                        if(v->arr[i].type==VT_STR) printf("%s",v->arr[i].str?v->arr[i].str:"");
                        else printf("%g",v->arr[i].num);
                    }
                    printf("]\n");
                }
                else printf("%g\n",v->num);
                break;
            }
            case OP_HALT:return;
        }
    }
}
