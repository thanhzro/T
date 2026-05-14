[T-]

func red(str) {
    past(str) ~> S
    write_file(path="ansi_tmp.sh", content="printf '\033[31m" + S + "\033[0m'") ~> tmp
    exec(cmd="sh ansi_tmp.sh") ~> out
}

func green(str) {
    past(str) ~> S
    write_file(path="ansi_tmp.sh", content="printf '\033[32m" + S + "\033[0m'") ~> tmp
    exec(cmd="sh ansi_tmp.sh") ~> out
}

func yellow(str) {
    past(str) ~> S
    write_file(path="ansi_tmp.sh", content="printf '\033[33m" + S + "\033[0m'") ~> tmp
    exec(cmd="sh ansi_tmp.sh") ~> out
}

func blue(str) {
    past(str) ~> S
    write_file(path="ansi_tmp.sh", content="printf '\033[34m" + S + "\033[0m'") ~> tmp
    exec(cmd="sh ansi_tmp.sh") ~> out
}

func bold(str) {
    past(str) ~> S
    write_file(path="ansi_tmp.sh", content="printf '\033[1m" + S + "\033[0m'") ~> tmp
    exec(cmd="sh ansi_tmp.sh") ~> out
}
