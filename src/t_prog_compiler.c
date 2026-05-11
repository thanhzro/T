
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "t_bytecode.h"

/* Forward declarations */
void compile_expr(Chunk *c, const char *expr);
void compile_assign(Chunk *c, const char *a, char op, const char *b, const char *target);
void compile_line(Chunk *chunk, const char *line);

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

void compile_line(Chunk *chunk, const char *line) {
    char buf[256];
    strncpy(buf, line, 255);
    /* skip empty */
    char *p = buf;
    while(*p == ' ') p++;
    if(*p == 0 || *p == '#') return;

    /* show X */
    if(strncmp(p, "show ", 5) == 0) {
        compile_expr(chunk, p+5);
        chunk_write(chunk, OP_SHOW);
        return;
    }

    /* A op B >> target */
    char *arrow = strstr(buf, ">>");
    if(arrow) {
        *arrow = 0;
        char *target = arrow + 2;
        while(*target == ' ') target++;
        /* trim expr */
        char *expr = buf;
        while(*expr == ' ') expr++;
        int elen = strlen(expr);
        while(elen > 0 && expr[elen-1] == ' ') expr[--elen] = 0;

        char a[64], b[64]; char op = '+';
        if(sscanf(expr, "%s %c %s", a, &op, b) == 3) {
            compile_assign(chunk, a, op, b, target);
        } else {
            compile_expr(chunk, expr);
            int idx = chunk_add_str(chunk, target);
            chunk_write(chunk, OP_STORE);
            chunk_write(chunk, idx);
        }
    }
}


void compile_program(Chunk *c, const char *lines[], int n);

/* Read and compile a .t file */
int run_file(const char *path) {
    FILE *f = fopen(path, "r");
    if(!f){ fprintf(stderr, "Cannot open %s\n", path); return 1; }
    
    char *lines[1024];
    int count = 0;
    char buf[256];
    
    while(fgets(buf, sizeof(buf), f) && count < 1024) {
        /* strip newline */
        int len = strlen(buf);
        if(len > 0 && buf[len-1] == '\n') buf[len-1] = 0;
        /* skip T- T0 T+ section markers */
        if(buf[0] == '[') continue;
        /* skip import */
        if(strncmp(buf, "import", 6) == 0) continue;
        lines[count++] = strdup(buf);
    }
    fclose(f);
    
    Chunk chunk = {0};
    VM *vm = calloc(1, sizeof(VM));
    vm->chunk = &chunk;
    compile_program(&chunk, (const char**)lines, count);
    run(vm);
    free(vm);
    for(int i=0;i<count;i++) free(lines[i]);
    return 0;
}

/* Compile full T program from lines array */
void compile_program(Chunk *c, const char *lines[], int n) {
    for(int i=0;i<n;i++)
        compile_line(c, lines[i]);
    chunk_write(c, OP_HALT);
}

int main() {
    /* Test: full T-like program */
    const char *program[] = {
        "10 + 5 >> x",
        "x * 2 >> y",
        "y - 3 >> result",
        "show result"
    };

    Chunk c = {0};
    VM *vm = calloc(1, sizeof(VM));
    vm->chunk = &c;

    compile_program(&c, program, 4);

    printf("Program test (expect 27): ");
    run(vm);
    free(vm);

    /* Test 2: multi-show */
    const char *prog2[] = {
        "5 * 5 >> sq",
        "sq + 1 >> result",
        "show sq",
        "show result"
    };
    Chunk c2={0}; VM *vm2=calloc(1,sizeof(VM)); vm2->chunk=&c2;
    compile_program(&c2, prog2, 4);
    printf("Multi-show test (expect 25, 26):\n");
    run(vm2); free(vm2);

    /* Test file runner */
    printf("File runner test:\n");
    run_file("_bc_test.t");
    return 0;
}
