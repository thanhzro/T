[T-]
import "lib/basic/std.t"
import "lib/intermediate/std.t"

[T0]
file_read(path="src/t_prog_compiler.c") ~> src
len(val=src) ~> src_len

split(str=src, sep="\n") ~> lines
len(val=lines) ~> line_count

indexOf(str=src, sub="compile_program") ~> has_compiler
indexOf(str=src, sub="OP_CALL") ~> has_opcodes

[T+]
show shall(src_len)
show shall(line_count)
show shall(has_compiler)
show shall(has_opcodes)
