[T-]

func jq_get(json, key) {
    past(json) ~> J
    past(key) ~> K
    shell_escape(str=J) ~> esc
    "echo " + esc + " | jq -r '." + K + "'" >> cmd
    exec(cmd=cmd) ~> raw
    trim(str=raw) ~> out
}

func jq_get_num(json, key) {
    past(json) ~> J
    past(key) ~> K
    shell_escape(str=J) ~> esc
    write_file(path="jq_cmd.sh", content="jq ." + K + "=" + ev + " tjq.json") ~> tmp2
    exec(cmd="sh jq_cmd.sh") ~> out
    exec(cmd=cmd) ~> raw
    trim(str=raw) ~> n
    toNumber(val=n) ~> out
}

func jq_keys(json) {
    past(json) ~> J
    shell_escape(str=J) ~> esc
    "echo " + esc + " | jq -r 'keys[]'" >> cmd
    exec(cmd=cmd) ~> raw
    trim(str=raw) ~> flat
    split(str=flat, sep="\n") ~> out
}

func jq_query(json, query) {
    past(json) ~> J
    past(query) ~> Q
    shell_escape(str=J) ~> esc
    "echo " + esc + " | jq -r '" + Q + "'" >> cmd
    exec(cmd=cmd) ~> raw
    trim(str=raw) ~> out
}

func jq_pretty(json) {
    past(json) ~> J
    shell_escape(str=J) ~> esc
    "echo " + esc + " | jq '.'" >> cmd
    exec(cmd=cmd) ~> out
}

func jq_update(json, key, val) {
    past(json) ~> J
    past(key) ~> K
    past(val) ~> V
    write_file(path="tjq.json", content=J) ~> tmp
    shell_escape(str=V) ~> ev
    write_file(path="jq_cmd.sh", content="jq ." + K + "=" + ev + " tjq.json") ~> tmp2
    exec(cmd="sh jq_cmd.sh") ~> out
}

func jq_update(json, key, val) {
    past(json) ~> J
    past(key) ~> K
    past(val) ~> V
    write_file(path="tjq.json", content=J) ~> tmp
    shell_escape(str=V) ~> ev
    write_file(path="jq_cmd.sh", content="jq ." + K + "=" + ev + " tjq.json") ~> tmp2
    exec(cmd="sh jq_cmd.sh") ~> out
}
