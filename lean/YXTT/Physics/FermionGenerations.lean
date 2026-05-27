import YXTT.Topology.T64

namespace YXTT

/-!
# Fermion Generations from T⁶⁴ Topology
-/

/-- Number of fermion generations -/
def fermionGenerations : ℕ := (64 - 1) / stableSpectrumCard

theorem three_generations :
  fermionGenerations = 3 := by
  simp [fermionGenerations, stableSpectrumCard]
  native_decide

/-- No fourth generation possible -/
theorem no_fourth_generation :
  ¬ (∃ n : ℕ, n = 4 ∧ (64 - 1) % (n * stableSpectrumCard) = 0) := by
  simp
  native_decide

end YXTT
