# YXT-FermionGenerations

**Formalization of the Topological Origin of Three Fermion Generations from T⁶⁴ in YuanXian Theory**

This repository provides machine-verifiable formal proofs (Lean 4 + Coq) for the paper:

> **From T⁶⁴ Topology to Three Generations of Fermions: Ontological Necessity Proof of the Generational Number "3"**

### Core Result
\[
\boxed{3 = \frac{64 - 1}{21}}
\]

### Repository Structure
├── lean/                  # Lean 4 Formalization │   ├── YXTT/ │   │   ├── Core/laws.lean │   │   ├── Topology/T64.lean │   │   └── Physics/FermionGenerations.lean │   └── Theorems/ThreeGenerations.lean ├── coq/                   # Coq Formalization │   ├── Laws.v │   ├── T64.v │   ├── FermionGenerations.v │   └── ThreeGenerations.v ├── python/                # Numerical Verification │   ├── verify_generations.py │   └── requirements.txt ├── lake.toml ├── .gitignore └── LICENSE

### Quick Start

```bash
# Lean 4
lake exe cache get
lake build

# Coq
cd coq
make

# Python Numerical Verification
cd python
pip install -r requirements.txt
python verify_generations.py

Verification Status
•  Lean 4: All core theorems compile successfully
•  Coq: Main theorems formally verified
•  Python: High-precision numerical validation + divisor analysis
Related Repositories
•  YXTT 2.0 — Core Type Theory Framework
•  YXT-Formalization — Main Formalization Repository
Zenodo Archive: (to be added after DOI assignment)
