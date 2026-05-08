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

func log_to_file(path, msg) {
    past(path) ~> P
    past(msg) ~> M
    timestamp() ~> ts
    toString(val=ts) ~> tss
    "[" + tss + "] " + M >> line
    exec(cmd="echo " + line + " >> " + P) ~> out
}
