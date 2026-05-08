[T-]
import "lib/basic/std.t"
import "lib/advanced/process.t"

func jq_get(json, key) {
    past(json) ~> J
    past(key) ~> K
    write_file(path="tjq.json", content=J) ~> tmp
    "jq -r '." + K + "' tjq.json" >> cmd
    exec(cmd=cmd) ~> raw
    trim(str=raw) ~> out
}

func jq_query(json, query) {
    past(json) ~> J
    past(query) ~> Q
    write_file(path="tjq.json", content=J) ~> tmp
    "jq -r '" + Q + "' tjq.json" >> cmd
    exec(cmd=cmd) ~> raw
    trim(str=raw) ~> out
}
