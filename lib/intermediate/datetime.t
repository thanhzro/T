[T-]
/* lib/intermediate/datetime.t
   Requires: format_date, format_time, format_datetime builtins
*/

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
