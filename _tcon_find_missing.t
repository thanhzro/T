[T-]
import "lib/basic/std.t"

[T0]
exec(cmd="grep -o 'func [a-z_]*' lib/advanced/*.t | cut -d: -f2 | sort -u > _adv_funcs.txt && grep -o '\"[a-z_]*\"' src/t_natives.h | tr -d '\"' | sort -u > _native_funcs.txt && comm -23 _adv_funcs.txt _native_funcs.txt | head -20") ~> missing
exec(cmd="cat _adv_funcs.txt | wc -l") ~> total_adv
exec(cmd="cat _native_funcs.txt | wc -l") ~> total_nat

[T+]
show shall(total_adv, total_nat, missing)
