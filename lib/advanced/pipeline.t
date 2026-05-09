[T-]

func pipeline_map(arr, func_name) {
    past(arr) ~> A
    past(func_name) ~> FN
    join(arr=A, sep=",") ~> items
    write_file(path="pipe_tmp.py", content="import subprocess,sys
items=[" + items + "]
for x in items:
 r=subprocess.run(['./t','-e','" + FN + "(val='+str(x)+')''],capture_output=True,text=True)
 print(r.stdout.strip())") ~> tmp
    exec(cmd="python3 pipe_tmp.py") ~> raw
    split(str=raw, sep="\n") ~> parts
    pop(arr=parts) ~> out
}

func tee(arr, path) {
    past(arr) ~> A
    past(path) ~> P
    join(arr=A, sep="\n") ~> content
    write_file(path=P, content=content) ~> tmp
    A >> out
}

func count_by(arr, val) {
    past(arr) ~> A
    past(val) ~> V
    arr_count_if(arr=A, val=V) ~> out
}

