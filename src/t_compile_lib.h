#pragma once
#include "t_natives.h"

void compile_expr(Chunk *c, const char *expr);
void compile_assign(Chunk *c, const char *a, char op, const char *b, const char *target);
void compile_line(Chunk *chunk, const char *line);

void compile_expr(Chunk *c, const char *expr) {
    /* String literal: "hello" */
    if(expr[0] == '"') {
        char buf[256]; strncpy(buf, expr+1, 255);
        int l=strlen(buf); if(l>0&&buf[l-1]=='"') buf[l-1]=0;
        int idx=chunk_add_str(c, buf);
        chunk_write(c, OP_PUSH_STR); chunk_write(c, idx);
        return;
    }
    /* Number */
    char *end;
    double val = strtod(expr, &end);
    if(end != expr && *end == 0) {
        int idx = chunk_add_num(c, val);
        chunk_write(c, OP_PUSH_NUM);
        chunk_write(c, idx);
        return;
    }
    /* Variable */
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

    /* func(args) ~> target */
    char *tilde = strstr(p, "~>");
    if(tilde && strchr(p, '(')) {
        char *tp = tilde; *tp = 0;
        char *target = tp + 2;
        while(*target == ' ') target++;
        char *lp = strchr(p, '(');
        char *rp = strrchr(p, ')');
        if(lp && rp) {
            char fname[64]; strncpy(fname,p,lp-p); fname[lp-p]=0;
            char *fn=fname; while(*fn==' ')fn++;
            char args[256]; strncpy(args,lp+1,rp-lp-1); args[rp-lp-1]=0;
            /* parse multiple key=val, key=val */
            int argc=0;
            char *tok=strtok(args,",");
            while(tok){
                while(*tok==' ')tok++;
                char *eq=strchr(tok,'=');
                if(eq){ char *val=eq+1; while(*val==' ')val++;
                    compile_expr(chunk,val); argc++;
                }
                tok=strtok(NULL,",");
            }
            int ifn=chunk_add_str(chunk,fn);
            chunk_write(chunk,OP_CALL); chunk_write(chunk,ifn); chunk_write(chunk,argc);
            int it=chunk_add_str(chunk,target);
            chunk_write(chunk,OP_STORE); chunk_write(chunk,it);
        }
        return;
    }

    /* Gate x (op val) >> target */
    if(strncmp(p, "Gate ", 5) == 0) {
        char var[64], op_str[8], val_str[64], target[64];
        /* parse: Gate var (op val) >> target */
        char *lp = strchr(p, '(');
        char *rp = strchr(p, ')');
        char *arr = strstr(p, ">>");
        if(lp && rp && arr) {
            /* extract var */
            char tmp[64];
            strncpy(tmp, p+5, lp-p-5);
            tmp[lp-p-5]=0;
            /* trim */
            char *v=tmp; while(*v==' ')v++;
            int vl=strlen(v); while(vl>0&&v[vl-1]==' ')v[--vl]=0;
            /* extract op and val from (op val) */
            char inside[64];
            strncpy(inside, lp+1, rp-lp-1);
            inside[rp-lp-1]=0;
            sscanf(inside, "%s %s", op_str, val_str);
            /* extract target */
            char *tgt = arr+2; while(*tgt==' ')tgt++;
            /* emit: LOAD var */
            int iv = chunk_add_str(chunk, v);
            chunk_write(chunk, OP_LOAD); chunk_write(chunk, iv);
            /* emit: PUSH val */
            double dval = atof(val_str);
            int iv2 = chunk_add_num(chunk, dval);
            chunk_write(chunk, OP_PUSH_NUM); chunk_write(chunk, iv2);
            /* emit: CMP op */
            if(strcmp(op_str,">")==0)  chunk_write(chunk, OP_GT);
            else if(strcmp(op_str,"<")==0)  chunk_write(chunk, OP_LT);
            else if(strcmp(op_str,"==")==0) chunk_write(chunk, OP_EQ);
            else if(strcmp(op_str,">=")==0) chunk_write(chunk, OP_GE);
            else if(strcmp(op_str,"<=")==0) chunk_write(chunk, OP_LE);
            /* emit: JUMP_IF_0 over STORE */
            chunk_write(chunk, OP_JUMP_IF_0); chunk_write(chunk, 4);
            /* emit: PUSH 1, STORE target */
            int i1g = chunk_add_num(chunk, 1);
            chunk_write(chunk, OP_PUSH_NUM); chunk_write(chunk, i1g);
            int it = chunk_add_str(chunk, tgt);
            chunk_write(chunk, OP_STORE); chunk_write(chunk, it);
        }
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