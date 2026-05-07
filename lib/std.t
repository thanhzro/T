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

func upper(str) {
    past(str) ~> P1
    chars(str=P1) ~> P2
    F(P2) {
        charCode(str=now) ~> O1
        Gate O1 (>= 97 && <= 122) >> now
        O1 - 32 >> O4
        fromChar(val=O4) ~> now
    }
    join(arr=P2, sep="") ~> O5
    return O5
}

func lower(str) {
    past(str) ~> P1
    chars(str=P1) ~> P2
    F(P2) {
        charCode(str=now) ~> O1
        Gate O1 (>= 65 && <= 90) >> now
        O1 + 32 >> O4
        fromChar(val=O4) ~> now
    }
    join(arr=P2, sep="") ~> O5
    return O5
}



func first(arr) {
    past(arr) ~> P1
    F(P1) {
        Gate idx (== 0) >> O1
    }
    return O1
}

func last(arr) {
    past(arr) ~> P1
    len(val=P1) ~> O2
    O2 - 1 >> O3
    F(P1) {
        Gate idx (== O3) >> O1
    }
    return O1
}

func clamp(val, lo, hi) {
    past(val) ~> P1
    past(lo) ~> P2
    past(hi) ~> P3
    max(a=P1, b=P2) ~> O1
    min(a=O1, b=P3) ~> O2
    return O2
}

func startsWith(str, prefix) {
    past(str) ~> P1
    past(prefix) ~> P2
    len(val=P2) ~> O2
    chars(str=P1) ~> P3
    chars(str=P2) ~> P4
    F(P4) {
        Gate idx (== idx) >> O1
    }
    join(arr=P4, sep="") ~> O3
    contains(str=P1, sub=O3) ~> O4
    return O4
}

func startsWith(str, prefix) {
    past(str) ~> P1
    past(prefix) ~> P2
    indexOf(str=P1, sub=P2) ~> O1
    Gate O1 (== 0) >> O2
    return O2
}

func endsWith(str, suffix) {
    past(str) ~> P1
    past(suffix) ~> P2
    len(val=P1) ~> O1
    len(val=P2) ~> O2
    O1 - O2 >> O3
    indexOf(str=P1, sub=P2) ~> O4
    Gate O4 (== O3) >> O5
    return O5
}


func reverse(arr) {
    past(arr) ~> P1
    len(val=P1) ~> O2
    range(n=O2) ~> O3
    F(O3) {
        O2 - 1 - now >> O4
        get(arr=P1, idx=O4) ~> now
    }
    return O3
}

func repeat(str, n) {
    past(str) ~> P1
    past(n) ~> P2
    range(n=P2) ~> O1
    "" >> result
    F(O1) {
        result + P1 >> result
    }
    return result
}




func reverse(arr) {
    past(arr) ~> A1
    len(val=A1) ~> L1
    range(n=L1) ~> O1
    F(O1) {
        L1 - 1 - idx >> O4
        get(arr=A1, idx=O4) ~> now
    }
    O1 >> out
}
