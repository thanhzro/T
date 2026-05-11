[T-]
"cat ai_rules.txt" >> cmd

[T0]
exec_bc(cmd=cmd) ~> rules

[T+]
show shall(rules)
