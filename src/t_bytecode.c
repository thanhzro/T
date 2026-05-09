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
typedef struct {
    BVal stack[STACK_MAX];
    int top;
    Chunk *chunk;
    int ip;
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
            case OP_SHOW: { BVal v=pop(vm); printf("%g\n",v.num); break; }
            case OP_HALT: return;
        }
    }
}

void test2();

/* Test: 2 + 3 * 4 = 14 */
int main() {
    Chunk chunk = {0};
    VM vm = {0};
    vm.chunk = &chunk;

    int i2 = chunk_add_num(&chunk, 2);
    int i3 = chunk_add_num(&chunk, 3);
    int i4 = chunk_add_num(&chunk, 4);

    chunk_write(&chunk, OP_PUSH_NUM); chunk_write(&chunk, i2);
    chunk_write(&chunk, OP_PUSH_NUM); chunk_write(&chunk, i3);
    chunk_write(&chunk, OP_PUSH_NUM); chunk_write(&chunk, i4);
    chunk_write(&chunk, OP_MUL);
    chunk_write(&chunk, OP_ADD);
    chunk_write(&chunk, OP_SHOW);
    chunk_write(&chunk, OP_HALT);

    run(&vm);
    test2();
    return 0;
}

/* Test 2: variable + conditional */
void test2() {
    Chunk chunk = {0};
    VM vm = {0};
    vm.chunk = &chunk;

    /* Thêm frame đơn giản */
    /* x = 10; if x > 5: show x */
    int i10 = chunk_add_num(&chunk, 10);
    int i5  = chunk_add_num(&chunk, 5);
    int i1  = chunk_add_num(&chunk, 1);

    /* PUSH 10, SHOW */
    chunk_write(&chunk, OP_PUSH_NUM); chunk_write(&chunk, i10);
    chunk_write(&chunk, OP_PUSH_NUM); chunk_write(&chunk, i5);
    /* GT: 10 > 5 = 1 */
    chunk_write(&chunk, OP_GT);
    /* JUMP_IF_0 → skip show */
    chunk_write(&chunk, OP_JUMP_IF_0); chunk_write(&chunk, 4);
    /* SHOW 10 */
    chunk_write(&chunk, OP_PUSH_NUM); chunk_write(&chunk, i10);
    chunk_write(&chunk, OP_SHOW);
    chunk_write(&chunk, OP_HALT);

    printf("Test2 (expect 10): ");
    run(&vm);
}
