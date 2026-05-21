[T-]


func now_date() {
    timestamp() ~> ts
    format_date(ts=ts) ~> out
}

func now_time() {
    timestamp() ~> ts
    format_time(ts=ts) ~> out
}

func now_datetime() {
    timestamp() ~> ts
    format_datetime(ts=ts) ~> out
}

func date_add(ts, days) {
    past(ts) ~> T
    past(days) ~> D
    D * 86400 >> secs
    T + secs >> out
}

func day_of_week(ts) {
    past(ts) ~> T
    T / 86400 >> days
    days % 7 >> dow
    dow + 4 >> out
}

func date_diff(t1, t2) {
    past(t1) ~> A
    past(t2) ~> B
    B - A >> diff
    diff / 86400 >> out
}

func days_in_month(month, year) {
    past(month) ~> M
    past(year) ~> Y
    toString(val=M) ~> ms
    toString(val=Y) ~> ys
    exec(cmd="python3 -c 'import calendar;print(calendar.monthrange(" + ys + "," + ms + ")[1])'") ~> raw
    trim(str=raw) ~> n
    toNumber(val=n) ~> out
}

func is_leap_year(year) {
    past(year) ~> Y
    toString(val=Y) ~> ys
    exec(cmd="python3 -c 'import calendar;print(1 if calendar.isleap(" + ys + ") else 0)'") ~> raw
    trim(str=raw) ~> n
    toNumber(val=n) ~> out
}

func unix_to_date(ts) {
    past(ts) ~> T
    toString(val=T) ~> ts_str
    write_file(path="ts_tmp.sh", content="date -d @$(printf %.0f " + ts_str + ") +%Y-%m-%d") ~> tmp
    exec(cmd="sh ts_tmp.sh") ~> raw
    trim(str=raw) ~> out
}
