[T-]
import "lib/basic/std.t"
import "lib/advanced/process.t"

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
    "echo " + esc + " | jq '." + K + "'" >> cmd
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
