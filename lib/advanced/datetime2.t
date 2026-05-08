[T-]
import "lib/basic/std.t"
import "lib/advanced/process.t"

func format_date(ts) {
    past(ts) ~> TS
    toString(val=TS) ~> ts_str
    "date -d @" + ts_str + " +%Y-%m-%d" >> cmd
    exec(cmd=cmd) ~> raw
    trim(str=raw) ~> out
}

func format_time(ts) {
    past(ts) ~> TS
    toString(val=TS) ~> ts_str
    "date -d @" + ts_str + " +%H:%M:%S" >> cmd
    exec(cmd=cmd) ~> raw
    trim(str=raw) ~> out
}

func format_datetime(ts) {
    past(ts) ~> TS
    toString(val=TS) ~> ts_str
    "date -d @" + ts_str + " +%Y-%m-%d_%H:%M:%S | tr _ ' '" >> cmd
    exec(cmd=cmd) ~> raw
    trim(str=raw) ~> out
}
