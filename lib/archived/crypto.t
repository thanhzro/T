[T-]

func hash_md5(str) {
    past(str) ~> S
    md5(str=S) ~> out
}

func hash_sha256(str) {
    past(str) ~> S
    sha256(str=S) ~> out
}

func checksum(str) {
    past(str) ~> S
    sha256(str=S) ~> h
    slice(str=h, from=0, to=8) ~> out
}

func verify_md5(str, expected) {
    past(str) ~> S
    past(expected) ~> E
    md5(str=S) ~> actual
    indexOf(str=actual, sub=E) ~> idx
    indexOf(str=E, sub=actual) ~> idx2
    idx + idx2 >> s
    0 >> out
    Gate s (== 0) >> out
}

func to_hex_str(str) {
    past(str) ~> S
    to_hex(str=S) ~> out
}

func from_hex_str(str) {
    past(str) ~> S
    from_hex(str=S) ~> out
}

func hmac_sha256(key, msg) {
    past(key) ~> K
    past(msg) ~> M
    shell_escape(str=M) ~> em
    shell_escape(str=K) ~> ek
    write_file(path="hmac_tmp.sh", content="echo -n " + em + " | openssl dgst -sha256 -hmac " + K) ~> tmp
    exec(cmd="sh hmac_tmp.sh") ~> raw
    trim(str=raw) ~> out
}

func hash_sha1(str) {
    past(str) ~> S
    shell_escape(str=S) ~> esc
    "printf %s " + esc + " | sha1sum | cut -d' ' -f1" >> cmd
    exec(cmd=cmd) ~> raw
    trim(str=raw) ~> out
}

func hash_crc32(str) {
    past(str) ~> S
    shell_escape(str=S) ~> esc
    "printf %s " + esc + " | cksum | cut -d' ' -f1" >> cmd
    exec(cmd=cmd) ~> raw
    trim(str=raw) ~> out
}

func random_token(n) {
    past(n) ~> N
    toString(val=N) ~> ns
    exec(cmd="openssl rand -hex " + ns) ~> raw
    trim(str=raw) ~> out
}
