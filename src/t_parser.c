#include <stdio.h>
#include <stdlib.h>
#include <string.h>

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
    int col;
} Token;

/* ===== NODE TYPE ===== */
typedef enum {
    NODE_ASSIGN, NODE_GATE, NODE_F,
    NODE_VAR_ASSIGN, NODE_ARRAY_ASSIGN,
    NODE_SHOW, NODE_ASK,
    NODE_FUNC_DEF, NODE_FUNC_CALL, NODE_RETURN,
    NODE_FILE_READ, NODE_FILE_WRITE,
    NODE_ARRAY_LITERAL
} NodeType;

/* ===== AST ===== */

typedef struct ArrayLiteralNode {
    NodeType node_type;
    struct ExprNode **values;
    int count;
} ArrayLiteralNode;

typedef struct ExprNode {
    int type; /* 0 literal, 1 ident/coord, 2 binop, 3 array literal */
    char value[64];
    char op[4];
    struct ExprNode *l, *r;
    ArrayLiteralNode *arr_node;
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
    char op[4];   double value;   char str_val[256];
    char op2[4];  double value2;  char str_val2[256];
    char logic[4];
    char target[64];
} GateNode;

typedef struct { NodeType node_type; char name[64]; ExprNode *expr; } VarAssignNode;
typedef struct { NodeType node_type; char name[64]; ExprNode **values; int count; } ArrayAssignNode;
typedef struct { NodeType node_type; char name[64]; char prompt[256]; } AskNode;
typedef struct { NodeType node_type; char source[64]; void **body; int body_count; int body_capacity; } FNode;
typedef struct { NodeType node_type; char coord[64]; char format[256]; } ShowNode;

typedef struct {
    NodeType node_type;
    char name[64];
    char params[16][64];
    int param_count;
    void **body;
    int body_count;
    int body_capacity;
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
    void **tminus; int tminus_count; int tminus_cap;
    void **t0; int t0_count; int t0_cap;
    void **tplus; int tplus_count; int tplus_cap;
} ProgramNode;

/* ===== PARSER ===== */

typedef struct {
    Token *tokens;
    int pos;
    int count;
} Parser;

Token* parser_peek(Parser *p){
    if(p->pos >= p->count) return &p->tokens[p->count-1];
    return &p->tokens[p->pos];
}

Token* parser_advance(Parser *p){
    if(p->pos < p->count) p->pos++;
    return &p->tokens[p->pos-1];
}

int parser_match(Parser *p, TokenType t, const char *v){
    Token *tk = parser_peek(p);
    if(tk->type==t && (!v || !strcmp(tk->value,v))){
        parser_advance(p);
        return 1;
    }
    return 0;
}

void parser_error(Parser *p, const char *msg){
    printf("Parse error line %d col %d: %s\n", parser_peek(p)->line, parser_peek(p)->col, msg);
    exit(1);
}

void parser_expect(Parser *p, TokenType t, const char *v, const char *msg){
    if(!parser_match(p,t,v)) parser_error(p,msg);
}

ExprNode* new_expr(int type, const char *value){
    ExprNode *e = malloc(sizeof(ExprNode));
    e->type = type;
    if(value) strcpy(e->value, value);
    else e->value[0]=0;
    e->l = e->r = NULL;
    e->op[0]=0;
    e->arr_node = NULL;
    return e;
}

/* ===== FORWARD ===== */
ExprNode* parse_expr(Parser *p);
void* parse_stmt(Parser *p);

/* ===== ARRAY ===== */
ExprNode** parse_array(Parser *p, int *count){
    parser_match(p, TOKEN_LBRACKET, NULL);
    ExprNode **vals = malloc(sizeof(ExprNode*)*64);
    int c=0;
    while(!parser_match(p, TOKEN_RBRACKET, NULL)){
        vals[c++] = parse_expr(p);
        parser_match(p, TOKEN_COMMA, NULL);
    }
    *count = c;
    return vals;
}

/* ===== FACTOR ===== */
ExprNode* parse_factor(Parser *p){
    Token *t = parser_peek(p);

    if(t->type == TOKEN_LBRACKET){
        int c;
        ExprNode **vals = parse_array(p, &c);
        ExprNode *e = new_expr(3, NULL);
        e->arr_node = malloc(sizeof(ArrayLiteralNode));
        e->arr_node->node_type = NODE_ARRAY_LITERAL;
        e->arr_node->values = vals;
        e->arr_node->count = c;
        return e;
    }

    if(t->type==TOKEN_NUMBER){ parser_advance(p); return new_expr(0, t->value); }
    if(t->type==TOKEN_STRING){ parser_advance(p); return new_expr(4, t->value); }

    if(t->type==TOKEN_IDENT || t->type==TOKEN_COORD ||
       (t->type==TOKEN_KEYWORD && !strcmp(t->value,"now"))){
        parser_advance(p);
        return new_expr(1, t->value);
    }

    if(parser_match(p, TOKEN_LPAREN, NULL)){
        ExprNode *e = parse_expr(p);
        parser_match(p, TOKEN_RPAREN, NULL);
        return e;
    }

    parser_error(p, "Invalid factor");
    return NULL;
}

/* ===== TERM / EXPR ===== */
ExprNode* parse_term(Parser *p){
    ExprNode *left = parse_factor(p);

    while(parser_peek(p)->type==TOKEN_OPERATOR &&
          (!strcmp(parser_peek(p)->value,"*") ||
           !strcmp(parser_peek(p)->value,"/") ||
           !strcmp(parser_peek(p)->value,"%"))){
        Token *op = parser_advance(p);
        ExprNode *right = parse_factor(p);

        ExprNode *e = new_expr(2, NULL);
        strcpy(e->op, op->value);
        e->l = left;
        e->r = right;
        left = e;
    }
    return left;
}

ExprNode* parse_expr(Parser *p){
    ExprNode *left = parse_term(p);

    while(parser_peek(p)->type==TOKEN_OPERATOR &&
          (!strcmp(parser_peek(p)->value,"+") ||
           !strcmp(parser_peek(p)->value,"-"))){
        Token *op = parser_advance(p);
        ExprNode *right = parse_term(p);

        ExprNode *e = new_expr(2, NULL);
        strcpy(e->op, op->value);
        e->l = left;
        e->r = right;
        left = e;
    }
    return left;
}

/* ===== STATEMENT ===== */
void* parse_stmt(Parser *p){
    Token *t = parser_peek(p);

    /* past(x) ~> P1 */
    if(t->type==TOKEN_KEYWORD && !strcmp(t->value,"past")){
        parser_advance(p);
        parser_match(p,TOKEN_LPAREN,NULL);

        Token *name = parser_advance(p);

        int has_index=0;
        ExprNode *idx=NULL;

        if(parser_match(p,TOKEN_LBRACKET,NULL)){
            has_index=1;
            idx = parse_expr(p);
            parser_match(p,TOKEN_RBRACKET,NULL);
        }

        parser_match(p,TOKEN_RPAREN,NULL);
        parser_match(p,TOKEN_OPERATOR,"~>");
        Token *target = parser_advance(p);

        AssignNode *a = malloc(sizeof(AssignNode));
        a->node_type = NODE_ASSIGN;
        a->expr = new_expr(1,name->value);
        a->has_index = has_index;
        a->index = idx;
        strcpy(a->target,target->value);
        return a;
    }

    /* Gate */
    if(t->type==TOKEN_KEYWORD && !strcmp(t->value,"Gate")){
        parser_advance(p);
        Token *src = parser_advance(p);

        parser_expect(p,TOKEN_LPAREN,NULL,"expected '(' after Gate source");
        Token *op = parser_advance(p);
        Token *val = parser_advance(p);

        GateNode *g = malloc(sizeof(GateNode));
        g->node_type = NODE_GATE;
        strcpy(g->source,src->value);
        strcpy(g->op,op->value);
        g->value = atof(val->value);
        strcpy(g->str_val,val->value);

        if(parser_peek(p)->type==TOKEN_LOGIC){
            Token *lg = parser_advance(p);
            strcpy(g->logic,lg->value);
            Token *op2 = parser_advance(p);
            Token *val2 = parser_advance(p);
            strcpy(g->op2,op2->value);
            g->value2 = atof(val2->value);
            strcpy(g->str_val2,val2->value);
        } else g->logic[0]=0;

        parser_expect(p,TOKEN_RPAREN,NULL,"expected ')' after Gate condition");
        parser_expect(p,TOKEN_OPERATOR,">>","expected '>>' after Gate condition");
        Token *target = parser_advance(p);
        strcpy(g->target,target->value);
        return g;
    }

    /* F */
    if(t->type==TOKEN_KEYWORD && !strcmp(t->value,"F")){
        parser_advance(p);
        parser_expect(p,TOKEN_LPAREN,NULL,"expected '(' after F");
        Token *src = parser_advance(p);
        if(src->type==TOKEN_KEYWORD && !strcmp(src->value,"F"))
            parser_error(p,"F() expects an array name, not another F — nested F() not supported");
        if(src->type!=TOKEN_IDENT && src->type!=TOKEN_COORD)
            parser_error(p,"F() expects an array name here");
        parser_expect(p,TOKEN_RPAREN,NULL,"expected ')' after F( source name");
        parser_expect(p,TOKEN_LBRACE,NULL,"expected '{' after F(...)");

        int bcap=8;
        void **body = malloc(sizeof(void*)*bcap);
        int c=0;
        while(!parser_match(p,TOKEN_RBRACE,NULL)){
            if(c>=bcap-1){ bcap*=2; body=realloc(body,sizeof(void*)*bcap); }
            body[c++] = parse_stmt(p);
        }

        FNode *f = malloc(sizeof(FNode));
        f->node_type = NODE_F;
        strcpy(f->source,src->value);
        f->body = body;
        f->body_count = c;
        return f;
    }

    /* return */
    if(t->type==TOKEN_KEYWORD && !strcmp(t->value,"return")){
        parser_advance(p);
        ReturnNode *r = malloc(sizeof(ReturnNode));
        r->node_type = NODE_RETURN;
        r->expr = parse_expr(p);
        return r;
    }

    /* func call */
    if((t->type==TOKEN_IDENT || t->type==TOKEN_COORD) && p->tokens[p->pos+1].type==TOKEN_LPAREN){
        Token *name = parser_advance(p);
        parser_match(p,TOKEN_LPAREN,NULL);

        FuncCallNode *fc = malloc(sizeof(FuncCallNode));
        fc->node_type = NODE_FUNC_CALL;
        strcpy(fc->name,name->value);
        fc->arg_count=0;

        while(!parser_match(p,TOKEN_RPAREN,NULL)){
            Token *argn = parser_advance(p);
            parser_match(p,TOKEN_EQUALS,NULL);
            fc->arg_values[fc->arg_count]=parse_expr(p);
            strcpy(fc->arg_names[fc->arg_count],argn->value);
            fc->arg_count++;
            parser_match(p,TOKEN_COMMA,NULL);
        }

        parser_match(p,TOKEN_OPERATOR,"~>");
        Token *target = parser_advance(p);
        strcpy(fc->target,target->value);
        return fc;
    }

    /* expr >> target */
    ExprNode *e = parse_expr(p);
    if(parser_match(p,TOKEN_OPERATOR,">>")){
        Token *target = parser_advance(p);
        /* expr >> "file.txt" or expr >> "file.txt" + */
        if(target->type==TOKEN_STRING){
            FileWriteNode *n = malloc(sizeof(FileWriteNode));
            n->node_type = NODE_FILE_WRITE;
            strncpy(n->path, target->value, 255);
            n->append_mode = parser_match(p,TOKEN_OPERATOR,"+");
            /* source is the expr target name — evaluate and store */
            strncpy(n->source, e->value, 63);
            return n;
        }
        AssignNode *a = malloc(sizeof(AssignNode));
        a->node_type = NODE_ASSIGN;
        a->expr = e;
        a->has_index = 0;
        strcpy(a->target,target->value);
        return a;
    }

    parser_error(p,"Invalid statement");
    return NULL;
}

/* ===== FUNC DEF ===== */
FuncDefNode* parse_func(Parser *p){
    parser_match(p,TOKEN_KEYWORD,"func");
    Token *name = parser_advance(p);

    FuncDefNode *fn = malloc(sizeof(FuncDefNode));
    fn->node_type = NODE_FUNC_DEF;
    strcpy(fn->name,name->value);

    parser_match(p,TOKEN_LPAREN,NULL);
    fn->param_count=0;

    while(!parser_match(p,TOKEN_RPAREN,NULL)){
        Token *param = parser_advance(p);
        strcpy(fn->params[fn->param_count++],param->value);
        parser_match(p,TOKEN_COMMA,NULL);
    }

    parser_match(p,TOKEN_LBRACE,NULL);

    void **body = malloc(sizeof(void*)*128);
    int c=0;
    while(!parser_match(p,TOKEN_RBRACE,NULL)){
        body[c++] = parse_stmt(p);
    }

    fn->body = body;
    fn->body_count = c;
    return fn;
}

/* ===== PROGRAM ===== */
Token* lex(const char *src, int *out_count);
ProgramNode* parse(Token *tokens, int count);

ProgramNode* parse(Token *tokens, int count){
    Parser p={tokens,0,count};
    ProgramNode *prog=malloc(sizeof(ProgramNode));
    prog->tminus_cap=16; prog->tminus=malloc(sizeof(void*)*prog->tminus_cap); prog->tminus_count=0;
    prog->t0_cap=16; prog->t0=malloc(sizeof(void*)*prog->t0_cap); prog->t0_count=0;
    prog->tplus_cap=16; prog->tplus=malloc(sizeof(void*)*prog->tplus_cap); prog->tplus_count=0;

    while(parser_peek(&p)->type!=TOKEN_EOF){
        Token *t=parser_peek(&p);
        if(t->type!=TOKEN_SECTION) break;

        /* ===== T- ===== */
        if(!strcmp(t->value,"[T-]")){
            parser_advance(&p);
            while(parser_peek(&p)->type!=TOKEN_SECTION &&
                  parser_peek(&p)->type!=TOKEN_EOF){

                Token *cur=parser_peek(&p);

                if(cur->type==TOKEN_KEYWORD && !strcmp(cur->value,"func")){
                    if(prog->tminus_count>=prog->tminus_cap-1){ prog->tminus_cap*=2; prog->tminus=realloc(prog->tminus,sizeof(void*)*prog->tminus_cap); }

                    if(prog->tminus_count>=prog->tminus_cap-1){ prog->tminus_cap*=2; prog->tminus=realloc(prog->tminus,sizeof(void*)*prog->tminus_cap); }


                    if(prog->tminus_count>=prog->tminus_cap-1){ prog->tminus_cap*=2; prog->tminus=realloc(prog->tminus,sizeof(void*)*prog->tminus_cap); }



                    prog->tminus[prog->tminus_count++] = parse_func(&p);
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

                    if(prog->tminus_count>=prog->tminus_cap-1){ prog->tminus_cap*=2; prog->tminus=realloc(prog->tminus,sizeof(void*)*prog->tminus_cap); }


                    if(prog->tminus_count>=prog->tminus_cap-1){ prog->tminus_cap*=2; prog->tminus=realloc(prog->tminus,sizeof(void*)*prog->tminus_cap); }



                    if(prog->tminus_count>=prog->tminus_cap-1){ prog->tminus_cap*=2; prog->tminus=realloc(prog->tminus,sizeof(void*)*prog->tminus_cap); }




                    prog->tminus[prog->tminus_count++]=a;
                }
                else if(cur->type==TOKEN_IDENT){
                    Token *name=parser_advance(&p);
                    parser_match(&p,TOKEN_EQUALS,NULL);

                    VarAssignNode *v=malloc(sizeof(VarAssignNode));
                    v->node_type=NODE_VAR_ASSIGN;
                    strcpy(v->name,name->value);
                    v->expr=parse_expr(&p);

                    if(prog->tminus_count>=prog->tminus_cap-1){ prog->tminus_cap*=2; prog->tminus=realloc(prog->tminus,sizeof(void*)*prog->tminus_cap); }


                    if(prog->tminus_count>=prog->tminus_cap-1){ prog->tminus_cap*=2; prog->tminus=realloc(prog->tminus,sizeof(void*)*prog->tminus_cap); }



                    if(prog->tminus_count>=prog->tminus_cap-1){ prog->tminus_cap*=2; prog->tminus=realloc(prog->tminus,sizeof(void*)*prog->tminus_cap); }




                    prog->tminus[prog->tminus_count++]=v;
                }
                else if(cur->type==TOKEN_KEYWORD && !strcmp(cur->value,"read")){
                    parser_advance(&p);
                    parser_match(&p,TOKEN_LPAREN,NULL);
                    Token *path_tok=parser_advance(&p);
                    parser_match(&p,TOKEN_RPAREN,NULL);
                    parser_match(&p,TOKEN_OPERATOR,"~>");
                    Token *target=parser_advance(&p);

                    FileReadNode *n=malloc(sizeof(FileReadNode));
                    n->node_type=NODE_FILE_READ;
                    strcpy(n->path,path_tok->value);
                    strcpy(n->target,target->value);
                    if(prog->tminus_count>=prog->tminus_cap-1){ prog->tminus_cap*=2; prog->tminus=realloc(prog->tminus,sizeof(void*)*prog->tminus_cap); }

                    if(prog->tminus_count>=prog->tminus_cap-1){ prog->tminus_cap*=2; prog->tminus=realloc(prog->tminus,sizeof(void*)*prog->tminus_cap); }


                    if(prog->tminus_count>=prog->tminus_cap-1){ prog->tminus_cap*=2; prog->tminus=realloc(prog->tminus,sizeof(void*)*prog->tminus_cap); }



                    prog->tminus[prog->tminus_count++]=n;
                }
                else if(cur->type==TOKEN_KEYWORD && !strcmp(cur->value,"import")){
                    parser_advance(&p);
                    Token *fname=parser_advance(&p);

                    char fpath[512];
                    const char *home=getenv("HOME");
                    snprintf(fpath,511,"%s/t-lang/lib/%s",home,fname->value);

                    FILE *fp=fopen(fpath,"r");
                    if(!fp){
                        snprintf(fpath,511,"%s",fname->value);
                        fp=fopen(fpath,"r");
                    }
                    if(!fp){
                        printf("Import warning: cannot find %s — skipped\n",fname->value);
                        continue;
                    }

                    fseek(fp,0,SEEK_END);
                    long size=ftell(fp);
                    fseek(fp,0,SEEK_SET);
                    char *src=malloc(size+1);
                    fread(src,1,size,fp);
                    src[size]=0;
                    fclose(fp);

                    int tok_count;
                    Token *toks=lex(src,&tok_count);
                    ProgramNode *lib=parse(toks,tok_count);

                    for(int i=0;i<lib->tminus_count;i++){
                        if(*(NodeType*)lib->tminus[i]==NODE_FUNC_DEF){
                            if(prog->tminus_count>=prog->tminus_cap-1){ prog->tminus_cap*=2; prog->tminus=realloc(prog->tminus,sizeof(void*)*prog->tminus_cap); }

                            if(prog->tminus_count>=prog->tminus_cap-1){ prog->tminus_cap*=2; prog->tminus=realloc(prog->tminus,sizeof(void*)*prog->tminus_cap); }


                            if(prog->tminus_count>=prog->tminus_cap-1){ prog->tminus_cap*=2; prog->tminus=realloc(prog->tminus,sizeof(void*)*prog->tminus_cap); }



                            prog->tminus[prog->tminus_count++]=lib->tminus[i];
                        }
                    }
                    free(src);
                }
                else parser_error(&p,"Invalid T-");
            }
        }

        /* ===== T0 ===== */
        else if(!strcmp(t->value,"[T0]")){
            parser_advance(&p);
            while(parser_peek(&p)->type!=TOKEN_SECTION &&
                  parser_peek(&p)->type!=TOKEN_EOF){
                if(prog->t0_count>=prog->t0_cap-1){ prog->t0_cap*=2; prog->t0=realloc(prog->t0,sizeof(void*)*prog->t0_cap); }

                if(prog->t0_count>=prog->t0_cap-1){ prog->t0_cap*=2; prog->t0=realloc(prog->t0,sizeof(void*)*prog->t0_cap); }


                if(prog->t0_count>=prog->t0_cap-1){ prog->t0_cap*=2; prog->t0=realloc(prog->t0,sizeof(void*)*prog->t0_cap); }



                prog->t0[prog->t0_count++] = parse_stmt(&p);
            }
        }

        /* ===== T+ ===== */
        else if(!strcmp(t->value,"[T+]")){
            parser_advance(&p);

            while(parser_peek(&p)->type!=TOKEN_SECTION &&
                  parser_peek(&p)->type!=TOKEN_EOF){

                /* show */
                if(parser_peek(&p)->type==TOKEN_KEYWORD &&
                   !strcmp(parser_peek(&p)->value,"show")){
                    parser_advance(&p); // show
                    parser_match(&p,TOKEN_KEYWORD,"shall");
                    parser_match(&p,TOKEN_LPAREN,NULL);

                    int show_start=prog->tplus_count;
                    while(1){
                        Token *coord=parser_advance(&p);

                        ShowNode *s=malloc(sizeof(ShowNode));
                        s->node_type=NODE_SHOW;
                        strcpy(s->coord,coord->value);
                        s->format[0]=0;

                        if(prog->tplus_count>=prog->tplus_cap-1){ prog->tplus_cap*=2; prog->tplus=realloc(prog->tplus,sizeof(void*)*prog->tplus_cap); }


                        if(prog->tplus_count>=prog->tplus_cap-1){ prog->tplus_cap*=2; prog->tplus=realloc(prog->tplus,sizeof(void*)*prog->tplus_cap); }



                        if(prog->tplus_count>=prog->tplus_cap-1){ prog->tplus_cap*=2; prog->tplus=realloc(prog->tplus,sizeof(void*)*prog->tplus_cap); }




                        prog->tplus[prog->tplus_count++]=s;

                        if(!parser_match(&p,TOKEN_COMMA,NULL)) break;
                    }

                    parser_match(&p,TOKEN_RPAREN,NULL);

                    /* optional as "format" — applies to all coords in this show */
                    if(parser_peek(&p)->type==TOKEN_KEYWORD &&
                       !strcmp(parser_peek(&p)->value,"as")){
                        parser_advance(&p);
                        Token *fmt=parser_advance(&p);
                        for(int si=show_start;si<prog->tplus_count;si++){
                            ShowNode *sn=(ShowNode*)prog->tplus[si];
                            strcpy(sn->format,fmt->value);
                        }
                    }
                    continue;
                }

                /* write / append */
                if(parser_peek(&p)->type==TOKEN_KEYWORD &&
                   (!strcmp(parser_peek(&p)->value,"write") ||
                    !strcmp(parser_peek(&p)->value,"append"))){

                    int is_append=!strcmp(parser_peek(&p)->value,"append");
                    parser_advance(&p);

                    parser_match(&p,TOKEN_LPAREN,NULL);
                    Token *path=parser_advance(&p);
                    parser_match(&p,TOKEN_RPAREN,NULL);

                    parser_match(&p,TOKEN_KEYWORD,"shall");
                    parser_match(&p,TOKEN_LPAREN,NULL);
                    Token *src=parser_advance(&p);
                    parser_match(&p,TOKEN_RPAREN,NULL);

                    FileWriteNode *n=malloc(sizeof(FileWriteNode));
                    n->node_type=NODE_FILE_WRITE;
                    strcpy(n->path,path->value);
                    strcpy(n->source,src->value);
                    n->append_mode=is_append;

                    if(prog->tplus_count>=prog->tplus_cap-1){ prog->tplus_cap*=2; prog->tplus=realloc(prog->tplus,sizeof(void*)*prog->tplus_cap); }


                    if(prog->tplus_count>=prog->tplus_cap-1){ prog->tplus_cap*=2; prog->tplus=realloc(prog->tplus,sizeof(void*)*prog->tplus_cap); }



                    if(prog->tplus_count>=prog->tplus_cap-1){ prog->tplus_cap*=2; prog->tplus=realloc(prog->tplus,sizeof(void*)*prog->tplus_cap); }




                    prog->tplus[prog->tplus_count++]=n;
                    continue;
                }

                /* expr >> "file.txt" hoặc expr >> "file.txt" + */
                {
                    Token *cur2=parser_peek(&p);
                    if(cur2->type==TOKEN_IDENT || cur2->type==TOKEN_COORD){
                        Token *src=parser_advance(&p);
                        if(parser_match(&p,TOKEN_OPERATOR,">>")){
                            Token *path=parser_advance(&p);
                            if(path->type==TOKEN_STRING){
                                FileWriteNode *n=malloc(sizeof(FileWriteNode));
                                n->node_type=NODE_FILE_WRITE;
                                strncpy(n->path,path->value,255);
                                strncpy(n->source,src->value,63);
                                n->append_mode=parser_match(&p,TOKEN_OPERATOR,"+");
                                if(prog->tplus_count>=prog->tplus_cap-1){ prog->tplus_cap*=2; prog->tplus=realloc(prog->tplus,sizeof(void*)*prog->tplus_cap); }
                                prog->tplus[prog->tplus_count++]=n;
                                continue;
                            }
                        }
                    }
                }
                parser_error(&p,"Invalid T+");
            }
        }
    }
    return prog;
}