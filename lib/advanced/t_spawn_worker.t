[T-]
import "lib/basic/std.t"
[T0]
file_read(path="spawn_config.txt") ~> config
file_read(path="lib/advanced/worker_template.t") ~> tmpl
fromChar(code=10) ~> nl
split(str=config, sep=nl) ~> lines
get(arr=lines, idx=0) ~> worker_id
get(arr=lines, idx=1) ~> worker_msg
_trim_c(str=worker_id) ~> worker_id
_trim_c(str=worker_msg) ~> worker_msg
"worker_" + worker_id >> worker_name
worker_name + ".t" >> worker_file
worker_name + "_done.txt" >> done_file
replace(str=tmpl, from="WORKER_MSG", to=worker_msg) ~> code1
replace(str=code1, from="WORKER_PATH", to=done_file) ~> final_code
write_file_t(path=worker_file, content=final_code) ~> ok1
spawn_file(fpath=worker_file) ~> done
[T+]
show shall(worker_file)
show shall(done)
