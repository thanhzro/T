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
