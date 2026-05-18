[T-]
import "lib/basic/std.t"
py_script = "import subprocess,re\nr=subprocess.run(['grep','-n','OP_PUSH_NUM','src/t_bytecode.h','src/t_prog_compiler.c'],capture_output=True,text=True)\nopen('worker_analyze_result.txt','w').write(r.stdout)\nprint('done')\n"
[T0]
write_file_t(path="worker_analyze.py", content=py_script) ~> ok
shell_exec(cmd="python3 worker_analyze.py") ~> result
file_read(path="worker_analyze_result.txt") ~> analysis
[T+]
show shall(result)
show shall(analysis)
