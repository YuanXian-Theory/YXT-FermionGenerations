import Lake
open Lake DSL

package YXT_FermionGenerations {
  leanOptions := #[
    ⟨`pp.funBinderTypes, true⟩,
    ⟨`autoImplicit, false⟩
  ]
}

require mathlib from git "https://github.com/leanprover-community/mathlib4" @ "master"
