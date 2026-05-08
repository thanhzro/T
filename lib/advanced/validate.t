[T-]
import "lib/basic/std.t"

func is_email(str) {
    past(str) ~> S
    regex_match(str=S, pat="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$") ~> out
}

func is_url(str) {
    past(str) ~> S
    regex_match(str=S, pat="^https?://[a-zA-Z0-9.-]+") ~> out
}

func is_ip(str) {
    past(str) ~> S
    regex_match(str=S, pat="^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$") ~> out
}

func is_phone(str) {
    past(str) ~> S
    regex_match(str=S, pat="^[+]?[0-9]{7,15}$") ~> out
}

func is_date(str) {
    past(str) ~> S
    regex_match(str=S, pat="^[0-9]{4}-[0-9]{2}-[0-9]{2}$") ~> out
}

func is_hex(str) {
    past(str) ~> S
    regex_match(str=S, pat="^[0-9a-fA-F]+$") ~> out
}

func is_alpha(str) {
    past(str) ~> S
    regex_match(str=S, pat="^[a-zA-Z]+$") ~> out
}

func is_alnum(str) {
    past(str) ~> S
    regex_match(str=S, pat="^[a-zA-Z0-9]+$") ~> out
}
