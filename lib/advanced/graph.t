[T-]

func graph_add_edge(graph, from, to) {
    past(graph) ~> G
    past(from) ~> FR
    past(to) ~> TO
    FR + "->" + TO >> edge
    push(arr=G, val=edge) ~> out
}

func graph_neighbors(graph, node) {
    past(graph) ~> G
    past(node) ~> N
    N + "->" >> prefix
    F(G) {
        Gate now (contains prefix) >> match
        isNumber(val=match) ~> ok
        Gate ok (== 1) >> keep
        isNumber(val=keep) ~> h
        [] >> opts
        push(arr=opts, val="") ~> opts
        split(str=now, sep="->") ~> parts
        get(arr=parts, idx=1) ~> neighbor
        push(arr=opts, val=neighbor) ~> opts
        get(arr=opts, idx=h) ~> now
    }
    F(G) {
        Gate now (== "") >> skip
        isNumber(val=skip) ~> s
        1 - s >> keep
        Gate keep (== 1) >> O1
        isNumber(val=O1) ~> now
    }
    G >> out
}

func graph_has_edge(graph, from, to) {
    past(graph) ~> G
    past(from) ~> FR
    past(to) ~> TO
    FR + "->" + TO >> edge
    join(arr=G, sep=",") ~> joined
    contains(str=joined, sub=edge) ~> out
}
