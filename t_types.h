#ifndef T_TYPES_H
#define T_TYPES_H

#include <stdlib.h>

/* ================= NODE TYPES ================= */

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
    NODE_FILE_WRITE,
    NODE_ARRAY_LITERAL
} NodeType;

/* ================= VALUE SYSTEM ================= */

typedef enum {
    TV_NUMBER,
    TV_STRING,
    TV_BOOL,
    TV_ARRAY,
    TV_ERROR
} TValueType;

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

/* ================= EXPRESSIONS ================= */

typedef struct ExprNode ExprNode;

typedef struct {
    NodeType node_type;
    ExprNode **values;
    int count;
} ArrayLiteralNode;

struct ExprNode {
    int type; /* 0 literal, 1 ident, 2 binop, 3 array */
    char value[64];
    char op[4];
    ExprNode *l;
    ExprNode *r;
    ArrayLiteralNode *arr_node;
};

/* ================= AST NODES ================= */

typedef struct {
    NodeType node_type;
    char target[64];
    ExprNode *expr;
    int has_index;
    int index;
} AssignNode;

typedef struct {
    NodeType node_type;
    char source[64];

    char op[4];
    double value;

    char op2[4];
    double value2;

    char logic[4];
    char target[64];
} GateNode;

typedef struct {
    NodeType node_type;
    char name[64];
    ExprNode *expr;
} VarAssignNode;

typedef struct {
    NodeType node_type;
    char name[64];
    ExprNode **values;
    int count;
} ArrayAssignNode;

typedef struct {
    NodeType node_type;
    char name[64];
    char prompt[256];
} AskNode;

typedef struct {
    NodeType node_type;
    char source[64];
    void **body;
    int body_count;
} FNode;

typedef struct {
    NodeType node_type;
    char coord[64];
    char format[256];
} ShowNode;

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

/* ================= PROGRAM ================= */

typedef struct {
    void **tminus;
    int tminus_count;

    void **t0;
    int t0_count;

    void **tplus;
    int tplus_count;
} ProgramNode;

/* ================= FRAME ================= */

typedef struct Frame {
    char keys[256][64];
    TValue values[256];
    int count;
    struct Frame *parent;
} Frame;

/* ================= EXEC RESULT ================= */

typedef struct {
    int has_return;
    TValue value;
} ExecResult;

#endif
