[T-]

func log_info(msg) {
    past(msg) ~> M
    timestamp() ~> ts
    "[INFO] " + M >> out
}

func log_warn(msg) {
    past(msg) ~> M
    "[WARN] " + M >> out
}

func log_error(msg) {
    past(msg) ~> M
    "[ERROR] " + M >> out
}

func log_debug(msg) {
    past(msg) ~> M
    "[DEBUG] " + M >> out
}


func log_to_file(path, level, msg) {
    past(path) ~> P
    past(level) ~> LV
    past(msg) ~> M
    timestamp() ~> ts
    toString(val=ts) ~> tss
    "[" + tss + "] [" + LV + "] " + M >> line
    shell_escape(str=line) ~> esc
    exec(cmd="echo " + esc + " >> " + P) ~> out
}

func log_tail(path, n) {
    past(path) ~> P
    past(n) ~> N
    toString(val=N) ~> ns
    exec(cmd="tail -" + ns + " " + P) ~> raw
    split(str=raw, sep="\n") ~> parts
    pop(arr=parts) ~> out
}

func log_count_errors(path) {
    past(path) ~> P
    exec(cmd="grep -c ERROR " + P + " 2>/dev/null || echo 0") ~> raw
    trim(str=raw) ~> n
    toNumber(val=n) ~> out
}

func log_clear(path) {
    past(path) ~> P
    exec(cmd="echo -n > " + P) ~> out
}
