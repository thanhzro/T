[T-]

func time_now() {
    timestamp() ~> out
}

func time_diff(ts1, ts2) {
    past(ts1) ~> T1
    past(ts2) ~> T2
    T2 - T1 >> out
}

func time_add_days(ts, days) {
    past(ts) ~> T
    past(days) ~> D
    D * 86400 >> secs
    T + secs >> out
}

func time_to_date(ts) {
    past(ts) ~> T
    toString(val=T) ~> ts_str
    write_file(path="ts_tmp.sh", content="date -d @$(printf '%.0f' " + ts_str + ") +%Y-%m-%d") ~> tmp
    exec(cmd="sh ts_tmp.sh") ~> raw
    trim(str=raw) ~> out
}

func time_elapsed(ts) {
    past(ts) ~> T
    timestamp() ~> now
    now - T >> diff
    floor(val=diff) ~> out
}

func sleep_sec(n) {
    past(n) ~> N
    toString(val=N) ~> ns
    exec(cmd="sleep " + ns) ~> out
}
