[T-]
data = [10,20,30,40,50]
threshold = 25

[T0]
F(data) {
    Gate now (> threshold) >> O1
}

[T+]
show shall(O1)
