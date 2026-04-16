# even_finder Guide

## Overview

The `even_finder` project is a simple Cairo program that demonstrates a basic STARK-style check for even numbers.

It accepts a single integer input and verifies that the value is even. If the value is not even, the program fails with an assertion error.

This example is useful for learning how to:
- write a Cairo executable
- use assertions for input validation
- build and run a Cairo project with Scarb

## Project Structure

```
even_finder/
├── src/
│   └── lib.cairo        # Cairo executable source code
├── Scarb.toml           # Scarb project manifest
├── guide.md             # This guide file
└── target/              # Build artifacts and proof outputs
```

## How to Use

1. Open a terminal in the `even_finder` directory:

```bash
cd even_finder
```

2. Build the project:

```bash
scarb build
```

3. Run the executable with an even integer argument:

```bash
scarb run -- 8
```

Expected output:

```text
8
```

4. If you provide an odd integer, the program will fail:

```bash
scarb run -- 7
```

Expected failure message:

```text
number is not even
```

## Notes

- The executable entry point is `main(n: u64)` in `src/lib.cairo`.
- The assertion in the program is `assert(n % 2 == 0, 'number is not even');`.
- This is a minimal example intended for learning; it does not produce a full ZK proof by itself, but it shows the Cairo workflow.

## Next Steps

After you are comfortable with `even_finder`, try exploring the `password_commitment` project to see a more advanced STARK example.
