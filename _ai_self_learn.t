[T-]
"cat ai_rules.txt 2>/dev/null" >> load_cmd
"arm64" >> new_pattern
"struct return" >> new_fix
": " >> sep

[T0]
exec_bc(cmd=load_cmd) ~> memory
contains(str=memory, sub=new_pattern) ~> already_known
new_pattern + ": struct return" >> new_rule

[T+]
show shall(already_known, new_rule)
write("ai_rules.txt") shall(new_rule)
