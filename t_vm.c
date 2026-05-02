#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* ===== NODE TYPE ===== */
typedef enum {
    NODE_ASSIGN, NODE_GATE, NODE_F,
    NODE_VAR_ASSIGN, NODE_ARRAY_ASSIGN,
    NODE_SHOW, NODE_ASK,
    NODE_FUNC_DEF, NODE_FUNC_CALL, NODE_RETURN,
    NODE_FILE_READ, NODE_FILE_WRITE
} NodeType;

/* ===== VALUE ===== */
typedef enum { TV_NUMBER, TV_STRING, TV_BOOL, TV_ARRAY, TV_ERROR } TValueType;

typedef struct TValue TValue;

typedef struct {
    TValue *items;
    int count;
} TArray;

struct TValue {
    TValueType type;
    double num;
    char str[256];
    int boolean;
    TArray arr;
};

/* ===== FRAME ===== */
typedef struct Frame {
    char keys[256][64];
    TValue values[256];
    int count;
    struct Frame *parent;
} Frame;

/* ===== EXEC RESULT ===== */
typedef struct {
    int has_return;
    TValue value;
} ExecResult;

/* ===== AST ===== */

typedef struct ExprNode {
    int type;
    char value[64];
    char op[4];
    struct ExprNode *l,*r;
    struct ArrayLiteralNode *arr_node;
} ExprNode;

typedef struct ArrayLiteralNode {
    int node_type;
    struct ExprNode **values;
    int count;
} ArrayLiteralNode;

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

/* ===== FUNC TABLE ===== */
FuncDefNode *funcs[64];
int func_count=0;

void register_func(FuncDefNode *fn){ funcs[func_count++]=fn; }

FuncDefNode* find_func(const char *name){
    for(int i=0;i<func_count;i++)
        if(!strcmp(funcs[i]->name,name)) return funcs[i];
    return NULL;
}

/* ===== VALUE ===== */
TValue make_number(double x){ TValue v={TV_NUMBER}; v.num=x; return v; }
TValue make_string(const char *s){ TValue v={TV_STRING}; strcpy(v.str,s); return v; }
TValue make_error(const char *s){ TValue v={TV_ERROR}; strcpy(v.str,s); return v; }

/* ===== FRAME ===== */
Frame* new_frame(Frame *parent){
    Frame *f=malloc(sizeof(Frame));
    f->count=0;
    f->parent=parent;
    return f;
}

void frame_set(Frame *f, const char *key, TValue v){
    for(int i=0;i<f->count;i++){
        if(!strcmp(f->keys[i],key)){
            f->values[i]=v;
            return;
        }
    }
    strcpy(f->keys[f->count],key);
    f->values[f->count]=v;
    f->count++;
}

TValue frame_get(Frame *f, const char *key){
    Frame *cur=f;
    while(cur){
        for(int i=0;i<cur->count;i++){
            if(!strcmp(cur->keys[i],key))
                return cur->values[i];
        }
        cur=cur->parent;
    }
    return make_error("!EMPTY_COORD");
}

/* ===== EXPR ===== */
int is_number(const char *s){
    if(!s[0]) return 0;
    int i=0;
    if(s[0]=='-') i=1;
    if(!s[i]) return 0;
    for(;s[i];i++)
        if((s[i]<'0'||s[i]>'9') && s[i]!='.') return 0;
    return 1;
}

TValue eval_expr(Frame *f, ExprNode *e){
    if(e->type==0){
        if(is_number(e->value)) return make_number(atof(e->value));
        return make_string(e->value);
    }
    if(e->type==1){
        return frame_get(f,e->value);
    }

    if(e->type==3){
        TValue arr;
        arr.type=TV_ARRAY;
        arr.arr.items=malloc(sizeof(TValue)*e->arr_node->count);
        arr.arr.count=e->arr_node->count;
        for(int i=0;i<e->arr_node->count;i++)
            arr.arr.items[i]=eval_expr(f,e->arr_node->values[i]);
        return arr;
    }
    if(e->type==2){
        TValue a=eval_expr(f,e->l);
        TValue b=eval_expr(f,e->r);

        if(a.type==TV_ERROR || b.type==TV_ERROR) return a;

        if(!strcmp(e->op,"+")){
            if(a.type==TV_STRING || b.type==TV_STRING){
                char buf[512];
                char sa[256], sb[256];
                if(a.type==TV_NUMBER) sprintf(sa,"%g",a.num); else strcpy(sa,a.str);
                if(b.type==TV_NUMBER) sprintf(sb,"%g",b.num); else strcpy(sb,b.str);
                strcpy(buf,sa); strcat(buf,sb);
                return make_string(buf);
            }
            return make_number(a.num+b.num);
        }
        if(!strcmp(e->op,"-")) return make_number(a.num-b.num);
        if(!strcmp(e->op,"*")) return make_number(a.num*b.num);
        if(!strcmp(e->op,"/")){
            if(b.num==0) return make_error("!DIV0");
            return make_number(a.num/b.num);
        }
    }
    return make_error("!ERR");
}

/* ===== EXEC ===== */

int gate_check(double v, const char *op, double val){
    if(!strcmp(op,">")) return v>val;
    if(!strcmp(op,"<")) return v<val;
    if(!strcmp(op,">=")) return v>=val;
    if(!strcmp(op,"<=")) return v<=val;
    if(!strcmp(op,"==")) return v==val;
    if(!strcmp(op,"!=")) return v!=val;
    return 0;
}

ExecResult exec_node(Frame *f, void *node);

ExecResult exec_block(Frame *f, void **body, int count){
    ExecResult res={0};
    for(int i=0;i<count;i++){
        res = exec_node(f, body[i]);
        if(res.has_return) return res;
    }
    return res;
}

ExecResult exec_node(Frame *f, void *node){
    ExecResult res={0};
    NodeType t=*(NodeType*)node;

    if(t==NODE_VAR_ASSIGN){
        VarAssignNode *v=node;
        frame_set(f,v->name,eval_expr(f,v->expr));
    }

    else if(t==NODE_ARRAY_ASSIGN){
        ArrayAssignNode *a=node;
        TValue arr; arr.type=TV_ARRAY;
        arr.arr.items=malloc(sizeof(TValue)*a->count);
        arr.arr.count=a->count;
        for(int i=0;i<a->count;i++)
            arr.arr.items[i]=eval_expr(f,a->values[i]);
        frame_set(f,a->name,arr);
    }

    else if(t==NODE_ASSIGN){
        AssignNode *a=node;
        TValue val;

        if(a->has_index){
            TValue arr = frame_get(f,a->expr->value);
            TValue idx = eval_expr(f,a->index);

            if(arr.type!=TV_ARRAY) val=make_error("!NOT_ARRAY");
            else if(idx.num<0 || idx.num>=arr.arr.count)
                val=make_error("!OUT_OF_BOUNDS");
            else val=arr.arr.items[(int)idx.num];
        } else {
            val = eval_expr(f,a->expr);
        }

        frame_set(f,a->target,val);
    }

    else if(t==NODE_GATE){
        GateNode *g=node;
        TValue v=frame_get(f,g->source);

        int pass1=gate_check(v.num,g->op,g->value);
        int pass=pass1;

        if(g->logic[0]){
            int pass2=gate_check(v.num,g->op2,g->value2);
            if(!strcmp(g->logic,"&&")) pass=pass1 && pass2;
            else pass=pass1 || pass2;
        }

        if(pass) frame_set(f,g->target,v);
        else{
            char buf[128];
            sprintf(buf,"!(%s)",g->target);
            frame_set(f,g->target,make_error(buf));
        }
    }

    else if(t==NODE_F){
        FNode *fn=node;
        TValue arr=frame_get(f,fn->source);

        int has_gate=0;
        for(int i=0;i<fn->body_count;i++)
            if(*(NodeType*)fn->body[i]==NODE_GATE) has_gate=1;

        if(has_gate){
            GateNode *gn=NULL;
            for(int i=0;i<fn->body_count;i++)
                if(*(NodeType*)fn->body[i]==NODE_GATE)
                    gn=(GateNode*)fn->body[i];

            TValue out; out.type=TV_ARRAY;
            out.arr.items=malloc(sizeof(TValue)*256);
            out.arr.count=0;

            for(int j=0;j<arr.arr.count;j++){
                Frame *cf=new_frame(f);
                frame_set(cf,"now",arr.arr.items[j]);
                exec_node(cf,gn);

                TValue resv=frame_get(cf,gn->target);
                if(resv.type!=TV_ERROR)
                    out.arr.items[out.arr.count++]=arr.arr.items[j];
            }

            frame_set(f,gn->target,out);
        }
        else{
            for(int i=0;i<fn->body_count;i++){
                if(*(NodeType*)fn->body[i]==NODE_ASSIGN){
                    AssignNode *a=(AssignNode*)fn->body[i];
                    TValue ex=frame_get(f,a->target);
                    if(ex.type==TV_ERROR)
                        frame_set(f,a->target,make_number(0));
                }
            }

            for(int i=0;i<arr.arr.count;i++){
                Frame *cf=new_frame(f);
                frame_set(cf,"now",arr.arr.items[i]);

                exec_block(cf,fn->body,fn->body_count);

                for(int k=0;k<cf->count;k++){
                    if(strcmp(cf->keys[k],"now")!=0)
                        frame_set(f,cf->keys[k],cf->values[k]);
                }
            }
        }
    }

    else if(t==NODE_FUNC_CALL){
        FuncCallNode *fc=node;

        /* BUILT-IN */
        if(!strcmp(fc->name,"len")){
            TValue val=eval_expr(f,fc->arg_values[0]);
            if(val.type==TV_ARRAY)
                frame_set(f,fc->target,make_number(val.arr.count));
            else if(val.type==TV_STRING)
                frame_set(f,fc->target,make_number(strlen(val.str)));
            else
                frame_set(f,fc->target,make_error("!TYPE_ERROR"));
            return res;
        }

        if(!strcmp(fc->name,"split")){
            TValue str=eval_expr(f,fc->arg_values[0]);
            TValue sep=eval_expr(f,fc->arg_values[1]);

            TValue out; out.type=TV_ARRAY;
            out.arr.items=malloc(sizeof(TValue)*256);
            out.arr.count=0;

            char buf[256]; strcpy(buf,str.str);
            char *token=strtok(buf,sep.str);
            while(token){
                if(is_number(token))
                    out.arr.items[out.arr.count++]=make_number(atof(token));
                else
                    out.arr.items[out.arr.count++]=make_string(token);
                token=strtok(NULL,sep.str);
            }

            frame_set(f,fc->target,out);
            return res;
        }

        if(!strcmp(fc->name,"join")){
            TValue arr=eval_expr(f,fc->arg_values[0]);
            TValue sep=eval_expr(f,fc->arg_values[1]);

            char buf[1024]; buf[0]=0;
            for(int i=0;i<arr.arr.count;i++){
                if(i) strcat(buf,sep.str);
                TValue it=arr.arr.items[i];
                if(it.type==TV_NUMBER){
                    char tmp[64]; sprintf(tmp,"%g",it.num);
                    strcat(buf,tmp);
                } else if(it.type==TV_STRING){
                    strcat(buf,it.str);
                }
            }

            frame_set(f,fc->target,make_string(buf));
            return res;
        }

        if(!strcmp(fc->name,"sum")){
            TValue arr=eval_expr(f,fc->arg_values[0]);
            double total=0;
            for(int i=0;i<arr.arr.count;i++)
                total+=arr.arr.items[i].num;
            frame_set(f,fc->target,make_number(total));
            return res;
        }
        if(!strcmp(fc->name,"avg")){
            TValue arr=eval_expr(f,fc->arg_values[0]);
            if(arr.arr.count==0){
                frame_set(f,fc->target,make_error("!DIV0"));
                return res;
            }
            double total=0;
            for(int i=0;i<arr.arr.count;i++)
                total+=arr.arr.items[i].num;
            frame_set(f,fc->target,make_number(total/arr.arr.count));
            return res;
        }
        if(!strcmp(fc->name,"abs")){
            TValue val=eval_expr(f,fc->arg_values[0]);
            frame_set(f,fc->target,make_number(val.num<0 ? -val.num : val.num));
            return res;
        }
        if(!strcmp(fc->name,"max")){
            TValue a=eval_expr(f,fc->arg_values[0]);
            TValue b=eval_expr(f,fc->arg_values[1]);
            frame_set(f,fc->target,make_number(a.num>b.num ? a.num : b.num));
            return res;
        }
        if(!strcmp(fc->name,"min")){
            TValue a=eval_expr(f,fc->arg_values[0]);
            TValue b=eval_expr(f,fc->arg_values[1]);
            frame_set(f,fc->target,make_number(a.num<b.num ? a.num : b.num));
            return res;
        }
        FuncDefNode *fn=find_func(fc->name);
        if(!fn){
            frame_set(f,fc->target,make_error("!NO_FUNC"));
            return res;
        }

        Frame *nf=new_frame(NULL);

        for(int i=0;i<fc->arg_count;i++){
            TValue val=eval_expr(f,fc->arg_values[i]);
            frame_set(nf,fc->arg_names[i],val);
        }

        ExecResult r=exec_block(nf,fn->body,fn->body_count);

        if(r.has_return)
            frame_set(f,fc->target,r.value);
        else
            frame_set(f,fc->target,make_error("!NO_RETURN"));
    }

    else if(t==NODE_RETURN){
        ReturnNode *r=node;
        res.has_return=1;
        res.value=eval_expr(f,r->expr);
        return res;
    }

    else if(t==NODE_ASK){
        AskNode *a=node;
        printf("%s",a->prompt);
        char buf[256]; fgets(buf,256,stdin);
        buf[strcspn(buf,"\n")]=0;

        if(is_number(buf))
            frame_set(f,a->name,make_number(atof(buf)));
        else
            frame_set(f,a->name,make_string(buf));
    }

    else if(t==NODE_FILE_READ){
        FileReadNode *n=node;
        FILE *fp=fopen(n->path,"r");

        if(!fp){
            frame_set(f,n->target,make_error("!FILE_NOT_FOUND"));
        } else {
            TValue arr; arr.type=TV_ARRAY;
            arr.arr.items=malloc(sizeof(TValue)*256);
            arr.arr.count=0;

            char line[256];
            while(fgets(line,256,fp)){
                line[strcspn(line,"\n")]=0;
                if(is_number(line))
                arr.arr.items[arr.arr.count++]=make_number(atof(line));
            else
                arr.arr.items[arr.arr.count++]=make_string(line);
            }

            fclose(fp);
            frame_set(f,n->target,arr);
        }
    }

    else if(t==NODE_FILE_WRITE){
        FileWriteNode *n=node;
        FILE *fp=fopen(n->path, n->append_mode ? "a":"w");

        if(!fp) return res;

        TValue v=frame_get(f,n->source);

        if(v.type==TV_NUMBER) fprintf(fp,"%g\n",v.num);
        else if(v.type==TV_STRING) fprintf(fp,"%s\n",v.str);
        else if(v.type==TV_ARRAY){
            for(int i=0;i<v.arr.count;i++){
                TValue it=v.arr.items[i];
                if(it.type==TV_NUMBER) fprintf(fp,"%g\n",it.num);
                else if(it.type==TV_STRING) fprintf(fp,"%s\n",it.str);
            }
        }

        fclose(fp);
    }

    else if(t==NODE_SHOW){
        ShowNode *s=node;
        TValue v=frame_get(f,s->coord);

        if(v.type==TV_NUMBER) printf("%g\n",v.num);
        else if(v.type==TV_STRING) printf("%s\n",v.str);
        else if(v.type==TV_ARRAY){
            printf("[");
            for(int i=0;i<v.arr.count;i++){
                TValue it=v.arr.items[i];
                if(it.type==TV_NUMBER) printf("%g",it.num);
                else if(it.type==TV_STRING) printf("%s",it.str);
                if(i<v.arr.count-1) printf(", ");
            }
            printf("]\n");
        }
        else printf("%s\n",v.str);
    }

    return res;
}

/* ===== PROGRAM ===== */
typedef struct {
    void **tminus; int tminus_count;
    void **t0; int t0_count;
    void **tplus; int tplus_count;
} ProgramNode;

void run_program(ProgramNode *prog){
    Frame *global=new_frame(NULL);

    for(int i=0;i<prog->tminus_count;i++){
        if(*(NodeType*)prog->tminus[i]==NODE_FUNC_DEF)
            register_func((FuncDefNode*)prog->tminus[i]);
    }

    for(int i=0;i<prog->tminus_count;i++){
        if(*(NodeType*)prog->tminus[i]!=NODE_FUNC_DEF)
            exec_node(global,prog->tminus[i]);
    }

    for(int i=0;i<prog->t0_count;i++)
        exec_node(global,prog->t0[i]);

    for(int i=0;i<prog->tplus_count;i++)
        exec_node(global,prog->tplus[i]);
}
