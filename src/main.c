#include <stdio.h>
#include <signal.h>

#include <stdlib.h>

/* ===== Forward declarations ===== */

typedef struct Token Token;
typedef struct ProgramNode ProgramNode;

/* từ t_lexer.c */
Token* lex(const char *src, int *out_count);

/* từ t_parser.c */
ProgramNode* parse(Token *tokens, int count, const char *src);

/* từ t_vm.c */
void run_program(ProgramNode *prog);


/* ===== Read file ===== */
char* read_file(const char *path){

    FILE *f = fopen(path, "rb");

    if(!f){
        printf("Error: cannot open %s\n", path);
        exit(1);
    }

    fseek(f, 0, SEEK_END);
    long size = ftell(f);
    rewind(f);

    char *buffer = (char*)malloc(size + 1);

    if(!buffer){
        fclose(f);
        exit(1);
    }

    fread(buffer, 1, size, f);
    buffer[size] = '\0';

    fclose(f);
    return buffer;
}


/* ===== MAIN ===== */
void crash_handler(int sig){
    fprintf(stderr, "\nT Runtime Error: Segmentation fault (signal %d)\n", sig);
    fprintf(stderr, "Likely causes:\n");
    fprintf(stderr, "  - Infinite loop (loop without Gate termination)\n");
    fprintf(stderr, "  - Array index out of bounds\n");
    fprintf(stderr, "  - Arena overflow (too many allocations)\n");
    extern char t_last_op[]; extern int t_stmt_count;
    fprintf(stderr, "Last operation: %s (stmt #%d)\n", t_last_op, t_stmt_count);
    exit(1);
}

int main(int argc, char **argv){
    signal(SIGSEGV, crash_handler);
    signal(SIGABRT, crash_handler);

    if(argc < 2){
        printf("Usage: t <file.t>\n");
        return 1;
    }

    const char *filepath = argv[1];

    /* đọc source */
    char *source = read_file(filepath);

    /* lex */
    int token_count = 0;
    Token *tokens = lex(source, &token_count);

    /* parse */
    ProgramNode *program = parse(tokens, token_count, source);

    /* run */
    run_program(program);

    /* free cơ bản */
    free(tokens);
    free(source);
    free(program);

    return 0;
}