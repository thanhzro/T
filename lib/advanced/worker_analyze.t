[T-]
import "lib/basic/std.t"
[T0]
shell_exec(cmd="python3 check_runtime.py 2>&1 | grep '^FAIL'") ~> fails
trim(str=fails) ~> fails
tcon_query(query=fails) ~> rule
shell_exec(cmd="python3 check_runtime.py 2>&1 | grep -c '^FAIL'") ~> fail_count
trim(str=fail_count) ~> fail_count
toString(val=fail_count) ~> fail_str
write_file_t(path="army_report.txt", content=fail_str) ~> ok
Gate fail_count (== "0") {
    write_file_t(path="army_report.txt", content="ALL_PASS") ~> ok
}
[T+]
shall(fails)
shall(rule)
