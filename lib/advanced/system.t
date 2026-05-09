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

func get_env(key) {
    past(key) ~> K
    env(key=K) ~> out
}

func set_env(key, val) {
    past(key) ~> K
    past(val) ~> V
    env_set(key=K, val=V) ~> out
}

func env_or_default(key, default) {
    past(key) ~> K
    past(default) ~> D
    env(key=K) ~> val
    isString(val=val) ~> ok
    [] >> opts
    push(arr=opts, val=D) ~> opts
    push(arr=opts, val=val) ~> opts
    get(arr=opts, idx=ok) ~> out
}

func sys_ram_free() {
    exec(cmd="free -m | awk 'NR==2{print $4}'") ~> raw
    trim(str=raw) ~> n
    toNumber(val=n) ~> out
}

func sys_uptime() {
    exec(cmd="uptime -p") ~> raw
    trim(str=raw) ~> out
}

func sys_hostname() {
    exec(cmd="hostname") ~> raw
    trim(str=raw) ~> out
}

func sys_os() {
    exec(cmd="uname -s") ~> raw
    trim(str=raw) ~> out
}

func sys_arch() {
    exec(cmd="uname -m") ~> raw
    trim(str=raw) ~> out
}
