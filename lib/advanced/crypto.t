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
    Gate s (== 0) >> O1
    isNumber(val=O1) ~> out
}

func to_hex_str(str) {
    past(str) ~> S
    to_hex(str=S) ~> out
}

func from_hex_str(str) {
    past(str) ~> S
    from_hex(str=S) ~> out
}
