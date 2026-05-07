[T-]

func gcd(a, b) {
    past(a) ~> A
    past(b) ~> B
    loop {
        A % B >> r
        B >> A
        r >> B
        Gate B (== 0) >> done
    }
    A >> out
}

func lcm(a, b) {
    past(a) ~> A
    past(b) ~> B
    gcd(a=A, b=B) ~> G
    A * B >> prod
    prod / G >> out
}

func is_prime(n) {
    past(n) ~> N
    1 >> result
    Gate N (>= 2) >> ok
    isNumber(val=ok) ~> valid
    result * valid >> result
    2 >> i
    loop {
        i * i >> i2
        Gate i2 (> N) >> done
        N % i >> r
        Gate r (== 0) >> is_factor
        isNumber(val=is_factor) ~> factor_found
        1 - factor_found >> not_factor
        result * not_factor >> result
        i + 1 >> i
    }
    result >> out
}

func factorial(n) {
    past(n) ~> N
    1 >> result
    1 >> i
    loop {
        Gate i (> N) >> done
        result * i >> result
        i + 1 >> i
    }
    result >> out
}
