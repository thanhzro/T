#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>

/* ===== TOKEN ===== */
typedef enum {
    TOKEN_SECTION,
    TOKEN_KEYWORD,
    TOKEN_COORD,
    TOKEN_OPERATOR,
    TOKEN_COMPARE,
    TOKEN_LOGIC,
    TOKEN_STRING,
    TOKEN_NUMBER,
    TOKEN_BOOL,
    TOKEN_IDENT,
    TOKEN_LPAREN, TOKEN_RPAREN,
    TOKEN_LBRACE, TOKEN_RBRACE,
    TOKEN_LBRACKET, TOKEN_RBRACKET,
    TOKEN_COMMA,
    TOKEN_EQUALS,
    TOKEN_EOF
} TokenType;

typedef struct {
    TokenType type;
    char value[256];
    int line;
} Token;

/* ===== LEXER ===== */
typedef struct {
    const char *src;
    int pos;
    int line;
} Lexer;

char peek(Lexer *l){
    return l->src[l->pos];
}

char advance(Lexer *l){
    return l->src[l->pos++];
}

int match(Lexer *l, const char *s){
    int len = strlen(s);
    if(strncmp(&l->src[l->pos], s, len)==0){
        l->pos += len;
        return 1;
    }
    return 0;
}

void error(Lexer *l, const char *msg){
    printf("Lex error line %d: %s\n", l->line, msg);
    exit(1);
}

Token make(TokenType t, const char *v, int line){
    Token tok;
    tok.type = t;
    strcpy(tok.value, v);
    tok.line = line;
    return tok;
}

/* ===== IDENT ===== */
Token lex_ident(Lexer *l){
    char buf[256]; int i=0;

    while(isalnum(peek(l)) || peek(l)=='.' || peek(l)=='-' || peek(l)=='_'){
        buf[i++] = advance(l);
    }
    buf[i]=0;

    /* keywords */
    const char *kw[] = {
        "past","now","shall","show","Gate","F",
        "func","return","ask","read","write","append","arr"
    };

    for(int j=0;j<13;j++){
        if(strcmp(buf,kw[j])==0)
            return make(TOKEN_KEYWORD,buf,l->line);
    }

    if(strcmp(buf,"true")==0 || strcmp(buf,"false")==0)
        return make(TOKEN_BOOL,buf,l->line);

    /* coord: có chữ + số */
    int hasDigit=0, hasAlpha=0;
    for(int k=0;k<strlen(buf);k++){
        if(isdigit(buf[k])) hasDigit=1;
        if(isalpha(buf[k])) hasAlpha=1;
    }
    if(hasDigit && hasAlpha)
        return make(TOKEN_COORD,buf,l->line);

    return make(TOKEN_IDENT,buf,l->line);
}

/* ===== NUMBER ===== */
Token lex_number(Lexer *l){
    char buf[256]; int i=0;

    while(isdigit(peek(l)) || peek(l)=='.'){
        buf[i++] = advance(l);
    }
    buf[i]=0;

    return make(TOKEN_NUMBER,buf,l->line);
}

/* ===== STRING ===== */
Token lex_string(Lexer *l){
    advance(l); // skip "
    char buf[256]; int i=0;

    while(peek(l)!='"' && peek(l)!=0){
        buf[i++] = advance(l);
    }
    if(peek(l)!='"') error(l,"Unterminated string");

    advance(l);
    buf[i]=0;

    return make(TOKEN_STRING,buf,l->line);
}

/* ===== MAIN LEX ===== */
Token* lex(const char *src, int *out_count){

    Lexer l = {src,0,1};

    Token *tokens = malloc(sizeof(Token)*1024);
    int count=0;

    while(peek(&l)!=0){

        char c = peek(&l);

        /* whitespace */
        if(c==' '||c=='\t'||c=='\r'){
            advance(&l); continue;
        }
        if(c=='\n'){
            l.line++; advance(&l); continue;
        }

        /* comment */
        if(c=='#'){
            while(peek(&l)!='\n' && peek(&l)!=0)
                advance(&l);
            continue;
        }

        /* SECTION */
        if(match(&l,"[T-]")){
            tokens[count++] = make(TOKEN_SECTION,"[T-]",l.line);
            continue;
        }
        if(match(&l,"[T0]")){
            tokens[count++] = make(TOKEN_SECTION,"[T0]",l.line);
            continue;
        }
        if(match(&l,"[T+]")){
            tokens[count++] = make(TOKEN_SECTION,"[T+]",l.line);
            continue;
        }

        /* multi-char operators */
        if(match(&l,">>")){
            tokens[count++] = make(TOKEN_OPERATOR,">>",l.line);
            continue;
        }
        if(match(&l,"<<")){
            tokens[count++] = make(TOKEN_OPERATOR,"<<",l.line);
            continue;
        }
        if(match(&l,"~>")){
            tokens[count++] = make(TOKEN_OPERATOR,"~>",l.line);
            continue;
        }
        if(match(&l,">=")){
            tokens[count++] = make(TOKEN_COMPARE,">=",l.line);
            continue;
        }
        if(match(&l,"<=")){
            tokens[count++] = make(TOKEN_COMPARE,"<=",l.line);
            continue;
        }
        if(match(&l,"==")){
            tokens[count++] = make(TOKEN_COMPARE,"==",l.line);
            continue;
        }
        if(match(&l,"!=")){
            tokens[count++] = make(TOKEN_COMPARE,"!=",l.line);
            continue;
        }
        if(match(&l,"&&")){
            tokens[count++] = make(TOKEN_LOGIC,"&&",l.line);
            continue;
        }
        if(match(&l,"||")){
            tokens[count++] = make(TOKEN_LOGIC,"||",l.line);
            continue;
        }

        /* single compare */
        if(c=='>'){
            advance(&l);
            tokens[count++] = make(TOKEN_COMPARE,">",l.line);
            continue;
        }
        if(c=='<'){
            advance(&l);
            tokens[count++] = make(TOKEN_COMPARE,"<",l.line);
            continue;
        }

        /* math operators */
        if(c=='+'||c=='-'||c=='*'||c=='/'){
            advance(&l);
            char buf[2]={c,0};
            tokens[count++] = make(TOKEN_OPERATOR,buf,l.line);
            continue;
        }

        /* symbols */
        if(c=='('){ advance(&l); tokens[count++]=make(TOKEN_LPAREN,"(",l.line); continue;}
        if(c==')'){ advance(&l); tokens[count++]=make(TOKEN_RPAREN,")",l.line); continue;}
        if(c=='{'){ advance(&l); tokens[count++]=make(TOKEN_LBRACE,"{",l.line); continue;}
        if(c=='}'){ advance(&l); tokens[count++]=make(TOKEN_RBRACE,"}",l.line); continue;}
        if(c=='['){ advance(&l); tokens[count++]=make(TOKEN_LBRACKET,"[",l.line); continue;}
        if(c==']'){ advance(&l); tokens[count++]=make(TOKEN_RBRACKET,"]",l.line); continue;}
        if(c==','){ advance(&l); tokens[count++]=make(TOKEN_COMMA,",",l.line); continue;}
        if(c=='='){ advance(&l); tokens[count++]=make(TOKEN_EQUALS,"=",l.line); continue;}

        /* string */
        if(c=='"'){
            tokens[count++] = lex_string(&l);
            continue;
        }

        /* number */
        if(isdigit(c)){
            tokens[count++] = lex_number(&l);
            continue;
        }

        /* ident / coord */
        if(isalpha(c)){
            tokens[count++] = lex_ident(&l);
            continue;
        }

        /* unknown */
        char msg[64];
        sprintf(msg,"Unknown token '%c'",c);
        error(&l,msg);
    }

    tokens[count++] = make(TOKEN_EOF,"",l.line);
    *out_count = count;
    return tokens;
}