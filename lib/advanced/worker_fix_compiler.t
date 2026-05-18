[T-]
import "lib/basic/std.t"
py_script = "import re\nwith open('src/t_prog_compiler.c') as f:\n    c=f.read()\ncount=c.count('chunk_write(c,OP_PUSH_NUM); chunk_write(c,')\nif count>0:\n    c2=re.sub(r'chunk_write\\(c,OP_PUSH_NUM\\); chunk_write\\(c,([^;]+);',\n        lambda m: 'chunk_write(c,OP_PUSH_NUM); chunk_write(c,('+m.group(1).strip()+')>>8)\\&0xFF); chunk_write(c,('+m.group(1).strip()+')\\&0xFF);',\n        c)\n    open('src/t_prog_compiler.c','w').write(c2)\n    print('COMPILER_FIXED:'+str(count))\nelse:\n    print('COMPILER_NOTHING')\n"
[T0]
write_file_t(path="worker_fix_compiler.py", content=py_script) ~> ok
exec_bc(cmd="python3 worker_fix_compiler.py") ~> result
[T+]
show shall(result)
