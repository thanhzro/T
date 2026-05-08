[T-]
import "lib/basic/std.t"
import "lib/advanced/process.t"

func gzip(path) {
    past(path) ~> P
    "gzip -k " + P >> cmd
    exec(cmd=cmd) ~> out
}

func gunzip(path) {
    past(path) ~> P
    "gunzip -k " + P >> cmd
    exec(cmd=cmd) ~> out
}

func gzip_str(str) {
    past(str) ~> S
    "echo " + S + " | gzip | base64" >> cmd
    exec(cmd=cmd) ~> raw
    trim(str=raw) ~> out
}

func file_size_kb(path) {
    past(path) ~> P
    "du -k " + P + " | cut -f1" >> cmd
    exec(cmd=cmd) ~> raw
    trim(str=raw) ~> n
    toNumber(val=n) ~> out
}

func zip_files(src, dest) {
    past(src) ~> S
    past(dest) ~> D
    "zip " + D + " " + S >> cmd
    exec(cmd=cmd) ~> out
}

func unzip_file(path) {
    past(path) ~> P
    "unzip " + P >> cmd
    exec(cmd=cmd) ~> out
}
