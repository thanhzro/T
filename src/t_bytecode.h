#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* ===== OPCODES ===== */
typedef enum {
    OP_PUSH_NUM,
    OP_PUSH_STR,
    OP_ADD, OP_SUB, OP_MUL, OP_DIV,
    OP_EQ, OP_LT, OP_GT,
    OP_LOAD, OP_STORE,
    OP_JUMP, OP_JUMP_IF_0,
    OP_CALL, OP_RETURN,
    OP_SHOW, OP_HALT
} OpCode;

/* ===== VALUE ===== */
typedef enum { VT_NUM, VT_STR, VT_ARR, VT_ERR } VType;
typedef struct {
    VType type;
    double num;
    char *str;   /* heap allocated! */
} BVal;

/* ===== CHUNK ===== */
typedef struct {
    uint8_t *code;
    int count, capacity;
    double *num_consts;
    int num_count;
    char **str_consts;
    int str_count;
} Chunk;

/* ===== STACK VM ===== */
#define STACK_MAX 256
#define FRAME_MAX 64

typedef struct {
    char keys[FRAME_MAX][64];
    BVal vals[FRAME_MAX];
    int count;
} Frame;

void frame_set(Frame *f, const char *k, BVal v){
    for(int i=0;i<f->count;i++)
        if(!strcmp(f->keys[i],k)){f->vals[i]=v;return;}
    strcpy(f->keys[f->count],k);
    f->vals[f->count++]=v;
}

BVal frame_get(Frame *f, const char *k){
    for(int i=0;i<f->count;i++)
        if(!strcmp(f->keys[i],k)) return f->vals[i];
    BVal err; err.type=VT_ERR; err.str=NULL; err.num=0;
    return err;
}
typedef struct {
    BVal stack[STACK_MAX];
    int top;
    Chunk *chunk;
    int ip;
    Frame frame;
} VM;

void chunk_write(Chunk *c, uint8_t byte) {
    if(c->count >= c->capacity) {
        c->capacity = c->capacity ? c->capacity*2 : 8;
        c->code = realloc(c->code, c->capacity);
    }
    c->code[c->count++] = byte;
}

int chunk_add_num(Chunk *c, double val) {
    c->num_consts = realloc(c->num_consts, sizeof(double)*(c->num_count+1));
    c->num_consts[c->num_count] = val;
    return c->num_count++;
}

BVal make_num(double n) { BVal v; v.type=VT_NUM; v.num=n; v.str=NULL; return v; }

void push(VM *vm, BVal v) { vm->stack[vm->top++] = v; }
BVal pop(VM *vm) { return vm->stack[--vm->top]; }

void run(VM *vm) {
    for(;;) {
        uint8_t op = vm->chunk->code[vm->ip++];
        switch(op) {
            case OP_PUSH_NUM: {
                int idx = vm->chunk->code[vm->ip++];
                push(vm, make_num(vm->chunk->num_consts[idx]));
                break;
            }
            case OP_ADD: { BVal b=pop(vm); BVal a=pop(vm); push(vm,make_num(a.num+b.num)); break; }
            case OP_SUB: { BVal b=pop(vm); BVal a=pop(vm); push(vm,make_num(a.num-b.num)); break; }
            case OP_MUL: { BVal b=pop(vm); BVal a=pop(vm); push(vm,make_num(a.num*b.num)); break; }
            case OP_DIV: { BVal b=pop(vm); BVal a=pop(vm); push(vm,make_num(a.num/b.num)); break; }
            case OP_GT:  { BVal b=pop(vm); BVal a=pop(vm); push(vm,make_num(a.num>b.num?1:0)); break; }
            case OP_LT:  { BVal b=pop(vm); BVal a=pop(vm); push(vm,make_num(a.num<b.num?1:0)); break; }
            case OP_EQ:  { BVal b=pop(vm); BVal a=pop(vm); push(vm,make_num(a.num==b.num?1:0)); break; }
            case OP_JUMP_IF_0: {
                int offset = vm->chunk->code[vm->ip++];
                BVal v = pop(vm);
                if(v.num == 0) vm->ip += offset;
                break;
            }
            case OP_JUMP: { int offset = vm->chunk->code[vm->ip++]; vm->ip += offset; break; }
            case OP_STORE: {
                int idx = vm->chunk->code[vm->ip++];
                frame_set(&vm->frame, vm->chunk->str_consts[idx], pop(vm));
                break;
            }
            case OP_LOAD: {
                int idx = vm->chunk->code[vm->ip++];
                push(vm, frame_get(&vm->frame, vm->chunk->str_consts[idx]));
                break;
            }
            case OP_SHOW: { BVal v=pop(vm); printf("%g\n",v.num); break; }
            case OP_HALT: return;
        }
    }
}


int chunk_add_str(Chunk *c, const char *s) {
    c->str_consts = realloc(c->str_consts, sizeof(char*)*(c->str_count+1));
    c->str_consts[c->str_count] = strdup(s);
    return c->str_count++;
}

void test3();
void test3() {
    /* x = 5; y = 3; z = x + y; show z  (expect 8) */
    Chunk chunk = {0};
    VM vm = {0};
    vm.chunk = &chunk;

    int n5 = chunk_add_num(&chunk, 5);
    int n3 = chunk_add_num(&chunk, 3);
    int sx = chunk_add_str(&chunk, "x");
    int sy = chunk_add_str(&chunk, "y");
    int sz = chunk_add_str(&chunk, "z");

    /* x = 5 */
    chunk_write(&chunk, OP_PUSH_NUM); chunk_write(&chunk, n5);
    chunk_write(&chunk, OP_STORE);    chunk_write(&chunk, sx);
    /* y = 3 */
    chunk_write(&chunk, OP_PUSH_NUM); chunk_write(&chunk, n3);
    chunk_write(&chunk, OP_STORE);    chunk_write(&chunk, sy);
    /* z = x + y */
    chunk_write(&chunk, OP_LOAD);     chunk_write(&chunk, sx);
    chunk_write(&chunk, OP_LOAD);     chunk_write(&chunk, sy);
    chunk_write(&chunk, OP_ADD);
    chunk_write(&chunk, OP_STORE);    chunk_write(&chunk, sz);
    /* show z */
    chunk_write(&chunk, OP_LOAD);     chunk_write(&chunk, sz);
    chunk_write(&chunk, OP_SHOW);
    chunk_write(&chunk, OP_HALT);

    printf("Test3 (expect 8): ");
    run(&vm);
}
