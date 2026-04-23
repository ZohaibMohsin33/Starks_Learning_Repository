# hash_comparisons Guide

## Overview

The `hash_comparisons` project is a Cairo program that demonstrates a zero knowledge proof for hash membership verification. It allows a prover to prove that they know a secret hash that belongs to a predefined "golden list" without revealing the actual hash value or which specific hash in the list it matches.

This example showcases:
- Hash-based membership proofs
- Constant-time operations to prevent timing attacks
- Privacy-preserving verification of list membership
- Handling ByteArray inputs in Cairo executables

## Project Structure

```
hash_comparisons/
├── src/
│   └── lib.cairo          # Cairo executable source code
├── args.json              # Serialized program arguments (generated)
├── generate_args.py       # Python script to serialize hash inputs
├── Scarb.toml             # Scarb project manifest
├── guide.md               # This guide file
└── target/                # Build artifacts and proof outputs
```

## How to Use

1. **Navigate to the project directory**:

```bash
cd hash_comparisons
```

2. **Generate the arguments file** using the provided Python script. You need to provide a hash string that exists in the golden list:

```bash
python3 generate_args.py "7f83b1657ff1fc53b92dc18148a1d65dfc2d4b1fa3d677284addd200126d9069"
```

This will create an `args.json` file with the serialized ByteArray data that Cairo can understand.

3. **Build the project**:

```bash
scarb build
```

4. **Run the executable** (this will generate a proof):

```bash
scarb run
```

If the hash is in the golden list, the program will succeed and output `true`. If not, it will fail with an assertion error.

## Understanding the Golden List

The program contains a hardcoded list of 10 hash values (the "golden list"). Some example hashes from the list include:
- `7f83b1657ff1fc53b92dc18148a1d65dfc2d4b1fa3d677284addd200126d9069`
- `486ea46224d1bb4fb680f34f7c9ad96a8f24ec88be73ea8e5a6c6522e3c4e6a5`
- And 8 others...

## Key Technical Details

### Constant-Time Comparison
The `is_in_golden_list` function uses a full loop that always iterates through the entire list, even after finding a match. This prevents timing attacks that could reveal which hash matched or whether any match was found.

### ByteArray Handling
Cairo's ByteArray type requires special serialization for input. The `generate_args.py` script converts a string hash into the format expected by Cairo's ByteArray implementation.

### Zero Knowledge Properties
- **Privacy**: The proof reveals nothing about the actual hash value
- **Soundness**: Only someone who knows a hash in the list can generate a valid proof
- **Completeness**: Any valid hash in the list will produce a successful proof

## Testing

The project includes unit tests to verify the functionality:

```bash
scarb test
```

Tests include:
- Verifying that known hashes from the golden list pass
- Verifying that unknown hashes fail

## Notes

- The golden list is hardcoded in the source code for simplicity
- In a real application, this list might be computed or loaded differently
- The program demonstrates the principle but uses a small list for educational purposes
- ByteArray serialization is necessary because Cairo executables can't directly accept string inputs

## Next Steps

After understanding `hash_comparisons`, you might want to explore:
- `password_commitment` - Another ZKP example with password hashing
- `age_verifier` - Age validation with privacy considerations
- Experiment with modifying the golden list or adding more complex verification logic