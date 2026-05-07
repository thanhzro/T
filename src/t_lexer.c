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
    int col;
} Token;

/* ===== LEXER ===== */
typedef struct {
    const char *src;
    int pos;
    int line;
    int col;
} Lexer;

char peek(Lexer *l){
    return l->src[l->pos];
}

char advance(Lexer *l){
    char ch = l->src[l->pos++];
    if(ch=='\n'){ l->line++; l->col=1; } else l->col++;
    return ch;
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
    printf("Lex error line %d col %d: %s\n", l->line, l->col, msg);
    exit(1);
}

Token make(TokenType t, const char *v, int line, int col){
    Token tok;
    tok.type = t;
    strcpy(tok.value, v);
    tok.line = line;
    tok.col = col;
    return tok;
}

/* ===== IDENT ===== */
Token lex_ident(Lexer *l){
    char buf[256]; int i=0;

    while(isalnum(peek(l)) || peek(l)=='.' || peek(l)=='_'){
        buf[i++] = advance(l);
    }
    buf[i]=0;

    /* keywords */
    const char *kw[] = {
        "past","now","shall","show","Gate","F",
        "func","return","ask","read","write","append","arr","as","import","import"
    };

    for(int j=0;j<15;j++){
        if(strcmp(buf,kw[j])==0)
            return make(TOKEN_KEYWORD,buf,l->line,l->col);
    }

    if(strcmp(buf,"true")==0 || strcmp(buf,"false")==0)
        return make(TOKEN_BOOL,buf,l->line,l->col);

    /* coord: có chữ + số */
    int hasDigit=0, hasAlpha=0;
    for(int k=0;k<strlen(buf);k++){
        if(isdigit(buf[k])) hasDigit=1;
        if(isalpha(buf[k])) hasAlpha=1;
    }
    if(hasDigit && hasAlpha)
        return make(TOKEN_COORD,buf,l->line,l->col);

    return make(TOKEN_IDENT,buf,l->line,l->col);
}

/* ===== NUMBER ===== */
Token lex_number(Lexer *l){
    char buf[256]; int i=0;

    while(isdigit(peek(l)) || peek(l)=='.'){
        buf[i++] = advance(l);
    }
    buf[i]=0;

    return make(TOKEN_NUMBER,buf,l->line,l->col);
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

    return make(TOKEN_STRING,buf,l->line,l->col);
}

/* ===== MAIN LEX ===== */
Token* lex(const char *src, int *out_count){

    Lexer l = {src,0,1};

    int capacity=1024;
    Token *tokens = malloc(sizeof(Token)*capacity);
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
            if(count>=capacity-1){ capacity*=2; tokens=realloc(tokens,sizeof(Token)*capacity); }
        tokens[count++] = make(TOKEN_SECTION,"[T-]",l.line,l.col);
            continue;
        }
        if(match(&l,"[T0]")){
            if(count>=capacity-1){ capacity*=2; tokens=realloc(tokens,sizeof(Token)*capacity); }
        tokens[count++] = make(TOKEN_SECTION,"[T0]",l.line,l.col);
            continue;
        }
        if(match(&l,"[T+]")){
            if(count>=capacity-1){ capacity*=2; tokens=realloc(tokens,sizeof(Token)*capacity); }
        tokens[count++] = make(TOKEN_SECTION,"[T+]",l.line,l.col);
            continue;
        }

        /* multi-char operators */
        if(match(&l,">>")){
            if(count>=capacity-1){ capacity*=2; tokens=realloc(tokens,sizeof(Token)*capacity); }
        tokens[count++] = make(TOKEN_OPERATOR,">>",l.line,l.col);
            continue;
        }
        if(match(&l,"<<")){
            if(count>=capacity-1){ capacity*=2; tokens=realloc(tokens,sizeof(Token)*capacity); }
        tokens[count++] = make(TOKEN_OPERATOR,"<<",l.line,l.col);
            continue;
        }
        if(match(&l,"~>")){
            if(count>=capacity-1){ capacity*=2; tokens=realloc(tokens,sizeof(Token)*capacity); }
        tokens[count++] = make(TOKEN_OPERATOR,"~>",l.line,l.col);
            continue;
        }
        if(match(&l,">=")){
            if(count>=capacity-1){ capacity*=2; tokens=realloc(tokens,sizeof(Token)*capacity); }
        tokens[count++] = make(TOKEN_COMPARE,">=",l.line,l.col);
            continue;
        }
        if(match(&l,"<=")){
            if(count>=capacity-1){ capacity*=2; tokens=realloc(tokens,sizeof(Token)*capacity); }
        tokens[count++] = make(TOKEN_COMPARE,"<=",l.line,l.col);
            continue;
        }
        if(match(&l,"==")){
            if(count>=capacity-1){ capacity*=2; tokens=realloc(tokens,sizeof(Token)*capacity); }
        tokens[count++] = make(TOKEN_COMPARE,"==",l.line,l.col);
            continue;
        }
        if(match(&l,"!=")){
            if(count>=capacity-1){ capacity*=2; tokens=realloc(tokens,sizeof(Token)*capacity); }
        tokens[count++] = make(TOKEN_COMPARE,"!=",l.line,l.col);
            continue;
        }
        if(match(&l,"&&")){
            if(count>=capacity-1){ capacity*=2; tokens=realloc(tokens,sizeof(Token)*capacity); }
        tokens[count++] = make(TOKEN_LOGIC,"&&",l.line,l.col);
            continue;
        }
        if(match(&l,"||")){
            if(count>=capacity-1){ capacity*=2; tokens=realloc(tokens,sizeof(Token)*capacity); }
        tokens[count++] = make(TOKEN_LOGIC,"||",l.line,l.col);
            continue;
        }

        /* single compare */
        if(c=='>'){
            advance(&l);
            if(count>=capacity-1){ capacity*=2; tokens=realloc(tokens,sizeof(Token)*capacity); }
        tokens[count++] = make(TOKEN_COMPARE,">",l.line,l.col);
            continue;
        }
        if(c=='<'){
            advance(&l);
            if(count>=capacity-1){ capacity*=2; tokens=realloc(tokens,sizeof(Token)*capacity); }
        tokens[count++] = make(TOKEN_COMPARE,"<",l.line,l.col);
            continue;
        }

        /* math operators */
        if(c=='-' && count>0 &&
           (tokens[count-1].type==TOKEN_EQUALS ||
            tokens[count-1].type==TOKEN_LPAREN ||
            tokens[count-1].type==TOKEN_LBRACKET ||
            tokens[count-1].type==TOKEN_COMMA ||
            tokens[count-1].type==TOKEN_OPERATOR) &&
           isdigit(l.src[l.pos+1])){
            advance(&l);
            char buf[256]; int i=0;
            buf[i++]='-';
            while(isdigit(peek(&l)) || peek(&l)=='.'){
                buf[i++]=advance(&l);
            }
            buf[i]=0;
            if(count>=capacity-1){ capacity*=2; tokens=realloc(tokens,sizeof(Token)*capacity); }
        tokens[count++]=make(TOKEN_NUMBER,buf,l.line,l.col);
            continue;
        }
        if(c=='+'||c=='-'||c=='*'||c=='/'||c=='%'){
            advance(&l);
            char buf[2]={c,0};
            if(count>=capacity-1){ capacity*=2; tokens=realloc(tokens,sizeof(Token)*capacity); }
        tokens[count++] = make(TOKEN_OPERATOR,buf,l.line,l.col);
            continue;
        }

        /* symbols */
        if(c=='('){ advance(&l); tokens[count++]=make(TOKEN_LPAREN,"(",l.line,l.col); continue;}
        if(c==')'){ advance(&l); tokens[count++]=make(TOKEN_RPAREN,")",l.line,l.col); continue;}
        if(c=='{'){ advance(&l); tokens[count++]=make(TOKEN_LBRACE,"{",l.line,l.col); continue;}
        if(c=='}'){ advance(&l); tokens[count++]=make(TOKEN_RBRACE,"}",l.line,l.col); continue;}
        if(c=='['){ advance(&l); tokens[count++]=make(TOKEN_LBRACKET,"[",l.line,l.col); continue;}
        if(c==']'){ advance(&l); tokens[count++]=make(TOKEN_RBRACKET,"]",l.line,l.col); continue;}
        if(c==','){ advance(&l); tokens[count++]=make(TOKEN_COMMA,",",l.line,l.col); continue;}
        if(c=='='){ advance(&l); tokens[count++]=make(TOKEN_EQUALS,"=",l.line,l.col); continue;}

        /* string */
        if(c=='"'){
            if(count>=capacity-1){ capacity*=2; tokens=realloc(tokens,sizeof(Token)*capacity); }
        tokens[count++] = lex_string(&l);
            continue;
        }

        /* number */
        if(isdigit(c)){
            if(count>=capacity-1){ capacity*=2; tokens=realloc(tokens,sizeof(Token)*capacity); }
        tokens[count++] = lex_number(&l);
            continue;
        }

        /* ident / coord */
        if(isalpha(c)){
            if(count>=capacity-1){ capacity*=2; tokens=realloc(tokens,sizeof(Token)*capacity); }
        tokens[count++] = lex_ident(&l);
            continue;
        }

        /* unknown */
        char msg[64];
        sprintf(msg,"Unknown token '%c'",c);
        error(&l,msg);
    }

    tokens[count++] = make(TOKEN_EOF,"",l.line,l.col);
    *out_count = count;
    return tokens;
}