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

func elapsed(start, end) {
    past(start) ~> S
    past(end) ~> E
    E - S >> out
}

func seconds_to_hms(secs) {
    past(secs) ~> S
    floor(val=S) ~> si
    si / 3600 >> h
    floor(val=h) ~> hours
    hours * 3600 >> h_secs
    si - h_secs >> rem
    rem / 60 >> m
    floor(val=m) ~> mins
    mins * 60 >> m_secs
    rem - m_secs >> secs_left
    toString(val=hours) ~> hs
    toString(val=mins) ~> ms
    toString(val=secs_left) ~> ss
    hs + "h " + ms + "m " + ss + "s" >> out
}
