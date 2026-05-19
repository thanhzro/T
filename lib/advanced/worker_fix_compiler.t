[T-]
import "lib/basic/std.t"
script = "import re\nwith open('src/t_prog_compiler.c') as f:\n    c=f.read()\ncount=c.count('chunk_write(c, OP_PUSH_NUM); chunk_write(c, ')\nif count>0:\n    print('COMPILER_FIXED:'+str(count))\nelse:\n    print('COMPILER_NOTHING')\n"
[T0]
write_file_t(path="wfcomp.py", content=script) ~> ok
shell_exec(cmd="python3 wfcomp.py") ~> result
trim(str=result) ~> result
[T+]
shall(result)
