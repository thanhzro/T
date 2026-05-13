[T-]
import "lib/basic/std.t"

[T0]
exec(cmd="grep -i 'gate' ai_rules.txt | head -3") ~> gate_rules
exec(cmd="grep -i 'loop' ai_rules.txt | head -3") ~> loop_rules
exec(cmd="grep -i 'native' ai_rules.txt | head -3") ~> native_rules

[T+]
show shall(gate_rules, loop_rules, native_rules)
