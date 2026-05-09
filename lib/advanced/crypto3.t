[T-]

func gen_password(length) {
    past(length) ~> N
    toString(val=N) ~> ns
    exec(cmd="cat /dev/urandom | tr -dc 'A-Za-z0-9!@#$%' | head -c " + ns) ~> raw
    trim(str=raw) ~> out
}

func str_rot13(str) {
    past(str) ~> S
    shell_escape(str=S) ~> esc
    write_file(path="rot_tmp.sh", content="echo " + esc + " | tr A-Za-z N-ZA-Mn-za-m") ~> tmp
    exec(cmd="sh rot_tmp.sh") ~> raw
    trim(str=raw) ~> out
}


func xor_hash(str, key) {
    past(str) ~> S
    past(key) ~> K
    shell_escape(str=S) ~> esc
    shell_escape(str=K) ~> ek
    write_file(path="xor_tmp.sh", content="python3 -c 's=" + esc + ";k=" + ek + ";print(bytes(a^b for a,b in zip(s.encode(),k.encode()*100)).hex()[:len(s)*2])' 2>/dev/null || echo ''") ~> tmp
    exec(cmd="sh xor_tmp.sh") ~> raw
    trim(str=raw) ~> out
}
