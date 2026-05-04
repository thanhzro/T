[T-]
func sum(arr) {
    past(arr) ~> P1
    F(P1) {
        O1 + now >> O1
    }
    return O1
}

func avg(arr) {
    past(arr) ~> P1
    sum(arr=P1) ~> O1
    len(val=P1) ~> O2
    O1 / O2 >> O3
    return O3
}

func max2(a, b) {
    past(a) ~> P1
    past(b) ~> P2
    Gate P1 (>= P2) >> O1
    return O1
}

func min2(a, b) {
    past(a) ~> P1
    past(b) ~> P2
    Gate P1 (<= P2) >> O1
    return O1
}
