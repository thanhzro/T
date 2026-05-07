#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>

/* ===== NODE TYPE ===== */
typedef enum {
    NODE_ASSIGN, NODE_GATE, NODE_F,
    NODE_VAR_ASSIGN, NODE_ARRAY_ASSIGN,
    NODE_SHOW, NODE_ASK,
    NODE_FUNC_DEF, NODE_FUNC_CALL, NODE_RETURN,
    NODE_FILE_READ, NODE_FILE_WRITE,
    NODE_ARRAY_LITERAL
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
    char **keys;
    TValue *values;
    int count;
    int capacity;
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
    char op[4]; double value; char str_val[256];
    char op2[4]; double value2; char str_val2[256];
    char logic[4];
    char target[64];
} GateNode;

typedef struct { NodeType node_type; char name[64]; ExprNode *expr; } VarAssignNode;
typedef struct { NodeType node_type; char name[64]; ExprNode **values; int count; } ArrayAssignNode;
typedef struct { NodeType node_type; char name[64]; char prompt[256]; } AskNode;
typedef struct { NodeType node_type; char source[64]; void **body; int body_count; } FNode;
typedef struct { NodeType node_type; char coord[64]; char format[256]; } ShowNode;

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

TValue make_string(const char *s){
    TValue v={TV_STRING};
    strncpy(v.str,s,255);
    v.str[255]=0;
    return v;
}

TValue make_error(const char *s){
    TValue v={TV_ERROR};
    strncpy(v.str,s,255);
    v.str[255]=0;
    return v;
}

/* ===== FRAME ===== */
Frame* new_frame(Frame *parent){
    Frame *f=malloc(sizeof(Frame));
    f->capacity=16;
    f->keys=malloc(sizeof(char*)*f->capacity);
    for(int i=0;i<f->capacity;i++) f->keys[i]=malloc(64);
    f->values=malloc(sizeof(TValue)*f->capacity);
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
    if(f->count>=f->capacity-1){
        f->capacity*=2;
        f->keys=realloc(f->keys,sizeof(char*)*f->capacity);
        for(int i=f->count;i<f->capacity;i++) f->keys[i]=malloc(64);
        f->values=realloc(f->values,sizeof(TValue)*f->capacity);
    }
    strncpy(f->keys[f->count],key,63);
    f->keys[f->count][63]=0;
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
    char errbuf[128];
    snprintf(errbuf,127,"!EMPTY_COORD(%s)",key);
    errbuf[127]=0;
    return make_error(errbuf);
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
    if(e->type==4) return make_string(e->value);
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
                if(a.type==TV_NUMBER) snprintf(sa,255,"%g",a.num); else { strncpy(sa,a.str,255); sa[255]=0; }
                if(b.type==TV_NUMBER) snprintf(sb,255,"%g",b.num); else { strncpy(sb,b.str,255); sb[255]=0; }
                strncpy(buf,sa,511); buf[511]=0;
                strncat(buf,sb,511-strlen(buf));
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
        if(!strcmp(e->op,"%")){
            if(b.num==0) return make_error("!DIV0");
            return make_number((int)a.num%(int)b.num);
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

int gate_check_str(const char *v, const char *op, const char *val){
    if(!strcmp(op,"==")) return !strcmp(v,val);
    if(!strcmp(op,"!=")) return strcmp(v,val)!=0;
    return 0;
}

ExecResult exec_node(Frame *f, void *node);

ExecResult exec_block(Frame *f, void **body, int count){
    ExecResult res={0};
    for(int i=0;i<count;i++){
        res = exec_node(f, body[i]);
        if(res.has_return) return res;
        /* >> out auto-return */
        TValue outval=frame_get(f,"out");
        if(outval.type!=TV_ERROR){ res.has_return=1; res.value=outval; return res; }
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

            if(arr.type!=TV_ARRAY){
                char eb[128];
                snprintf(eb,127,"!NOT_ARRAY(%s)",a->expr->value);
                eb[127]=0;
                val=make_error(eb);
            }
            else if(idx.num<0 || idx.num>=arr.arr.count){
                char eb[128];
                snprintf(eb,127,"!OUT_OF_BOUNDS(%d)",(int)idx.num);
                eb[127]=0;
                val=make_error(eb);
            }
            else val=arr.arr.items[(int)idx.num];
        } else {
            val = eval_expr(f,a->expr);
        }

        frame_set(f,a->target,val);
    }

    else if(t==NODE_GATE){
        GateNode *g=node;
        TValue v=frame_get(f,g->source);

        /* Resolve comparison value — variable or literal */
        double cmp1=g->value; const char *cstr1=g->str_val;
        TValue cv1=frame_get(f,g->str_val);
        if(cv1.type==TV_NUMBER) cmp1=cv1.num;
        else if(cv1.type==TV_STRING) cstr1=cv1.str;

        int pass1;
        if(v.type==TV_STRING)
            pass1=gate_check_str(v.str,g->op,cstr1);
        else
            pass1=gate_check(v.num,g->op,cmp1);
        int pass=pass1;

        if(g->logic[0]){
            double cmp2=g->value2; const char *cstr2=g->str_val2;
            TValue cv2=frame_get(f,g->str_val2);
            if(cv2.type==TV_NUMBER) cmp2=cv2.num;
            else if(cv2.type==TV_STRING) cstr2=cv2.str;

            int pass2;
            if(v.type==TV_STRING)
                pass2=gate_check_str(v.str,g->op2,cstr2);
            else
                pass2=gate_check(v.num,g->op2,cmp2);
            if(!strcmp(g->logic,"&&")) pass=pass1 && pass2;
            else pass=pass1 || pass2;
        }

        if(pass) frame_set(f,g->target,v);
        else{
            char buf[128];
            snprintf(buf,127,"!(%s)",g->target);
            buf[127]=0;
            frame_set(f,g->target,make_error(buf));
        }
    }

    else if(t==NODE_F){
        FNode *fn=node;
        TValue arr=frame_get(f,fn->source);

        int has_gate=0, has_now_assign=0;
        for(int i=0;i<fn->body_count;i++){
            if(*(NodeType*)fn->body[i]==NODE_GATE) has_gate=1;
            if(*(NodeType*)fn->body[i]==NODE_ASSIGN){
                AssignNode *a=(AssignNode*)fn->body[i];
                if(!strcmp(a->target,"now")) has_now_assign=1;
            }
            if(*(NodeType*)fn->body[i]==NODE_FUNC_CALL){
                FuncCallNode *fc=(FuncCallNode*)fn->body[i];
                if(!strcmp(fc->target,"now")) has_now_assign=1;
            }
        }

        /* Check if Gate target is "now" -> conditional transform */
        int gate_targets_now=0;
        for(int i=0;i<fn->body_count;i++){
            if(*(NodeType*)fn->body[i]==NODE_GATE){
                GateNode *gcheck=(GateNode*)fn->body[i];
                if(!strcmp(gcheck->target,"now")) gate_targets_now=1;
            }
        }

        if(has_gate && has_now_assign && gate_targets_now){
            /* CONDITIONAL TRANSFORM — pass Gate: transform, fail Gate: keep */
            GateNode *gn=NULL;
            for(int i=0;i<fn->body_count;i++)
                if(*(NodeType*)fn->body[i]==NODE_GATE)
                    gn=(GateNode*)fn->body[i];

            TValue out; out.type=TV_ARRAY;
            out.arr.items=malloc(sizeof(TValue)*arr.arr.count);
            out.arr.count=0;

            for(int j=0;j<arr.arr.count;j++){
                Frame *cf=new_frame(f);
                frame_set(cf,"now",arr.arr.items[j]);
                frame_set(cf,"idx",make_number(j));
                /* Chay cac node truoc Gate truoc */
                for(int k=0;k<fn->body_count;k++){
                    if(*(NodeType*)fn->body[k]!=NODE_GATE)
                        exec_node(cf,fn->body[k]);
                    else break;
                }
                exec_node(cf,gn);
                TValue resv=frame_get(cf,gn->target);
                if(resv.type!=TV_ERROR){
                    /* Chay cac node sau Gate */
                    int after_gate=0;
                    for(int k=0;k<fn->body_count;k++){
                        if(*(NodeType*)fn->body[k]==NODE_GATE){ after_gate=1; continue; }
                        if(after_gate) exec_node(cf,fn->body[k]);
                    }
                    out.arr.items[out.arr.count++]=frame_get(cf,"now");
                } else {
                    out.arr.items[out.arr.count++]=arr.arr.items[j];
                }
                free(cf);
            }
            frame_set(f,fn->source,out);
        }
        else if(has_gate){  /* FILTER or FILTER+TRANSFORM */
            /* FILTER MODE — node truoc Gate -> Gate -> node sau Gate (neu pass) */
            GateNode *gn=NULL;
            int gate_idx=-1;
            for(int i=0;i<fn->body_count;i++)
                if(*(NodeType*)fn->body[i]==NODE_GATE && gate_idx==-1){
                    gn=(GateNode*)fn->body[i];
                    gate_idx=i;
                }

            TValue out; out.type=TV_ARRAY;
            out.arr.items=malloc(sizeof(TValue)*arr.arr.count);
            out.arr.count=0;

            for(int j=0;j<arr.arr.count;j++){
                Frame *cf=new_frame(f);
                frame_set(cf,"now",arr.arr.items[j]);
                frame_set(cf,"idx",make_number(j));
                for(int k=0;k<gate_idx;k++)
                    exec_node(cf,fn->body[k]);
                exec_node(cf,gn);
                TValue resv=frame_get(cf,gn->target);
                if(resv.type!=TV_ERROR){
                    for(int k=gate_idx+1;k<fn->body_count;k++)
                        if(*(NodeType*)fn->body[k]!=NODE_GATE)
                            exec_node(cf,fn->body[k]);
                    TValue nowval=frame_get(cf,"now");
                    if(nowval.type!=TV_ERROR)
                        out.arr.items[out.arr.count++]=nowval;
                    else
                        out.arr.items[out.arr.count++]=arr.arr.items[j];
                }
                free(cf);
            }
            frame_set(f,gn->target,out);
        }
        else if(has_now_assign){
            TValue out; out.type=TV_ARRAY;
            out.arr.items=malloc(sizeof(TValue)*arr.arr.count);
            out.arr.count=0;

            for(int i=0;i<arr.arr.count;i++){
                Frame *cf=new_frame(f);
                frame_set(cf,"now",arr.arr.items[i]);
                frame_set(cf,"idx",make_number(i));
                exec_block(cf,fn->body,fn->body_count);
                out.arr.items[out.arr.count++]=frame_get(cf,"now");
                free(cf);
            }
            frame_set(f,fn->source,out);
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
                frame_set(cf,"idx",make_number(i));
                exec_block(cf,fn->body,fn->body_count);
                for(int k=0;k<cf->count;k++)
                    if(strcmp(cf->keys[k],"now")!=0)
                        frame_set(f,cf->keys[k],cf->values[k]);
                free(cf);
            }
        }
    }

    else if(t==NODE_FUNC_CALL){
        FuncCallNode *fc=node;

        if(!strcmp(fc->name,"len")){
            TValue val=eval_expr(f,fc->arg_values[0]);
            if(val.type==TV_ARRAY)
                frame_set(f,fc->target,make_number(val.arr.count));
            else if(val.type==TV_STRING)
                frame_set(f,fc->target,make_number(strlen(val.str)));
            else{
                char eb[128];
                snprintf(eb,127,"!TYPE_ERROR(%s)",fc->name);
                eb[127]=0;
                frame_set(f,fc->target,make_error(eb));
            }
            return res;
        }

        if(!strcmp(fc->name,"split")){
            TValue str=eval_expr(f,fc->arg_values[0]);
            TValue sep=eval_expr(f,fc->arg_values[1]);
            TValue out; out.type=TV_ARRAY;
            out.arr.items=malloc(sizeof(TValue)*(strlen(str.str)+1));
            out.arr.count=0;
            char buf[256]; strncpy(buf,str.str,255); buf[255]=0;
            char *token=strtok(buf,sep.str);
            while(token){
                if(is_number(token)) out.arr.items[out.arr.count++]=make_number(atof(token));
                else out.arr.items[out.arr.count++]=make_string(token);
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
                if(i) strncat(buf,sep.str,1023-strlen(buf));
                TValue it=arr.arr.items[i];
                if(it.type==TV_NUMBER){ char tmp[64]; snprintf(tmp,63,"%g",it.num); strncat(buf,tmp,1023-strlen(buf)); }
                else strncat(buf,it.str,1023-strlen(buf));
            }
            frame_set(f,fc->target,make_string(buf));
            return res;
        }
        if(!strcmp(fc->name,"trim")){
            TValue val=eval_expr(f,fc->arg_values[0]);
            char *s=val.str;
            while(*s==' '||*s=='\t') s++;
            char tmp[256]; strncpy(tmp,s,255); tmp[255]=0;
            int len=strlen(tmp);
            while(len>0&&(tmp[len-1]==' '||tmp[len-1]=='\t')) len--;
            tmp[len]=0;
            frame_set(f,fc->target,make_string(tmp));
            return res;
        }
        if(!strcmp(fc->name,"replace")){
            TValue str=eval_expr(f,fc->arg_values[0]);
            TValue old_s=eval_expr(f,fc->arg_values[1]);
            TValue new_s=eval_expr(f,fc->arg_values[2]);
            char result[1024]; result[0]=0;
            char *src=str.str;
            int olen=strlen(old_s.str);
            while(*src){
                if(strncmp(src,old_s.str,olen)==0){
                    strncat(result,new_s.str,1023-strlen(result));
                    src+=olen;
                } else {
                    char tmp[2]={*src,0};
                    strncat(result,tmp,1023-strlen(result));
                    src++;
                }
            }
            frame_set(f,fc->target,make_string(result));
            return res;
        }
        if(!strcmp(fc->name,"contains")){
            TValue str=eval_expr(f,fc->arg_values[0]);
            TValue sub=eval_expr(f,fc->arg_values[1]);
            frame_set(f,fc->target,make_number(strstr(str.str,sub.str)!=NULL));
            return res;
        }
        if(!strcmp(fc->name,"indexOf")){
            TValue str=eval_expr(f,fc->arg_values[0]);
            TValue sub=eval_expr(f,fc->arg_values[1]);
            char *found=strstr(str.str,sub.str);
            frame_set(f,fc->target,make_number(found ? (int)(found-str.str) : -1));
            return res;
        }

        if(!strcmp(fc->name,"max")){
            TValue a=eval_expr(f,fc->arg_values[0]);
            TValue b=eval_expr(f,fc->arg_values[1]);
            frame_set(f,fc->target,make_number(a.num>b.num?a.num:b.num));
            return res;
        }
        if(!strcmp(fc->name,"min")){
            TValue a=eval_expr(f,fc->arg_values[0]);
            TValue b=eval_expr(f,fc->arg_values[1]);
            frame_set(f,fc->target,make_number(a.num<b.num?a.num:b.num));
            return res;
        }
        if(!strcmp(fc->name,"chars")){
            TValue val=eval_expr(f,fc->arg_values[0]);
            TValue out; out.type=TV_ARRAY;
            out.arr.items=malloc(sizeof(TValue)*strlen(val.str)+1);
            out.arr.count=0;
            for(int i=0;val.str[i];i++){
                char tmp[2]={val.str[i],0};
                out.arr.items[out.arr.count++]=make_string(tmp);
            }
            frame_set(f,fc->target,out);
            return res;
        }
        if(!strcmp(fc->name,"charCode")){
            TValue val=eval_expr(f,fc->arg_values[0]);
            frame_set(f,fc->target,make_number((double)val.str[0]));
            return res;
        }
        if(!strcmp(fc->name,"fromChar")){
            TValue val=eval_expr(f,fc->arg_values[0]);
            char tmp[2]={(char)(int)val.num,0};
            frame_set(f,fc->target,make_string(tmp));
            return res;
        }

        if(!strcmp(fc->name,"range")){
            TValue n=eval_expr(f,fc->arg_values[0]);
            TValue out; out.type=TV_ARRAY;
            out.arr.items=malloc(sizeof(TValue)*(int)n.num);
            out.arr.count=(int)n.num;
            for(int i=0;i<(int)n.num;i++)
                out.arr.items[i]=make_number(i);
            frame_set(f,fc->target,out);
            return res;
        }
        if(!strcmp(fc->name,"get")){
            TValue arr=eval_expr(f,fc->arg_values[0]);
            TValue idx=eval_expr(f,fc->arg_values[1]);
            int i=(int)idx.num;
            if(arr.type!=TV_ARRAY||i<0||i>=arr.arr.count)
                frame_set(f,fc->target,make_error("!OUT_OF_BOUNDS"));
            else
                frame_set(f,fc->target,arr.arr.items[i]);
            return res;
        }

        if(!strcmp(fc->name,"slice")){
            TValue str=eval_expr(f,fc->arg_values[0]);
            TValue from=eval_expr(f,fc->arg_values[1]);
            TValue to=eval_expr(f,fc->arg_values[2]);
            int a=(int)from.num, b=(int)to.num;
            int len=strlen(str.str);
            if(a<0) a=0;
            if(b>len) b=len;
            if(a>=b){ frame_set(f,fc->target,make_string("")); return res; }
            char buf[256]; int n=b-a;
            if(n>255) n=255;
            strncpy(buf,str.str+a,n);
            buf[n]=0;
            frame_set(f,fc->target,make_string(buf));
            return res;
        }
        if(!strcmp(fc->name,"padLeft")){
            TValue str=eval_expr(f,fc->arg_values[0]);
            TValue n=eval_expr(f,fc->arg_values[1]);
            TValue ch=eval_expr(f,fc->arg_values[2]);
            int total=(int)n.num, slen=strlen(str.str);
            char buf[512]; buf[0]=0;
            for(int i=0;i<total-slen;i++) strncat(buf,ch.str,511-strlen(buf));
            strncat(buf,str.str,511-strlen(buf));
            frame_set(f,fc->target,make_string(buf));
            return res;
        }
        if(!strcmp(fc->name,"padRight")){
            TValue str=eval_expr(f,fc->arg_values[0]);
            TValue n=eval_expr(f,fc->arg_values[1]);
            TValue ch=eval_expr(f,fc->arg_values[2]);
            int total=(int)n.num, slen=strlen(str.str);
            char buf[512]; strncpy(buf,str.str,511); buf[511]=0;
            for(int i=0;i<total-slen;i++) strncat(buf,ch.str,511-strlen(buf));
            frame_set(f,fc->target,make_string(buf));
            return res;
        }
        if(!strcmp(fc->name,"floor")){
            TValue v=eval_expr(f,fc->arg_values[0]);
            frame_set(f,fc->target,make_number((double)(long long)v.num));
            return res;
        }
        if(!strcmp(fc->name,"ceil")){
            TValue v=eval_expr(f,fc->arg_values[0]);
            double n=v.num;
            long long t=(long long)n;
            frame_set(f,fc->target,make_number(n>t?t+1:t));
            return res;
        }
        if(!strcmp(fc->name,"round")){
            TValue v=eval_expr(f,fc->arg_values[0]);
            frame_set(f,fc->target,make_number((double)(long long)(v.num+0.5)));
            return res;
        }

        if(!strcmp(fc->name,"unique")){
            TValue arr=eval_expr(f,fc->arg_values[0]);
            TValue out; out.type=TV_ARRAY;
            out.arr.items=malloc(sizeof(TValue)*arr.arr.count);
            out.arr.count=0;
            for(int i=0;i<arr.arr.count;i++){
                int found=0;
                for(int j=0;j<out.arr.count;j++){
                    if(arr.arr.items[i].type==TV_NUMBER && out.arr.items[j].type==TV_NUMBER && arr.arr.items[i].num==out.arr.items[j].num){ found=1; break; }
                    if(arr.arr.items[i].type==TV_STRING && out.arr.items[j].type==TV_STRING && !strcmp(arr.arr.items[i].str,out.arr.items[j].str)){ found=1; break; }
                }
                if(!found) out.arr.items[out.arr.count++]=arr.arr.items[i];
            }
            frame_set(f,fc->target,out);
            return res;
        }
        if(!strcmp(fc->name,"push")){
            TValue arr=eval_expr(f,fc->arg_values[0]);
            TValue val=eval_expr(f,fc->arg_values[1]);
            TValue out; out.type=TV_ARRAY;
            out.arr.items=malloc(sizeof(TValue)*(arr.arr.count+1));
            out.arr.count=arr.arr.count+1;
            for(int i=0;i<arr.arr.count;i++) out.arr.items[i]=arr.arr.items[i];
            out.arr.items[arr.arr.count]=val;
            frame_set(f,fc->target,out);
            return res;
        }
        if(!strcmp(fc->name,"pop")){
            TValue arr=eval_expr(f,fc->arg_values[0]);
            if(arr.arr.count==0){ frame_set(f,fc->target,make_error("!EMPTY")); return res; }
            TValue out; out.type=TV_ARRAY;
            out.arr.items=malloc(sizeof(TValue)*(arr.arr.count-1));
            out.arr.count=arr.arr.count-1;
            for(int i=0;i<out.arr.count;i++) out.arr.items[i]=arr.arr.items[i];
            frame_set(f,fc->target,out);
            return res;
        }
        if(!strcmp(fc->name,"flatten")){
            TValue arr=eval_expr(f,fc->arg_values[0]);
            TValue out; out.type=TV_ARRAY;
            out.arr.items=malloc(sizeof(TValue)*arr.arr.count*8);
            out.arr.count=0;
            for(int i=0;i<arr.arr.count;i++){
                if(arr.arr.items[i].type==TV_ARRAY){
                    for(int j=0;j<arr.arr.items[i].arr.count;j++)
                        out.arr.items[out.arr.count++]=arr.arr.items[i].arr.items[j];
                } else {
                    out.arr.items[out.arr.count++]=arr.arr.items[i];
                }
            }
            frame_set(f,fc->target,out);
            return res;
        }
        if(!strcmp(fc->name,"zip")){
            TValue a=eval_expr(f,fc->arg_values[0]);
            TValue b=eval_expr(f,fc->arg_values[1]);
            int n=a.arr.count<b.arr.count?a.arr.count:b.arr.count;
            TValue out; out.type=TV_ARRAY;
            out.arr.items=malloc(sizeof(TValue)*n*2);
            out.arr.count=n*2;
            for(int i=0;i<n;i++){
                out.arr.items[i*2]=a.arr.items[i];
                out.arr.items[i*2+1]=b.arr.items[i];
            }
            frame_set(f,fc->target,out);
            return res;
        }
        if(!strcmp(fc->name,"sqrt")){
            TValue v=eval_expr(f,fc->arg_values[0]);
            double r=v.num, x=r;
            for(int i=0;i<20;i++) x=0.5*(x+r/x);
            frame_set(f,fc->target,make_number(x));
            return res;
        }
        FuncDefNode *fn=find_func(fc->name);
        if(!fn){
            char errbuf[128];
            snprintf(errbuf,127,"!NO_FUNC(%s)",fc->name);
            errbuf[127]=0;
            frame_set(f,fc->target,make_error(errbuf));
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

        free(nf);
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
            char eb[128];
            snprintf(eb,127,"!FILE_NOT_FOUND(%s)",n->path);
            eb[127]=0;
            frame_set(f,n->target,make_error(eb));
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

        if(s->format[0]){
            char out[512]; char tmp[256];
            if(v.type==TV_NUMBER) snprintf(tmp,255,"%g",v.num);
            else { strncpy(tmp,v.str,255); tmp[255]=0; }

            char *ph=strstr(s->format,"{}");
            if(ph){
                int pre=(int)(ph-s->format);
                strncpy(out,s->format,pre);
                out[pre]=0;
                strncat(out,tmp,511-strlen(out));
                strncat(out,ph+2,511-strlen(out));
            } else {
                strncpy(out,s->format,511);
                out[511]=0;
            }
            printf("%s\n",out);
        }
        else if(v.type==TV_NUMBER) printf("%g\n",v.num);
        else if(v.type==TV_STRING) printf("%s\n",v.str);
        else if(v.type==TV_ERROR) printf("%s\n",v.str);
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