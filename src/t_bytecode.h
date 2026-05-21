#pragma once
/* Global iter state */
static void* _g_iter_arr[16];
static int _g_iter_is_arr[16];
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>
#include <math.h>

/* ===== OPCODES ===== */
typedef enum {
    OP_PUSH_NUM, OP_PUSH_STR, OP_PUSH_ARR,
    OP_LOAD, OP_STORE,
    OP_ADD, OP_SUB, OP_MUL, OP_DIV, OP_MOD, OP_NEG,
    OP_EQ, OP_NEQ, OP_LT, OP_GT, OP_LE, OP_GE,
    OP_JUMP, OP_JUMP_IF_0,
    OP_CALL, OP_RETURN,
    OP_CONCAT,
    OP_ITER_START, OP_ITER_NEXT,
    OP_TYPE_NUM, OP_TYPE_STR, OP_TYPE_ARR,
    OP_SHOW, OP_HALT,
    OP_PAR_BEGIN, OP_PAR_LINE, OP_PAR_END
} OpCode;

/* ===== VALUE ===== */
typedef enum { VT_NIL, VT_NUM, VT_STR, VT_ARR, VT_ERR } VType;
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
int chunk_add_num(Chunk*c,double v){for(int _i=0;_i<c->num_count;_i++){if(c->num_consts[_i]==v)return _i;}c->num_consts=realloc(c->num_consts,sizeof(double)*(c->num_count+1));c->num_consts[c->num_count]=v;return c->num_count++;}
int chunk_add_str(Chunk*c,const char*s){for(int _i=0;_i<c->str_count;_i++){if(strcmp(c->str_consts[_i],s)==0)return _i;}c->str_consts=realloc(c->str_consts,sizeof(char*)*(c->str_count+1));c->str_consts[c->str_count]=strdup(s);return c->str_count++;}

/* ===== FRAME ===== */
#define FRAME_MAX 2048
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
    out->type=VT_NIL; out->num=0; out->str=NULL; out->arr=NULL; out->arr_len=0;
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
#define FUNC_MAX 1024
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
#define STACK_MAX 4096
typedef struct {
    BVal stack[STACK_MAX]; int top;
    Chunk *chunk; int ip;
    pthread_mutex_t frame_lock;
    Frame frame;
    CallFrame calls[CALL_MAX]; int call_depth;
    TFunc *funcs; int func_count; int func_capacity;
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
        _g_current_ip=vm->ip; uint8_t op=vm->chunk->code[vm->ip++];
        extern int _g_trace; if(_g_trace) fprintf(stderr,"IP:%d OP:%d\n",_g_current_ip,op);
        switch(op){
            case OP_PUSH_NUM:{int i=(vm->chunk->code[vm->ip]<<8)|vm->chunk->code[vm->ip+1];vm->ip+=2;push(vm,make_num(vm->chunk->num_consts[i]));break;}
            case OP_PUSH_STR:{int i=(vm->chunk->code[vm->ip]<<8)|vm->chunk->code[vm->ip+1];vm->ip+=2;push(vm,make_str(vm->chunk->str_consts[i]));break;}
            case OP_LOAD:{int i=(vm->chunk->code[vm->ip]<<8)|vm->chunk->code[vm->ip+1];vm->ip+=2;BVal _fg; frame_get(&vm->frame,vm->chunk->str_consts[i],&_fg); push(vm,_fg);break;}
            case OP_STORE:{int i=(vm->chunk->code[vm->ip]<<8)|vm->chunk->code[vm->ip+1];vm->ip+=2;vm->top--;frame_set(&vm->frame,vm->chunk->str_consts[i],&vm->stack[vm->top]);break;}
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
            case OP_MOD:{double b=vm->stack[--vm->top].num;double a=vm->stack[--vm->top].num;push(vm,make_num(b?fmod(a,b):0));break;}
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
    BVal _bv=vm->stack[--vm->top];
    BVal _av=vm->stack[--vm->top];
    int _eq=0;
    if(_av.type==VT_STR && _bv.type==VT_STR)
        _eq=(_av.str&&_bv.str)?strcmp(_av.str,_bv.str)==0:(_av.str==_bv.str);
    else _eq=(_av.num==_bv.num)?1:0;
    vm->stack[vm->top].type=VT_NUM;
    vm->stack[vm->top].num=_eq;
    vm->stack[vm->top].str=NULL;
    vm->stack[vm->top].arr=NULL;
    vm->stack[vm->top].arr_len=0;
    vm->top++;
    break;}
case OP_NEQ:{
    BVal _bv=vm->stack[--vm->top];
    BVal _av=vm->stack[--vm->top];
    int _neq=0;
    if(_av.type==VT_STR && _bv.type==VT_STR)
        _neq=(_av.str&&_bv.str)?strcmp(_av.str,_bv.str)!=0:(_av.str!=_bv.str);
    else _neq=(_av.num!=_bv.num)?1:0;
    push(vm,make_num(_neq));break;}
case OP_NEG:{
    double a=vm->stack[--vm->top].num;
    vm->stack[vm->top].type=VT_NUM;
    vm->stack[vm->top].num=-a;
    vm->stack[vm->top].str=NULL;
    vm->stack[vm->top].arr=NULL;
    vm->stack[vm->top].arr_len=0;
    vm->top++; break;}
case OP_JUMP_IF_0:{int off=(int16_t)((vm->chunk->code[vm->ip]<<8)|vm->chunk->code[vm->ip+1]);vm->ip+=2;double v=vm->stack[--vm->top].num;if(v==0)vm->ip+=off;break;}
            case OP_JUMP:{int off=(int8_t)vm->chunk->code[vm->ip++];vm->ip+=off;break;}
            case OP_CALL:{
                int ni=(vm->chunk->code[vm->ip]<<8)|vm->chunk->code[vm->ip+1];vm->ip+=2;
                int argc=vm->chunk->code[vm->ip++];
                const char*fname=vm->chunk->str_consts[ni];
                /* inline find - avoid vm_find_func return bug */
                TFunc*fn=NULL;
                for(int fi=0;fi<vm->func_count;fi++)
                    if(strcmp(vm->funcs[fi].name,fname)==0){fn=&vm->funcs[fi];break;}
                if(fn==NULL){break;}
                strcpy(_g_current_func,fn->name); _g_current_ip=vm->ip;
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
        extern int _g_trace; if(_g_trace){
            fprintf(stderr,"[FRAME DUMP]\n");
            for(int _fi=0;_fi<vm->frame.count;_fi++)
                fprintf(stderr,"  %s = %g\n",vm->frame.keys[_fi],vm->frame.vals[_fi].num);
        }
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
                BVal _bva=bval_tostr(vm->stack[ta]);
                BVal _bvb=bval_tostr(vm->stack[tb]);
                snprintf(_cbuf,sizeof(_cbuf),"%s%s",
                    _bva.str?_bva.str:"",
                    _bvb.str?_bvb.str:"");
                vm->stack[vm->top].type=VT_STR;
                vm->stack[vm->top].num=0;
                vm->stack[vm->top].str=strdup(_cbuf);
                vm->stack[vm->top].arr=NULL;
                vm->stack[vm->top].arr_len=0;
                vm->top++;
                break;
            }
            case OP_ITER_START:{
                vm->top--;
                BVal *arr=&vm->stack[vm->top];
                int n=arr->arr_len>0?arr->arr_len:(int)arr->num;
                int inow=(vm->chunk->code[vm->ip]<<8)|vm->chunk->code[vm->ip+1];vm->ip+=2;
                /* Save outer now/idx before inner F() */
                char _saved_now_key[32]; snprintf(_saved_now_key,31,"_now_%d",vm->iter_top);
                char _saved_idx_key[32]; snprintf(_saved_idx_key,31,"_idx_%d",vm->iter_top);
                BVal _sv_now={0},_sv_idx={0};
                frame_get(&vm->frame,"now",&_sv_now);
                frame_get(&vm->frame,"idx",&_sv_idx);
                frame_set(&vm->frame,_saved_now_key,&_sv_now);
                frame_set(&vm->frame,_saved_idx_key,&_sv_idx);
                /* Store array ref */
                vm->iter_count[vm->iter_top]=n;
                vm->iter_idx[vm->iter_top]=0;
                /* Store array ptr - use iter_arr */
                /* Check by type - most reliable on ARM64 */
                int is_real_arr = (vm->stack[vm->top].type == VT_ARR);
                _g_iter_is_arr[vm->iter_top] = is_real_arr;
                _g_iter_arr[vm->iter_top] = is_real_arr ? (void*)vm->stack[vm->top].arr : NULL;

                vm->iter_top++;
                /* Set idx = 0 */
                {BVal _idx0=make_num(0);frame_set(&vm->frame,"idx",&_idx0);}
                /* Set now = first element */
                if(_g_iter_is_arr[vm->iter_top-1] && n>0){
                    frame_set(&vm->frame,vm->chunk->str_consts[inow],&_g_iter_arr[vm->iter_top-1][0]);
                } else {
                    BVal _tmp=make_num(0); frame_set(&vm->frame,vm->chunk->str_consts[inow],&_tmp);
                }
                break;
            }
            case OP_ITER_NEXT:{
                int inow=(vm->chunk->code[vm->ip]<<8)|vm->chunk->code[vm->ip+1];vm->ip+=2;
                int body=(vm->chunk->code[vm->ip]<<8)|vm->chunk->code[vm->ip+1];vm->ip+=2;
                int top=vm->iter_top-1;
                /* Write now back to array (F() mutate pattern) */
                if(_g_iter_is_arr[top] && _g_iter_arr[top]){
                    BVal _now_val={0};
                    frame_get(&vm->frame,vm->chunk->str_consts[inow],&_now_val);
                    ((BVal*)_g_iter_arr[top])[vm->iter_idx[top]]=_now_val;
                }
                /* Sync all frame vars back to outer frame */
                for(int _si=0;_si<vm->frame.count;_si++){
                    /* skip 'now' and 'done' - they are F() internal */
                    if(strcmp(vm->frame.keys[_si],"now")==0) continue;
                    if(strcmp(vm->frame.keys[_si],"done")==0) continue;
                }
                /* Check done flag - early exit from F() */
                BVal _done_val={0};
                frame_get(&vm->frame,"done",&_done_val);
                int _early_exit=(_done_val.num!=0);
                
                vm->iter_idx[top]++;
                if(_early_exit || vm->iter_idx[top]>=vm->iter_count[top]){
                    vm->iter_top--;
                    /* Restore outer now/idx */
                    char _rn_key[32]; snprintf(_rn_key,31,"_now_%d",vm->iter_top);
                    char _ri_key[32]; snprintf(_ri_key,31,"_idx_%d",vm->iter_top);
                    BVal _rn={0},_ri={0};
                    frame_get(&vm->frame,_rn_key,&_rn);
                    frame_get(&vm->frame,_ri_key,&_ri);
                    frame_set(&vm->frame,"now",&_rn);
                    frame_set(&vm->frame,"idx",&_ri);
                }else{
                    int idx=vm->iter_idx[top];
                    /* Update idx in frame */
                    {BVal _idxv=make_num((double)idx);frame_set(&vm->frame,"idx",&_idxv);}
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
                int n=(vm->chunk->code[vm->ip]<<8)|vm->chunk->code[vm->ip+1]; vm->ip+=2;
                BVal *items=(BVal*)calloc(n,sizeof(BVal));
                for(int i=n-1;i>=0;i--){
                    vm->top--;
                    items[i]=vm->stack[vm->top];
                    if(vm->stack[vm->top].str) items[i].str=strdup(vm->stack[vm->top].str);
                    if(vm->stack[vm->top].arr){
                        items[i].arr=(BVal*)malloc(vm->stack[vm->top].arr_len*sizeof(BVal));
                        memcpy(items[i].arr,vm->stack[vm->top].arr,vm->stack[vm->top].arr_len*sizeof(BVal));
                        items[i].arr_len=vm->stack[vm->top].arr_len;
                    }
                }
                vm->stack[vm->top].type=VT_ARR;
                vm->stack[vm->top].num=n;
                vm->stack[vm->top].str=NULL;
                vm->stack[vm->top].arr=items;
                vm->stack[vm->top].arr_len=n;
                vm->top++;
                break;
            }
            case OP_TYPE_NUM:{
                BVal v=vm->stack[--vm->top];
                BVal r=make_num(v.type==VT_NUM?1:0);
                push(vm,r); break;}
            case OP_TYPE_STR:{
                BVal v=vm->stack[--vm->top];
                BVal r=make_num(v.type==VT_STR?1:0);
                push(vm,r); break;}
            case OP_TYPE_ARR:{
                BVal v=vm->stack[--vm->top];
                BVal r=make_num(v.type==VT_ARR?1:0);
                push(vm,r); break;}
            
                
                case OP_SHOW:{
                vm->top--;
                BVal*v=&vm->stack[vm->top];
                /* Check if name was pushed before value */
                char _vname[64]="?";
                if(vm->top>0 && vm->stack[vm->top-1].type==VT_STR){
                    vm->top--;
                    if(vm->stack[vm->top].str) strncpy(_vname,vm->stack[vm->top].str,63);
                }
                if(v->type==VT_NIL){fprintf(stderr,"[Error] %s line %d: variable '%s' not found or empty\n  Check: var defined in T-? Param name conflict?\n",_g_current_file?_g_current_file:"?",_g_current_line,_vname);printf("!EMPTY_COORD(%s)\n",_vname);break;}
                if(v->type==VT_STR) printf("%s\n",v->str?v->str:"");
                else if(v->type==VT_ARR){
                    printf("[");
                    for(int i=0;i<v->arr_len;i++){
                        if(i>0)printf(", ");
                        if(v->arr[i].type==VT_STR) printf("%s",v->arr[i].str?v->arr[i].str:"");
                        else if(v->arr[i].type==VT_ARR){
                            printf("[");
                            for(int j=0;j<v->arr[i].arr_len;j++){
                                if(j>0)printf(", ");
                                if(v->arr[i].arr[j].type==VT_STR)printf("%s",v->arr[i].arr[j].str?v->arr[i].arr[j].str:"");
                                else printf("%g",v->arr[i].arr[j].num);
                            }
                            printf("]");
                        }
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
