[T-]

func regex_replace(str, pat, rep) {
    past(str) ~> S
    past(pat) ~> P
    past(rep) ~> R
    shell_escape(str=S) ~> es
    write_file(path="rx_tmp.sh", content="echo " + es + " | sed s/" + P + "/" + R + "/g") ~> tmp
    exec(cmd="sh rx_tmp.sh") ~> raw
    trim(str=raw) ~> out
}

func regex_count(str, pat) {
    past(str) ~> S
    past(pat) ~> P
    shell_escape(str=S) ~> es
    shell_escape(str=P) ~> ep
    write_file(path="rx_tmp.sh", content="echo " + es + " | grep -oE " + ep + " | wc -l") ~> tmp
    exec(cmd="sh rx_tmp.sh") ~> raw
    trim(str=raw) ~> n
    toNumber(val=n) ~> out
}

func regex_extract_all(str, pat) {
    past(str) ~> S
    past(pat) ~> P
    shell_escape(str=S) ~> es
    shell_escape(str=P) ~> ep
    write_file(path="rx_tmp.sh", content="echo " + es + " | grep -oE " + ep) ~> tmp
    exec(cmd="sh rx_tmp.sh") ~> raw
    trim(str=raw) ~> flat
    split(str=flat, sep="\n") ~> out
}

func regex_test(str, pat) {
    past(str) ~> S
    past(pat) ~> P
    regex_match(str=S, pat=P) ~> out
}

func regex_first(str, pat) {
    past(str) ~> S
    past(pat) ~> P
    regex_find(str=S, pat=P) ~> out
}
