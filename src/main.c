#include <stdio.h>
#include <stdlib.h>

/* ===== Forward declarations ===== */

typedef struct Token Token;
typedef struct ProgramNode ProgramNode;

/* từ t_lexer.c */
Token* lex(const char *src, int *out_count);

/* từ t_parser.c */
ProgramNode* parse(Token *tokens, int count);

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
int main(int argc, char **argv){

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
    ProgramNode *program = parse(tokens, token_count);

    /* run */
    run_program(program);

    /* free cơ bản */
    free(tokens);
    free(source);
    free(program);

    return 0;
}