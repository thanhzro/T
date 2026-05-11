[T-]
"cat ai_rules.txt 2>/dev/null" >> load_cmd
"BVal" >> pattern1
"iter" >> pattern2

[T0]
exec_bc(cmd=load_cmd) ~> memory
contains(str=memory, sub=pattern1) ~> found1
contains(str=memory, sub=pattern2) ~> found2
found1 + found2 >> total_known

[T+]
show shall(total_known, memory)
