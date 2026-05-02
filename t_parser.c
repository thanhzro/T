#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>

/* ===== TOKEN ===== */
typedef enum {
    TOKEN_SECTION, TOKEN_KEYWORD, TOKEN_COORD, TOKEN_OPERATOR,
    TOKEN_COMPARE, TOKEN_LOGIC, TOKEN_STRING, TOKEN_NUMBER,
    TOKEN_BOOL, TOKEN_IDENT,
    TOKEN_LPAREN, TOKEN_RPAREN, TOKEN_LBRACE, TOKEN_RBRACE,
    TOKEN_LBRACKET, TOKEN_RBRACKET,
    TOKEN_COMMA, TOKEN_EQUALS, TOKEN_EOF
} TokenType;

typedef struct {
    TokenType type;
    char value[256];
    int line;
} Token;

/* ===== NODE TYPES ===== */
typedef enum {
    NODE_ASSIGN,
    NODE_GATE,
    NODE_F,
    NODE_VAR_ASSIGN,
    NODE_ARRAY_ASSIGN,
    NODE_SHOW,
    NODE_ASK,
    NODE_FUNC_DEF,
    NODE_FUNC_CALL,
    NODE_RETURN,
    NODE_FILE_READ,
    NODE_FILE_WRITE
} NodeType;

/* ===== AST ===== */

typedef struct ExprNode {
    int type;
    char value[64];
    char op[4];
    struct ExprNode *l,*r;
} ExprNode;

typedef struct {
    NodeType node_type;
    ExprNode *expr;
    char target[64];
    int has_index;
    ExprNode *index;
} AssignNode;

typedef struct {
    NodeType node_type;
    char source[64];
    char op[4]; double value;
    char op2[4]; double value2;
    char logic[4];
    char target[64];
} GateNode;

typedef struct { NodeType node_type; char name[64]; ExprNode *expr; } VarAssignNode;
typedef struct { NodeType node_type; char name[64]; ExprNode **values; int count; } ArrayAssignNode;
typedef struct { NodeType node_type; char name[64]; char prompt[256]; } AskNode;
typedef struct { NodeType node_type; char source[64]; void **body; int body_count; } FNode;
typedef struct { NodeType node_type; char coord[64]; } ShowNode;

typedef struct {
    NodeType node_type;
    char name[64];
    char params[16][64];
    int param_count;
    void **body;
    int body_count;
} FuncDefNode;

typedef struct {
    NodeType node_type;
    char name[64];
    char arg_names[16][64];
    ExprNode *arg_values[16];
    int arg_count;
    char target[64];
} FuncCallNode;

typedef struct {
    NodeType node_type;
    ExprNode *expr;
} ReturnNode;

typedef struct {
    NodeType node_type;
    char path[256];
    char target[64];
} FileReadNode;

typedef struct {
    NodeType node_type;
    char path[256];
    char source[64];
    int append_mode;
} FileWriteNode;

typedef struct {
    void **tminus; int tminus_count;
    void **t0; int t0_count;
    void **tplus; int tplus_count;
} ProgramNode;

/* ===== PARSER ===== */

typedef struct {
    Token *tokens;
    int pos, count;
} Parser;

Token* parser_peek(Parser *p){ return &p->tokens[p->pos]; }
Token* parser_advance(Parser *p){ return &p->tokens[p->pos++]; }

int parser_match(Parser *p, TokenType t, const char *v){
    Token *tk = parser_peek(p);
    if(tk->type==t && (!v || strcmp(tk->value,v)==0)){
        parser_advance(p);
        return 1;
    }
    return 0;
}

void parser_error(Parser *p, const char *msg){
    printf("Parse error line %d: %s\n", parser_peek(p)->line, msg);
    exit(1);
}

/* ===== EXPR ===== */

ExprNode* new_expr(int type, const char *v){
    ExprNode *e=malloc(sizeof(ExprNode));
    e->type=type;
    if(v) strcpy(e->value,v);
    e->l=e->r=NULL;
    return e;
}

ExprNode* parse_expr(Parser *p);

ExprNode* parse_factor(Parser *p){
    Token *t=parser_peek(p);

    if(t->type==TOKEN_NUMBER || t->type==TOKEN_STRING){
        parser_advance(p);
        return new_expr(0,t->value);
    }

    if(t->type==TOKEN_COORD || t->type==TOKEN_IDENT ||
       (t->type==TOKEN_KEYWORD && strcmp(t->value,"now")==0)){
        parser_advance(p);
        return new_expr(1,t->value);
    }

    if(parser_match(p,TOKEN_LPAREN,NULL)){
        ExprNode *e=parse_expr(p);
        parser_match(p,TOKEN_RPAREN,NULL);
        return e;
    }

    parser_error(p,"Invalid factor");
    return NULL;
}

ExprNode* parse_term(Parser *p){
    ExprNode *e=parse_factor(p);

    while(parser_peek(p)->type==TOKEN_OPERATOR &&
         (!strcmp(parser_peek(p)->value,"*") ||
          !strcmp(parser_peek(p)->value,"/"))){
        Token *op=parser_advance(p);
        ExprNode *r=parse_factor(p);

        ExprNode *n=new_expr(2,NULL);
        strcpy(n->op,op->value);
        n->l=e; n->r=r;
        e=n;
    }
    return e;
}

ExprNode* parse_expr(Parser *p){
    ExprNode *e=parse_term(p);

    while(parser_peek(p)->type==TOKEN_OPERATOR &&
         (!strcmp(parser_peek(p)->value,"+") ||
          !strcmp(parser_peek(p)->value,"-"))){
        Token *op=parser_advance(p);
        ExprNode *r=parse_term(p);

        ExprNode *n=new_expr(2,NULL);
        strcpy(n->op,op->value);
        n->l=e; n->r=r;
        e=n;
    }
    return e;
}

/* ===== ARRAY ===== */

ExprNode** parse_array(Parser *p,int *count){
    parser_match(p,TOKEN_LBRACKET,NULL);

    ExprNode **vals=malloc(sizeof(ExprNode*)*64);
    int c=0;

    while(!parser_match(p,TOKEN_RBRACKET,NULL)){
        vals[c++]=parse_expr(p);
        parser_match(p,TOKEN_COMMA,NULL);
    }

    *count=c;
    return vals;
}

/* ===== STATEMENTS ===== */

void* parse_stmt(Parser *p){
    Token *t=parser_peek(p);

    /* write / append */
    if(t->type==TOKEN_KEYWORD &&
       (!strcmp(t->value,"write") || !strcmp(t->value,"append"))){

        int is_append = !strcmp(t->value,"append");

        parser_advance(p);
        parser_match(p,TOKEN_LPAREN,NULL);

        Token *path=parser_advance(p);

        parser_match(p,TOKEN_RPAREN,NULL);
        parser_match(p,TOKEN_OPERATOR,"<<");

        Token *src=parser_advance(p);

        FileWriteNode *n=malloc(sizeof(FileWriteNode));
        n->node_type=NODE_FILE_WRITE;
        strcpy(n->path,path->value);
        strcpy(n->source,src->value);
        n->append_mode=is_append;

        return n;
    }

    /* past */
    if(t->type==TOKEN_KEYWORD && !strcmp(t->value,"past")){
        parser_advance(p);
        parser_match(p,TOKEN_LPAREN,NULL);

        Token *name=parser_advance(p);

        AssignNode *a=malloc(sizeof(AssignNode));
        a->node_type=NODE_ASSIGN;
        a->has_index=0;
        a->index=NULL;

        if(parser_match(p,TOKEN_LBRACKET,NULL)){
            a->has_index=1;
            a->index=parse_expr(p);
            parser_match(p,TOKEN_RBRACKET,NULL);
        }

        parser_match(p,TOKEN_RPAREN,NULL);
        parser_match(p,TOKEN_OPERATOR,"~>");
        Token *target=parser_advance(p);

        strcpy(a->target,target->value);
        a->expr=new_expr(1,name->value);

        return a;
    }

    /* Gate */
    if(t->type==TOKEN_KEYWORD && !strcmp(t->value,"Gate")){
        parser_advance(p);
        Token *src=parser_advance(p);

        parser_match(p,TOKEN_LPAREN,NULL);

        Token *op=parser_advance(p);
        Token *val=parser_advance(p);

        GateNode *g=malloc(sizeof(GateNode));
        g->node_type=NODE_GATE;

        strcpy(g->source,src->value);
        strcpy(g->op,op->value);
        g->value=atof(val->value);
        g->logic[0]=0;

        if(parser_peek(p)->type==TOKEN_LOGIC){
            Token *lg=parser_advance(p);
            strcpy(g->logic,lg->value);

            Token *op2=parser_advance(p);
            Token *val2=parser_advance(p);

            strcpy(g->op2,op2->value);
            g->value2=atof(val2->value);
        }

        parser_match(p,TOKEN_RPAREN,NULL);
        parser_match(p,TOKEN_OPERATOR,">>");

        Token *target=parser_advance(p);
        strcpy(g->target,target->value);

        return g;
    }

    /* F */
    if(t->type==TOKEN_KEYWORD && !strcmp(t->value,"F")){
        parser_advance(p);
        parser_match(p,TOKEN_LPAREN,NULL);
        Token *src=parser_advance(p);
        parser_match(p,TOKEN_RPAREN,NULL);
        parser_match(p,TOKEN_LBRACE,NULL);

        void **body=malloc(sizeof(void*)*128);
        int c=0;
        while(!parser_match(p,TOKEN_RBRACE,NULL)){
            body[c++]=parse_stmt(p);
        }

        FNode *f=malloc(sizeof(FNode));
        f->node_type=NODE_F;
        strcpy(f->source,src->value);
        f->body=body;
        f->body_count=c;
        return f;
    }

    /* return */
    if(t->type==TOKEN_KEYWORD && !strcmp(t->value,"return")){
        parser_advance(p);
        ReturnNode *r=malloc(sizeof(ReturnNode));
        r->node_type=NODE_RETURN;
        r->expr=parse_expr(p);
        return r;
    }

    /* func call */
    if(t->type==TOKEN_IDENT &&
       p->pos+1 < p->count &&
       p->tokens[p->pos+1].type==TOKEN_LPAREN){

        Token *name=parser_advance(p);
        parser_match(p,TOKEN_LPAREN,NULL);

        FuncCallNode *fc=malloc(sizeof(FuncCallNode));
        fc->node_type=NODE_FUNC_CALL;
        strcpy(fc->name,name->value);
        fc->arg_count=0;

        while(!parser_match(p,TOKEN_RPAREN,NULL)){
            Token *an=parser_advance(p);
            parser_match(p,TOKEN_EQUALS,NULL);

            fc->arg_values[fc->arg_count]=parse_expr(p);
            strcpy(fc->arg_names[fc->arg_count],an->value);
            fc->arg_count++;

            parser_match(p,TOKEN_COMMA,NULL);
        }

        parser_match(p,TOKEN_OPERATOR,"~>");
        Token *target=parser_advance(p);
        strcpy(fc->target,target->value);

        return fc;
    }

    /* expr >> coord */
    ExprNode *e=parse_expr(p);
    parser_match(p,TOKEN_OPERATOR,">>");
    Token *target=parser_advance(p);

    AssignNode *a=malloc(sizeof(AssignNode));
    a->node_type=NODE_ASSIGN;
    a->expr=e;
    a->has_index=0;
    a->index=NULL;

    strcpy(a->target,target->value);

    return a;
}

/* ===== FUNC ===== */

FuncDefNode* parse_func(Parser *p){
    parser_match(p,TOKEN_KEYWORD,"func");
    Token *name=parser_advance(p);

    FuncDefNode *fn=malloc(sizeof(FuncDefNode));
    fn->node_type=NODE_FUNC_DEF;
    strcpy(fn->name,name->value);

    parser_match(p,TOKEN_LPAREN,NULL);

    fn->param_count=0;
    while(!parser_match(p,TOKEN_RPAREN,NULL)){
        Token *param=parser_advance(p);
        strcpy(fn->params[fn->param_count++],param->value);
        parser_match(p,TOKEN_COMMA,NULL);
    }

    parser_match(p,TOKEN_LBRACE,NULL);

    fn->body=malloc(sizeof(void*)*128);
    fn->body_count=0;

    while(!parser_match(p,TOKEN_RBRACE,NULL)){
        fn->body[fn->body_count++]=parse_stmt(p);
    }

    return fn;
}

/* ===== PROGRAM ===== */

ProgramNode* parse(Token *tokens, int count){
    Parser p={tokens,0,count};

    ProgramNode *prog=malloc(sizeof(ProgramNode));
    prog->tminus=malloc(sizeof(void*)*256); prog->tminus_count=0;
    prog->t0=malloc(sizeof(void*)*256); prog->t0_count=0;
    prog->tplus=malloc(sizeof(void*)*256); prog->tplus_count=0;

    while(parser_peek(&p)->type!=TOKEN_EOF){
        Token *t=parser_peek(&p);

        if(!strcmp(t->value,"[T-]")){
            parser_advance(&p);
            while(parser_peek(&p)->type!=TOKEN_SECTION){
                Token *cur=parser_peek(&p);

                if(cur->type==TOKEN_KEYWORD && !strcmp(cur->value,"func")){
                    prog->tminus[prog->tminus_count++]=parse_func(&p);
                }
                else if(cur->type==TOKEN_KEYWORD && !strcmp(cur->value,"arr")){
                    parser_advance(&p);
                    Token *name=parser_advance(&p);
                    parser_match(&p,TOKEN_EQUALS,NULL);

                    int c; ExprNode **vals=parse_array(&p,&c);

                    ArrayAssignNode *a=malloc(sizeof(ArrayAssignNode));
                    a->node_type=NODE_ARRAY_ASSIGN;
                    strcpy(a->name,name->value);
                    a->values=vals; a->count=c;

                    prog->tminus[prog->tminus_count++]=a;
                }
                else if(cur->type==TOKEN_KEYWORD && !strcmp(cur->value,"ask")){
                    parser_advance(&p);
                    Token *name=parser_advance(&p);
                    parser_match(&p,TOKEN_EQUALS,NULL);
                    Token *str=parser_advance(&p);

                    AskNode *a=malloc(sizeof(AskNode));
                    a->node_type=NODE_ASK;
                    strcpy(a->name,name->value);
                    strcpy(a->prompt,str->value);

                    prog->tminus[prog->tminus_count++]=a;
                }
                else if(cur->type==TOKEN_KEYWORD && !strcmp(cur->value,"read")){
                    parser_advance(&p);
                    parser_match(&p,TOKEN_LPAREN,NULL);

                    Token *path=parser_advance(&p);

                    parser_match(&p,TOKEN_RPAREN,NULL);
                    parser_match(&p,TOKEN_OPERATOR,"~>");

                    Token *target=parser_advance(&p);

                    FileReadNode *n=malloc(sizeof(FileReadNode));
                    n->node_type=NODE_FILE_READ;
                    strcpy(n->path,path->value);
                    strcpy(n->target,target->value);

                    prog->tminus[prog->tminus_count++]=n;
                }
                else if(cur->type==TOKEN_IDENT){
                    Token *name=parser_advance(&p);
                    parser_match(&p,TOKEN_EQUALS,NULL);

                    VarAssignNode *v=malloc(sizeof(VarAssignNode));
                    v->node_type=NODE_VAR_ASSIGN;
                    strcpy(v->name,name->value);
                    v->expr=parse_expr(&p);

                    prog->tminus[prog->tminus_count++]=v;
                }
                else parser_error(&p,"Invalid T-");
            }
        }

        else if(!strcmp(t->value,"[T0]")){
            parser_advance(&p);
            while(parser_peek(&p)->type!=TOKEN_SECTION)
                prog->t0[prog->t0_count++]=parse_stmt(&p);
        }

        else if(!strcmp(t->value,"[T+]")){
            parser_advance(&p);
            while(parser_peek(&p)->type!=TOKEN_EOF){
                parser_advance(&p);
                parser_advance(&p);

                parser_match(&p,TOKEN_LPAREN,NULL);
                Token *coord=parser_advance(&p);
                parser_match(&p,TOKEN_RPAREN,NULL);

                ShowNode *s=malloc(sizeof(ShowNode));
                s->node_type=NODE_SHOW;
                strcpy(s->coord,coord->value);

                prog->tplus[prog->tplus_count++]=s;
            }
        }
    }

    return prog;
}