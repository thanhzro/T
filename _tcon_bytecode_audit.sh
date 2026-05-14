#!/bin/bash
echo "=== T con Bytecode Audit ==="

# Check missing opcodes
echo "--- Opcodes in enum:"
grep "OP_" src/t_bytecode.h | grep -v "//" | head -5

echo "--- Opcodes with case handler:"
grep "case OP_" src/t_bytecode.h | wc -l

echo "--- Missing handlers:"
grep "OP_" src/t_bytecode.h | grep -oP "OP_\w+" | sort -u > /tmp/all_ops.txt
grep "case OP_" src/t_bytecode.h | grep -oP "OP_\w+" | sort -u > /tmp/handled_ops.txt
diff /tmp/all_ops.txt /tmp/handled_ops.txt | grep "^<"
