[T-]
import "lib/basic/std.t"
[T0]
file_read(path="ai_rules.txt") ~> rules
fromChar(code=10) ~> nl
split(str=rules, sep=nl) ~> lines
write_file_t(path="audit_bugs.txt", content="=BUGS=") ~> ok0
write_file_t(path="audit_fixes.txt", content="=FIXES=") ~> ok1
0 >> bug_count
0 >> fix_count
F(lines) {
    indexOf(str=now, sub="BUG:") ~> is_bug
    indexOf(str=now, sub="FIX:") ~> is_fix
    0 >> bf
    Gate is_bug (== 0) >> bf
    Gate bf (== 1) >> bug_count
    bug_count + 1 >> bug_count
}
len(val=lines) ~> total_lines
[T+]
show shall(bug_count)
show shall(total_lines)
