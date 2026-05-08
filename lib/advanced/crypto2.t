[T-]

func aes_encrypt(data, key) {
    past(data) ~> D
    past(key) ~> K
    shell_escape(str=D) ~> esc
    "echo " + esc + " | openssl enc -aes-256-cbc -pbkdf2 -pass pass:" + K + " -base64" >> cmd
    exec(cmd=cmd) ~> raw
    trim(str=raw) ~> out
}

func aes_decrypt(data, key) {
    past(data) ~> D
    past(key) ~> K
    shell_escape(str=D) ~> esc
    "echo " + esc + " | openssl enc -d -aes-256-cbc -pbkdf2 -pass pass:" + K + " -base64" >> cmd
    exec(cmd=cmd) ~> raw
    trim(str=raw) ~> out
}

func base64_encode(str) {
    past(str) ~> S
    shell_escape(str=S) ~> esc
    "echo " + esc + " | base64" >> cmd
    exec(cmd=cmd) ~> raw
    trim(str=raw) ~> out
}

func base64_decode(str) {
    past(str) ~> S
    trim(str=S) ~> ts
    shell_escape(str=ts) ~> esc
    "echo " + esc + " | base64 -d" >> cmd
    exec(cmd=cmd) ~> out
}
