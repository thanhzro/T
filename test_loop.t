[T-]
score = 0

[T0]
loop {
    score + 10 >> score
    Gate score (>= 50) >> done
}

[T+]
show shall(score)
