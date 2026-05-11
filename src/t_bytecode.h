#pragma once
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>

/* ===== OPCODES ===== */
typedef enum {
    OP_PUSH_NUM, OP_PUSH_STR, OP_PUSH_NIL,
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
typedef struct { VType type; double num; char *str; } BVal;

BVal make_num(double n){BVal v;v.type=VT_NUM;v.num=n;v.str=NULL;return v;}
BVal make_str(const char*s){BVal v;v.type=VT_STR;v.num=0;v.str=s?strdup(s):NULL;return v;}
void bval_free(BVal*v){if(v->str){free(v->str);v->str=NULL;}}
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

void frame_set(Frame*f,const char*k,BVal v){
    for(int i=0;i<f->count;i++){
        if(strcmp(f->keys[i],k)==0){f->vals[i]=v;return;}
    }
    strcpy(f->keys[f->count],k);f->vals[f->count++]=v;
}
void frame_get(Frame*f,const char*k,BVal*out){
    out->type=VT_NUM; out->num=0; out->str=NULL;
    for(int i=0;i<f->count;i++){
        if(strcmp(f->keys[i],k)==0){
            out->type=f->vals[i].type;
            out->num=f->vals[i].num;
            out->str=f->vals[i].str;
            return;
        }
    }
}

/* ===== FUNC REGISTRY ===== */
#define FUNC_MAX 256
typedef double (*NativeFn)(double *args, int argc);
typedef char* (*NativeStrFn)(char **sargs, int argc);
typedef struct TFunc {
    char name[64];
    char params[8][64];
    int param_count;
    int is_native;      /* 0=T func, 1=native num, 2=native str */
    NativeFn native;
    NativeStrFn native_s;
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

void push(VM*vm,BVal v){vm->stack[vm->top++]=v;}
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
            case OP_STORE:{int i=vm->chunk->code[vm->ip++];vm->top--;frame_set(&vm->frame,vm->chunk->str_consts[i],vm->stack[vm->top]);break;}
            case OP_ADD:{double b=vm->stack[--vm->top].num;double a=vm->stack[--vm->top].num;push(vm,make_num(a+b));break;}
            case OP_SUB:{double b=vm->stack[--vm->top].num;double a=vm->stack[--vm->top].num;push(vm,make_num(a-b));break;}
            case OP_MUL:{double b=vm->stack[--vm->top].num;double a=vm->stack[--vm->top].num;push(vm,make_num(a*b));break;}
            case OP_DIV:{double b=vm->stack[--vm->top].num;double a=vm->stack[--vm->top].num;push(vm,make_num(b?a/b:0));break;}
            case OP_GT:{double b=vm->stack[--vm->top].num;double a=vm->stack[--vm->top].num;push(vm,make_num(a>b?1:0));break;}
            case OP_LT:{double b=vm->stack[--vm->top].num;double a=vm->stack[--vm->top].num;push(vm,make_num(a<b?1:0));break;}
            case OP_EQ:{double b=vm->stack[--vm->top].num;double a=vm->stack[--vm->top].num;push(vm,make_num(a==b?1:0));break;}
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
                if(fn==NULL){fprintf(stderr,"!NO_FUNC(%s)\n",fname);break;}
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
                        frame_set(&vm->frame,fn->params[i],vm->stack[vm->top]);
                }
                vm->chunk=&fn->chunk;vm->ip=0;
                break;
            }
            case OP_RETURN:{
                BVal ret=pop(vm);
                CallFrame*cf=&vm->calls[--vm->call_depth];
                vm->frame=cf->frame;vm->ip=cf->return_ip;vm->chunk=cf->return_chunk;
                push(vm,ret);break;
            }
            case OP_CONCAT:{int tb=--vm->top;int ta=--vm->top;push(vm,bval_concat(vm->stack[ta],vm->stack[tb]));break;}
            case OP_TOSTR:{int ta=--vm->top;push(vm,bval_tostr(vm->stack[ta]));break;}
            case OP_ITER_START:{
                BVal arr=pop(vm);
                int n=(int)arr.num;
                int inow=vm->chunk->code[vm->ip++];
                vm->iter_count[vm->iter_top]=n;
                vm->iter_idx[vm->iter_top]=0;
                vm->iter_top++;
                frame_set(&vm->frame,vm->chunk->str_consts[inow],make_num(0));
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
                    frame_set(&vm->frame,vm->chunk->str_consts[inow],make_num(vm->iter_idx[top]));
                    vm->ip=body;
                }
                break;
            }
            case OP_SHOW:{vm->top--;BVal*v=&vm->stack[vm->top];if(v->type==VT_STR)printf("%s\n",v->str?v->str:"");else printf("%g\n",v->num);break;}
            case OP_HALT:return;
        }
    }
}
