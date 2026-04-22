# age_verifier Guide

## Overview

The `age_verifier` project is a Cairo program that demonstrates age validation for eligibility checks.

It accepts a birth year as input and verifies that the calculated age falls within the range of 18 to 60 years (inclusive). If the age is outside this range, the program fails with an assertion error.

This example is useful for learning how to:
- perform arithmetic operations in Cairo
- implement range validation with multiple conditions
- use assertions for business logic validation
- build and run a Cairo project with Scarb

## Project Structure

```
age_verifier/
├── src/
│   └── lib.cairo        # Cairo executable source code
├── Scarb.toml           # Scarb project manifest
├── guide.md             # This guide file
└── target/              # Build artifacts and proof outputs
```

## How to Use

1. Open a terminal in the `age_verifier` directory:

```bash
cd age_verifier
```

2. Build the project:

```bash
scarb build
```

3. Run the executable with a birth year that results in age between 18-60:

```bash
scarb run -- 1990
```

Expected output (for birth year 1990 in 2026):

```text
1990
```

4. Try with an underage birth year (e.g., 2010, age 16):

```bash
scarb run -- 2010
```

This will result in an assertion error: `UNDERAGE`

5. Try with an overage birth year (e.g., 1950, age 76):

```bash
scarb run -- 1950
```

This will result in an assertion error: `OVERAGE`

6. Try with an invalid future birth year (e.g., 2030):

```bash
scarb run -- 2030
```

This will result in an assertion error: `INVALID`

## Understanding the Code

The main function in `src/lib.cairo`:

```cairo
#[executable]
fn main(n: u64) {
    let current_year: u64 = 2026;

    assert(n <= current_year, 'INVALID');

    let age = current_year - n;

    assert(age >= 18, 'UNDERAGE');
    assert(age <= 60, 'OVERAGE');
}
```

- Takes a `u64` parameter `n` (birth year)
- Validates that birth year is not in the future
- Calculates age as `current_year - n`
- Ensures age is between 18 and 60 inclusive
- Uses assertions to enforce all constraints

## Learning Outcomes

After working with this project, you'll understand:
- Arithmetic operations in Cairo (subtraction)
- Multiple assertion conditions
- Input validation patterns
- Error handling with custom assertion messages
- Building eligibility verification logic