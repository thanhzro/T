# T — The T Programming Language

T is a minimalist programming language built around one idea: **time is structure**.

Every program flows in one direction — past → present → future. No exceptions.

## Why T?

- **4 syntax elements only** — `>>`, `~>`, `F()`, `Gate`. That's it.
- **Deterministic memory** — no GC, no manual `free()`. Memory released by design.
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

## Example

```t
[T-]
import "lib/basic/std.t"
scores = [85, 92, 78, 95, 60]

[T0]
sort(arr=scores) ~> O1
max_arr(arr=scores) ~> O2
avg(arr=scores) ~> O3
F(scores) {
    Gate now (>= 80) >> O4
}

[T+]
show shall(O1)
show shall(O2, O3)
show shall(O4)
```

## Build

Requires GCC.

```bash
git clone https://github.com/thanhzro/T.git
cd T
make
```

## Run

```bash
./t yourfile.t
```

## Standard Library

```
lib/basic/     — Core stdlib written in T
lib/intermediate/  — Coming soon
lib/advanced/      — Coming soon
```

`lib/basic/std.t` includes: math, string, array, type utilities — all written in T, no C required.

## License

Apache 2.0
