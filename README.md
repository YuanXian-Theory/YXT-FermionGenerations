# YXT-FermionGenerations

Formalization of the topological origin of **three generations of fermions** from the $\mathbb{T}^{64}$ topology in YuanXian Theory.

## Paper
**Title**: 从$\mathbb{T}^{64}$拓扑到三代费米子：代际数字"3"的本体论必然性证明

**Core Result**:
\[
3 = \frac{64 - 1}{21}
\]

## Project Structure

- `lean/YXTT/Core/laws.lean` — Four Core Laws
- `lean/YXTT/Topology/T64.lean` — T⁶⁴ topology and homology
- `lean/YXTT/Physics/FermionGenerations.lean` — Fermion generations derivation
- `lean/Theorems/ThreeGenerations.lean` — Main theorems

## Build

```bash
lake exe cache get
lake build
