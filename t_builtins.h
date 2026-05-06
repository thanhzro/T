#ifndef T_BUILTINS_H
#define T_BUILTINS_H

#include "t_types.h"

ExecResult call_builtin(Frame *f, FuncCallNode *fc, ExprNode res);

#endif