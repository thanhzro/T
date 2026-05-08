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
