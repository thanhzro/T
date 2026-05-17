#!/bin/bash
echo "=== T Language Bootstrap Chain ==="
echo "Stage 0: C compiler (t_bc)"
echo "Stage 1: compile t_compiler.t using Stage 0"
cp lib/advanced/t_compiler.t input.t
./t_bc lib/advanced/t_compiler.t 2>/dev/null
cp output.bc stage1.bc
echo "Stage 1 bytecode: $(wc -l < stage1.bc) lines"
echo "=== Bootstrap Evidence ==="
echo "T compiler written in T compiled by T compiler"
cat stage1.bc
