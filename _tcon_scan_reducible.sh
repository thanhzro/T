#!/bin/bash
echo "=== T con: Reducible C natives ==="

echo "--- Natives that are just math wrappers (can be T):"
grep -A3 "REG1\|is_native=1" src/t_natives.h | grep '"[a-z]*"' | grep -oP '"[a-z_]+"' | tr -d '"' | sort -u | head -15

echo ""
echo "--- Current C size breakdown:"
grep -c "^double nat_" src/t_natives.h | xargs echo "  Math/mix functions:"
grep -c "^char\* nat_" src/t_natives.h | xargs echo "  String functions:"
grep -c "^void nat_" src/t_natives.h | xargs echo "  Array/void functions:"
grep -c "REG1\|REG_S1\|REG_S2" src/t_natives.h | xargs echo "  Simple registrations:"

echo ""
echo "Lines: $(wc -l < src/t_natives.h)"
