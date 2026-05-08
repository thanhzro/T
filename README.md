# T — The T Programming Language

T is a minimalist programming language built around one idea: **time is structure**.

Every program flows in one direction — past → present → future. No exceptions.

## Why T?

- **4 syntax elements only** — `>>`, `~>`, `F()`, `Gate`. That's it.
- **Deterministic memory** — arena allocator, no GC, no manual `free()`.
- **Easier than Python to read. Safer than Rust to write.**
- **Built for AI** — clean coordinate system, no ambiguity, no noise.

## Structure

```
[T-]   — The past. Static data, imports, function definitions.
[T0]   — The present. Logic, processing, pipelines.
[T+]   — The future. Output only. No logic allowed.
```

## Core Syntax

| Syntax | Meaning |
|---|---|
| `x = 10` | Declare in T- |
| `expr >> target` | Flow data |
| `func_call(...) ~> target` | Call and store |
| `Gate src (op val) >> target` | Conditional filter |
| `F(arr) { body }` | Fractal loop (4 modes) |
| `loop { body }` | Loop until `done` is set |
| `show shall(O1)` | Output |

## F() — 4 Modes

| Pattern | Mode |
|---|---|
| `F(arr) { O1 + now >> O1 }` | Accumulate |
| `F(arr) { Gate now (> 0) >> O1 }` | Filter |
| `F(arr) { Gate now (> 0) >> now ... ~> now }` | Conditional Transform |
| `F(arr) { ... ~> now }` | Transform |

## Standard Library

```

lib/
├── basic/
│   └── std.t          — 30+ core functions (math, string, array, type)
├── intermediate/
│   ├── array.t        — chunk, groupBy, take, drop, sliding_window, rotate...
│   ├── csv.t          — CSV parsing
│   ├── datetime.t     — date/time formatting
│   ├── json.t         — JSON get/set/array
│   ├── math2.t        — gcd, lcm, is_prime, factorial, fibonacci, stats
│   ├── network.t      — HTTP get/post
│   └── string2.t      — capitalize, title, snake_case, truncate, slugify...
└── advanced/          — Coming soon
```

## Example

```t
[T-]
import "lib/basic/std.t"
import "lib/intermediate/csv.t"
read("data.csv") ~> P1

[T0]
parse_csv_rows(rows=P1) ~> O1
F(O1) {
    get(arr=now, idx=1) ~> score
    Gate score (>= 80) >> O2
}

[T+]
show shall(O2)
```

## Build

Requires GCC, libcurl.

```bash
git clone https://github.com/thanhzro/T.git
cd T
make
```

## Run

```bash
./t yourfile.t
```

## License

Apache 2.0
