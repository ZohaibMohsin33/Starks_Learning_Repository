# Zero Knowledge Proofs and STARKs Learning Repository

Welcome to this repository dedicated to learning and exploring **Zero Knowledge Proofs (ZK)** and **STARKs** (Scalable Transparent Arguments of Knowledge). This is an educational resource designed for students and developers interested in understanding cryptographic proofs and their practical applications.

## 📚 About This Repository

This repository serves as a collection of practice programs and implementations related to zero knowledge proofs and STARK technology. It's built from my own learning journey and contains multiple programs demonstrating different aspects of ZK-STARKs.

Whether you're just starting to learn about cryptographic proofs or looking to deepen your understanding, you'll find practical implementations and examples here.

## 🔐 What are Zero Knowledge Proofs & STARKs?

### Zero Knowledge Proofs
A **Zero Knowledge Proof (ZKP)** is a cryptographic protocol that allows one party (the prover) to prove to another party (the verifier) that they know a specific value or that a statement is true, **without revealing the value itself or any additional information**.

### STARKs
**STARKs** (Scalable Transparent Arguments of Knowledge) are a type of zero knowledge proof system that offer:
- **Scalability**: Efficient proof generation and verification even for large computations
- **Transparency**: No need for a trusted setup ceremony
- **Post-Quantum Security**: Resistant to quantum computing attacks (relies on hash functions)

## 📁 Repository Structure

```
starks/
├── password_commitment/        # Password commitment program (ZKP example)
│   ├── src/
│   │   └── lib.cairo          # Cairo implementation
│   ├── args.json              # Program arguments
│   ├── Scarb.toml             # Project manifest
│   └── target/                # Build artifacts and proofs
└── README.md                  # This file
```

## 🚀 Getting Started

### Prerequisites
- **Cairo**: Experience with Cairo programming language
- **Scarb**: Build system for Cairo projects
- Basic understanding of cryptography concepts

### Building Your First Program

1. **Navigate to a program directory** (e.g., `password_commitment/`)
2. **Build the project**:
   ```bash
   scarb build
   ```
3. **Run and generate proofs**:
   ```bash
   scarb run
   ```

## 📋 Programs Included

### 1. Password Commitment Program
A practical implementation demonstrating how zero knowledge proofs can be used to prove knowledge of a password without revealing it.

**Key Concepts**:
- Password hashing and commitment
- Zero knowledge proof generation
- Proof verification

**Location**: `./password_commitment/`

**More programs coming soon...**

## 🎓 Learning Resources

### Core Concepts to Master
- [ ] Cryptographic hashing functions
- [ ] Commitment schemes
- [ ] Interactive vs Non-interactive proofs
- [ ] STARK architecture and components
- [ ] Cairo programming language
- [ ] Proof generation and verification

### Recommended Resources
- **StarkWare Documentation**: Official guides and specifications
- **Cairo Documentation**: Language reference and tutorials
- **Cryptography Fundamentals**: Understanding the mathematical foundations

## 🔧 Development

### Building the Project
```bash
cd <program_directory>
scarb build
```

### Running Tests
```bash
scarb test
```

### Exploring Proofs
Generated proofs and execution data can be found in:
```
target/execute/<program_name>/execution*/proof/proof.json
```

## 📝 How to Use This Repository

1. **Start with simpler programs** and gradually move to more complex ones
2. **Read the code comments** to understand the implementation details
3. **Experiment with the examples** - modify parameters and see how proofs change
4. **Build your own programs** using the patterns demonstrated here

## 🤝 Contributing

This repository is meant for learning and sharing knowledge. Contributions are welcome:
- Share your own ZK-STARK implementations
- Improve existing programs with better documentation
- Add new educational examples
- Fix bugs and suggest improvements

## 📧 Questions & Support

If you have questions or need clarification about any of the programs or concepts, please feel free to reach out. This is a learning community!

## ⚠️ Disclaimer

These programs are primarily for educational purposes. While care has been taken to implement best practices, always review code thoroughly before using it in production environments.

## 📄 License

[Add your preferred license here]

---

**Happy Learning! 🎓** 

Feel free to explore, experiment, and dive deep into the fascinating world of zero knowledge proofs and STARKs!
