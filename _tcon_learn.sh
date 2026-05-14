#!/bin/bash
python3 - << 'PYEOF'
import subprocess, os
if not os.path.exists('_train_log.txt'): 
    print("Rules total:", len(open('ai_rules.txt').readlines()))
    exit()
existing = open('ai_rules.txt').read()
new_rules = []
for line in open('_train_log.txt'):
    line = line.strip()
    if not line: continue
    func = line.split(']')[0].lstrip('[') if '[' in line else ''
    rule_text = line.split('→')[-1].strip() if '→' in line else ''
    new_rule = f"tcon_learned: {func} → {rule_text}"
    if f"tcon_learned: {func}" not in existing:
        new_rules.append(new_rule)
        existing += new_rule
if new_rules:
    open('ai_rules.txt','a').write('\n'.join(new_rules)+'\n')
print("Rules total:", len(open('ai_rules.txt').readlines()))
PYEOF
