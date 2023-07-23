# My Circuit

A circuit to generate zero-knowledge circuits, proofs, and solidity verifiers

## Description

In this project we have designed a new zkSNARK circuit that implements some logical operations. We implemented the circuit and deployed a verifier on-chain to verify proofs generated from this circuit .

## Circuit Components

- AND Gate: The AND gate takes input signals A and B and produces an output signal, X, representing the logical AND of A and B.
- XOR Gate (Simulating NOT): The XOR gate takes input signals A and B and produces an output signal, Y, which simulates the logical NOT operation on A and B.
- OR Gate: The OR gate takes input signals X and Y and produces the final output signal, Q, representing the logical OR of X and Y.
```
