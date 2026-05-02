# T

The T programming language.

## What is T?

T is a programming language where time is structure.
Every program is divided into three sections:

- `[T-]` — The past. Data that is known and fixed.
- `[T0]` — The present. Logic and processing.
- `[T+]` — The future. Output and results.

## Example

```t
[T-]
arr scores = [80, 90, 70]

[T0]
past(scores) ~> P1
F(P1) {
    O1 + now >> O1
}

[T+]
show shall(O1)
```

Output: `240`

## Build

Requires GCC.

```bash
gcc t_lexer.c t_parser.c t_vm.c main.c -o t
```

## Run

```bash
./t yourfile.t
```

## Features

- Time-based structure: T-, T0, T+
- Accumulator with `F()`
- Filter with `Gate`
- Functions
- Array indexing
- File I/O: `read`, `write`, `append`
- String operations: `len`, `join`, `split`

## License

MIT
