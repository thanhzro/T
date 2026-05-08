[T-]
import "lib/basic/std.t"
import "lib/advanced/format.t"
import "lib/advanced/template.t"
import "lib/advanced/time2.t"
import "lib/advanced/ui.t"
import "lib/advanced/validate.t"

[T0]
format_bytes(bytes=1048576) ~> O1

[T+]
show shall(O1)
