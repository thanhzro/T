[T-]
import "lib/basic/std.t"

[T0]
exec(cmd="grep -A 8 '^func sign' lib/advanced/math3.t") ~> sign_code
exec(cmd="grep -A 8 '^func hash_md5' lib/advanced/crypto.t") ~> md5_code
exec(cmd="grep -A 8 '^func is_email' lib/advanced/validate.t") ~> email_code
exec(cmd="grep -A 8 '^func is_url' lib/advanced/validate.t") ~> url_code
exec(cmd="grep -A 8 '^func checksum' lib/advanced/crypto.t") ~> checksum_code

[T+]
show shall(sign_code, md5_code, email_code, url_code, checksum_code)
