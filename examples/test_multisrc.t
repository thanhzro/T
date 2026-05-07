[T-]
data = [3,6,7,10,15,20,21]

[T0]
F(data) {
    now % 3 >> R3
    now % 5 >> R5
    Gate R3 (== 0) || R5 (== 0) >> O1
}

[T+]
show shall(O1)
