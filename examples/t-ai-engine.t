[T-]
import "lib/basic/std.t"

[T0]
exec(cmd="echo 'Gate filter not working' | tr '[:upper:]' '[:lower:]'") ~> query
exec(cmd="grep -i 'gate' ai_rules.txt | head -3") ~> gate_rules
exec(cmd="grep -i 'filter' ai_rules.txt | head -3") ~> filter_rules
exec(cmd="grep -i 'native' ai_rules.txt | head -3") ~> native_rules

[T+]
show shall(query, gate_rules, filter_rules, native_rules)
