
#pragma once
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include "t_bytecode.h"

/* ===== NATIVE FUNCTIONS ===== */
double nat_floor(double*a,int n){return floor(a[0]);}
double nat_ceil(double*a,int n){return ceil(a[0]);}
double nat_sqrt(double*a,int n){return sqrt(a[0]);}
double nat_abs(double*a,int n){return fabs(a[0]);}
double nat_log(double*a,int n){return log(a[0]);}
double nat_sin(double*a,int n){return sin(a[0]);}
double nat_cos(double*a,int n){return cos(a[0]);}
double nat_exp(double*a,int n){return exp(a[0]);}
double nat_atan(double*a,int n){return atan(a[0]);}
double nat_atan2(double*a,int n){return atan2(a[0],a[1]);}
double nat_round(double*a,int n){return round(a[0]);}
double nat_pow(double*a,int n){return pow(a[0],a[1]);}
double nat_toNumber(double*a,int n){return a[0];}
double nat_len(double*a,int n){return a[0];}
double nat_isArray(double*a,int n){return 0;}
double nat_charCode(double*a,int n){return a[0];}

/* ===== REGISTER ALL NATIVES ===== */
void register_all_natives(VM *vm) {
    TFunc *f;
    #define REG1(nm, fn, p0) \
        f=&vm->funcs[vm->func_count++]; \
        strcpy(f->name,nm); f->is_native=1; f->native=fn; \
        f->param_count=1; strcpy(f->params[0],p0);
    #define REG2(nm, fn, p0, p1) \
        f=&vm->funcs[vm->func_count++]; \
        strcpy(f->name,nm); f->is_native=1; f->native=fn; \
        f->param_count=2; strcpy(f->params[0],p0); strcpy(f->params[1],p1);

    REG1("floor",  nat_floor,  "val")
    REG1("ceil",   nat_ceil,   "val")
    REG1("sqrt",   nat_sqrt,   "val")
    REG1("abs",    nat_abs,    "val")
    REG1("log",    nat_log,    "val")
    REG1("ln",     nat_log,    "val")
    REG1("sin",    nat_sin,    "val")
    REG1("cos",    nat_cos,    "val")
    REG1("exp_e",  nat_exp,    "val")
    REG1("atan",   nat_atan,   "val")
    REG2("atan2",  nat_atan2,  "y","x")
    REG1("round",  nat_round,  "val")
    REG2("pow",    nat_pow,    "base","exp")

    #undef REG1
    #undef REG2
}
