/* ===== t_builtins.c ===== */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include "t_types.h"

TValue call_builtin(Frame *f, FuncCallNode *fc, ExecResult res){
    res.has_return = 1;

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

    if(!strcmp(fc->name,"split")){
        TValue str=eval_expr(f,fc->arg_values[0]);
        TValue sep=eval_expr(f,fc->arg_values[1]);
        TValue out; out.type=TV_ARRAY;
        out.arr.items=malloc(sizeof(TValue)*256);
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
            if(it.type==TV_NUMBER){
                char tmp[64];
                snprintf(tmp,63,"%g",it.num);
                strncat(buf,tmp,1023-strlen(buf));
            } else {
                strncat(buf,it.str,1023-strlen(buf));
            }
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

    if(!strcmp(fc->name,"upper")){
        TValue val=eval_expr(f,fc->arg_values[0]);
        char tmp[256]; strncpy(tmp,val.str,255); tmp[255]=0;
        for(int i=0;tmp[i];i++) tmp[i]=toupper(tmp[i]);
        frame_set(f,fc->target,make_string(tmp));
        return res;
    }

    if(!strcmp(fc->name,"lower")){
        TValue val=eval_expr(f,fc->arg_values[0]);
        char tmp[256]; strncpy(tmp,val.str,255); tmp[255]=0;
        for(int i=0;tmp[i];i++) tmp[i]=tolower(tmp[i]);
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

    if(!strcmp(fc->name,"abs")){
        TValue val=eval_expr(f,fc->arg_values[0]);
        frame_set(f,fc->target,make_number(val.num<0?-val.num:val.num));
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

    res.has_return = 0;
    return res;
}