#!/bin/bash
echo "=== T con: Natives to keep in C ==="
cat << 'CORE'
KEEP (I/O + VM primitives):
- push, get, len, exec
- write_file, read_file  
- range_step, range_bc
- upper, lower, trim (char-level ops)
- md5, sha256 (crypto, needs C)
- split, join (string ops, performance)
- sort (performance critical)

MOVE TO T LIB (logic only):
- gcd, lcm → lib/intermediate/math2.t (already there!)
- flatten → lib/basic/array.t (already there!)
- unique → lib/basic/array.t (already there!)
- contains, str_starts, str_ends → lib/basic/string.t
- max, min → lib/basic/math.t
- reverse → lib/basic/array.t
CORE

echo ""
echo "Lines in t_natives.h now: $(wc -l < src/t_natives.h)"
echo "Estimated after cleanup: ~400 lines"
