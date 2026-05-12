[T-]
"BVal by value" >> bug1
"iter in VM struct" >> bug2

[T0]
bug1 + ": output pointer" >> rule1
bug2 + ": use global" >> rule2

[T+]
show shall(rule1, rule2)
write("ai_rules.txt") shall(rule1)
write("ai_rules.txt") shall(rule2)
