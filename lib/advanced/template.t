[T-]
import "lib/basic/std.t"

func render(template, key, value) {
    past(template) ~> T
    past(key) ~> K
    past(value) ~> V
    "<<" + K + ">>" >> placeholder
    split(str=T, sep=placeholder) ~> parts
    join(arr=parts, sep=V) ~> out
}

func html_escape(str) {
    past(str) ~> S
    split(str=S, sep="&") ~> p1
    join(arr=p1, sep="&amp;") ~> s1
    split(str=s1, sep="<") ~> p2
    join(arr=p2, sep="&lt;") ~> s2
    split(str=s2, sep=">") ~> p3
    join(arr=p3, sep="&gt;") ~> out
}
