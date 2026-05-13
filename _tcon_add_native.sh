#!/bin/bash
# T con auto-add missing native
FUNC=$1
SIG=$(grep "^$FUNC:" _tcon_sigs.txt | cut -d: -f2)
[ -z "$SIG" ] && echo "No sig for $FUNC" && exit 1

# Detect type from signature
FIRST_PARAM=$(echo $SIG | cut -d, -f1)
case $FIRST_PARAM in
    str|sub) TYPE="str" ;;
    arr) TYPE="arr" ;;
    *) TYPE="num" ;;
esac

echo "Adding native: $FUNC ($TYPE type)"

python3 << PYEOF
with open('src/t_natives.h') as f:
    c = f.read()

func = "$FUNC"
sig = "$SIG"
params = sig.split(',')
ptype = "$TYPE"

# Generate C native based on type
if ptype == "num":
    native = f'''
double nat_{func}_auto(BVal *stack, int argc){{
    if(argc<1) return 0;
    /* TODO: implement {func} */
    return stack[0].num;
}}
'''
    reg = f'    {{TFunc*f2=&vm->funcs[vm->func_count++];strcpy(f2->name,"{func}");f2->is_native=3;f2->native_m=nat_{func}_auto;f2->param_count={len(params)};'
elif ptype == "str":
    native = f'''
char* nat_{func}_auto(char**a,int n){{
    if(n<1||!a[0]) return strdup("");
    /* TODO: implement {func} */
    return strdup(a[0]);
}}
'''
    reg = f'    REG_S{len(params)}("{func}",nat_{func}_auto'

for i,p in enumerate(params):
    reg += f';strcpy(f2->params[{i}],"{p}")'
reg += ';}'

c = c.replace('void nat_push_val', native + 'void nat_push_val')
c = c.replace(
    '    {TFunc*f=&vm->funcs[vm->func_count++];strcpy(f->name,"reverse");',
    reg + '\n    {TFunc*f=&vm->funcs[vm->func_count++];strcpy(f->name,"reverse");'
)
with open('src/t_natives.h','w') as f:
    f.write(c)
print(f"Added native: {func}")
PYEOF
