#!/bin/bash
grep 'if(!strcmp' src/t_vm.c | grep -o '"[a-z_]*"' | tr -d '"' | sort > _vm_builtins.txt
grep 'strcpy.*name' src/t_natives.h | grep -o '"[a-z_]*"' | tr -d '"' | sort > _native_names.txt
echo "=== Already ported (in both t_vm.c and t_natives.h) ==="
comm -12 _vm_builtins.txt _native_names.txt
echo ""
echo "=== Still only in t_vm.c ==="
comm -23 _vm_builtins.txt _native_names.txt
echo ""
wc -l _vm_builtins.txt _native_names.txt
