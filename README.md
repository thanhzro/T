# T — The T Programming Language

T is a minimalist programming language built around one idea: **time is structure**.

Every program flows in one direction — past → present → future. No exceptions.

## Why T?

- **No semicolons. No braces hell. No noise.** T syntax is clean enough for humans and AI to read equally well.
- **Deterministic memory** — no garbage collector needed, no manual `free()` required. Memory is released automatically at the right moment by design.
- **Easier than Python to read. Safer than Rust to write.**

## Structure

Every T program has exactly three sections:

```
[T-]   — The past. Static data. Immutable.
[T0]   — The present. Logic, processing, pipelines.
[T+]   — The future. Output only. No logic allowed.

```

## F() — The Core Construct

`F()` is T's most powerful feature. One syntax, four behaviors detected automatically:

| Pattern | Mode |
|---|---|
| `F(arr) { O1 + now >> O1 }` | Accumulate |
| `F(arr) { Gate now (> 0) >> O1 }` | Filter |
| `F(arr) { Gate now (>= 97 && <= 122) >> now ... ~> now }` | Conditional Transform |
| `F(arr) { ... ~> now }` | Transform |

## Example

```t
[T-]
scores = [80, 90, 70]

[T0]
sum(arr=scores) ~> O1
avg(arr=scores) ~> O2
upper(str="hello world") ~> O3

[T+]
show shall(O1)
show shall(O2)
show shall(O3)
```

Output:
```
240
80
HELLO WORLD
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

`lib/std.t` is written in T itself — no C required.

Includes: `sum`, `avg`, `max2`, `min2`, `upper`, `lower`

## License

Apache 2.0
