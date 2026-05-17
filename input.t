[T-]
import "lib/basic/std.t"
import "lib/advanced/t_parser.t"
import "lib/advanced/t_codegen.t"

[T0]
file_read(path="input.t") ~> src
get_tzero(src=src) ~> t0_section
get(arr=t0_section, idx=0) ~> t0_str
fromChar(code=10) ~> nl
split(str=t0_str, sep=nl) ~> t0_lines
"[" >> bracket
arr_filter_not_starts(arr=t0_lines, prefix=bracket) ~> t0_nonempty
[] >> t0_code
F(t0_nonempty) { Gate now (!= "") >> t0_code }
compile_all(lines=t0_code) ~> all_instrs
write_output(instrs=all_instrs, path="output.bc", nl=nl) ~> ok

[T+]
show shall(ok)
