#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "t_bytecode.h"

void compile_expr(Chunk *c, const char *expr) {
    char *end;
    double val = strtod(expr, &end);
    if(end != expr) {
        int idx = chunk_add_num(c, val);
        chunk_write(c, OP_PUSH_NUM);
        chunk_write(c, idx);
        return;
    }
    int idx = chunk_add_str(c, expr);
    chunk_write(c, OP_LOAD);
    chunk_write(c, idx);
}

void compile_assign(Chunk *c, const char *a, char op, const char *b, const char *target) {
    compile_expr(c, a);
    compile_expr(c, b);
    switch(op) {
        case '+': chunk_write(c, OP_ADD); break;
        case '-': chunk_write(c, OP_SUB); break;
        case '*': chunk_write(c, OP_MUL); break;
        case '/': chunk_write(c, OP_DIV); break;
    }
    int idx = chunk_add_str(c, target);
    chunk_write(c, OP_STORE);
    chunk_write(c, idx);
}

int main() {
    Chunk chunk = {0};
    VM vm = {0};
    vm.chunk = &chunk;

    compile_assign(&chunk, "3", '+', "4", "x");
    int ix = chunk_add_str(&chunk, "x");
    chunk_write(&chunk, OP_LOAD); chunk_write(&chunk, ix);
    chunk_write(&chunk, OP_SHOW);
    chunk_write(&chunk, OP_HALT);

    printf("Compiler test (expect 7): ");
    run(&vm);
    return 0;
}
