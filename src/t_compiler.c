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


/* Parse "A op B >> target" và compile */
void compile_line(Chunk *chunk, const char *line) {
    char buf[256];
    strncpy(buf, line, 255);
    
    /* Split on >> */
    char *arrow = strstr(buf, ">>");
    if(!arrow) return;
    *arrow = 0;
    char *target = arrow + 2;
    while(*target == ' ') target++;
    
    /* Trim expr */
    char *expr = buf;
    while(*expr == ' ') expr++;
    int elen = strlen(expr);
    while(elen > 0 && expr[elen-1] == ' ') expr[--elen] = 0;
    
    /* Parse expr: A op B */
    char a[64], b[64];
    char op = '+';
    if(sscanf(expr, "%s %c %s", a, &op, b) == 3) {
        compile_assign(chunk, a, op, b, target);
    } else {
        /* Simple: just a value */
        compile_expr(chunk, expr);
        int idx = chunk_add_str(chunk, target);
        chunk_write(chunk, OP_STORE);
        chunk_write(chunk, idx);
    }
}


/* Compile multiple lines */
void compile_block(Chunk *chunk, const char *lines[], int n) {
    for(int i = 0; i < n; i++)
        compile_line(chunk, lines[i]);
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

    /* Test compile_line */
    Chunk c2 = {0}; VM vm2 = {0}; vm2.chunk = &c2;
    compile_line(&c2, "10 + 5 >> result");
    int ir = chunk_add_str(&c2, "result");
    chunk_write(&c2, OP_LOAD); chunk_write(&c2, ir);
    chunk_write(&c2, OP_SHOW);
    chunk_write(&c2, OP_HALT);
    printf("compile_line test (expect 15): ");
    run(&vm2);

    /* Test compile_block: 10+5>>x; x*2>>y; y-3>>result = 27 */
    Chunk c3 = {0}; VM vm3 = {0}; vm3.chunk = &c3;
    const char *block[] = {
        "10 + 5 >> x",
        "x * 2 >> y",
        "y - 3 >> result"
    };
    compile_block(&c3, block, 3);
    int ir2 = chunk_add_str(&c3, "result");
    chunk_write(&c3, OP_LOAD); chunk_write(&c3, ir2);
    chunk_write(&c3, OP_SHOW);
    chunk_write(&c3, OP_HALT);
    printf("compile_block test (expect 27): ");
    run(&vm3);

    /* Test heap strings */
    Chunk c4 = {0}; VM vm4 = {0}; vm4.chunk = &c4;
    /* push "hello" + " world" → concat → show */
    int is1 = chunk_add_str(&c4, "hello");
    int is2 = chunk_add_str(&c4, " world");
    chunk_write(&c4, OP_PUSH_STR); chunk_write(&c4, is1);
    chunk_write(&c4, OP_PUSH_STR); chunk_write(&c4, is2);
    chunk_write(&c4, OP_CONCAT);
    chunk_write(&c4, OP_SHOW);
    chunk_write(&c4, OP_HALT);
    printf("heap string test (expect hello world): ");
    run(&vm4);


    return 0;
}
