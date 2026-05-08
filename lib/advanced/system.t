[T-]

func os_name() {
    exec(cmd="uname -s") ~> raw
    trim(str=raw) ~> out
}

func os_arch() {
    exec(cmd="uname -m") ~> raw
    trim(str=raw) ~> out
}

func cpu_count() {
    exec(cmd="nproc") ~> raw
    trim(str=raw) ~> n
    toNumber(val=n) ~> out
}

func mem_total_mb() {
    exec(cmd="free -m | awk 'NR==2{print $2}'") ~> raw
    trim(str=raw) ~> n
    toNumber(val=n) ~> out
}

func disk_free_mb(path) {
    past(path) ~> P
    "df -m " + P + " | awk 'NR==2{print $4}'" >> cmd
    exec(cmd=cmd) ~> raw
    trim(str=raw) ~> n
    toNumber(val=n) ~> out
}

func hostname() {
    exec(cmd="hostname") ~> raw
    trim(str=raw) ~> out
}

func uptime_sec() {
    exec(cmd="awk '{print int($1)}' /proc/uptime") ~> raw
    trim(str=raw) ~> n
    toNumber(val=n) ~> out
}
