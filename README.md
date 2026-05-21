# T — The T Programming Language

T is a minimalist programming language built around one idea: **time is structure**.

Every program flows in one direction — past → present → future. No exceptions.

## Why T?

- **4 syntax elements only** — `>>`, `~>`, `F()`, `Gate`. That's it.
- **Deterministic memory** — arena allocator, no GC, no manual `free()`.
- **Easier than Python to read. Safer than Rust to write.**
- **Built for AI** — clean coordinate system, no ambiguity, no noise.
- **2500 lines of C** — smaller than Lua, faster than Python.

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
│   └── std.t              — 40+ core functions (math, string, array, crypto, type)
├── intermediate/
│   ├── array.t            — chunk, groupBy, take, drop, sliding_window, rotate
│   ├── csv.t              — CSV parsing
│   ├── datetime.t         — date/time formatting
│   ├── json.t             — JSON get/set/array/keys
│   ├── math2.t            — gcd, lcm, is_prime, factorial, fibonacci, stats
│   ├── network.t          — HTTP get/post
│   └── string2.t          — capitalize, title, snake_case, truncate, slugify
└── advanced/
    ├── compress.t         — gzip, zip operations
    ├── crypto.t           — hash_md5, hash_sha256, checksum
    ├── datetime2.t        — format_date, format_time, format_datetime
    ├── db.t               — SQLite wrapper
    ├── file2.t            — file read/write, dir listing
    ├── json2.t            — JSON parse/query via jq
    ├── math3.t            — round, ceil, pow, pi, lerp, sign
    ├── ml.t               — mat_mul, mat_rows, mat_cols
    ├── ml2.t              — dot_product, sigmoid, relu, normalize
    ├── net2.t             — REST API wrapper, ping
    ├── process.t          — shell, ls, cat, pwd, which
    ├── queue.t            — queue, stack data structures
    ├── stats.t            — mean, correlation, percentile, zscore
    ├── string3.t          — repeat, starts_with, ends_with, char_at
    ├── system.t           — os_name, os_arch, cpu_count, hostname
    ├── template.t         — render, html_escape
    └── validate.t         — is_email, is_url, is_ip, is_phone, is_date

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

## T Con Army — Self-Healing Runtime

T ships with an autonomous agent army that monitors and self-heals:

```bash
nohup ./run_army.sh > army.log 2>&1 &Every 60s the army:
Checks worker scores (selection pressure)
Runs 48 tests
Detects failures → finds CMD fix pattern → executes
Updates scores — workers below 0 are deprecated
No human intervention needed.
Philosophy
T is not trying to replace Python or C. T is a coordination language for the AI era:
Python computes. T coordinates.
LLMs reason. T army executes.
Humans set goals. T con army achieves them.
"Small workers, clear pipelines, emergent intelligence."
