# Password Commitment Project Guide

## Project Overview

The **Password Commitment** program is a practical implementation of Zero Knowledge Proofs using the STARK technology. It demonstrates how to prove knowledge of a password without revealing the actual password.

---

## 🔄 Complete Workflow: Build → Test → Prove → Verify

This guide walks you through the complete process of working with this project.

### Prerequisites
Before starting, ensure you have:
- **Cairo** installed and configured
- **Scarb** package manager installed
- **Prover tools** for STARK proof generation
- **Verifier tools** for proof verification

---

## Step 1: Build the Project

### Command
```bash
scarb build
```

### What Happens
- Compiles the Cairo code in `src/lib.cairo`
- Generates intermediate representation (IR) and bytecode
- Creates build artifacts in `target/dev/`
- Produces:
  - `password_commitment.executable.json` - Compiled executable code
  - `password_commitment_unittest.test.json` - Test executable
  - `password_commitment_unittest.test.sierra.json` - Sierra representation

### Output
```
Compiling password_commitment v0.1.0
Finished `dev` profile target(s) in XX.XXs
```

---

## Step 2: Run Tests

### Command
```bash
scarb test
```

### What Happens
- Executes all test functions in the project
- Validates the core logic and algorithms
- Ensures the commitment scheme works correctly
- Verifies password hashing and proof generation functions

### Expected Output
Tests pass with details about:
- Commitment generation
- Password verification logic
- Proof correctness

### Key Tests Include
- **Commitment Test**: Verifies password commitment generation
- **Verification Test**: Ensures proof verification logic
- **Edge Cases**: Tests boundary conditions and special inputs

---

## Step 3: Generate Proofs

### Command
```bash
scarb run
```

### What Happens
1. **Reads Input**: Loads arguments from `args.json`
2. **Executes Program**: Runs the compiled Cairo code with inputs
3. **Generates Execution Trace**: Creates a computation trace
4. **Produces Proof**: Generates a STARK proof
5. **Stores Results**: Saves artifacts to `target/execute/`

### Input Configuration
Edit `args.json` to specify:
```json
{
  "password": "your_password_here",
  "commitment": "commitment_value",
  "salt": "random_salt_value"
}
```

### Output Structure
```
target/execute/password_commitment/
├── execution1/
│   ├── prover_input.json      (Computation trace)
│   └── proof/
│       └── proof.json         (Generated STARK proof)
└── execution2/
    ├── prover_input.json
    └── proof/
        └── proof.json
```

### Generated Files
- **prover_input.json**: Complete execution trace with all intermediate values
- **proof.json**: The STARK proof (can be very large for complex proofs)

---

## Step 4: Verify the Proof

### Command
```bash
# Manual verification (if using standalone verifier)
stark-verify {proof_file} {public_inputs}
```

### What Verification Does
1. **Checks Proof Structure**: Validates proof format and components
2. **Verifies Computation**: Ensures the proof corresponds to valid computation
3. **Validates Public Inputs**: Checks against the commitment (public output)
4. **Confirms Correctness**: Returns verification result (PASS/FAIL)

### Expected Verification Properties
✅ Proof should verify with the correct public inputs (commitment)
✅ Proof should fail if inputs are tampered with
✅ Proof size grows with computation complexity
✅ Verification is fast compared to execution

---

## 📊 Complete Command Sequence

```bash
# 1. Build the project
scarb build

# 2. Run tests to verify logic
scarb test

# 3. Configure your inputs (edit args.json)
nano args.json

# 4. Generate proof
scarb run

# 5. Verify the generated proof
stark-verify target/execute/password_commitment/execution1/proof/proof.json
```

---

## 📁 Project Structure Explained

```
password_commitment/
├── src/
│   └── lib.cairo              # Main Cairo implementation
├── args.json                  # Input arguments for proof generation
├── Scarb.toml                 # Project manifest (dependencies, settings)
├── target/
│   ├── dev/                   # Build artifacts
│   │   ├── password_commitment.executable.json
│   │   └── password_commitment_unittest.test.json
│   └── execute/               # Execution and proof outputs
│       └── password_commitment/
│           └── execution{N}/
│               ├── prover_input.json
│               └── proof/proof.json
└── GUIDE.md                   # This file
```

---

## 🔍 Understanding Each Component

### Cairo Implementation (`src/lib.cairo`)
Contains:
- **Password Hashing**: Function to hash passwords securely
- **Commitment Generation**: Creates commitment from password
- **Proof Functions**: Generates and verifies proofs
- **Helper Functions**: Utility functions for the proof system

### Configuration (`args.json`)
Specifies the inputs for proof generation:
- Secret input: The actual password
- Public output: The commitment (what you prove knowledge of)
- Optional parameters: Salt, nonce, or other inputs

### Build Artifacts (`target/dev/`)
- Compiled code ready for execution
- Test executables for validation
- Various representations (JSON, Sierra) of the same code

### Execution Outputs (`target/execute/`)
- Complete records of program execution
- Proof data that can be sent to a verifier
- Multiple executions stored separately

---

## ⚙️ Key STARK Concepts in This Project

### 1. **Commitment Scheme**
Shows how to create a commitment to a secret (password) that:
- Binds you to the value
- Doesn't reveal the value
- Can be later proved correct

### 2. **Proof Generation**
Demonstrates:
- Creating a computation trace
- Converting it to a STARK proof
- Handling large computations efficiently

### 3. **Proof Properties**
- **Soundness**: Can't fake a proof for wrong statement
- **Completeness**: Valid statements always generate proofs
- **Zero-Knowledge**: Knowledge of password isn't leaked
- **Succinctness**: Proof size is reasonable

---

## 🐛 Troubleshooting

| Issue | Solution |
|-------|----------|
| `scarb build` fails | Check Cairo syntax, install Scarb correctly |
| `scarb test` fails | Review test expectations, check input values |
| Proof generation is slow | Normal for complex computations, be patient |
| Proof verification fails | Ensure proof matches the public inputs, check verifier version |
| Large proof files | Compression options available, depends on computation size |

---

## 📈 Next Steps

1. **Modify the program**: Change the hashing algorithm, add more constraints
2. **Test different inputs**: See how proofs change with different passwords
3. **Analyze proof sizes**: Understand proof generation costs
4. **Explore Cairo features**: Use more advanced Cairo constructs
5. **Build your own**: Create similar applications (voting, credentials, etc.)

---

## 📚 Additional Resources

- **Cairo Documentation**: https://docs.cairo-lang.org/
- **Scarb Documentation**: https://docs.swmansion.com/scarb/
- **STARK Overview**: Understand the theoretical foundations
- **StarkWare Research**: Deep dives into STARK technology

---

## Quick Reference Cheat Sheet

```bash
# Full workflow (development)
scarb build && scarb test && scarb run

# Build only
scarb build

# Test only
scarb test

# Clean build artifacts
scarb clean

# Build with optimizations
scarb build --release

# Run with debug output
scarb run --verbose
```

---

**Version**: 1.0  
**Last Updated**: April 2026  
**Audience**: Students and ZK-STARK learners

---

For questions or clarifications, refer to the main repository README or Cairo documentation.
