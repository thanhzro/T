[T-]

func validate_email(str) {
    past(str) ~> S
    regex_match(str=S, pat="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$") ~> out
}

func validate_url(str) {
    past(str) ~> S
    regex_match(str=S, pat="^https?://[a-zA-Z0-9.-]+") ~> out
}

func validate_ip(str) {
    past(str) ~> S
    regex_match(str=S, pat="^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$") ~> out
}

func validate_phone(str) {
    past(str) ~> S
    regex_match(str=S, pat="^[+]?[0-9]{7,15}$") ~> out
}

func validate_date(str) {
    past(str) ~> S
    regex_match(str=S, pat="^[0-9]{4}-[0-9]{2}-[0-9]{2}$") ~> out
}

func validate_range(val, lo, hi) {
    past(val) ~> V
    past(lo) ~> Lo
    past(hi) ~> Hi
    V - Lo >> dl
    Hi - V >> dh
    Gate dl (>= 0) >> ok_lo
    isNumber(val=ok_lo) ~> ol
    Gate dh (>= 0) >> ok_hi
    isNumber(val=ok_hi) ~> oh
    ol * oh >> out
}

func validate_min_len(str, n) {
    past(str) ~> S
    past(n) ~> N
    len(val=S) ~> slen
    slen - N >> diff
    Gate diff (>= 0) >> O1
    isNumber(val=O1) ~> out
}

func is_email(str) {
    past(str) ~> S
    validate_email(str=S) ~> out
}

func is_url(str) {
    past(str) ~> S
    validate_url(str=S) ~> out
}

func is_ip(str) {
    past(str) ~> S
    validate_ip(str=S) ~> out
}
