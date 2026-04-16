# range_checker Guide

## Overview

The `range_checker` project is a simple Cairo program that demonstrates range validation using assertions.

It accepts a single integer input and verifies that the value is less than 100. If the value is 100 or greater, the program fails with an assertion error.

This example is useful for learning how to:
- write a Cairo executable with input validation
- use assertions for range checking
- build and run a Cairo project with Scarb

## Project Structure

```
range_checker/
├── src/
│   └── lib.cairo        # Cairo executable source code
├── Scarb.toml           # Scarb project manifest
├── guide.md             # This guide file
└── target/              # Build artifacts and proof outputs
```

## How to Use

1. Open a terminal in the `range_checker` directory:

```bash
cd range_checker
```

2. Build the project:

```bash
scarb build
```

3. Run the executable with an integer argument less than 100:

```bash
scarb run -- 42
```

Expected output:

```text
42
```

4. Try with a value >= 100 to see the assertion failure:

```bash
scarb run -- 150
```

This will result in an assertion error: `Out of range`

## Understanding the Code

The main function in `src/lib.cairo`:

```cairo
#[executable]
fn main(n: u64) {
    assert(n < 100, 'Out of range');
}
```

- Takes a `u64` parameter `n`
- Uses `assert` to check that `n` is less than 100
- If the condition fails, the program panics with the message 'Out of range'

## Learning Outcomes

After working with this project, you'll understand:
- Basic input validation in Cairo
- How assertions work for enforcing constraints
- The difference between successful execution and assertion failures
- Building and running simple Cairo executables