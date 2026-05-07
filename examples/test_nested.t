[T-]
outer = [1,2,3]
inner = [10,20]

[T0]
F(outer) {
    F(inner) {
        now + 1 >> now
    }
}

[T+]
show shall(inner)
