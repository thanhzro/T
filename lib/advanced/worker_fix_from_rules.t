[T-]
import "lib/basic/std.t"
[T0]
file_read(path="army_report.txt") ~> fail_msg
trim(str=fail_msg) ~> fail_msg
Gate fail_msg (== "ALL_PASS") {
    write_file_t(path="fix_report.txt", content="NO_FIX_NEEDED") ~> ok
}
0 >> is_pass
Gate fail_msg (== "ALL_PASS") >> is_pass
Gate is_pass (== 0) {
    shell_exec(cmd="grep '^FIX:' ai_rules.txt") ~> fix_rules
    tcon_query(query=fail_msg) ~> matched_rule
    write_file_t(path="fix_report.txt", content=matched_rule) ~> ok
}
[T+]
shall(fail_msg)
