[T-]
import "lib/basic/std.t"
[T0]
file_read(path="army_report.txt") ~> fail_msg
trim(str=fail_msg) ~> fail_msg
0 >> is_pass
Gate fail_msg (== "ALL_PASS") >> is_pass
Gate is_pass (== 0) {
    tcon_query(query=fail_msg) ~> matched_rule
    write_file_t(path="matched_rule.txt", content=matched_rule) ~> ok
    shell_exec(cmd="grep -o 'CMD:.*' matched_rule.txt | sed 's/CMD://' | sh") ~> fix_result
    trim(str=fix_result) ~> fix_result
    write_file_t(path="fix_report.txt", content=fix_result) ~> ok
}
Gate is_pass (== 1) {
    write_file_t(path="fix_report.txt", content="NO_FIX_NEEDED") ~> ok
}
[T+]
shall(fail_msg)
